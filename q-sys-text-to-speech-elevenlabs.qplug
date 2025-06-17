-- Basic Framework Plugin
-- by QSC
-- October 2020
-- Information block for the plugin
PluginInfo = {
  Name = "ElevenLabs~Open Source Text to Speech",
  Version = "1.0",
  BuildVersion = "1.0.0.12",
  Id = "4c315943-9d5d-4995-a9da-c6d26d222a3d",
  Author = "Philip Lawall",
  Description = "Open source text to speech plugin that uses the ElevenLabs API."
}
 -- Define the color of the plugin object in the design
function GetColor(props)
  return {0, 83, 214}
end

-- The name that will initially display when dragged into a design
function GetPrettyName(props)
  return "ElevenLabs TTS " .. PluginInfo.BuildVersion
end

-- Optional function used if plugin has multiple pages
PageNames = {"Main", "Help"} -- List the pages within the plugin
function GetPages(props)
  local pages = {}
  for ix,name in ipairs(PageNames) do
    table.insert(pages, {name = PageNames[ix]})
  end
  return pages
end

-- Optional function to define model if plugin supports more than one model
function GetModel(props)
  local model = {}
  return model
end

-- Define User configurable Properties of the plugin
function GetProperties()
  local props = {}
  return props
end

-- Optional function to define pins on the plugin that are not connected to a Control
function GetPins(props)
  local pins = {}
  table.insert(pins,{
    Name = "Audio Output",
    Direction = "output",
  })
  return pins
end

-- Optional function to update available properties when properties are altered by the user
function RectifyProperties(props)
  return props
end

-- Optional function to define components used within the plugin
function GetComponents(props)
  local components = {}
  
  table.insert(components,{
    Name = "audio_player",
  		Type = "audio_file_player",
  		Properties = {
  			["n_channels"] = 1
  		}
  })
  return components
end

-- Optional function to define wiring of components used within the plugin
function GetWiring(props)
  local wiring = {}
  table.insert( wiring, { "Audio Output", "audio_player Track 1" } )
  return wiring
end

-- Defines the Controls used within the plugin
function GetControls(props)
  local ctrls = {}
  table.insert(ctrls, {
    Name = "text",
    ControlType = "Text",
    Count = 1,
    PinStyle = "Input",
    UserPin = true
  })
  table.insert(ctrls, {
    Name = "convert_tts",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "Input",
    UserPin = true,
    Count = 1
  })
  table.insert(ctrls, {
    Name = "convert_and_play_tts",
    ControlType = "Button",
    ButtonType = "Trigger",
    Count = 1,
    PinStyle = "Input",
    UserPin = true
  })
  table.insert(ctrls, {
    Name = "api_key",
    ControlType = "Text",
    Count = 1,
    PinStyle = "Input",
    UserPin = true
  })
  table.insert(ctrls, {
    Name = "slot_selector",
    ControlType = "Text",
    TextType = "Combo Box",
    Count = 1,
    PinStyle = "None",
    UserPin = true
  })
  table.insert(ctrls, {
    Name = "voice_selector",
    ControlType = "Text",
    TextType = "Combo Box",
    Count = 1,
    PinStyle = "None",
    UserPin = true
  })
  table.insert(ctrls, {
    Name = "player_selector",
    ControlType = "Text",
    TextType = "Combo Box",
    Count = 1,
    PinStyle = "None",
    UserPin = true
  })
  table.insert(ctrls, {
    Name = "slot_delete",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "None",
    UserPin = true,
    Count = 11
  })
  table.insert(ctrls, {
    Name = "slot_trigger",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "Input",
    UserPin = true,
    Count = 11
  })
  table.insert(ctrls, {
    Name = "slot_name",
    ControlType = "Text",
    Count = 11,
    PinStyle = "None",
    UserPin = true
  })
  table.insert(ctrls, {
    Name = "slot_text",
    ControlType = "Indicator",
    IndicatorType = "Text",
    PinStyle = "None",
    UserPin = true,
    Count = 11
  })
  table.insert(ctrls, {
    Name = "QR",
    ControlType = "Button",
    ButtonType = "Trigger",
    PinStyle = "Input",
    UserPin = true,
    Count = 1
  })
  table.insert(ctrls, {
    Name = "api_connected",
    ControlType = "Indicator",
    IndicatorType = "LED",
    PinStyle = "Output",
    UserPin = true,
    Count = 1
  })
  return ctrls
