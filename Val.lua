local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Creating the main Window
local Window = Rayfield:CreateWindow({
   Name = "Ghost's Hack GUI",
   Icon = 0,
   LoadingTitle = "Loading Interface...",
   LoadingSubtitle = "Powered by Rayfield",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "GhostScripts",
      FileName = "HackGUI"
   }
})

-- Creating the first Tab
local Test1Tab = Window:CreateTab("Test1", 4483362458)

-- Adding the first Button in Test1
local Button1 = Test1Tab:CreateButton({
   Name = "Noti",
   Callback = function()
      Rayfield:Notify({
         Title = "Notification",
         Content = "hehe",
         Duration = 5
      })
   end
})

-- Adding the second Button in Test1
local Button2 = Test1Tab:CreateButton({
   Name = "Another Button",
   Callback = function()
      print("Button in Test1 clicked!")
   end
})

-- Creating the second Tab
local Test2Tab = Window:CreateTab("Test2", 4483362458)

-- Adding Buttons in Test2
local Button3 = Test2Tab:CreateButton({
   Name = "Test2 Button1",
   Callback = function()
      print("Button1 in Test2 clicked!")
   end
})

local Button4 = Test2Tab:CreateButton({
   Name = "Test2 Button2",
   Callback = function()
      print("Button2 in Test2 clicked!")
   end
})
