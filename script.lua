-- ULTIMATE Da Hood Cheat by Quarz - Tam Ayarlanabilir
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Ayarlar
local Settings = {
    -- Hareket
    speedEnabled = false,
    speedValue = 50,
    flyEnabled = false,
    flySpeed = 50,
    noclipEnabled = false,
    infiniteJumpEnabled = false,
    jumpPower = 50,
    bhopEnabled = false,
    
    -- Savaş
    aimbotEnabled = false,
    aimbotFOV = 100,
    aimbotSmooth = 5,
    silentAimEnabled = false,
    killAuraEnabled = false,
    killAuraRange = 20,
    triggerBotEnabled = false,
    rapidFireEnabled = false,
    autoReloadEnabled = false,
    
    -- Görsel
    espEnabled = false,
    wallhackEnabled = false,
    tracersEnabled = false,
    chamsEnabled = false,
    fullbrightEnabled = false,
    crosshairEnabled = false,
    
    -- Da Hood Özel
    autoStompEnabled = false,
    antiStompEnabled = false,
    cashGrabEnabled = false,
    autoPickupEnabled = false,
    autoRobEnabled = false,
    antiGrabEnabled = false,
    autoCarryEnabled = false,
    autoEatEnabled = false,
    autoHealEnabled = false,
    autoReviveEnabled = false,
    autoLockpickEnabled = false,
    autoMaskEnabled = false,
    
    -- Diğer
    godModeEnabled = false,
    invisibilityEnabled = false,
    antiKickEnabled = false,
    antiBanEnabled = false,
    chatSpamEnabled = false,
    autoFarmEnabled = false,
    autoClickerEnabled = false,
    clickerCPS = 10,
    
    -- Troll
    discoModeEnabled = false,
    rainbowLightingEnabled = false,
    earthquakeEnabled = false,
    musicSpamEnabled = false,
    explosionSpamEnabled = false
}

wait(2)

-- GUI Oluştur
local gui = Instance.new("ScreenGui")
gui.Name = "UltimateCheat"
gui.Parent = game.CoreGui

-- Ana çerçeve - Siyah tema, sağda konumlu
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 550, 0, 450)
main.Position = UDim2.new(1, -570, 0, 50)
main.BackgroundColor3 = Color3.new(0, 0, 0)
main.BorderColor3 = Color3.new(0.2, 0.2, 0.2)
main.BorderSizePixel = 2
main.Active = true
main.Draggable = true
main.Parent = gui

-- Başlık
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
title.BorderSizePixel = 0
title.Text = "🔥 ULTIMATE DA HOOD CHEAT 🔥"
title.TextColor3 = Color3.new(1, 0.2, 0.2)
title.TextScaled = true
title.Font = Enum.Font.SourceSansBold
title.Parent = main

-- Scroll Frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -80)
scrollFrame.Position = UDim2.new(0, 5, 0, 40)
scrollFrame.BackgroundColor3 = Color3.new(0.02, 0.02, 0.02)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 8
scrollFrame.ScrollBarImageColor3 = Color3.new(0.3, 0.3, 0.3)
scrollFrame.Parent = main

-- Layout
local layout = Instance.new("UIListLayout")
layout.Parent = scrollFrame
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 3)

