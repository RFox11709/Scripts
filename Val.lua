local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()

-- Main Window Configuration
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

-- Sense ESP Default Configurations
Sense.whitelist = {}
Sense.sharedSettings = {
    textSize = 13,
    textFont = 2,
    limitDistance = false,
    maxDistance = 150,
    useTeamColor = false
}
Sense.teamSettings.enemy.enabled = false
Sense.teamSettings.friendly.enabled = false

-- Utility Functions
local function modifyHumanoidProperty(property, value)
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid[property] = value
    end
end

local function toggleFullbright(isEnabled)
    local lighting = game.Lighting
    if isEnabled then
        lighting.Brightness = 2
        lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
        lighting.Ambient = Color3.fromRGB(255, 255, 255)
    else
        lighting.Brightness = 1
        lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        lighting.Ambient = Color3.fromRGB(128, 128, 128)
    end
end

-- Tabs and Features
-- Player Control Tab
local PlayerTab = Window:CreateTab("Player", 4483362458)

PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 100,
    Callback = function(value) modifyHumanoidProperty("WalkSpeed", value) end
})

PlayerTab:CreateSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 200,
    Default = 100,
    Callback = function(value) modifyHumanoidProperty("JumpPower", value) end
})

PlayerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if value and rootPart then
                -- Create BodyGyro and BodyVelocity
                local bodyGyro = Instance.new("BodyGyro", rootPart)
                bodyGyro.MaxTorque = Vector3.new(400000, 400000, 400000)
                bodyGyro.P = 9e4

                local bodyVelocity = Instance.new("BodyVelocity", rootPart)
                bodyVelocity.MaxForce = Vector3.new(400000, 400000, 400000)
                bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            else
                -- Remove BodyGyro and BodyVelocity
                for _, instance in ipairs(rootPart:GetChildren()) do
                    if instance:IsA("BodyGyro") or instance:IsA("BodyVelocity") then
                        instance:Destroy()
                    end
                end
            end
        end
    end
})

-- Visual Tab
local VisualTab = Window:CreateTab("Visual", 4483362458)

VisualTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle",
    Callback = toggleFullbright
})

VisualTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(value)
        Sense.teamSettings.enemy.enabled = value
        if value then
            Sense.Load()
        else
            Sense.Unload()
        end
    end
})

-- Add additional features here if needed
