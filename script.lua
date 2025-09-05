-- Da Hood Ultimate Cheat by Quarz
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Settings
local Settings = {
    AimbotEnabled = false,
    SilentAim = false,
    SmoothAim = false,
    Prediction = false,
    AimRadius = 100,
    MaxLockDistance = 120,
    SmoothSpeed = 5,
    TargetPart = "Head",
    FOVCircle = true,
    SpeedHack = false,
    FlyHack = false,
    Noclip = false,
    SpeedValue = 50,
    JumpPower = 50,
    ESPEnabled = true,
    CrosshairEnabled = true,
    HealthESP = true,
    KillAura = false,
    GodMode = false,
    KillAuraRange = 20,
    AutoStomp = false,
    AutoReload = false,
    AutoPickup = false,
    CashGrab = false,
    AntiStomp = false,
    TeleportToGuns = false,
    AutoRob = false,
    InfiniteStamina = false
}

local crosshair, Target, mainGui = nil, nil, nil
local connections = {}

-- Ban Bypass
pcall(function()
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" or method == "InvokeServer" then
            if string.find(tostring(self), "Ban") or string.find(tostring(self), "Kick") then
                return
            end
        end
        return oldNamecall(self, ...)
    end
    setreadonly(mt, true)
end)

-- GUI Creation
local function createGUI()
    local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = "DaHoodCheatGUI"
    screenGui.ResetOnSpawn = false
    mainGui = screenGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 450, 0, 600)
    mainFrame.Position = UDim2.new(0, 50, 0, 50)
    mainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 15)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.fromRGB(0, 10, 25)
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0, 8)

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 35)
    titleBar.BackgroundColor3 = Color3.fromRGB(0, 5, 20)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = mainFrame

    local titleCorner = Instance.new("UICorner", titleBar)
    titleCorner.CornerRadius = UDim.new(0, 8)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -80, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "🏠 DA HOOD CHEAT BY QUARZ 🏠"
    titleLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = titleBar

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 25)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true
    closeButton.Font = Enum.Font.GothamBold
    closeButton.BorderSizePixel = 0
    closeButton.Parent = titleBar

    local closeCorner = Instance.new("UICorner", closeButton)
    closeCorner.CornerRadius = UDim.new(0, 4)

    closeButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)

    local contentFrame = Instance.new("ScrollingFrame")
    contentFrame.Size = UDim2.new(1, -10, 1, -50)
    contentFrame.Position = UDim2.new(0, 5, 0, 40)
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 10)
    contentFrame.BorderSizePixel = 1
    contentFrame.BorderColor3 = Color3.fromRGB(0, 10, 25)
    contentFrame.ScrollBarThickness = 8
    contentFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 100, 200)
    contentFrame.Parent = mainFrame

    local contentCorner = Instance.new("UICorner", contentFrame)
    contentCorner.CornerRadius = UDim.new(0, 6)

    local layout = Instance.new("UIListLayout", contentFrame)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)

    local function createToggle(name, icon, setting)
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Size = UDim2.new(1, -10, 0, 40)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 25)
        toggleFrame.BorderSizePixel = 1
        toggleFrame.BorderColor3 = Color3.fromRGB(0, 15, 35)
        toggleFrame.Parent = contentFrame

        local toggleCorner = Instance.new("UICorner", toggleFrame)
        toggleCorner.CornerRadius = UDim.new(0, 6)

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.7, 0, 1, 0)
        label.Position = UDim2.new(0, 10, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = icon .. " " .. name
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.TextScaled = true
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = toggleFrame

        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 60, 0, 25)
        button.Position = UDim2.new(1, -70, 0.5, -12.5)
        button.BackgroundColor3 = Settings[setting] and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
        button.Text = Settings[setting] and "ON" or "OFF"
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = true
        button.Font = Enum.Font.GothamBold
        button.BorderSizePixel = 0
        button.Parent = toggleFrame

        local buttonCorner = Instance.new("UICorner", button)
        buttonCorner.CornerRadius = UDim.new(0, 4)

        button.MouseButton1Click:Connect(function()
            Settings[setting] = not Settings[setting]
            button.BackgroundColor3 = Settings[setting] and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(100, 0, 0)
            button.Text = Settings[setting] and "ON" or "OFF"
        end)
    end

    local function createSlider(name, icon, setting, minVal, maxVal)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(1, -10, 0, 60)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 25)
        sliderFrame.BorderSizePixel = 1
        sliderFrame.BorderColor3 = Color3.fromRGB(0, 15, 35)
        sliderFrame.Parent = contentFrame

        local sliderCorner = Instance.new("UICorner", sliderFrame)
        sliderCorner.CornerRadius = UDim.new(0, 6)

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, -10, 0, 25)
        label.Position = UDim2.new(0, 5, 0, 5)
        label.BackgroundTransparency = 1
        label.Text = icon .. " " .. name .. ": " .. Settings[setting]
        label.TextColor3 = Color3.fromRGB(200, 200, 200)
        label.TextScaled = true
        label.Font = Enum.Font.Gotham
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = sliderFrame

        local sliderBg = Instance.new("Frame")
        sliderBg.Size = UDim2.new(1, -20, 0, 15)
        sliderBg.Position = UDim2.new(0, 10, 0, 35)
        sliderBg.BackgroundColor3 = Color3.fromRGB(0, 0, 15)
        sliderBg.BorderSizePixel = 1
        sliderBg.BorderColor3 = Color3.fromRGB(0, 20, 40)
        sliderBg.Parent = sliderFrame

        local sliderBgCorner = Instance.new("UICorner", sliderBg)
        sliderBgCorner.CornerRadius = UDim.new(0, 7)

        local sliderFill = Instance.new("Frame")
        sliderFill.Size = UDim2.new((Settings[setting] - minVal) / (maxVal - minVal), 0, 1, 0)
        sliderFill.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
        sliderFill.BorderSizePixel = 0
        sliderFill.Parent = sliderBg

        local sliderFillCorner = Instance.new("UICorner", sliderFill)
        sliderFillCorner.CornerRadius = UDim.new(0, 7)

        local sliderButton = Instance.new("TextButton")
        sliderButton.Size = UDim2.new(1, 0, 1, 0)
        sliderButton.BackgroundTransparency = 1
        sliderButton.Text = ""
        sliderButton.Parent = sliderBg

        local dragging = false
        sliderButton.MouseButton1Down:Connect(function() dragging = true end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local mouse = UserInputService:GetMouseLocation()
                local relativeX = math.clamp((mouse.X - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                local value = math.floor(minVal + (maxVal - minVal) * relativeX)
                Settings[setting] = value
                sliderFill.Size = UDim2.new(relativeX, 0, 1, 0)
                label.Text = icon .. " " .. name .. ": " .. value
            end
        end)
    end

    -- Create toggles and sliders
    createToggle("Aimbot", "🎯", "AimbotEnabled")
    createToggle("Silent Aim", "🤫", "SilentAim")
    createToggle("Smooth Aim", "🌊", "SmoothAim")
    createToggle("Prediction", "🔮", "Prediction")
    createToggle("FOV Circle", "⭕", "FOVCircle")
    createSlider("Aim Radius", "📏", "AimRadius", 50, 300)
    createSlider("Max Distance", "📐", "MaxLockDistance", 50, 500)
    createSlider("Smooth Speed", "⚡", "SmoothSpeed", 1, 20)
    
    createToggle("Speed Hack", "💨", "SpeedHack")
    createToggle("Fly Hack", "🚁", "FlyHack")
    createToggle("Noclip", "👻", "Noclip")
    createSlider("Speed Value", "🏃", "SpeedValue", 16, 200)
    createSlider("Jump Power", "🦘", "JumpPower", 50, 200)
    
    createToggle("ESP", "👁️", "ESPEnabled")
    createToggle("Crosshair", "⊕", "CrosshairEnabled")
    createToggle("Health ESP", "❤️", "HealthESP")
    
    createToggle("Kill Aura", "⚔️", "KillAura")
    createToggle("God Mode", "🛡️", "GodMode")
    createSlider("Kill Aura Range", "📊", "KillAuraRange", 5, 50)
    
    createToggle("Auto Stomp", "🦶", "AutoStomp")
    createToggle("Auto Reload", "🔄", "AutoReload")
    createToggle("Auto Pickup", "📦", "AutoPickup")
    createToggle("Cash Grab", "💰", "CashGrab")
    createToggle("Anti Stomp", "🛡️", "AntiStomp")
    createToggle("TP to Guns", "🔫", "TeleportToGuns")
    createToggle("Auto Rob", "🏪", "AutoRob")
    createToggle("Infinite Stamina", "⚡", "InfiniteStamina")

    contentFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)

    UserInputService.InputBegan:Connect(function(input, gp)
        if not gp and input.KeyCode == Enum.KeyCode.RightShift then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)
end

-- Crosshair
local function createCrosshair()
    crosshair = Instance.new("Frame")
    crosshair.Size = UDim2.new(0, Settings.AimRadius*2, 0, Settings.AimRadius*2)
    crosshair.AnchorPoint = Vector2.new(0.5, 0.5)
    crosshair.BackgroundTransparency = 1
    crosshair.BorderSizePixel = 2
    crosshair.BorderColor3 = Color3.fromRGB(0, 255, 0)
    crosshair.Parent = mainGui

    local corner = Instance.new("UICorner", crosshair)
    corner.CornerRadius = UDim.new(1, 0)

    UserInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and Settings.CrosshairEnabled then
            crosshair.Position = UDim2.new(0, input.Position.X, 0, input.Position.Y)
            crosshair.Visible = Settings.CrosshairEnabled and Settings.FOVCircle
            crosshair.Size = UDim2.new(0, Settings.AimRadius*2, 0, Settings.AimRadius*2)
        end
    end)
