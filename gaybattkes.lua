if not game:IsLoaded() then game.Loaded:Wait() end

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MAIN_PLACE_ID = 6403373529 
local GITHUB_RAW_URL = "https://raw.githubusercontent.com/markiyanbest/slap/main/gaybattkes.lua"
local ConfigFile = "SlappleFarm_Settings.json"
local isInitializing = true
local noclipConnection = nil
local keepWSConnection = nil
local currentWalkSpeed = 20
local flyConnection = nil
local flyBV = nil
local flyBG = nil
local antiVoidConn = nil
local hitboxLoop = nil
local hitboxSize = 10
local autoSlapConn = nil
local slapReach = 15

if game.PlaceId ~= MAIN_PLACE_ID then
    print("⚠️ BRAZIL DETECTED! RETURNING TO MAIN GAME...")
    _G.AllowTeleport = true
    pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, Players.LocalPlayer) end)
    return 
end

local serverStartTime = tick()
_G.AllowTeleport = false
_G.IsHopping = false
_G.HopDelay = 3

-- 1. МЕГА-ХУК
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if self == Players.LocalPlayer and method == "Kick" then
            print("🚨 KICK ATTEMPT! Reason: " .. tostring(args[1]) .. " | AUTO-REJOIN!")
            _G.AllowTeleport = true
            task.spawn(function()
                task.wait(0.5)
                pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, Players.LocalPlayer) end)
            end)
            return nil 
        end

        if self == TeleportService and (method == "Teleport" or method == "TeleportToPlaceInstance" or method == "TeleportAsync") then
            if not _G.AllowTeleport then return nil end
            local targetPlaceId = method == "TeleportAsync" and args[2] or args[1]
            if targetPlaceId and targetPlaceId ~= MAIN_PLACE_ID then
                return nil
            end
        end

        if method == "FireServer" or method == "InvokeServer" then
            if self.Name == "Kicker" or self.Name == "Ban" or self.Name == "LogTunnel" or self.Name == "ModerationRemote" or self.Name == "AdminGUI" or self.Name == "WalkSpeedChanged" then
                return nil 
            end
        end

        return oldNamecall(self, ...)
    end))
end

-- АВТО-РЕДЖОЙН
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            local pGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
            local cGui = game:GetService("CoreGui")
            local errorFound = false
            
            if pGui then
                for _, v in ipairs(pGui:GetChildren()) do
                    if v:IsA("ScreenGui") and (v.Name:lower():find("error") or (v.Name:lower():find("profile") and v.Name:lower():find("load"))) then
                        errorFound = true
                        break
                    end
                end
            end
            
            if not errorFound and cGui then
                for _, v in ipairs(cGui:GetChildren()) do
                    if v:IsA("ScreenGui") and v.Name:lower():find("error") then
                        errorFound = true
                        break
                    end
                end
            end
            
            if errorFound then
                print("🚨 ERROR WINDOW DETECTED! AUTO-REJOIN...")
                _G.AllowTeleport = true
                pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, Players.LocalPlayer) end)
            end
        end)
    end
end)

Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local function DisableClientAnticheats()
    pcall(function()
        local playerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts")
        local clientAC = playerScripts:FindFirstChild("ClientAnticheat")
        if clientAC then
            local antiMobile = clientAC:FindFirstChild("AntiMobileExploits")
            if antiMobile then antiMobile.Disabled = true; antiMobile:Destroy() end
        end
        local legacyClient = playerScripts:FindFirstChild("LegacyClient")
        if legacyClient then
            local antiOffset = legacyClient:FindFirstChild("Anti-offset")
            if antiOffset then antiOffset.Disabled = true; antiOffset:Destroy() end
            local antiDream = legacyClient:FindFirstChild("Antidream")
            if antiDream then antiDream.Disabled = true; antiDream:Destroy() end
        end
        local debugRoom = workspace:FindFirstChild("Debug Room")
        if debugRoom then
            local detector = debugRoom:FindFirstChild("CodeDetector")
            if detector then detector.Disabled = true; detector:Destroy() end
        end
    end)
