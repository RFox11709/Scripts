local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Creating the main Window
local Window = Rayfield:CreateWindow({
   Name = "Val",
   Icon = 0,
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Made by Ghost",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "GhostScripts",
      FileName = "HackGUI"
   }
})

-- Player Control Tab
local PlayerTab = Window:CreateTab("Player", 4483362458)

-- Walk Speed Changer Button
local WalkSpeedButton = PlayerTab:CreateButton({
   Name = "Walk Speed Changer",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.WalkSpeed = 100  -- Change to your desired speed
      end
   end
})

-- Jump Power Changer Button
local JumpPowerButton = PlayerTab:CreateButton({
   Name = "Jump Power Changer",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.JumpPower = 100  -- Change to your desired jump power
      end
   end
})

-- Fly Toggle Button
local FlyToggle = PlayerTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "FlyToggle", -- Flag for configuration saving
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      if player and player.Character then
         if Value then
            -- Simple flying method
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
            bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            bodyVelocity.Parent = player.Character:WaitForChild("HumanoidRootPart")
         else
            -- Remove flying if toggled off
            local bodyVelocity = player.Character:FindFirstChildOfClass("BodyVelocity")
            if bodyVelocity then
               bodyVelocity:Destroy()
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
   Flag = "FullbrightToggle", -- Flag for configuration saving
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

-- Player ESP Toggle Button
local ESPToggle = VisualTab:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Flag = "ESPToggle", -- Flag for configuration saving
   Callback = function(Value)
      local player = game.Players.LocalPlayer
      for _, v in pairs(game.Players:GetPlayers()) do
         if v ~= player then
            -- Create ESP for other players
            if Value then
               local esp = Instance.new("BillboardGui")
               esp.Parent = v.Character:WaitForChild("Head")
               esp.Adornee = v.Character:WaitForChild("Head")
               esp.Size = UDim2.new(0, 100, 0, 50)
               esp.StudsOffset = Vector3.new(0, 2, 0)
               esp.AlwaysOnTop = true
               local textLabel = Instance.new("TextLabel")
               textLabel.Parent = esp
               textLabel.Text = v.Name
               textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
               textLabel.BackgroundTransparency = 1
               textLabel.Size = UDim2.new(1, 0, 1, 0)
            else
               -- Remove ESP
               for _, gui in pairs(v.Character:WaitForChild("Head"):GetChildren()) do
                  if gui:IsA("BillboardGui") then
                     gui:Destroy()
                  end
               end
            end
         end
      end
   end
})