end

-- ESP
local function createESP(player)
    if player == LocalPlayer then return end
    
    local function onCharacter(char)
        wait(1)
        local head = char:FindFirstChild("Head")
        local humanoid = char:FindFirstChild("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not head or not root then return end

        local bill = Instance.new("BillboardGui", head)
        bill.Name = "ESP"
        bill.Adornee = head
        bill.AlwaysOnTop = true
        bill.Size = UDim2.new(0, 150, 0, 80)
        bill.StudsOffset = Vector3.new(0, 2, 0)

        local frame = Instance.new("Frame", bill)
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        frame.BackgroundTransparency = 0.3
        frame.BorderSizePixel = 1
        frame.BorderColor3 = Color3.fromRGB(0, 255, 0)

        local corner = Instance.new("UICorner", frame)
        corner.CornerRadius = UDim.new(0, 6)

        local nameLabel = Instance.new("TextLabel", frame)
        nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "👤 " .. player.Name
        nameLabel.TextScaled = true
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.Font = Enum.Font.GothamBold

        local distLabel = Instance.new("TextLabel", frame)
        distLabel.Size = UDim2.new(1, 0, 0.3, 0)
        distLabel.Position = UDim2.new(0, 0, 0.4, 0)
        distLabel.BackgroundTransparency = 1
        distLabel.TextScaled = true
        distLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
        distLabel.Font = Enum.Font.Gotham

        local healthLabel = Instance.new("TextLabel", frame)
        healthLabel.Size = UDim2.new(1, 0, 0.3, 0)
        healthLabel.Position = UDim2.new(0, 0, 0.7, 0)
        healthLabel.BackgroundTransparency = 1
        healthLabel.TextScaled = true
        healthLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        healthLabel.Font = Enum.Font.Gotham

        connections[#connections + 1] = RunService.RenderStepped:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart and root.Parent then
                local d = (LocalPlayer.Character.PrimaryPart.Position - root.Position).Magnitude
                distLabel.Text = "📏 " .. string.format("%.0f studs", d)
                
                if humanoid and Settings.HealthESP then
                    healthLabel.Text = "❤️ " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                end

                bill.Enabled = Settings.ESPEnabled
            end
        end)
    end

    player.CharacterAdded:Connect(onCharacter)
    if player.Character then onCharacter(player.Character) end
end

-- Aimbot
local function GetClosestPlayer()
    if not (LocalPlayer.Character and LocalPlayer.Character.PrimaryPart) then return nil end
    local myPos = LocalPlayer.Character.PrimaryPart.Position
    local crossPos = Vector2.new(Mouse.X, Mouse.Y)
    local closest, minDist = nil, Settings.AimRadius

    for _, pl in pairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer and pl.Character and pl.Character:FindFirstChild(Settings.TargetPart) and pl.Character.PrimaryPart then
            local targetPart = pl.Character[Settings.TargetPart]
            local worldDist = (myPos - targetPart.Position).Magnitude
            if worldDist <= Settings.MaxLockDistance then
                local screenPoint, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                if onScreen then
                    local d = (Vector2.new(screenPoint.X, screenPoint.Y) - crossPos).Magnitude
                    if d < minDist then
                        minDist, closest = d, pl
                    end
                end
            end
        end
    end
    return closest
end

-- Da Hood Features
local function setupDaHoodFeatures()
    connections[#connections + 1] = RunService.Heartbeat:Connect(function()
        if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
            
            -- Auto Stomp
            if Settings.AutoStomp then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.PlatformStand then
                            local distance = (LocalPlayer.Character.PrimaryPart.Position - player.Character.PrimaryPart.Position).Magnitude
                            if distance <= 10 then
                                pcall(function()
                                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
                                end)
                            end
                        end
                    end
                end
            end
            
            -- Cash Grab
            if Settings.CashGrab then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "Part" and obj:FindFirstChild("TouchInterest") and obj:FindFirstChild("Weld") then
                        if (LocalPlayer.Character.PrimaryPart.Position - obj.Position).Magnitude <= 20 then
                            LocalPlayer.Character.PrimaryPart.CFrame = obj.CFrame
                        end
                    end
                end
            end
            
            -- Auto Pickup
            if Settings.AutoPickup then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj:IsA("Tool") and (obj.Name:find("Glock") or obj.Name:find("AK47") or obj.Name:find("AR")) then
                        if obj:FindFirstChild("Handle") and (LocalPlayer.Character.PrimaryPart.Position - obj.Handle.Position).Magnitude <= 15 then
                            obj.Handle.CFrame = LocalPlayer.Character.PrimaryPart.CFrame
                        end
                    end
                end
            end
            
            -- Anti Stomp
            if Settings.AntiStomp then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid and humanoid.PlatformStand then
                    humanoid.PlatformStand = false
                    LocalPlayer.Character.PrimaryPart.CFrame = LocalPlayer.Character.PrimaryPart.CFrame + Vector3.new(0, 10, 0)
                end
            end
            
            -- Auto Reload
            if Settings.AutoReload then
                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild("Ammo") then
                    if tool.Ammo.Value <= 5 then
                        pcall(function()
                            game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", tool)
                        end)
                    end
                end
            end
        end
    end)
end

-- Movement Hacks
local function setupMovementHacks()
    connections[#connections + 1] = RunService.Heartbeat:Connect(function()
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and Settings.SpeedHack then
                humanoid.WalkSpeed = Settings.SpeedValue
            end
            
            if humanoid and Settings.JumpPower then
                humanoid.JumpPower = Settings.JumpPower
            end
            
            if rootPart and Settings.Noclip then
                for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
            
            if Settings.GodMode and humanoid then
                humanoid.Health = humanoid.MaxHealth
            end
        end
    end)
end

-- Initialize
createGUI()
createCrosshair()
setupMovementHacks()
setupDaHoodFeatures()

for _, pl in pairs(Players:GetPlayers()) do createESP(pl) end
Players.PlayerAdded:Connect(createESP)

-- Main aimbot loop
connections[#connections + 1] = RunService.RenderStepped:Connect(function()
    if Settings.AimbotEnabled then
        Target = GetClosestPlayer()
        if Target and Target.Character and Target.Character:FindFirstChild(Settings.TargetPart) then
            local targetPos = Target.Character[Settings.TargetPart].Position
            
            if Settings.Prediction and Target.Character.PrimaryPart then
                local velocity = Target.Character.PrimaryPart.Velocity
                targetPos = targetPos + (velocity * 0.1)
            end
            
            if Settings.SmoothAim then
                local currentCFrame = Camera.CFrame
                local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)
                Camera.CFrame = currentCFrame:Lerp(targetCFrame, Settings.SmoothSpeed / 100)
            else
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
            end
        end
    end
end)

-- Keybinds
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp then
        if input.KeyCode == Enum.KeyCode.E then
            Settings.AimbotEnabled = not Settings.AimbotEnabled
        elseif input.KeyCode == Enum.KeyCode.F then
            Settings.FlyHack = not Settings.FlyHack
        elseif input.KeyCode == Enum.KeyCode.G then
            Settings.SpeedHack = not Settings.SpeedHack
        end
    end
end)

print("🏠 Da Hood Cheat by Quarz loaded! Press Right Shift to open GUI")
