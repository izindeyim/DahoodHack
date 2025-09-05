-- JJSploit Compatible Da Hood Cheat by Quarz
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- All settings
local speedEnabled = false
local aimbotEnabled = false
local espEnabled = false
local noclipEnabled = false
local godModeEnabled = false
local autoStompEnabled = false
local cashGrabEnabled = false
local autoPickupEnabled = false
local antiStompEnabled = false
local flyEnabled = false
local killAuraEnabled = false
local autoReloadEnabled = false
local infiniteJumpEnabled = false

-- Create GUI (JJSploit compatible)
wait(2) -- Wait for character to load

local gui = Instance.new("ScreenGui")
gui.Name = "QuarzCheat"
gui.Parent = game.CoreGui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 280, 0, 650)
main.Position = UDim2.new(0, 10, 0, 10)
main.BackgroundColor3 = Color3.new(0, 0, 0)
main.BorderColor3 = Color3.new(0, 1, 0)
main.BorderSizePixel = 2
main.Active = true
main.Draggable = true
main.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0, 0.5, 0)
title.Text = "QUARZ DA HOOD CHEAT"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = main

-- Speed Button
local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(0.9, 0, 0, 35)
speedBtn.Position = UDim2.new(0.05, 0, 0, 40)
speedBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
speedBtn.Text = "SPEED: OFF"
speedBtn.TextColor3 = Color3.new(1, 1, 1)
speedBtn.TextScaled = true
speedBtn.Font = Enum.Font.SourceSans
speedBtn.Parent = main

speedBtn.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    speedBtn.BackgroundColor3 = speedEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    speedBtn.Text = speedEnabled and "SPEED: ON" or "SPEED: OFF"
end)

-- Aimbot Button
local aimbotBtn = Instance.new("TextButton")
aimbotBtn.Size = UDim2.new(0.9, 0, 0, 35)
aimbotBtn.Position = UDim2.new(0.05, 0, 0, 85)
aimbotBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
aimbotBtn.Text = "AIMBOT: OFF"
aimbotBtn.TextColor3 = Color3.new(1, 1, 1)
aimbotBtn.TextScaled = true
aimbotBtn.Font = Enum.Font.SourceSans
aimbotBtn.Parent = main

aimbotBtn.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    aimbotBtn.BackgroundColor3 = aimbotEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    aimbotBtn.Text = aimbotEnabled and "AIMBOT: ON" or "AIMBOT: OFF"
end)

-- ESP Button
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0.9, 0, 0, 35)
espBtn.Position = UDim2.new(0.05, 0, 0, 130)
espBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
espBtn.Text = "ESP: OFF"
espBtn.TextColor3 = Color3.new(1, 1, 1)
espBtn.TextScaled = true
espBtn.Font = Enum.Font.SourceSans
espBtn.Parent = main

espBtn.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espBtn.BackgroundColor3 = espEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    espBtn.Text = espEnabled and "ESP: ON" or "ESP: OFF"
end)

-- Noclip Button
local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0.9, 0, 0, 35)
noclipBtn.Position = UDim2.new(0.05, 0, 0, 175)
noclipBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
noclipBtn.Text = "NOCLIP: OFF"
noclipBtn.TextColor3 = Color3.new(1, 1, 1)
noclipBtn.TextScaled = true
noclipBtn.Font = Enum.Font.SourceSans
noclipBtn.Parent = main

noclipBtn.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled
    noclipBtn.BackgroundColor3 = noclipEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    noclipBtn.Text = noclipEnabled and "NOCLIP: ON" or "NOCLIP: OFF"
end)

-- God Mode Button
local godBtn = Instance.new("TextButton")
godBtn.Size = UDim2.new(0.9, 0, 0, 35)
godBtn.Position = UDim2.new(0.05, 0, 0, 220)
godBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
godBtn.Text = "GOD MODE: OFF"
godBtn.TextColor3 = Color3.new(1, 1, 1)
godBtn.TextScaled = true
godBtn.Font = Enum.Font.SourceSans
godBtn.Parent = main

godBtn.MouseButton1Click:Connect(function()
    godModeEnabled = not godModeEnabled
    godBtn.BackgroundColor3 = godModeEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    godBtn.Text = godModeEnabled and "GOD MODE: ON" or "GOD MODE: OFF"
end)

-- Auto Stomp Button
local stompBtn = Instance.new("TextButton")
stompBtn.Size = UDim2.new(0.9, 0, 0, 35)
stompBtn.Position = UDim2.new(0.05, 0, 0, 265)
stompBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
stompBtn.Text = "AUTO STOMP: OFF"
stompBtn.TextColor3 = Color3.new(1, 1, 1)
stompBtn.TextScaled = true
stompBtn.Font = Enum.Font.SourceSans
stompBtn.Parent = main

