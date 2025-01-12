-- Load DrRay Library
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("Ghost's Epic GUI", "Default")

-- Open GUI when the script runs
window:Open()

-- Local Player Tab
local localPlayerTab = window:newTab("Local Player", "Default")

-- Variables
local playerService = game:GetService("Players")
local localPlayer = playerService.LocalPlayer
local playerList = {}

-- Function to refresh player list
local function refreshPlayers()
    playerList = {}
    for _, player in ipairs(playerService:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerList, player.Name)
        end
    end
end

-- Initial Player List Refresh
refreshPlayers()

-- Dropdown for Player Selection
local selectedPlayer
local dropdown = localPlayerTab:newDropdown("Select Player", "Choose a player to teleport to.", playerList, function(playerName)
    selectedPlayer = playerName
end)

-- Refresh Button
localPlayerTab:newButton("Refresh Player List", "Updates the player list in the dropdown.", function()
    refreshPlayers()
    dropdown:SetOptions(playerList) -- Update dropdown options
end)

-- Teleport Button
localPlayerTab:newButton("Teleport to Player", "Move to the selected player.", function()
    if selectedPlayer then
        local targetPlayer = playerService:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
        else
            warn("Player not valid or doesn't have a character.")
        end
    else
        warn("No player selected.")
    end
end)

-- Visual Tab
local visualTab = window:newTab("Visual", "Default")

-- Player ESP Toggle
visualTab:newToggle("Player ESP", "Highlight players with boxes.", false, function(state)
    if state then
        for _, player in ipairs(playerService:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local espBox = Instance.new("BoxHandleAdornment")
                espBox.Adornee = player.Character.HumanoidRootPart
                espBox.Size = Vector3.new(4, 6, 4)
                espBox.Color3 = Color3.fromRGB(255, 0, 0)
                espBox.AlwaysOnTop = true
                espBox.Transparency = 0.7
                espBox.Parent = player.Character
                player.Character:SetAttribute("ESP", espBox) -- Save ESP for toggling off
            end
        end
    else
        for _, player in ipairs(playerService:GetPlayers()) do
            if player.Character and player.Character:GetAttribute("ESP") then
                player.Character:GetAttribute("ESP"):Destroy()
                player.Character:SetAttribute("ESP", nil)
            end
        end
    end
end)

-- Fullbright Toggle
visualTab:newToggle("Fullbright", "Brighten the entire map.", false, function(state)
    local lighting = game:GetService("Lighting")
    if state then
        lighting.Brightness = 2
        lighting.GlobalShadows = false
        lighting.Ambient = Color3.new(1, 1, 1)
    else
        lighting.Brightness = 1
        lighting.GlobalShadows = true
        lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
    end
end)

-- Customize Theme (Optional)
local mainColor = Color3.fromRGB(0, 128, 255)
local secondaryColor = Color3.fromRGB(255, 85, 0)
window:SetTheme(mainColor, secondaryColor)
