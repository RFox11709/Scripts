local UniverseID = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://apis.roblox.com/universes/v1/places/"..game.PlaceId.."/universe")).universeId
if game.PlaceId == 8737899170 then -- Pet Simulator 99
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mrxver0/Scripts/refs/heads/main/PS99.lua"))() -- Done
elseif game.PlaceId == 18901165922 then -- PetGo
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mrxver0/Scripts/refs/heads/main/PETGOSCRIPT.lua"))() -- Done
elseif game.PlaceId == 7449423635 or game.PlaceId == 2753915549 or game.PlaceId == 4442272183 then -- BloxFruit
    loadstring(game:HttpGet"https://raw.githubusercontent.com/mrxver0/Scripts/refs/heads/main/BloxFruit.lua")() -- Done
elseif game.PlaceId == 142823291 then -- Murder Mystery 2 
    loadstring(game:HttpGet"https://raw.githubusercontent.com/mrxver0/Scripts/refs/heads/main/MM2.lua")()
else
    -- In-game notification
    game.StarterGui:SetCore("SendNotification", {
        Title = "Notice";
        Text = "Game not supported"; -- The notification message
        Duration = 5; -- Duration in seconds
    })
end
