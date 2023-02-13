------------------------------------------------------
---------------- Q-SYS Text to Speech ----------------
------------------------------------------------------
-- Written by: Philip Lawall (Qvest GmbH)
-- Inspired by: Jason Krasavage (SPL, LLC.) Open Source TTS Plugin, The Farm AV 'FarmTTS' Plugin
-- Initial prototype done 02/13/2023
------------------------------------------------------
------------------------------------------------------
-- Includes --
rapidjson = require("rapidjson")

-- QR Code Logic

function generate()
  local mode = {"low", "medium", "quartile", "high"}
  local url = "https://github.com/philiplawall/q-sys-text-to-speech-elevenlabs"
  local svg = QRCode.GenerateSVG(url, mode[3])

  legend = {
    DrawChrome = false,
    IconData = Crypto.Base64Encode(svg)
  }

  Controls.QR.Legend = rapidjson.encode(legend)
end

generate()

-- Control logic

voice_names = {}
voice_ids = {}

Controls.voice_selector.Choices = voice_names
temp_languages = {}

Controls.voice_selector.EventHandler = function()
  if Controls.voice_selector.String ~= "" then
    Controls.convert_tts.IsDisabled = false
  end
end

Controls.convert_tts.EventHandler = function()
  convertTTS()
end

Controls.text.EventHandler = function(self)
  if self.String ~= "" then
    if Controls.voice_selector.String ~= "" then
      Controls.convert_tts.IsDisabled = false
    end
  end
end

Controls.slot_selector.Choices = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}

function pluginError(text)
  print(text)
end

function processTTS(data, text)
  local selection = tonumber(Controls.slot_selector.String)
  audio_file = io.open("media/Audio/Slot-" .. tostring(selection) .. "-tts.wav", "w+")
  if audio_file ~= nil then
    filedata = audio_file:write(data)
    io.close(audio_file)
  else
    pluginError("file==nil")
  end
  text_file = io.open("media/Audio/Slot-" .. tostring(selection) .. "-tts.txt", "w+")
  if text_file ~= nil then
    filedata = text_file:write(text)
    io.close(text_file)
  else
    pluginError("file==nil")
  end
  Controls.slot_text[selection].String = Controls.text.String
  updateControls()
  Controls.api_connected.Boolean = true
  Controls.api_connected.Color = "green"
end

function updateControls()
  if not System.IsEmulating then
    Controls.text.IsDisabled = false
    Controls.slot_selector.IsDisabled = false
    Controls.voice_selector.IsDisabled = false
    Controls.selected_voice.IsDisabled = false
    Controls.text.String = ""
    for i = 1, #Controls.slot_trigger do
      if io.open("media/Audio/Slot-" .. tostring(i) .. "-tts.wav", "r") then
        Controls.slot_name[i].IsDisabled = false
        Controls.slot_text[i].IsDisabled = false
        Controls.slot_trigger[i].IsDisabled = false
        Controls.slot_delete[i].IsDisabled = false
        local file = io.open("media/Audio/Slot-" .. tostring(i) .. "-tts.txt", "r")
        local text = file:read("*a")
        Controls.slot_text[i].String = text
      else
        Controls.slot_text[i].String = ""
        Controls.slot_name[i].String = ""
        Controls.slot_name[i].IsDisabled = true
        Controls.slot_text[i].IsDisabled = true
        Controls.slot_trigger[i].IsDisabled = true
        Controls.slot_delete[i].IsDisabled = true
      end
    end
  else
    -- system is emulating
    print("System is emulating. This plugin will not work in emulation mode.")
    for i = 1, #Controls.slot_trigger do
      Controls.slot_name[i].IsDisabled = true
      Controls.slot_text[i].IsDisabled = true
      Controls.slot_trigger[i].IsDisabled = true
      Controls.slot_delete[i].IsDisabled = true
    end
    Controls.text.String = "This plugin will not work in emulation mode."
    Controls.text.IsDisabled = true
    Controls.slot_selector.IsDisabled = true
    Controls.voice_selector.IsDisabled = true
    Controls.selected_voice.IsDisabled = true
  end
