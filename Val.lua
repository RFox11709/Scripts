-- Load Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
if not Rayfield then
    error("Failed to load Rayfield library.")
end

-- Create Main Window
local Window = Rayfield:CreateWindow({
    Name = "Test GUI",
    LoadingTitle = "Loading Your GUI...",
    LoadingSubtitle = "Powered by Rayfield",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RayfieldSaves",
        FileName = "TestGUIConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvite",
        RememberJoins = false
    },
    KeySystem = false -- Disable key system for simplicity
})

-- Create Tabs
local PlayerTab = Window:CreateTab("Player", 4483362458) -- Use a valid Roblox asset ID for the icon

-- Add a Slider to Control Walk Speed
local WalkSpeedSlider = PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Min = 16, -- Minimum speed (default Roblox speed)
    Max = 200, -- Maximum speed
    Default = 16, -- Default slider position
    Callback = function(Value)
        -- Update player's WalkSpeed
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        else
            warn("Character or Humanoid not found!")
        end
    end
})

-- Add a Slider to Control Jump Power
local JumpPowerSlider = PlayerTab:CreateSlider({
    Name = "Jump Power",
    Min = 50, -- Minimum jump power
    Max = 300, -- Maximum jump power
    Default = 50, -- Default slider position
    Callback = function(Value)
        -- Update player's JumpPower
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = Value
        else
            warn("Character or Humanoid not found!")
        end
    end
})

-- Add a Button to Reset Walk Speed and Jump Power
local ResetButton = PlayerTab:CreateButton({
    Name = "Reset to Default",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16 -- Reset to default speed
            player.Character.Humanoid.JumpPower = 50 -- Reset to default jump power
        else
            warn("Character or Humanoid not found!")
        end
    end
})

-- Add an Info Tab
local InfoTab = Window:CreateTab("Info", 4483362458) -- Use another valid icon ID
InfoTab:CreateLabel("This is a demo GUI created using Rayfield.")

-- Initialize Rayfield
Rayfield:Notify({
    Title = "Test GUI Loaded",
    Content = "Your GUI is ready to use!",
    Duration = 5,
    Image = 4483362458, -- Icon ID
    Actions = {
        Okay = {
            Name = "Okay",
            Callback = function()
                print("GUI loaded successfully!")
            end
        }
    }
})
