local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Creating the main Window
local Window = Rayfield:CreateWindow({
   Name = "Val",
   Icon = 0,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Powered by Rayfield",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "GhostScripts",
      FileName = "ValGUI"
   }
})

-- Load the Sense library for ESP
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

-- Custom ESP Configuration
Sense.whitelist = {}
Sense.sharedSettings = {
    textSize = 13,
    textFont = 2,
    limitDistance = false,
    maxDistance = 150,
    useTeamColor = false
}

Sense.teamSettings = {
    enemy = {
        enabled = false,
        box = true,
        boxColor = { Color3.new(1, 0, 0), 1 },
        boxOutline = true,
        boxOutlineColor = { Color3.new(0, 0, 0), 1 },
        boxFill = false,
        boxFillColor = { Color3.new(1, 0, 0), 0.5 },
        healthBar = false,
        healthyColor = Color3.new(0, 1, 0),
        dyingColor = Color3.new(1, 0, 0),
        healthBarOutline = true,
        healthBarOutlineColor = { Color3.new(0, 0, 0), 0.5 },
        healthText = false,
        healthTextColor = { Color3.new(1, 1, 1), 1 },
        healthTextOutline = true,
        healthTextOutlineColor = Color3.new(),
        box3d = false,
        box3dColor = { Color3.new(1, 0, 0), 1 },
        name = true,
        nameColor = { Color3.new(1, 1, 1), 1 },
        nameOutline = true,
        nameOutlineColor = Color3.new(),
        weapon = false,
        weaponColor = { Color3.new(1, 1, 1), 1 },
        weaponOutline = true,
        weaponOutlineColor = Color3.new(),
        distance = false,
        distanceColor = { Color3.new(1, 1, 1), 1 },
        distanceOutline = true,
        distanceOutlineColor = Color3.new(),
        tracer = true,
        tracerOrigin = "Bottom",
        tracerColor = { Color3.new(1, 0, 0), 1 },
        tracerOutline = true,
        tracerOutlineColor = { Color3.new(0, 0, 0), 1 },
        offScreenArrow = true,
        offScreenArrowColor = { Color3.new(1, 1, 1), 1 },
        offScreenArrowSize = 15,
        offScreenArrowRadius = 150,
        offScreenArrowOutline = true,
        offScreenArrowOutlineColor = { Color3.new(0, 0, 0), 1 },
        chams = false,
        chamsVisibleOnly = false,
        chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
        chamsOutlineColor = { Color3.new(1, 0, 0), 0 }
    },
    friendly = {
        enabled = false,
        box = true,
        boxColor = { Color3.new(0, 1, 0), 1 },
        boxOutline = true,
        boxOutlineColor = { Color3.new(0, 0, 0), 1 },
        boxFill = false,
        boxFillColor = { Color3.new(0, 1, 0), 0.5 },
        healthBar = false,
        healthyColor = Color3.new(0, 1, 0),
        dyingColor = Color3.new(1, 0, 0),
        healthBarOutline = true,
        healthBarOutlineColor = { Color3.new(0, 0, 0), 0.5 },
        healthText = false,
        healthTextColor = { Color3.new(1, 1, 1), 1 },
        healthTextOutline = true,
        healthTextOutlineColor = Color3.new(),
        box3d = false,
        box3dColor = { Color3.new(0, 1, 0), 1 },
        name = true,
        nameColor = { Color3.new(1, 1, 1), 1 },
        nameOutline = true,
        nameOutlineColor = Color3.new(),
        weapon = false,
        weaponColor = { Color3.new(1, 1, 1), 1 },
        weaponOutline = true,
        weaponOutlineColor = Color3.new(),
        distance = false,
        distanceColor = { Color3.new(1, 1, 1), 1 },
        distanceOutline = true,
        distanceOutlineColor = Color3.new(),
        tracer = true,
        tracerOrigin = "Bottom",
        tracerColor = { Color3.new(0, 1, 0), 1 },
        tracerOutline = true,
        tracerOutlineColor = { Color3.new(0, 0, 0), 1 },
        offScreenArrow = true,
        offScreenArrowColor = { Color3.new(1, 1, 1), 1 },
        offScreenArrowSize = 15,
        offScreenArrowRadius = 150,
        offScreenArrowOutline = true,
        offScreenArrowOutlineColor = { Color3.new(0, 0, 0), 1 },
        chams = false,
        chamsVisibleOnly = false,
        chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
        chamsOutlineColor = { Color3.new(0, 1, 0), 0 }
    }
}

-- Player Control Tab
local PlayerTab = Window:CreateTab("Player", 4483362458)


-- Visual Tab
local VisualTab = Window:CreateTab("Visual", 4483362458)

-- Fullbright Toggle Button
local FullbrightToggle = VisualTab:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
   Flag = "FullbrightToggle", 
   Callback = function(Value)
      if Value then
         -- Activate Fullbright (set lighting to maximum)
         game.Lighting.Brightness = 2
         game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
         game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
      else
         -- Reset to default lighting
         game.Lighting.Brightness = 1
         game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
         game.Lighting.Ambient = Color3.fromRGB(128, 128, 128)
      end
   end
})

-- Player ESP Toggle Button (Using Sense)
local ESPToggle = VisualTab:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Flag = "ESPToggle", 
   Callback = function(Value)
      -- Update ESP configuration based on toggle
      Sense.teamSettings.enemy.enabled = Value
      Sense.teamSettings.enemy.box = true
      Sense.teamSettings.enemy.boxColor = { Color3.new(1, 0, 0), 1 }
      
      -- Load or unload the ESP based on the toggle value
      if Value then
         Sense.Load()
      else
         Sense.Unload()
      end
   end
})

-- Add more features or tabs if needed
