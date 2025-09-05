-- Simple Da Hood Cheat Test
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Create simple GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TestCheat"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(0, 255, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
title.Text = "DA HOOD CHEAT BY QUARZ"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0.8, 0, 0, 40)
speedButton.Position = UDim2.new(0.1, 0, 0, 40)
speedButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
speedButton.Text = "SPEED HACK: OFF"
speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedButton.TextScaled = true
speedButton.Font = Enum.Font.Gotham
speedButton.Parent = frame

local aimbotButton = Instance.new("TextButton")
aimbotButton.Size = UDim2.new(0.8, 0, 0, 40)
aimbotButton.Position = UDim2.new(0.1, 0, 0, 90)
aimbotButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
aimbotButton.Text = "AIMBOT: OFF"
aimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotButton.TextScaled = true
aimbotButton.Font = Enum.Font.Gotham
aimbotButton.Parent = frame

local espButton = Instance.new("TextButton")
espButton.Size = UDim2.new(0.8, 0, 0, 40)
espButton.Position = UDim2.new(0.1, 0, 0, 140)
espButton.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
espButton.Text = "ESP: OFF"
espButton.TextColor3 = Color3.fromRGB(255, 255, 255)
espButton.TextScaled = true
espButton.Font = Enum.Font.Gotham
espButton.Parent = frame

-- Settings
local speedEnabled = false
local aimbotEnabled = false
local espEnabled = false

-- Speed Hack
speedButton.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedButton.BackgroundColor3 = speedEnabled and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
    speedButton.Text = "SPEED HACK: " .. (speedEnabled and "ON" or "OFF")
end)

-- Aimbot
aimbotButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    aimbotButton.BackgroundColor3 = aimbotEnabled and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
    aimbotButton.Text = "AIMBOT: " .. (aimbotEnabled and "ON" or "OFF")
end)

-- ESP
espButton.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espButton.BackgroundColor3 = espEnabled and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
    espButton.Text = "ESP: " .. (espEnabled and "ON" or "OFF")
end)

-- Main loop
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
        
        -- Speed hack
        if speedEnabled and humanoid then
            humanoid.WalkSpeed = 100
        elseif humanoid then
            humanoid.WalkSpeed = 16
        end
    end
end)

-- Toggle GUI with Right Shift
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.RightShift then
        frame.Visible = not frame.Visible
    end
end)

print("✅ Simple Da Hood Cheat loaded! Press Right Shift to toggle GUI")
