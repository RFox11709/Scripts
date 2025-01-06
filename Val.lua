local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Creating the main Window
local Window = Rayfield:CreateWindow({
   Name = "ValHub",
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
Sense.whitelist = {}  -- Add any user IDs to whitelist for showing ESP for those players only
Sense.sharedSettings = {
    textSize = 13,
    textFont = 2,
    limitDistance = false,
    maxDistance = 150,
    useTeamColor = false
}

-- Player Control Tab
local PlayerTab = Window:CreateTab("Player", 4483362458)

-- Walk Speed Slider
local WalkSpeedSlider = PlayerTab:CreateSlider({
   Name = "Walk Speed",
   Min = 16,  -- Default walk speed in Roblox
   Max = 200, -- Max speed you want
   Default = 100,  -- Default value
   Increment = 1,  -- Increment value for the slider
   Flag = "WalkSpeedSlider",
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
   Min = 50,  -- Default jump power in Roblox
   Max = 200, -- Max jump power
   Default = 100,  -- Default value
   Increment = 1,  -- Increment value for the slider
   Flag = "JumpPowerSlider",
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.JumpPower = Value
      end
   end
})

-- Walk Speed Toggle Button
local WalkSpeedToggle = PlayerTab:CreateToggle({
   Name = "Enable Walk Speed",
   CurrentValue = true,
   Flag = "WalkSpeedToggle",
   Callback = function(Value)
      if not Value then
         -- Reset walk speed to default when disabled
         local player = game.Players.LocalPlayer
         if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16  -- Default walk speed
         end
      end
   end
})

-- Jump Power Toggle Button
local JumpPowerToggle = PlayerTab:CreateToggle({
   Name = "Enable Jump Power",
   CurrentValue = true,
   Flag = "JumpPowerToggle",
   Callback = function(Value)
      if not Value then
         -- Reset jump power to default when disabled
         local player = game.Players.LocalPlayer
         if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = 50  -- Default jump power
         end
      end
   end
})

-- Fly Toggle Button (Fixed fly functionality)
local FlyToggle = PlayerTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "FlyToggle", -- Flag for configuration saving
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player and player.Character then
         if Value then
            -- Add flying method (not floating)
            local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
            local bodyGyro = Instance.new("BodyGyro")
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
            bodyGyro.CFrame = humanoidRootPart.CFrame
            bodyGyro.Parent = humanoidRootPart
            bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- Start with no velocity
            bodyVelocity.Parent = humanoidRootPart
            humanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- Set initial velocity
            -- Keep flying until toggled off
            game:GetService("RunService").Heartbeat:Connect(function()
               if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                  bodyVelocity.Velocity = player.Character.HumanoidRootPart.CFrame.LookVector * 50 -- Move forward
               end
            end)
         else
            -- Remove flying elements if toggled off
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
               local bodyGyro = humanoidRootPart:FindFirstChildOfClass("BodyGyro")
               local bodyVelocity = humanoidRootPart:FindFirstChildOfClass("BodyVelocity")
               if bodyGyro then bodyGyro:Destroy() end
               if bodyVelocity then bodyVelocity:Destroy() end
            end
         end
      end
   end
})

-- Fullbright Toggle Button
local VisualTab = Window:CreateTab("Visual", 4483362458)
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