end
DisableClientAnticheats()

local safePlatform = workspace:FindFirstChild("SlappleSafePlatform")
if not safePlatform then
    safePlatform = Instance.new("Part")
    safePlatform.Name = "SlappleSafePlatform"
    safePlatform.Size = Vector3.new(30, 2, 30)
    safePlatform.Anchored = true
    safePlatform.Transparency = 1
    safePlatform.CanCollide = true
    safePlatform.Parent = workspace
end

local safeBox = workspace:FindFirstChild("SafeBox")
if not safeBox then
    safeBox = Instance.new("Part")
    safeBox.Name = "SafeBox"
    safeBox.Size = Vector3.new(50, 5, 50)
    safeBox.Position = Vector3.new(-5500, -5000, -5000)
    safeBox.Anchored = true
    safeBox.Transparency = 0.5
    safeBox.CanCollide = true
    safeBox.Parent = workspace
end

local function LoadSettings()
    if isfile and readfile and isfile(ConfigFile) then
        local success, result = pcall(function() return HttpService:JSONDecode(readfile(ConfigFile)) end)
        if success and type(result) == "table" then
            _G.SlappleFarm = result.SlappleFarm or false
            _G.AutoEnterArena = result.AutoEnterArena or false
            _G.ServerHopWhenEmpty = result.ServerHopWhenEmpty or false
            _G.AutoExecute = (result.AutoExecute ~= nil) and result.AutoExecute or true
            _G.TotalSlapsFarmed = result.TotalSlapsFarmed or 0
            _G.HopDelay = result.HopDelay or 3
            return
        end
    end
    _G.SlappleFarm = false
    _G.AutoEnterArena = false
    _G.ServerHopWhenEmpty = true
    _G.AutoExecute = true
    _G.TotalSlapsFarmed = 0
    _G.HopDelay = 3
end

local function SaveSettings()
    if isInitializing then return end
    if writefile then
        pcall(function()
            writefile(ConfigFile, HttpService:JSONEncode({
                SlappleFarm = _G.SlappleFarm,
                AutoEnterArena = _G.AutoEnterArena,
                ServerHopWhenEmpty = _G.ServerHopWhenEmpty,
                AutoExecute = _G.AutoExecute,
                TotalSlapsFarmed = _G.TotalSlapsFarmed,
                HopDelay = _G.HopDelay
            }))
        end)
    end
end

LoadSettings()

local function SetNoclip(state)
    if state then
        if not noclipConnection then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = Players.LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") and v.CanCollide and v.Name ~= "SlappleSafePlatform" then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
    end
end

