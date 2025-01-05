-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackGUI"
ScreenGui.Parent = game.CoreGui

-- Create Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250) -- Width: 400px, Height: 250px
MainFrame.Position = UDim2.new(0.5, -50, 0.4, -55) -- Centered but lower
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.1
MainFrame.Visible = false -- Initially hidden
MainFrame.Parent = ScreenGui

-- Add Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30) -- Full width, 30px height
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Add Title Text
local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -30, 1, 0) -- Fill TitleBar but leave space for close button
TitleText.Position = UDim2.new(0, 10, 0, 0) -- Padding
TitleText.Text = "Hack GUI"
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 18
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.BackgroundTransparency = 1
TitleText.Parent = TitleBar

-- Add Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 18
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TitleBar

-- Add Buttons
local Button1 = Instance.new("TextButton")
Button1.Size = UDim2.new(0, 150, 0, 40) -- Button size
Button1.Position = UDim2.new(0, 20, 0, 50) -- Position below TitleBar
Button1.Text = "Run Script 1"
Button1.Font = Enum.Font.SourceSans
Button1.TextSize = 16
Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
Button1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Button1.BorderSizePixel = 0
Button1.Parent = MainFrame

local Button2 = Button1:Clone()
Button2.Text = "Run Script 2"
Button2.Position = UDim2.new(0, 20, 0, 100)
Button2.Parent = MainFrame

-- Create Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 40) -- Small button
ToggleButton.Position = UDim2.new(0, 10, 0, 10) -- Top-left corner
ToggleButton.Text = "Open GUI"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 16
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = ScreenGui

-- Make GUI Draggable
local UIS = game:GetService("UserInputService")
local dragToggle = false
local dragInput, dragStart, startPos

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragToggle = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Toggle Button Functionality
local guiOpen = false
ToggleButton.MouseButton1Click:Connect(function()
    guiOpen = not guiOpen
    MainFrame.Visible = guiOpen
    if guiOpen then
        ToggleButton.Text = "Close GUI"
    else
        ToggleButton.Text = "Open GUI"
    end
end)

-- Close Button Functionality
CloseButton.MouseButton1Click:Connect(function()
    guiOpen = false
    MainFrame.Visible = false
    ToggleButton.Text = "Open GUI"
end)

-- Animations
MainFrame.Visible = true
for i = 1, 10 do
    MainFrame.BackgroundTransparency = MainFrame.BackgroundTransparency - 0.1
    wait(0.02)
end
MainFrame.Visible = false