-- Buton oluşturma fonksiyonu
local function createButton(name, setting, hasSlider, minVal, maxVal, valueKey)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, hasSlider and 70 or 40)
    frame.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
    frame.BorderColor3 = Color3.new(0.15, 0.15, 0.15)
    frame.BorderSizePixel = 1
    frame.Parent = scrollFrame
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(hasSlider and 0.65 or 1, hasSlider and -5 or -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, 2)
    btn.BackgroundColor3 = Settings[setting] and Color3.new(0, 0.4, 0) or Color3.new(0.4, 0, 0)
    btn.Text = name .. ": " .. (Settings[setting] and "AÇIK" or "KAPALI")
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSans
    btn.BorderSizePixel = 0
    btn.Parent = frame
    
    btn.MouseButton1Click:Connect(function()
        Settings[setting] = not Settings[setting]
        btn.BackgroundColor3 = Settings[setting] and Color3.new(0, 0.4, 0) or Color3.new(0.4, 0, 0)
        btn.Text = name .. ": " .. (Settings[setting] and "AÇIK" or "KAPALI")
    end)
    
    if hasSlider then
        local decreaseBtn = Instance.new("TextButton")
        decreaseBtn.Size = UDim2.new(0.15, 0, 0, 35)
        decreaseBtn.Position = UDim2.new(0.67, 0, 0, 2)
        decreaseBtn.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
        decreaseBtn.Text = "-"
        decreaseBtn.TextColor3 = Color3.new(1, 1, 1)
        decreaseBtn.TextScaled = true
        decreaseBtn.Font = Enum.Font.SourceSansBold
        decreaseBtn.BorderSizePixel = 0
        decreaseBtn.Parent = frame
        
        local increaseBtn = Instance.new("TextButton")
        increaseBtn.Size = UDim2.new(0.15, 0, 0, 35)
        increaseBtn.Position = UDim2.new(0.83, 0, 0, 2)
        increaseBtn.BackgroundColor3 = Color3.new(0.1, 0.3, 0.1)
        increaseBtn.Text = "+"
        increaseBtn.TextColor3 = Color3.new(1, 1, 1)
        increaseBtn.TextScaled = true
        increaseBtn.Font = Enum.Font.SourceSansBold
        increaseBtn.BorderSizePixel = 0
        increaseBtn.Parent = frame
        
        local valueLabel = Instance.new("TextLabel")
        valueLabel.Size = UDim2.new(1, -10, 0, 30)
        valueLabel.Position = UDim2.new(0, 5, 0, 37)
        valueLabel.BackgroundTransparency = 1
        valueLabel.Text = valueKey .. ": " .. Settings[valueKey]
        valueLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        valueLabel.TextScaled = true
        valueLabel.Font = Enum.Font.SourceSans
        valueLabel.TextXAlignment = Enum.TextXAlignment.Left
        valueLabel.Parent = frame
        
        decreaseBtn.MouseButton1Click:Connect(function()
            if Settings[valueKey] > minVal then
                Settings[valueKey] = Settings[valueKey] - (maxVal > 100 and 10 or 1)
                valueLabel.Text = valueKey .. ": " .. Settings[valueKey]
            end
        end)
        
        increaseBtn.MouseButton1Click:Connect(function()
            if Settings[valueKey] < maxVal then
                Settings[valueKey] = Settings[valueKey] + (maxVal > 100 and 10 or 1)
                valueLabel.Text = valueKey .. ": " .. Settings[valueKey]
            end
        end)
    end
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

-- Kategori başlığı oluşturma
local function createCategory(name)
    local categoryFrame = Instance.new("Frame")
    categoryFrame.Size = UDim2.new(1, -10, 0, 30)
    categoryFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    categoryFrame.BorderSizePixel = 0
    categoryFrame.Parent = scrollFrame
    
    local categoryLabel = Instance.new("TextLabel")
    categoryLabel.Size = UDim2.new(1, 0, 1, 0)
    categoryLabel.BackgroundTransparency = 1
    categoryLabel.Text = "📁 " .. name
    categoryLabel.TextColor3 = Color3.new(1, 1, 0)
    categoryLabel.TextScaled = true
    categoryLabel.Font = Enum.Font.SourceSansBold
    categoryLabel.Parent = categoryFrame
    
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
end

-- Kategoriler ve butonlar
createCategory("HAREKET HİLELERİ")
createButton("Hız Hilesi", "speedEnabled", true, 16, 200, "speedValue")
createButton("Uçma Hilesi", "flyEnabled", true, 16, 100, "flySpeed")
createButton("Duvar Geçme", "noclipEnabled", false)
createButton("Sonsuz Zıplama", "infiniteJumpEnabled", true, 50, 200, "jumpPower")
createButton("Tavşan Zıplaması", "bhopEnabled", false)