local function DisableBrazilPortal()
    pcall(function()
        local lobby = workspace:FindFirstChild("Lobby")
        if lobby then
            local brazil = lobby:FindFirstChild("brazil")
            if brazil then
                for _, v in pairs(brazil:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanTouch = false
                        v.CanCollide = false
                        v.Transparency = 1
                    end
                end
                brazil:Destroy() 
            end
        end
    end)
end

task.spawn(function()
    while task.wait(1) do
        DisableBrazilPortal()
    end
end)

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Orion_Library_PE_V2.lua"))()

local function DoServerHop()
    if _G.IsHopping then return end
    _G.IsHopping = true
    _G.AllowTeleport = true
    serverStartTime = tick()

    SaveSettings() 

    pcall(function()
        OrionLib:MakeNotification({ 
            Name = "Server Hop", 
            Content = "Searching for empty server...", 
            Image = "rbxassetid://7734053426", 
            Time = 2 
        }) 
    end)

    if _G.AutoExecute then 
        local q = queue_on_teleport or queueonteleport
        if not q and getgenv then
            q = getgenv().queue_on_teleport or getgenv().queueonteleport
        end
        
        if q then 
            local execCode = 'repeat task.wait() until game:IsLoaded(); loadstring(game:HttpGet("' .. GITHUB_RAW_URL .. '"))()'
            local success, err = pcall(function() 
                q(execCode)
            end)
            if not success then
                warn("AUTO-EXECUTE ERROR: " .. tostring(err))
            end
        end
    end 

    local placeId = game.PlaceId 
    local jobId = game.JobId 
    local targetServerId = nil 

    local success, response = pcall(function() 
        return game:HttpGet("https://games.roblox.com/v1/games/" .. tostring(placeId) .. "/servers/Public?sortOrder=Asc&limit=100") 
    end) 

    if success and response then 
        local decodeSuccess, decoded = pcall(function() return HttpService:JSONDecode(response) end) 
        if decodeSuccess and decoded and decoded.data then 
            local validServers = {} 
            for _, server in ipairs(decoded.data) do 
                if type(server) == "table" and server.playing and server.maxPlayers and server.playing < 10 and server.id ~= jobId then 
                    table.insert(validServers, server.id) 
                end 
            end 
            if #validServers > 0 then 
                targetServerId = validServers[math.random(1, #validServers)] 
            end 
        end 
    end 

    if targetServerId then 
        local tpSuccess, tpErr = pcall(function() 
            TeleportService:TeleportToPlaceInstance(placeId, targetServerId, Players.LocalPlayer) 
        end)
        
        if not tpSuccess then
            task.wait(1)
            _G.IsHopping = false
            _G.AllowTeleport = false
            DoServerHop()
            return
        end
    else 
        task.wait(2)
        _G.IsHopping = false
        _G.AllowTeleport = false
        return
    end 

    task.delay(6, function()
        _G.IsHopping = false 
        _G.AllowTeleport = false
        serverStartTime = tick() 
    end)
end

if not _G.TeleportHooked then
    _G.TeleportHooked = true
    TeleportService.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
        if player == Players.LocalPlayer then
            _G.IsHopping = false
            _G.AllowTeleport = false
            task.wait(1.5)
            if _G.SlappleFarm then
                DoServerHop()
            end
        end
    end)
end

task.spawn(function()
    while task.wait(1) do
        if _G.SlappleFarm then
            if tick() - serverStartTime > 30 then
                _G.IsHopping = false
                _G.AllowTeleport = false
                DoServerHop()
                serverStartTime = tick() 
            end
        end
    end
end)

local function EnterArena()
    local char = Players.LocalPlayer.Character
    if char and char:FindFirstChild("Head") and not char:FindFirstChild("entered") then
        local lobby = workspace:FindFirstChild("Lobby")
        if lobby and lobby:FindFirstChild("Teleport1") then
            firetouchinterest(char.Head, lobby.Teleport1, 0)
            task.wait() 
            firetouchinterest(char.Head, lobby.Teleport1, 1)
        end
    end
end

local function GetSlappleTouchPart(slapple)
    if slapple:FindFirstChild("Glove") and slapple.Glove:IsA("BasePart") then
        return slapple.Glove
    elseif slapple:IsA("BasePart") then
        return slapple
    else
        for _, child in ipairs(slapple:GetChildren()) do
            if child:IsA("BasePart") then
                return child
            end
        end
    end
    return nil
end

local function CollectAllSlapplesRemote()
    local char = Players.LocalPlayer.Character
    local leaderstats = Players.LocalPlayer:FindFirstChild("leaderstats")
    
    local startSlaps = 0
    if leaderstats and leaderstats:FindFirstChild("Slaps") then
        startSlaps = leaderstats.Slaps.Value
    end

    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("entered") then 
        local hrp = char.HumanoidRootPart
        local arena = workspace:FindFirstChild("Arena")

        if arena and arena:FindFirstChild("island5") and arena.island5:FindFirstChild("Slapples") then 
            local island = arena.island5
            local slappleContainer = island.Slapples

            local islandCFrame = island:IsA("Model") and island:GetPivot() or island.CFrame
            local safeCFrame = islandCFrame * CFrame.new(0, -15, 0)
            safePlatform.CFrame = islandCFrame * CFrame.new(0, -17, 0)

            if (hrp.Position - safeCFrame.Position).Magnitude > 5 then
                pcall(function()
                    hrp.CFrame = safeCFrame
                    hrp.AssemblyLinearVelocity = Vector3.zero
                end)
                task.wait(0.1) 
            end

            local function TryCollect()
                for _, v in ipairs(slappleContainer:GetChildren()) do 
                    if not _G.SlappleFarm then break end
                    if v.Name == "Slapple" or v.Name == "GoldenSlapple" or v.Name:find("Slapple") then 
                        local targetPart = GetSlappleTouchPart(v)
                        if targetPart then
                            pcall(function()
                                firetouchinterest(hrp, targetPart, 0) 
                                task.wait(0.08) 
                                firetouchinterest(hrp, targetPart, 1) 
                            end)
                        end
                    end 
                end
            end

            TryCollect()
            task.wait(0.4)
            
            local hasLeft = false
            for _, v in ipairs(slappleContainer:GetChildren()) do
                if v.Name == "Slapple" or v.Name == "GoldenSlapple" or v.Name:find("Slapple") then
                    hasLeft = true
                    break
                end
            end
            
            if hasLeft then
                TryCollect()
                task.wait(0.3)
            end
        end 
    end 
    
    local endSlaps = 0
    if leaderstats and leaderstats:FindFirstChild("Slaps") then
        endSlaps = leaderstats.Slaps.Value
    end
    
    local gainedSlaps = endSlaps - startSlaps
    if gainedSlaps > 0 then
        _G.TotalSlapsFarmed = _G.TotalSlapsFarmed + gainedSlaps
        SaveSettings()
    end
    
    return gainedSlaps
end

local function SetFly(state, speed)
    local char = Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local hum = char.Humanoid

    if state then
        hum.PlatformStand = true
        if not hrp:FindFirstChild("FlyBV") then
            flyBV = Instance.new("BodyVelocity")
            flyBV.Name = "FlyBV"
            flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBV.Velocity = Vector3.new(0,0,0)
            flyBV.Parent = hrp
            
            flyBG = Instance.new("BodyGyro")
            flyBG.Name = "FlyBG"
            flyBG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
            flyBG.P = 1000
            flyBG.D = 50
            flyBG.Parent = hrp
        end

        if flyConnection then flyConnection:Disconnect() end
        flyConnection = RunService.RenderStepped:Connect(function()
            local cam = Workspace.CurrentCamera
            local cframe = cam.CFrame
            
            local velocity = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then velocity = velocity - cframe.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then velocity = velocity + cframe.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then velocity = velocity + cframe.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then velocity = velocity - cframe.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then velocity = velocity + cframe.UpVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then velocity = velocity - cframe.UpVector end
            
            if velocity.Magnitude > 0 then
                velocity = velocity.Unit * speed
            end
            
            flyBV.Velocity = velocity
            flyBG.CFrame = cframe
        end)
    else
        if flyConnection then flyConnection:Disconnect() flyConnection = nil end
        if hrp:FindFirstChild("FlyBV") then hrp.FlyBV:Destroy() end
        if hrp:FindFirstChild("FlyBG") then hrp.FlyBG:Destroy() end
        if hum then hum.PlatformStand = false end
    end
end

local function SetHitbox(state)
    if hitboxLoop then 
        hitboxLoop:Disconnect()
        hitboxLoop = nil 
    end
    
    if state then
        getgenv().HitboxEnabled = true
        hitboxLoop = task.spawn(function()
            while getgenv().HitboxEnabled do
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        pcall(function()
                            -- Перевіряємо розмір, щоб не паралізувати гравця
                            if v.Character.HumanoidRootPart.Size.X ~= hitboxSize then
                                v.Character.HumanoidRootPart.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                                v.Character.HumanoidRootPart.Transparency = 0.7
                                v.Character.HumanoidRootPart.CanCollide = false
                                v.Character.HumanoidRootPart.Massless = true
                            end
                        end)
                    end
                end
                task.wait(1) -- Повільніше оновлення, щоб не було лагів
            end
        end)
    else
        getgenv().HitboxEnabled = false
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    v.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    v.Character.HumanoidRootPart.Transparency = 1
                    v.Character.HumanoidRootPart.Massless = false
                end)
            end
        end
    end
end

local function SetupAntiRagdoll(char)
    if not char then return end
    local rag = char:WaitForChild("Ragdolled", 5)
    if rag then
        rag.Changed:Connect(function(val)
            if val and getgenv().AntiRagdoll then
                rag.Value = false
                if char:FindFirstChild("Torso") then char.Torso.Anchored = false end
                if char:FindFirstChild("HumanoidRootPart") then char.HumanoidRootPart.Anchored = false end
            end
        end)
    end
end
Players.LocalPlayer.CharacterAdded:Connect(SetupAntiRagdoll)
if Players.LocalPlayer.Character then SetupAntiRagdoll(Players.LocalPlayer.Character) end

local function SetAutoSlap(state, reach)
    if autoSlapConn then autoSlapConn:Disconnect() autoSlapConn = nil end
    if state then
        autoSlapConn = task.spawn(function()
            while getgenv().AutoSlap do
                local char = Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("entered") then
                    local hrp = char.HumanoidRootPart
                    for _, v in pairs(Players:GetPlayers()) do
                        if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("entered") then
                            local dist = (hrp.Position - v.Character.HumanoidRootPart.Position).Magnitude
                            if dist <= reach then
                                pcall(function()
                                    ReplicatedStorage.b:FireServer(v.Character.HumanoidRootPart, true)
                                end)
                            end
                        end
                    end
                end
                task.wait(0.2) -- Затримка, щоб не кікнуло за спам ремоутів!
            end
        end)
    end
end

-- ІНТЕРФЕЙС
local Window = OrionLib:MakeWindow({
    Name = "Slap Battles Ultimate Hub",
    IntroText = "Loading...",
    IntroIcon = "rbxassetid://15315284749",
    HidePremium = false,
    SaveConfig = false,
    IntroEnabled = false, 
    ConfigFolder = "SlapBattlesUltimate"
})

-- ВКЛАДКА 1: ФАРМ
local FarmTab = Window:MakeTab({Name = "Slapples Farm", Icon = "rbxassetid://7733673987", PremiumOnly = false})
local StatLabel = FarmTab:AddLabel("Farmed: " .. tostring(_G.TotalSlapsFarmed) .. " slaps")
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            StatLabel:Set("Farmed: " .. tostring(_G.TotalSlapsFarmed) .. " slaps")
        end)
    end