stompBtn.MouseButton1Click:Connect(function()
    autoStompEnabled = not autoStompEnabled
    stompBtn.BackgroundColor3 = autoStompEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    stompBtn.Text = autoStompEnabled and "AUTO STOMP: ON" or "AUTO STOMP: OFF"
end)

-- Cash Grab Button
local cashBtn = Instance.new("TextButton")
cashBtn.Size = UDim2.new(0.9, 0, 0, 35)
cashBtn.Position = UDim2.new(0.05, 0, 0, 310)
cashBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
cashBtn.Text = "CASH GRAB: OFF"
cashBtn.TextColor3 = Color3.new(1, 1, 1)
cashBtn.TextScaled = true
cashBtn.Font = Enum.Font.SourceSans
cashBtn.Parent = main

cashBtn.MouseButton1Click:Connect(function()
    cashGrabEnabled = not cashGrabEnabled
    cashBtn.BackgroundColor3 = cashGrabEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    cashBtn.Text = cashGrabEnabled and "CASH GRAB: ON" or "CASH GRAB: OFF"
end)

-- Auto Pickup Button
local pickupBtn = Instance.new("TextButton")
pickupBtn.Size = UDim2.new(0.9, 0, 0, 35)
pickupBtn.Position = UDim2.new(0.05, 0, 0, 355)
pickupBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
pickupBtn.Text = "AUTO PICKUP: OFF"
pickupBtn.TextColor3 = Color3.new(1, 1, 1)
pickupBtn.TextScaled = true
pickupBtn.Font = Enum.Font.SourceSans
pickupBtn.Parent = main

pickupBtn.MouseButton1Click:Connect(function()
    autoPickupEnabled = not autoPickupEnabled
    pickupBtn.BackgroundColor3 = autoPickupEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    pickupBtn.Text = autoPickupEnabled and "AUTO PICKUP: ON" or "AUTO PICKUP: OFF"
end)

-- Anti Stomp Button
local antiStompBtn = Instance.new("TextButton")
antiStompBtn.Size = UDim2.new(0.9, 0, 0, 35)
antiStompBtn.Position = UDim2.new(0.05, 0, 0, 400)
antiStompBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
antiStompBtn.Text = "ANTI STOMP: OFF"
antiStompBtn.TextColor3 = Color3.new(1, 1, 1)
antiStompBtn.TextScaled = true
antiStompBtn.Font = Enum.Font.SourceSans
antiStompBtn.Parent = main

antiStompBtn.MouseButton1Click:Connect(function()
    antiStompEnabled = not antiStompEnabled
    antiStompBtn.BackgroundColor3 = antiStompEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    antiStompBtn.Text = antiStompEnabled and "ANTI STOMP: ON" or "ANTI STOMP: OFF"
end)

-- Fly Button
local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0.9, 0, 0, 35)
flyBtn.Position = UDim2.new(0.05, 0, 0, 445)
flyBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
flyBtn.Text = "FLY: OFF"
flyBtn.TextColor3 = Color3.new(1, 1, 1)
flyBtn.TextScaled = true
flyBtn.Font = Enum.Font.SourceSans
flyBtn.Parent = main

flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    flyBtn.BackgroundColor3 = flyEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    flyBtn.Text = flyEnabled and "FLY: ON" or "FLY: OFF"
end)

-- Kill Aura Button
local auraBtn = Instance.new("TextButton")
auraBtn.Size = UDim2.new(0.9, 0, 0, 35)
auraBtn.Position = UDim2.new(0.05, 0, 0, 490)
auraBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
auraBtn.Text = "KILL AURA: OFF"
auraBtn.TextColor3 = Color3.new(1, 1, 1)
auraBtn.TextScaled = true
auraBtn.Font = Enum.Font.SourceSans
auraBtn.Parent = main

auraBtn.MouseButton1Click:Connect(function()
    killAuraEnabled = not killAuraEnabled
    auraBtn.BackgroundColor3 = killAuraEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    auraBtn.Text = killAuraEnabled and "KILL AURA: ON" or "KILL AURA: OFF"
end)

-- Infinite Jump Button
local jumpBtn = Instance.new("TextButton")
jumpBtn.Size = UDim2.new(0.9, 0, 0, 35)
jumpBtn.Position = UDim2.new(0.05, 0, 0, 535)
jumpBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
jumpBtn.Text = "INFINITE JUMP: OFF"
jumpBtn.TextColor3 = Color3.new(1, 1, 1)
jumpBtn.TextScaled = true
jumpBtn.Font = Enum.Font.SourceSans
jumpBtn.Parent = main

