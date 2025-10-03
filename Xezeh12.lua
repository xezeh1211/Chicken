-- Xezeh12 - Loadstring móvil (inicializa rápido <3s)
local screenParent = (type(gethui)=="function" and gethui()) or game:GetService("CoreGui")
pcall(function() if screenParent:FindFirstChild("Xezeh12") then screenParent:FindFirstChild("Xezeh12"):Destroy() end end)
local Xezeh12 = Instance.new("ScreenGui"); Xezeh12.Name="Xezeh12"; Xezeh12.ResetOnSpawn=false; Xezeh12.Parent=screenParent
local Main=Instance.new("Frame"); Main.Parent=Xezeh12; Main.Size=UDim2.new(0,300,0,260); Main.Position=UDim2.new(0.35,0,0.25,0)
Main.BackgroundColor3=Color3.fromRGB(30,30,30); Main.BorderSizePixel=0; Main.Active=true; Main.Draggable=true
local Title=Instance.new("TextLabel",Main); Title.Size=UDim2.new(1,0,0,30); Title.BackgroundTransparency=1; Title.Text="Xezeh12"; Title.TextColor3=Color3.fromRGB(255,255,255); Title.Font=Enum.Font.SourceSansBold; Title.TextSize=18
Instance.new("UICorner",Main)
local function createButton(t,y,p,w) local b=Instance.new("TextButton"); b.Size=UDim2.new(0,w or 280,0,36); b.Position=UDim2.new(0,10,0,y); b.BackgroundColor3=Color3.fromRGB(50,50,50); b.TextColor3=Color3.fromRGB(255,255,255); b.Font=Enum.Font.SourceSans; b.TextSize=16; b.Text=t; b.Parent=p; Instance.new("UICorner",b).CornerRadius=UDim.new(0,6); return b end
local RunService=game:GetService("RunService"); local Players=game:GetService("Players"); local LocalPlayer=Players.LocalPlayer

-- Botones
local bailarBtn = createButton("Bailar (Emote)",40,Main)
local flyBtn = createButton("Fly: Desactivado",86,Main)
local speedLabel = Instance.new("TextLabel",Main); speedLabel.Size=UDim2.new(0,120,0,24); speedLabel.Position=UDim2.new(0,10,0,128); speedLabel.BackgroundTransparency=1; speedLabel.TextColor3=Color3.fromRGB(255,255,255); speedLabel.Font=Enum.Font.SourceSans; speedLabel.TextSize=14; speedLabel.Text="Velocidad: 50"
local speedUp = createButton("Vel +",122,Main,130); speedUp.Position=UDim2.new(0,10,0,156)
local speedDown = createButton("Vel -",122,Main,130); speedDown.Position=UDim2.new(0,160,0,156)
local lagBtn = createButton("Fake Lag: Desactivado",192,Main)

-- Bailar (no bloquea)
bailarBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local a = Instance.new("Animation"); a.AnimationId = "rbxassetid://5917459362"
            local ok, track = pcall(function() return humanoid:LoadAnimation(a) end)
            if ok and track then track:Play(); task.delay(4, function() pcall(function() track:Stop() end) end) end
        end
    end
end)

-- Fly (rápido, sin Wait)
local flying=false; local flySpeed=50; local flyConn=nil
local function createBV(hrp)
    if not hrp then return end
    local bv = hrp:FindFirstChild("Xezeh12_BodyVelocity")
    if not bv then bv = Instance.new("BodyVelocity"); bv.Name="Xezeh12_BodyVelocity"; bv.MaxForce=Vector3.new(9e9,9e9,9e9); bv.P=1250; bv.Parent=hrp end
    return bv
end
local function enableFlyNow()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    if not hrp or not humanoid then return end
    local bv = createBV(hrp)
    if flyConn then pcall(function() flyConn:Disconnect() end) flyConn=nil end
    flyConn = RunService.Heartbeat:Connect(function()
        if not flying or not hrp or not bv.Parent then return end
        local moveDir = humanoid.MoveDirection or Vector3.new()
        bv.Velocity = moveDir * flySpeed
    end)
end
local function disableFlyNow()
    local char = LocalPlayer.Character
    if char then local hrp = char:FindFirstChild("HumanoidRootPart") if hrp then local v = hrp:FindFirstChild("Xezeh12_BodyVelocity") if v then pcall(function() v:Destroy() end) end end end
    if flyConn then pcall(function() flyConn:Disconnect() end) flyConn=nil end
end
flyBtn.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then flyBtn.Text="Fly: Activado" enableFlyNow() else flyBtn.Text="Fly: Desactivado" disableFlyNow() end
end)
speedUp.MouseButton1Click:Connect(function() flySpeed = math.clamp(flySpeed + 10, 10, 500); speedLabel.Text="Velocidad: "..tostring(flySpeed) end)
speedDown.MouseButton1Click:Connect(function() flySpeed = math.clamp(flySpeed - 10, 10, 500); speedLabel.Text="Velocidad: "..tostring(flySpeed) end)

-- Fake lag (toggle, sin bloquear)
local fakeLag=false; local lagConn=nil
local function startFakeLagNow()
    local char = LocalPlayer.Character; if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
    if lagConn then pcall(function() lagConn:Disconnect() end) lagConn=nil end
    lagConn = RunService.Heartbeat:Connect(function()
        if not fakeLag then return end
        if math.random() < 0.02 then pcall(function() hrp.CFrame = hrp.CFrame * CFrame.new(0,0,math.random(-3,3)) end) end
    end)
end
local function stopFakeLagNow() if lagConn then pcall(function() lagConn:Disconnect() end) lagConn=nil end end
lagBtn.MouseButton1Click:Connect(function() fakeLag = not fakeLag if fakeLag then lagBtn.Text="Fake Lag: Activado" startFakeLagNow() else lagBtn.Text="Fake Lag: Desactivado" stopFakeLagNow() end end)

-- Reaplicar rápido al reaparecer (no bloqueante)
LocalPlayer.CharacterAdded:Connect(function(char)
    task.spawn(function()
        if flying then disableFlyNow(); enableFlyNow() end
        if fakeLag then stopFakeLagNow(); startFakeLagNow() end
    end)
end)

-- Mensaje rápido de carga (no bloqueante)
task.spawn(function() pcall(function() print("✅ Xezeh12 listo (inicializado rápido)") end) end)