end)

FarmTab:AddSlider({
    Name = "Delay before Server Hop (sec)", 
    Min = 1, Max = 5, Default = _G.HopDelay, 
    Color = Color3.fromRGB(255,255,255), Increment = 1, 
    Callback = function(Value) 
        _G.HopDelay = Value; SaveSettings() 
    end
})

FarmTab:AddToggle({
    Name = "Autofarm Slapples (No TP + Hop)", 
    Default = _G.SlappleFarm, 
    Callback = function(Value)
        _G.SlappleFarm = Value; SaveSettings(); SetNoclip(Value)
        if Value then 
            task.spawn(function() 
                while _G.SlappleFarm do 
                    local char = Players.LocalPlayer.Character 
                    
                    if char and not char:FindFirstChild("entered") then 
                        EnterArena(); task.wait(0.5) 
                    end 

                    if char and char:FindFirstChild("entered") then
                        local gainedSlaps = CollectAllSlapplesRemote()
                        pcall(function()
                            if gainedSlaps > 0 then 
                                OrionLib:MakeNotification({Name = "Slapple Farm", Content = "Got: +" .. tostring(gainedSlaps) .. " slaps! Hopping...", Image = "rbxassetid://7734053426", Time = 2}) 
                            end
                        end)

                        task.wait(_G.HopDelay)
                        DoServerHop()
                        while _G.IsHopping and _G.SlappleFarm do task.wait(0.5) end
                    end
                    
                    task.wait(0.2) 
                end 
            end) 
        end 
    end
})

