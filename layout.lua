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
    Image = "--[[ #encode "ElevenLabsLogo.png" ]]",
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
  layout["text"] = {
    PrettyName = "Conversion Text",
    Style = "TextField",
    Position = {10,204},
    Size = {411,62},
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
    Position = {434,204},
    Size = {103,62},
    ButtonVisualStyle = "Gloss",
    UnlinkOffColor = true,
    Color = {255,255,255},
    OffColor = {255,230,240},
    StrokeWidth = 2,
    StrokeColor = {0,0,0},
    CornerRadius = 0,
    Legend = "Generate\rAudio",
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
  for i=1, 10 do
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
    Image = "--[[ #encode "ElevenLabsLogo.png" ]]",
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