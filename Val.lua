-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Val"
ScreenGui.Parent = game.CoreGui

-- Create Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -50, 0.4, -55
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleText = Instance.new("TextLabel")
TitleText.Size = UDim2.new(1, -30, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.Text = "Hack GUI"
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 18
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.BackgroundTransparency = 1
TitleText.Parent = TitleBar

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

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 100, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "Open GUI"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 16
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = ScreenGui

-- Visual Tab Button
local VisualTabButton = Instance.new("TextButton")
VisualTabButton.Size = UDim2.new(0, 80, 0, 30)
VisualTabButton.Position = UDim2.new(0, 10, 0, 40) -- On the left
VisualTabButton.Text = "Visual"
VisualTabButton.Font = Enum.Font.SourceSansBold
VisualTabButton.TextSize = 16
VisualTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VisualTabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
VisualTabButton.BorderSizePixel = 0
VisualTabButton.Parent = MainFrame

-- Right-Side Buttons
local Button1 = Instance.new("TextButton")
Button1.Size = UDim2.new(0, 100, 0, 30)
Button1.Position = UDim2.new(1, -110, 0, 40)
Button1.Text = "Feature 1"
Button1.Font = Enum.Font.SourceSans
Button1.TextSize = 16
Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
Button1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button1.Visible = false
Button1.Parent = MainFrame

local Button2 = Instance.new("TextButton")
Button2.Size = UDim2.new(0, 100, 0, 30)
Button2.Position = UDim2.new(1, -110, 0, 80)
Button2.Text = "Feature 2"
Button2.Font = Enum.Font.SourceSans
Button2.TextSize = 16
Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
Button2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button2.Visible = false
Button2.Parent = MainFrame

-- Drag Functionality (Mobile Friendly)
local UIS = game:GetService("UserInputService")
local dragToggle, dragStart, startPos

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
    ToggleButton.Text = guiOpen and "Close GUI" or "Open GUI"
end)

-- Close Button Functionality
CloseButton.MouseButton1Click:Connect(function()
    guiOpen = false
    MainFrame.Visible = false
    ToggleButton.Text = "Open GUI"
end)

-- Visual Tab Button Functionality
local visualOpen = false
VisualTabButton.MouseButton1Click:Connect(function()
    visualOpen = not visualOpen
    Button1.Visible = visualOpen
    Button2.Visible = visualOpen
end)
