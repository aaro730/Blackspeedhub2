
-- BLACK SPEED HUB
-- Delta mobile compatible GUI

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "BlackSpeedHub"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 230, 0, 220)
frame.Position = UDim2.new(0.5, -115, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(12,12,12)
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.Text = "BLACK SPEED HUB"
title.TextColor3 = Color3.fromRGB(255,40,40)
title.BackgroundTransparency = 1
title.TextSize = 19
title.Font = Enum.Font.GothamBold
title.Parent = frame

local box = Instance.new("TextBox")
box.Size = UDim2.new(0,190,0,38)
box.Position = UDim2.new(0,20,0,55)
box.Text = "100"
box.PlaceholderText = "Enter speed"
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextColor3 = Color3.new(1,1,1)
box.Parent = frame

local function makeButton(text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0,190,0,38)
    button.Position = UDim2.new(0,20,0,y)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(180,20,20)
    button.TextColor3 = Color3.new(1,1,1)
    button.Font = Enum.Font.GothamBold
    button.Parent = frame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0,8)
    c.Parent = button

    return button
end

local apply = makeButton("APPLY SPEED",105)
local reset = makeButton("RESET SPEED",150)
local hide = makeButton("HIDE MENU",195)

local function setSpeed(value)
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = value
    end
end

apply.MouseButton1Click:Connect(function()
    local value = tonumber(box.Text)
    if value then
        setSpeed(math.clamp(value,1,500))
    end
end)

reset.MouseButton1Click:Connect(function()
    box.Text = "16"
    setSpeed(16)
end)

hide.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    frame.Visible = true
end)