FarmTab:AddToggle({
    Name = "Auto-Execute", 
    Default = _G.AutoExecute, 
    Callback = function(Value) 
        _G.AutoExecute = Value; SaveSettings() 
    end
})

FarmTab:AddButton({
    Name = "Manual Server Hop", 
    Callback = function() 
        DoServerHop() 
    end
})

FarmTab:AddButton({
    Name = "Reset Counter", 
    Callback = function() 
        _G.TotalSlapsFarmed = 0; SaveSettings(); pcall(function() StatLabel:Set("Farmed: 0 slaps") end) 
    end
})

-- ВКЛАДКА 2: БЕЙДЖІ
local BadgesTab = Window:MakeTab({Name = "Badges", Icon = "rbxassetid://7733673987", PremiumOnly = false})
local BadgeSection = BadgesTab:AddSection({Name = "Badges"})

BadgeSection:AddButton({
    Name = "Get Lone Orange Badge", 
    Callback = function() 
        pcall(function() 
            local arena = workspace:FindFirstChild("Arena")
            if arena and arena:FindFirstChild("island5") and arena.island5:FindFirstChild("Orange") then
                fireclickdetector(arena.island5.Orange.ClickDetector) 
            end
        end) 
    end
})

BadgeSection:AddButton({
    Name = "Get Duck Badge", 
    Callback = function() 
        pcall(function() 
            local arena = workspace:FindFirstChild("Arena")
            if arena and arena:FindFirstChild("default island") and arena["default island"]:FindFirstChild("Rubber Ducky") then
                fireclickdetector(arena["default island"]["Rubber Ducky"].ClickDetector) 
            end
        end) 
    end
})

