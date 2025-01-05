-- Basic Setup
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Val"
ScreenGui.Parent = PlayerGui

-- Main Frame
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
TitleText.Size = UDim2.new(1, 0, 1, 0)
TitleText.Text = "Hack GUI"
TitleText.Font = Enum.Font.SourceSansBold
TitleText.TextSize = 18
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.BackgroundTransparency = 1
TitleText.Parent = TitleBar

-- Close Button
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
local VisualButton = Instance.new("TextButton")
VisualButton.Size = UDim2.new(0, 80, 0, 30)
VisualButton.Position = UDim2.new(0, 10, 0, 40)
VisualButton.Text = "Visual"
VisualButton.Font = Enum.Font.SourceSans
VisualButton.TextSize = 16
VisualButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VisualButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
VisualButton.BorderSizePixel = 0
VisualButton.Visible = false
VisualButton.Parent = MainFrame

-- Visual Tab Content
local VisualContent = Instance.new("Frame")
VisualContent.Size = UDim2.new(0, 300, 0, 200)
VisualContent.Position = UDim2.new(0, 100, 0, 30)
VisualContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
VisualContent.BorderSizePixel = 0
VisualContent.Visible = false
VisualContent.Parent = MainFrame

local VisualLabel = Instance.new("TextLabel")
VisualLabel.Size = UDim2.new(1, 0, 1, 0)
VisualLabel.Text = "Visual Options Here"
VisualLabel.Font = Enum.Font.SourceSans
VisualLabel.TextSize = 20
VisualLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
VisualLabel.BackgroundTransparency = 1
VisualLabel.Parent = VisualContent

-- Make GUI Draggable
local UIS = game:GetService("UserInputService")
local dragging, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
TitleBar.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        update(input)
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

-- Visual Tab Functionality
local visualOpen = false
VisualButton.MouseButton1Click:Connect(function()
    visualOpen = not visualOpen
    VisualContent.Visible = visualOpen
end)

-- Show Visual Button when GUI opens
MainFrame:GetPropertyChangedSignal("Visible"):Connect(function()
    VisualButton.Visible = MainFrame.Visible
end)