createCategory("SAVAŞ HİLELERİ")
createButton("Aimbot", "aimbotEnabled", true, 50, 200, "aimbotFOV")
createButton("Sessiz Nişan", "silentAimEnabled", false)
createButton("Öldürme Aurası", "killAuraEnabled", true, 5, 50, "killAuraRange")
createButton("Tetik Botu", "triggerBotEnabled", false)
createButton("Hızlı Ateş", "rapidFireEnabled", false)
createButton("Otomatik Doldurma", "autoReloadEnabled", false)

createCategory("GÖRSEL HİLELER")
createButton("ESP (Oyuncu Görme)", "espEnabled", false)
createButton("Duvar Hilesi", "wallhackEnabled", false)
createButton("İzleyici Çizgiler", "tracersEnabled", false)
createButton("Chams", "chamsEnabled", false)
createButton("Tam Parlaklık", "fullbrightEnabled", false)
createButton("Nişangah", "crosshairEnabled", false)

createCategory("DA HOOD ÖZEL")
createButton("Otomatik Ezme", "autoStompEnabled", false)
createButton("Ezme Koruması", "antiStompEnabled", false)
createButton("Para Toplama", "cashGrabEnabled", false)
createButton("Otomatik Silah Alma", "autoPickupEnabled", false)
createButton("Otomatik Soygun", "autoRobEnabled", false)
createButton("Kapma Koruması", "antiGrabEnabled", false)
createButton("Otomatik Taşıma", "autoCarryEnabled", false)
createButton("Otomatik Yemek", "autoEatEnabled", false)
createButton("Otomatik İyileşme", "autoHealEnabled", false)
createButton("Otomatik Canlandırma", "autoReviveEnabled", false)
createButton("Otomatik Kilit Açma", "autoLockpickEnabled", false)
createButton("Otomatik Maske", "autoMaskEnabled", false)

createCategory("DİĞER HİLELER")
createButton("Tanrı Modu", "godModeEnabled", false)
createButton("Görünmezlik", "invisibilityEnabled", false)
createButton("Atılma Koruması", "antiKickEnabled", false)
createButton("Ban Koruması", "antiBanEnabled", false)
createButton("Chat Spam", "chatSpamEnabled", false)
createButton("Otomatik Farm", "autoFarmEnabled", false)
createButton("Otomatik Tıklayıcı", "autoClickerEnabled", true, 1, 20, "clickerCPS")

createCategory("TROLL HİLELERİ")
createButton("Disko Modu", "discoModeEnabled", false)
createButton("Gökkuşağı Işık", "rainbowLightingEnabled", false)
createButton("Deprem", "earthquakeEnabled", false)
createButton("Müzik Spam", "musicSpamEnabled", false)
createButton("Patlama Spam", "explosionSpamEnabled", false)