jumpBtn.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    jumpBtn.BackgroundColor3 = infiniteJumpEnabled and Color3.new(0, 0.5, 0) or Color3.new(0.5, 0, 0)
    jumpBtn.Text = infiniteJumpEnabled and "INFINITE JUMP: ON" or "INFINITE JUMP: OFF"
end)

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0.9, 0, 0, 35)
closeBtn.Position = UDim2.new(0.05, 0, 0, 580)
closeBtn.BackgroundColor3 = Color3.new(0.5, 0, 0)
closeBtn.Text = "CLOSE"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.SourceSans
closeBtn.Parent = main

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Simple ESP function
local function createESP(player)
    if player == LocalPlayer then return end
    
    spawn(function()
        while player.Parent do
            wait(1)
            if player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                
                if not head:FindFirstChild("ESP") then
                    local esp = Instance.new("BillboardGui")
                    esp.Name = "ESP"
                    esp.Parent = head
                    esp.Size = UDim2.new(0, 100, 0, 50)
                    esp.StudsOffset = Vector3.new(0, 2, 0)
                    esp.AlwaysOnTop = true
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = esp
                    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.SourceSans
                    
                    local distLabel = Instance.new("TextLabel")
                    distLabel.Parent = esp
                    distLabel.Size = UDim2.new(1, 0, 0.5, 0)
                    distLabel.Position = UDim2.new(0, 0, 0.5, 0)
                    distLabel.BackgroundTransparency = 1
                    distLabel.TextColor3 = Color3.new(0, 1, 0)
                    distLabel.TextScaled = true
                    distLabel.Font = Enum.Font.SourceSans
                    
                    spawn(function()
                        while esp.Parent do
                            wait(0.1)
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                distLabel.Text = math.floor(distance) .. " studs"
                            end
                            esp.Enabled = espEnabled
                        end
                    end)
                end
            end
        end
    end)
end

-- Simple aimbot function
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.Head.Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    return closestPlayer
end

-- Main loop
spawn(function()
    while true do
        wait(0.1)
        
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            -- Speed hack
            if speedEnabled and humanoid then
                humanoid.WalkSpeed = 50
            elseif humanoid then
                humanoid.WalkSpeed = 16
            end
            
            -- Noclip
            if noclipEnabled then
                for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            
            -- God Mode
            if godModeEnabled and humanoid then
                humanoid.Health = humanoid.MaxHealth
            end
            
            -- Auto Stomp
            if autoStompEnabled then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
                        local pHumanoid = player.Character.Humanoid
                        if pHumanoid.PlatformStand then
                            local distance = (rootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if distance <= 10 then
                                if game:GetService("ReplicatedStorage"):FindFirstChild("MainEvent") then
                                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
                                end
                            end
                        end
                    end
                end
            end
            
            -- Cash Grab
            if cashGrabEnabled then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "Part" and obj:FindFirstChild("TouchInterest") and obj:FindFirstChild("Weld") then
                        if (rootPart.Position - obj.Position).Magnitude <= 20 then
                            rootPart.CFrame = obj.CFrame
                        end
                    end
                end
            end
            
            -- Auto Pickup
            if autoPickupEnabled then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj:IsA("Tool") and (obj.Name:find("Glock") or obj.Name:find("AK47") or obj.Name:find("AR")) then
                        if obj:FindFirstChild("Handle") and (rootPart.Position - obj.Handle.Position).Magnitude <= 15 then
                            obj.Handle.CFrame = rootPart.CFrame
                        end
                    end
                end
            end
            
            -- Anti Stomp
            if antiStompEnabled and humanoid then
                if humanoid.PlatformStand then
                    humanoid.PlatformStand = false
                    rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 10, 0)
                end
            end
            
            -- Kill Aura
            if killAuraEnabled then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (rootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= 20 then
                            Mouse.Button1Down()
                            wait(0.1)
                            Mouse.Button1Up()
                        end
                    end
                end
            end
            
            -- Infinite Jump
            if infiniteJumpEnabled and humanoid then
                humanoid.JumpPower = 50
            end
            
            -- Simple aimbot
            if aimbotEnabled then
                local target = getClosestPlayer()
                if target and target.Character and target.Character:FindFirstChild("Head") then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
                end
            end
        end
    end
end)

-- Setup ESP for all players
for _, player in pairs(Players:GetPlayers()) do
    createESP(player)
end

Players.PlayerAdded:Connect(createESP)

-- Toggle GUI with G key
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.G then
        main.Visible = not main.Visible
    end
end)

print("Quarz Da Hood Cheat loaded! Press G to toggle GUI")