BadgeSection:AddButton({
    Name = "Get Knife Badge", 
    Callback = function() 
        pcall(function() 
            local lobby = workspace:FindFirstChild("Lobby")
            if lobby and lobby:FindFirstChild("Scene") and lobby.Scene:FindFirstChild("knofe") then
                fireclickdetector(lobby.Scene.knofe.ClickDetector) 
            end
        end) 
    end
})

-- ВКЛАДКА 3: ТЕЛЕПОРТИ
local TeleportsTab = Window:MakeTab({Name = "Teleports", Icon = "rbxassetid://4370318685", PremiumOnly = false})
local TPSection = TeleportsTab:AddSection({Name = "Teleports"})

TPSection:AddButton({
    Name = "TP To Arena", 
    Callback = function() 
        local c = Players.LocalPlayer.Character; local origo = workspace:FindFirstChild("Origo")
        if c and origo then c.HumanoidRootPart.CFrame = origo.CFrame * CFrame.new(0,-5,0) end 
    end
})

TPSection:AddButton({
    Name = "TP To Slapple Island", 
    Callback = function() 
        local c = Players.LocalPlayer.Character; local arena = workspace:FindFirstChild("Arena")
        if c and arena and arena:FindFirstChild("island5") and arena.island5:FindFirstChild("Union") then 
            c.HumanoidRootPart.CFrame = arena.island5.Union.CFrame * CFrame.new(0, 5, 0) 
        end 
    end
})

TPSection:AddButton({
    Name = "TP To Lobby", 
    Callback = function() 
        local c = Players.LocalPlayer.Character
        if c then c.HumanoidRootPart.CFrame = CFrame.new(-800,328,-2.5) end 
    end
})