-- Kapatma butonu
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.BackgroundColor3 = Color3.new(0.8, 0, 0)
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.BorderSizePixel = 0
closeBtn.Parent = main

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- ESP Fonksiyonu
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
                    esp.Size = UDim2.new(0, 150, 0, 80)
                    esp.StudsOffset = Vector3.new(0, 2, 0)
                    esp.AlwaysOnTop = true
                    
                    local frame = Instance.new("Frame")
                    frame.Parent = esp
                    frame.Size = UDim2.new(1, 0, 1, 0)
                    frame.BackgroundColor3 = Color3.new(0, 0, 0)
                    frame.BackgroundTransparency = 0.3
                    frame.BorderColor3 = Color3.new(1, 0, 0)
                    frame.BorderSizePixel = 2
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Parent = frame
                    nameLabel.Size = UDim2.new(1, 0, 0.4, 0)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = "👤 " .. player.Name
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextScaled = true
                    nameLabel.Font = Enum.Font.SourceSansBold
                    
                    local distLabel = Instance.new("TextLabel")
                    distLabel.Parent = frame
                    distLabel.Size = UDim2.new(1, 0, 0.3, 0)
                    distLabel.Position = UDim2.new(0, 0, 0.4, 0)
                    distLabel.BackgroundTransparency = 1
                    distLabel.TextColor3 = Color3.new(0, 1, 1)
                    distLabel.TextScaled = true
                    distLabel.Font = Enum.Font.SourceSans
                    
                    local healthLabel = Instance.new("TextLabel")
                    healthLabel.Parent = frame
                    healthLabel.Size = UDim2.new(1, 0, 0.3, 0)
                    healthLabel.Position = UDim2.new(0, 0, 0.7, 0)
                    healthLabel.BackgroundTransparency = 1
                    healthLabel.TextColor3 = Color3.new(1, 0, 0)
                    healthLabel.TextScaled = true
                    healthLabel.Font = Enum.Font.SourceSans
                    
                    spawn(function()
                        while esp.Parent do
                            wait(0.1)
                            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                                distLabel.Text = "📏 " .. math.floor(distance) .. " stud"
                                
                                local humanoid = player.Character:FindFirstChild("Humanoid")
                                if humanoid then
                                    healthLabel.Text = "❤️ " .. math.floor(humanoid.Health) .. "/" .. math.floor(humanoid.MaxHealth)
                                end
                            end
                            esp.Enabled = Settings.espEnabled
                        end
                    end)
                end
            end
        end
    end)
end

-- Aimbot fonksiyonu
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.Head.Position).Magnitude
            if distance < shortestDistance and distance <= Settings.aimbotFOV then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    return closestPlayer
end

