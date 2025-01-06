local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Creating the main Window
local Window = Rayfield:CreateWindow({
   Name = "Ghost's Ultimate Hack GUI",
   Icon = 0,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Powered by Rayfield",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "GhostScripts",
      FileName = "HackGUI"
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

-- Walk Speed Slider
local WalkSpeedSlider = PlayerTab:CreateSlider({
   Name = "Walk Speed",
   Min = 16,
   Max = 200,
   Default = 100,
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.WalkSpeed = Value
      end
   end
})

-- Jump Power Slider
local JumpPowerSlider = PlayerTab:CreateSlider({
   Name = "Jump Power",
   Min = 50,
   Max = 200,
   Default = 100,
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.JumpPower = Value
      end
   end
})

-- Fly Toggle Button
local FlyToggle = PlayerTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "FlyToggle", 
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player and player.Character then
         local humanoid = player.Character:FindFirstChild("Humanoid")
         if Value then
            -- Create a BodyGyro to keep the player steady while flying
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
            bodyGyro.CFrame = player.Character.HumanoidRootPart.CFrame
            bodyGyro.P = 9e4
            bodyGyro.D = 10
            bodyGyro.Parent = player.Character.HumanoidRootPart
            
            -- Add BodyVelocity for flying
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
            bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            bodyVelocity.Parent = player.Character.HumanoidRootPart
         else
            -- Stop flying (Remove BodyVelocity and BodyGyro)
            local bodyVelocity = player.Character:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
               bodyVelocity:Destroy()
            end
            local bodyGyro = player.Character:FindFirstChildOfClass("BodyGyro")
            if bodyGyro then
               bodyGyro:Destroy()
            end
         end
      end
   end
})

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