end

-- Layout of controls and graphics for the plugin UI to display
function GetControlLayout(props)
  local layout = {}
  local graphics = {}
  local about_blurb = [[
This plugin was developed to be a free and open-source method to leverage ElevenLabs Text to Speech API. This plugin has been deployed under an MIT license, so you are free to reuse, distribute and profit from this code. You must generate a valid ElevenLabs API key to use this plugin, and once you do you will be subject to ElevenLabs own pricing for API usage. The cost is very cheap, and currently at the time of development is the following:

(pricing is per month)
0$: 10000 characters per month, no custom voices
5$: 30000 characters per month, up to 10 custom voices
22$: 100000 characters per month, up to 30 custom voices
99$: 500000 characters per month, up to 60 custom voices
330$: 2000000 characters per month, up to 120 custom voices
      
Audio files are only generated when you press the generate button. They are stored locally on the core in 1 of the 10 slots. When played back, the API is not used, and after converting your strings of text to audio, and saving them in the slots, the API key can happily be removed, and the core does not need access to the internet. I would advise deploying the plugin to shared environments in this manner so your API key cannot be abused by a third party. 

Contact me via GitHub, send a message or open an issue, if you have any problems or suggestions for improvements.
]]
  local CurrentPage = PageNames[props["page_index"].Value]
  if CurrentPage == "Main" then
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {240,245,245},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,800}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,725},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "Image",
      Image = "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",
      Position = { 60,752 },
      Size = { 355, 48}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "powered by",
      Position = {198,733},
      Size = {164,19},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
  
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Developed by Philip Lawall",
      Position = {367,781},
      Size = {189,19},
      Font = "Roboto",
      FontSize = 12,
      FontStyle = "Italic",
      HTextAlign = "Right",
      VTextAlign = "Center",
      Color = {230,230,230}
  
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Open Source Text to Speech",
      Position = {0,0},
      Size = {560,75},
      Font = "Roboto",
      FontSize = 36,
      FontStyle = "Medium Italic",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Valid ElevenLabs API Key:",
      Position = {2,82},
      Size = {168,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Left",
      VTextAlign = "Center"
    })
    layout["api_connected"] = {
      IndicatorType = "LED",
      Position = {160,82},
      Size = {31,31},
      Margin = 10
    }
    layout["api_key"] = {
      PrettyName = "ElevenLabs API Key",
      Style = "TextField",
      Position = {187,82},
      Size = {352,31},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 0,
      Font = "Roboto Mono",
      FontStyle = "Italic",
      FontSize = 12,
      FontColor = {0,0,0}
    }
    table.insert(graphics,{
      Type = "Text",
      Text = "Slot",
      Position = {10,117},
      Size = {64,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Voice",
      Position = {135,117},
      Size = {103,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Player",
      Position = {260,117},
      Size = {103,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    layout["slot_selector"] = {
      PrettyName = "Slot Selector",
      Style = "ComboBox",
      Position = {10,148},
      Size = {64,24},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 10,
      FontSize = 12
    }
    layout["voice_selector"] = {
      PrettyName = "Voice Combo Box",
      Style = "ComboBox",
      Position = {135,148},
      Size = {103,25},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 10,
      FontSize = 12
    }
    layout["player_selector"] = {
      PrettyName = "Player Combo Box",
      Style = "ComboBox",
      Position = {260,148},
      Size = {103,25},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 10,
      FontSize = 12
    }
    layout["text"] = {
      PrettyName = "Conversion Text",
      Style = "TextField",
      Position = {10,204},
      Size = {335,62},
      Color = {255,255,255},
      StrokeWidth = 2,
      StrokeColor = {221,221,221},
      CornerRadius = 0,
      Font = "Roboto",
      FontStyle = "Regular",
      FontSize = 12,
      FontColor = {0,0,0}
    }
    layout["convert_tts"] = {
      PrettyName = "Generate Audio",
      ButtonStyle = "Trigger",
      Position = {354,204},
      Size = {183,28},
      ButtonVisualStyle = "Gloss",
      UnlinkOffColor = true,
      Color = {255,255,255},
      OffColor = {255,230,240},
      StrokeWidth = 2,
      StrokeColor = {0,0,0},
      CornerRadius = 0,
      Legend = "Generate Audio",
      Font = "Roboto",
      FontStyle = "Medium Italic",
      FontSize = 14,
      FontColor = {0,0,0}
    }
    layout["convert_and_play_tts"] = {
      PrettyName = "Generate and Play Audio",
      ButtonStyle = "Trigger",
      Position = {354,238},
      Size = {183,28},
      ButtonVisualStyle = "Gloss",
      UnlinkOffColor = true,
      Color = {255,255,255},
      OffColor = {212,255,237},
      StrokeWidth = 2,
      StrokeColor = {0,0,0},
      CornerRadius = 0,
      Legend = "Generate and Play Audio",
      Font = "Roboto",
      FontStyle = "Medium Italic",
      FontSize = 14,
      FontColor = {0,0,0}
    }
    table.insert(graphics,{
      Type = "Text",
      Text = "Slot",
      Position = {10,287},
      Size = {44,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Name",
      Position = {54,287},
      Size = {128,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Text",
      Position = {182,287},
      Size = {251,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Delete",
      Position = {433,287},
      Size = {52,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Play",
      Position = {485,287},
      Size = {52,31},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    for i=1, 11 do
      table.insert(graphics,{
        Type = "Text",
        Text = tostring(i),
        Position = {10,318+(32*(i-1))},
        Size = {44,31},
        Font = "Roboto",
        FontSize = 14,
        FontStyle = "Medium",
        HTextAlign = "Center",
        VTextAlign = "Center"
      })
      layout["slot_name "..i] = {
        PrettyName = "Slot Friendly Name "..i,
        Style = "TextField",
        Position = {54,318+(32*(i-1))},
        Size = {128,31},
        Color = {255,255,255},
        StrokeWidth = 2,
        StrokeColor = {221,221,221},
        CornerRadius = 0,
        Font = "Roboto",
        FontStyle = "Regular",
        FontSize = 12,
        FontColor = {0,0,0},
        Margin = 3
      }
      layout["slot_text "..i] = {
        PrettyName = "Slot Converted Text "..i,
        Style = "TextField",
        Position = {182,318+(32*(i-1))},
        Size = {251,31},
        Color = {221,221,221},
        StrokeWidth = 2,
        StrokeColor = {156,156,156},
        CornerRadius = 0,
        FontSize = 12,
        FontColor = {0,0,0},
        Margin = 3
      }
      layout["slot_delete "..i] = {
        PrettyName = "Slot Delete Button "..i,
        ButtonStyle = "Trigger",
        Position = {433,318+(32*(i-1))},
        Size = {52,31},
        ButtonVisualStyle = "Gloss",
        UnlinkOffColor = true,
        Color = {255,255,255},
        OffColor = {221,221,221},
        StrokeWidth = 2,
        StrokeColor = {0,0,0},
        CornerRadius = 0,
        Font = "Roboto",
        FontStyle = "Medium Italic",
        FontSize = 14,
        FontColor = {0,0,0},
        Margin = 3
      }
      layout["slot_trigger "..i] = {
        PrettyName = "Slot Play Button "..i,
        ButtonStyle = "Trigger",
        Position = {485,318+(32*(i-1))},
        Size = {52,31},
        ButtonVisualStyle = "Gloss",
        UnlinkOffColor = true,
        Color = {255,255,255},
        OffColor = {212,255,237},
        StrokeWidth = 2,
        StrokeColor = {0,0,0},
        CornerRadius = 0,
        Font = "Roboto",
        FontStyle = "Medium Italic",
        FontSize = 14,
        FontColor = {0,0,0},
        Margin = 3
      }
    end
  
  
  
  elseif CurrentPage == "Help" then
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {240,245,245},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,800}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,0},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "GroupBox",
      Text = "",
      Fill = {0,83,214},
      StrokeWidth = 0,
      Position = {0,725},
      Size = {560,75}
    })
    table.insert(graphics,{
      Type = "Image",
      Image = "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",
      Position = { 60,752 },
      Size = { 355, 48}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "powered by",
      Position = {198,733},
      Size = {164,19},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Medium",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Open Source Text to Speech",
      Position = {0,0},
      Size = {560,75},
      Font = "Roboto",
      FontSize = 36,
      FontStyle = "Medium Italic",
      HTextAlign = "Center",
      VTextAlign = "Center",
      Color = {255,255,255}
    })
    layout["QR"] = {
      PrettyName = "QR Code",
      ButtonStyle = "Trigger",
      Position = {173,100},
      Size = {215,215},
      ButtonVisualStyle = "Gloss",
      UnlinkOffColor = true,
      Color = {255,255,255},
      OffColor = {255,255,255},
      StrokeWidth = 0,
      StrokeColor = {0,0,0},
      CornerRadius = 10,
      Padding = 10
    }
    table.insert(graphics,{
      Type = "Text",
      Text = about_blurb,
      Position = {30,330},
      Size = {500,347},
      Font = "Roboto",
      FontSize = 14,
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Top",
      Color = {0,0,0}
    })
    table.insert(graphics,{
      Type = "Text",
      Text = "Developed by Philip Lawall",
      Position = {367,781},
      Size = {189,19},
      Font = "Roboto",
      FontSize = 12,
      FontStyle = "Italic",
      HTextAlign = "Right",
      VTextAlign = "Center",
      Color = {230,230,230}
  
    })
  end
  return layout, graphics
end

-- Start event based logic
if Controls then
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
  
  Components = {}                                  --Create a table called Components
  DebugOutput = ""                                 --Build string to be displayed in the Debug Output window
  Components = Component.GetComponents()           --Set Components table equal to the table returned by Component.GetComponents()
  
  for _,v1 in ipairs(Components) do   
    DebugOutput = "\nName: "..v1.Name              --Add the component name to the DebugOutput string
    DebugOutput = DebugOutput.."\nType: "..v1.Type --Add the component type to the DebugOutput string
    DebugOutput = DebugOutput.."\nProperties:"     --Add Properties text to the DebugOutput string
    for _,v2 in ipairs(v1.Properties) do           --Add the list of properties to the DebugOutput string
      for k3,v3 in pairs(v2) do 
        DebugOutput = DebugOutput.."\n      "..k3.." = "..v3
      end
      DebugOutput = DebugOutput.."\n"
    end 
    print (DebugOutput)                            --Print the DebugOutput string     
  end
  
  audio_player["playing"].EventHandler = function(self)
    print("Audio Player Playing: " .. tostring(self.Boolean))
  end
  
  
  -- Control logic
  
  autoPlay = false
  
  voice_names = {}
  voice_ids = {}
  
  Controls.voice_selector.Choices = voice_names
  temp_languages = {}
  
  Controls.voice_selector.EventHandler = function()
    if Controls.voice_selector.String ~= "" then
      Controls.convert_tts.IsDisabled = false
      Controls.convert_and_play_tts.IsDisabled = false
    end
  end
  
  Controls.convert_tts.EventHandler = function()
    convertTTS()
  end
  
  Controls.convert_and_play_tts.EventHandler = function()
    autoPlay = true
    convertTTS()
    -- local selection = tonumber(Controls.slot_selector.String)
    -- audio_player["root"].String = "Audio/"
    -- audio_player["directory"].String = ""
    -- audio_player["filename"].String = "Slot-" .. tostring(selection) .. "-tts.wav"
    -- audio_player["play"]:Trigger()
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
    if autoPlay then 
      selection = 11
    end
    
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
    if #Controls.slot_name >= selection then    
      Controls.slot_text[selection].String = Controls.text.String
    end
    updateControls()
    Controls.api_connected.Boolean = true
    Controls.api_connected.Color = "green"
  
    if autoPlay then
      print("Autoplaying audio for slot " .. tostring(selection))
      audio_player["stop"]:Trigger()
      audio_player["root"].String = "Audio/"
      audio_player["directory"].String = ""
      audio_player["filename"].String = "Slot-" .. tostring(selection) .. "-tts.wav"
      audio_player["play"]:Trigger()
      autoPlay = false
    end
  end
  
  function updateControls()
    if not System.IsEmulating then
      Controls.text.IsDisabled = false
      Controls.slot_selector.IsDisabled = false
      Controls.voice_selector.IsDisabled = false
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
  
    Controls.voice_selector.String = ""
  
    Controls.text.String = ""
    Controls.convert_tts.IsDisabled = true  
    Controls.convert_and_play_tts.IsDisabled = true
  
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
      text = Controls.text.String,
      apply_text_normalization = "on"
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
end