-- Ana döngü
spawn(function()
    while true do
        wait(0.05)
        
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            
            -- Hız hilesi
            if Settings.speedEnabled and humanoid then
                humanoid.WalkSpeed = Settings.speedValue
            elseif humanoid then
                humanoid.WalkSpeed = 16
            end
            
            -- Uçma hilesi
            if Settings.flyEnabled and rootPart then
                local bodyVelocity = rootPart:FindFirstChild("BodyVelocity")
                if not bodyVelocity then
                    bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
                    bodyVelocity.Parent = rootPart
                end
                
                local moveVector = Vector3.new(0, 0, 0)
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveVector = moveVector + Camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveVector = moveVector - Camera.CFrame.LookVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveVector = moveVector - Camera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveVector = moveVector + Camera.CFrame.RightVector
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveVector = moveVector + Vector3.new(0, 1, 0)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveVector = moveVector - Vector3.new(0, 1, 0)
                end
                
                bodyVelocity.Velocity = moveVector * Settings.flySpeed
            else
                local bodyVelocity = rootPart and rootPart:FindFirstChild("BodyVelocity")
                if bodyVelocity then bodyVelocity:Destroy() end
            end
            
            -- Duvar geçme
            if Settings.noclipEnabled then
                for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            else
                for _, part in pairs(LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = true
                    end
                end
            end
            
            -- Tanrı modu
            if Settings.godModeEnabled and humanoid then
                humanoid.Health = humanoid.MaxHealth
            end
            
            -- Sonsuz zıplama
            if Settings.infiniteJumpEnabled and humanoid then
                humanoid.JumpPower = Settings.jumpPower
            elseif humanoid then
                humanoid.JumpPower = 50
            end
            
            -- Otomatik ezme
            if Settings.autoStompEnabled then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
                        local pHumanoid = player.Character.Humanoid
                        if pHumanoid.PlatformStand then
                            local distance = (rootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if distance <= 10 then
                                if ReplicatedStorage:FindFirstChild("MainEvent") then
                                    ReplicatedStorage.MainEvent:FireServer("Stomp")
                                end
                            end
                        end
                    end
                end
            end
            
            -- Para toplama
            if Settings.cashGrabEnabled then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "Part" and obj:FindFirstChild("TouchInterest") and obj:FindFirstChild("Weld") then
                        if (rootPart.Position - obj.Position).Magnitude <= 20 then
                            rootPart.CFrame = obj.CFrame
                        end
                    end
                end
            end
            
            -- Otomatik silah alma
            if Settings.autoPickupEnabled then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj:IsA("Tool") and (obj.Name:find("Glock") or obj.Name:find("AK47") or obj.Name:find("AR") or obj.Name:find("Shotgun") or obj.Name:find("SMG")) then
                        if obj:FindFirstChild("Handle") and (rootPart.Position - obj.Handle.Position).Magnitude <= 15 then
                            obj.Handle.CFrame = rootPart.CFrame
                        end
                    end
                end
            end
            
            -- Ezme koruması
            if Settings.antiStompEnabled and humanoid then
                if humanoid.PlatformStand then
                    humanoid.PlatformStand = false
                    rootPart.CFrame = rootPart.CFrame + Vector3.new(0, 10, 0)
                end
            end
            
            -- Öldürme aurası
            if Settings.killAuraEnabled then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local distance = (rootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= Settings.killAuraRange then
                            Mouse.Button1Down()
                            wait(0.1)
                            Mouse.Button1Up()
                        end
                    end
                end
            end
            
            -- Aimbot
            if Settings.aimbotEnabled then
                local target = getClosestPlayer()
                if target and target.Character and target.Character:FindFirstChild("Head") then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
                end
            end
            
            -- Tam parlaklık
            if Settings.fullbrightEnabled then
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
            end
            
            -- Gökkuşağı ışık
            if Settings.rainbowLightingEnabled then
                Lighting.Ambient = Color3.fromHSV(tick() % 5 / 5, 1, 1)
            end
            
            -- Disko modu
            if Settings.discoModeEnabled then
                Lighting.Brightness = math.random(0, 3)
                Lighting.Ambient = Color3.fromHSV(math.random(), 1, 1)
            end
            
            -- Otomatik tıklayıcı
            if Settings.autoClickerEnabled then
                Mouse.Button1Down()
                wait(1 / Settings.clickerCPS)
                Mouse.Button1Up()
            end
            
            -- Otomatik soygun
            if Settings.autoRobEnabled then
                for _, obj in pairs(workspace:GetChildren()) do
                    if obj.Name == "ATM" or obj.Name == "Store" or obj.Name == "Bank" then
                        if (rootPart.Position - obj.Position).Magnitude <= 10 then
                            if ReplicatedStorage:FindFirstChild("MainEvent") then
                                ReplicatedStorage.MainEvent:FireServer("AttemptRob", obj)
                            end
                        end
                    end
                end
            end
            
            -- Otomatik yemek
            if Settings.autoEatEnabled then
                for _, obj in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if obj.Name:find("Apple") or obj.Name:find("Taco") or obj.Name:find("Pizza") then
                        humanoid:EquipTool(obj)
                        wait(0.5)
                        obj:Activate()
                    end
                end
            end
            
            -- Otomatik iyileşme
            if Settings.autoHealEnabled and humanoid then
                if humanoid.Health < humanoid.MaxHealth * 0.5 then
                    for _, obj in pairs(LocalPlayer.Backpack:GetChildren()) do
                        if obj.Name:find("Bandage") or obj.Name:find("MedKit") then
                            humanoid:EquipTool(obj)
                            wait(0.5)
                            obj:Activate()
                        end
                    end
                end
            end
        end
    end
end)

-- ESP kurulumu
for _, player in pairs(Players:GetPlayers()) do
    createESP(player)
end
Players.PlayerAdded:Connect(createESP)

-- GUI açma/kapama
UserInputService.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.Insert then
        main.Visible = not main.Visible
    end
end)

print("🔥 ULTIMATE Da Hood Cheat yüklendi! INSERT tuşu ile aç/kapat 🔥")
