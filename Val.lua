-- Create ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Val"
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250) -- 400x250px
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

-- Visual Button
local VisualButton = Instance.new("TextButton")
VisualButton.Size = UDim2.new(0, 100, 0, 40)
VisualButton.Position = UDim2.new(0, 10, 0, 50) -- Left side
VisualButton.Text = "Visual"
VisualButton.Font = Enum.Font.SourceSansBold
VisualButton.TextSize = 16
VisualButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VisualButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
VisualButton.BorderSizePixel = 0
VisualButton.Parent = MainFrame

-- Right Side Buttons (hidden initially)
local RightButton = Instance.new("TextButton")
RightButton.Size = UDim2.new(0, 100, 0, 40)
RightButton.Position = UDim2.new(0, 150, 0, 50)
RightButton.Text = "Option 1"
RightButton.Font = Enum.Font.SourceSansBold
RightButton.TextSize = 16
RightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RightButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RightButton.BorderSizePixel = 0
RightButton.Visible = false
RightButton.Parent = MainFrame

local RightButton2 = Instance.new("TextButton")
RightButton2.Size = UDim2.new(0, 100, 0, 40)
RightButton2.Position = UDim2.new(0, 150, 0, 100)
RightButton2.Text = "Option 2"
RightButton2.Font = Enum.Font.SourceSansBold
RightButton2.TextSize = 16
RightButton2.TextColor3 = Color3.fromRGB(255, 255, 255)
RightButton2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RightButton2.BorderSizePixel = 0
RightButton2.Visible = false
RightButton2.Parent = MainFrame

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

-- Button Logic
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    ToggleButton.Text = MainFrame.Visible and "Close GUI" or "Open GUI"
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Text = "Open GUI"
end)

VisualButton.MouseButton1Click:Connect(function()
    RightButton.Visible = not RightButton.Visible
    RightButton2.Visible = not RightButton2.Visible
end)