TPSection:AddButton({
    Name = "TP To Cannon Island", 
    Callback = function() 
        local c = Players.LocalPlayer.Character; local arena = workspace:FindFirstChild("Arena")
        if c and arena and arena:FindFirstChild("CannonIsland") and arena.CannonIsland:FindFirstChild("Cannon") then 
            c.HumanoidRootPart.CFrame = arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0,5,0) 
        end 
    end
})

TPSection:AddButton({
    Name = "TP To Moai Island", 
    Callback = function() 
        local c = Players.LocalPlayer.Character
        if c then c.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5) end 
    end
})

TPSection:AddButton({
    Name = "TP To Safe Spot", 
    Callback = function() 
        local c = Players.LocalPlayer.Character
        if c and safeBox then c.HumanoidRootPart.CFrame = safeBox.CFrame * CFrame.new(0, 5, 0) end 
    end
})

-- ВКЛАДКА 4: РУХ
local MovementTab = Window:MakeTab({Name = "Movement", Icon = "rbxassetid://4335489011", PremiumOnly = false})

MovementTab:AddSlider({
    Name = "WalkSpeed", 
    Min = 20, Max = 500, Default = 20, Increment = 1, 
    Callback = function(Value)
        currentWalkSpeed = Value; local char = Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = Value end
    end
})

MovementTab:AddToggle({
    Name = "Keep WalkSpeed", 
    Default = false, 
    Callback = function(Value)
        if keepWSConnection then keepWSConnection:Disconnect() end
        if Value then
            keepWSConnection = RunService.Heartbeat:Connect(function()
                local char = Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    if char.Humanoid.WalkSpeed ~= currentWalkSpeed then char.Humanoid.WalkSpeed = currentWalkSpeed end
                end
            end)
        end
    end
})

MovementTab:AddSlider({
    Name = "JumpPower", 
    Min = 50, Max = 500, Default = 50, Increment = 1, 
    Callback = function(Value)
        local char = Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then char.Humanoid.JumpPower = Value end
    end
})

MovementTab:AddSlider({
    Name = "Gravity", 
    Min = 0, Max = 196, Default = 196, Increment = 1, 
    Callback = function(Value) Workspace.Gravity = Value end
})

MovementTab:AddToggle({
    Name = "Noclip", 
    Default = false, 
    Callback = function(Value) SetNoclip(Value) end
})

local flySpeedVal = 50
MovementTab:AddSlider({
    Name = "Fly Speed", 
    Min = 10, Max = 300, Default = 50, Increment = 1, 
    Callback = function(Value) flySpeedVal = Value end
})

MovementTab:AddToggle({
    Name = "CFrame Fly", 
    Default = false, 
    Callback = function(Value) SetFly(Value, flySpeedVal) end
})

-- ВКЛАДКА 5: БОЙОВІ
local CombatTab = Window:MakeTab({Name = "Combat", Icon = "rbxassetid://7734053426", PremiumOnly = false})

CombatTab:AddSlider({
    Name = "Hitbox Size", 
    Min = 5, Max = 50, Default = 10, Increment = 1, 
    Callback = function(Value) hitboxSize = Value end
})

CombatTab:AddToggle({
    Name = "Hitbox Expander", 
    Default = false, 
    Callback = function(Value) SetHitbox(Value) end
})

CombatTab:AddToggle({
    Name = "Anti-Ragdoll", 
    Default = false, 
    Callback = function(Value) getgenv().AntiRagdoll = Value end
})

CombatTab:AddSlider({
    Name = "Slap Reach", 
    Min = 5, Max = 50, Default = 15, Increment = 1, 
    Callback = function(Value) slapReach = Value end
})

CombatTab:AddToggle({
    Name = "Auto Slap Aura", 
    Default = false, 
    Callback = function(Value) 
        getgenv().AutoSlap = Value; SetAutoSlap(Value, slapReach) 
    end
})