end

function clearControls()
  for i = 1, #Controls.slot_trigger do
    Controls.slot_text[i].String = ""
    Controls.slot_name[i].IsDisabled = true
    Controls.slot_text[i].IsDisabled = true
    Controls.slot_trigger[i].IsDisabled = true
    Controls.slot_delete[i].IsDisabled = true
  end
  Controls.selected_voice.String = ""

  Controls.voice_selector.String = ""

  Controls.text.String = ""
  Controls.convert_tts.IsDisabled = true

end

for i = 1, #Controls.slot_delete do
  Controls.slot_delete[i].EventHandler = function()
    os.remove("media/Audio/Slot-" .. tostring(i) .. "-tts.wav")
    os.remove("media/Audio/Slot-" .. tostring(i) .. "-tts.txt")
    updateControls()
  end
end

for i = 1, #Controls.slot_trigger do
  audio_player["root"].String = "Audio/"
  audio_player["directory"].String = ""
  Controls.slot_trigger[i].EventHandler = function()
    audio_player["filename"].String = "Slot-" .. tostring(i) .. "-tts.wav"
    audio_player["play"]:Trigger()
  end
end

-- HTTP logic for the Google TTS API: https://cloud.google.com/text-to-speech

function convertTTSResponseHandler(tbl, code, data, err, headers)
  print(string.format("Response Code: %i\t\tErrors: %s", code, err or "None"))
  if (code == 200) then
    processTTS(data, Controls.text.String)
  else
    pluginError("Error converting text to speech")
  end
end

function convertTTS() -- HTTP POST for request a text to speech conversion
  local data = {
    text = Controls.text.String
  }

  voice_id = ""
  for i, v in ipairs(voice_names) do
    -- print("Comparing " .. v .. " to " .. Controls.voice_selector.String .. "")
    if v == Controls.voice_selector.String then
      voice_id = voice_ids[i]
    end
  end
  -- print(voice_id)
  if (voice_id == "") then
    pluginError("Voice ID not found")
  else
    local BaseURL = "https://api.elevenlabs.io/v1/text-to-speech/" .. voice_id
    HttpClient.Upload {
      Url = BaseURL,
      Method = "POST",
      Data = rapidjson.encode(data),
      Headers = {
        ["Content-Type"] = "application/json; charset=utf-8",
        ["xi-api-key"] = Controls.api_key.String
      },
      EventHandler = convertTTSResponseHandler
    }
  end
end

function getVoicesResponseHandler(tbl, code, data, err, headers)
  -- print(string.format("Response Code: %i\t\tErrors: %s\rData: %s", code, err or "None", data))
  response = rapidjson.decode(data)
  voices = response["voices"]
  for i, v in ipairs(voices) do
    voice_names[i] = v["name"]
    voice_ids[i] = v["voice_id"]
  end
  Controls.voice_selector.Choices = voice_names
  Controls.api_connected.Boolean = true
  Controls.api_connected.Color = "green"
end

function getVoices(url) -- HTTP GET for requesting complete list of available voices
  local BaseURL = "https://api.elevenlabs.io/v1/voices"
  HttpClient.Download {
    Url = BaseURL,
    Headers = {
      ["Content-Type"] = "application/json; charset=utf-8",
      ["xi-api-key"] = Controls.api_key.String
    },
    EventHandler = getVoicesResponseHandler
  }
end

Controls.api_key.EventHandler = function(self)
  if self.String ~= "" then
    getVoices()
    clearControls()
    updateControls()
  else
    Controls.api_connected.Boolean = false
    Controls.api_connected.Color = "red"
  end
end
-- Runtime logic
if Controls.api_key.String ~= "" then
  getVoices()
else
  Controls.api_connected.Boolean = false
  Controls.api_connected.Color = "red"
end

clearControls()
updateControls()
