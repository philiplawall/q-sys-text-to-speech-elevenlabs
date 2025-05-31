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
