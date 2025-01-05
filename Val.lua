-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Val"
ScreenGui.Parent = game.CoreGui

-- Create Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250) -- Width: 400px, Height: 250px
MainFrame.Position = UDim2.new(0.5, -50, 0.4, -55) -- Lower position for mobile
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

-- Add Toggle Button
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

-- Make GUI Draggable (Mobile Friendly)
local UIS = game:GetService("UserInputService")
local dragToggle = false
local dragStart, startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if dragToggle and input.UserInputType == Enum.UserInputType.Touch then
        updateInput(input)
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = false
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