-- ВКЛАДКА 6: АВТО-ЗБІР
local CollectTab = Window:MakeTab({Name = "Auto Collect", Icon = "rbxassetid://7733955740", PremiumOnly = false})

CollectTab:AddToggle({
    Name = "Auto Collect Orbs & Gifts", 
    Default = false, 
    Callback = function(Value)
        getgenv().AutoCollectOrbs = Value
        if Value then
            task.spawn(function()
                while getgenv().AutoCollectOrbs do
                    local char = Players.LocalPlayer.Character
                    if char and char:FindFirstChild("Head") and char:FindFirstChild("entered") then
                        for _, v in pairs(workspace:GetDescendants()) do
                            if v.Name == "JetOrb" or v.Name == "PhaseOrb" or v.Name == "SiphonOrb" or v.Name == "Gift" then
                                if v:IsA("BasePart") then
                                    pcall(function()
                                        firetouchinterest(char.Head, v, 0)
                                        task.wait(0.01)
                                        firetouchinterest(char.Head, v, 1)
                                    end)
                                end
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- ВКЛАДКА 7: ВІЗУАЛ ТА FPS
local VisualTab = Window:MakeTab({Name = "Visuals & FPS", Icon = "rbxassetid://4370318685", PremiumOnly = false})

VisualTab:AddToggle({
    Name = "FPS Booster", 
    Default = false, 
    Callback = function(Value)
        if Value then
            Lighting.GlobalShadows = false; Lighting.FogEnd = 9e9; Lighting.Brightness = 0
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") then
                    v.Enabled = false
                elseif v:IsA("Atmosphere") then
                    pcall(function() v:Destroy() end)
                end
            end
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    pcall(function() v.Enabled = false end)
                end
            end
        else
            Lighting.GlobalShadows = true; Lighting.FogEnd = 100000; Lighting.Brightness = 2
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("SunRaysEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("DepthOfFieldEffect") then
                    v.Enabled = true
                end
            end
        end
    end
})

-- ВКЛАДКА 8: ОБХОДИ ТА ЗАХИСТ
local BypassTab = Window:MakeTab({Name = "Bypasses & Anti", Icon = "rbxassetid://7733960948", PremiumOnly = false})

BypassTab:AddLabel("Anti-Cheat Bypass: ACTIVE")
BypassTab:AddParagraph("Destroyed client scripts", "Anti-offset, Antidream, CodeDetector")
BypassTab:AddLabel("Anti-Teleport: ACTIVE")
BypassTab:AddLabel("Anti-AFK: ACTIVE")
BypassTab:AddLabel("Auto-Rejoin: ACTIVE")

BypassTab:AddToggle({
    Name = "Anti-Void", 
    Default = false, 
    Callback = function(Value)
        if antiVoidConn then antiVoidConn:Disconnect() end
        if Value then
            antiVoidConn = task.spawn(function()
                while getgenv().AntiVoidOn do
                    local char = Players.LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") then
                        if char.HumanoidRootPart.Position.Y < -50 then
                            local arena = workspace:FindFirstChild("Arena")
                            local origo = workspace:FindFirstChild("Origo")
                            if arena and arena:FindFirstChild("island5") and origo then
                                char.HumanoidRootPart.CFrame = origo.CFrame * CFrame.new(0, -5, 0)
                                char.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
                            else
                                char.HumanoidRootPart.CFrame = CFrame.new(-800, 328, -2.5)
                            end
                        end
                    end
                    task.wait(0.5) -- Повільніша перевірка, щоб не було лагів
                end
            end)
            getgenv().AntiVoidOn = true
        else
            getgenv().AntiVoidOn = false
        end
    end
})

BypassTab:AddLabel("WalkSpeed Bypass: ACTIVE")
BypassTab:AddLabel("CFrame Bypass: ACTIVE")

isInitializing = false
