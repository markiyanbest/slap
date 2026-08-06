if not game:IsLoaded() then game.Loaded:Wait() end

local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local MAIN_PLACE_ID = 6403373529 
local GITHUB_RAW_URL = "https://raw.githubusercontent.com/markiyanbest/slap/main/gaybattkes.lua"
local ConfigFile = "SlappleFarm_Settings.json"
local isInitializing = true
local noclipConnection = nil

-- АНТИ-БРАЗИЛІЯ: Перевірка ID при запуску
if game.PlaceId ~= MAIN_PLACE_ID then
    print("⚠️ ВІДНАЙДЕНО БРАЗИЛІЮ! ПОВЕРТАЄМОСЯ В ОСНОВНУ ГРУ...")
    _G.AllowTeleport = true
    pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, Players.LocalPlayer) end)
    return 
end

local serverStartTime = tick()
_G.AllowTeleport = false
_G.IsHopping = false
_G.TargetServerId = nil -- Змінна для жорсткого блокування телепортів до друзів

-- 1. МЕГА-ХУК: Блок телепортів + Античіт + АВТО-РЕДЖОЙН
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        -- АВТО-РЕДЖОЙН ПРИ КІКУ
        if self == Players.LocalPlayer and method == "Kick" then
            print("🚨 СПРОБА КІКУ! Причина: " .. tostring(args[1]) .. " | АВТО-РЕДЖОЙН!")
            _G.AllowTeleport = true
            task.spawn(function()
                task.wait(0.5)
                pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, Players.LocalPlayer) end)
            end)
            return nil 
        end

        -- ЖОРСТКИЙ ЗАХИСТ ВІД ТЕЛЕПОРТІВ (Блокує Бразилію та телепорти до друзів)
        if self == TeleportService then
            -- Блокуємо звичайний Teleport (бо він кидає до друзів)
            if method == "Teleport" then
                if _G.AllowTeleport and args[1] == MAIN_PLACE_ID and _G.TargetServerId == nil then
                    -- Дозволяємо тільки якщо це аварійний реджойн
                else
                    print("🛑 ЗАБЛОКОВАНО TELEPORT (може кинути до друга)!")
                    return nil
                end
            end
            
            -- Дозволяємо TeleportToPlaceInstance ТІЛЬКИ на наш цільовий сервер
            if method == "TeleportToPlaceInstance" then
                if not _G.AllowTeleport then return nil end
                local id = args[2]
                if id ~= _G.TargetServerId then
                    print("🛑 ЗАБЛОКОВАНО ТЕЛЕПОРТ ДО ДРУГА/ІНШОГО СЕРВЕРА!")
                    return nil
                end
            end

            -- Блокуємо TeleportAsync, якщо це не наш сервер
            if method == "TeleportAsync" then
                if not _G.AllowTeleport then return nil end
                local targetPlaceId = args[2]
                if targetPlaceId and targetPlaceId ~= MAIN_PLACE_ID then
                    return nil
                end
            end
        end

        -- БЛОКУВАННЯ АНТИЧІТУ SLAP BATTLES
        if method == "FireServer" or method == "InvokeServer" then
            if self.Name == "Kicker" or self.Name == "Ban" or self.Name == "LogTunnel" or self.Name == "ModerationRemote" then
                return nil 
            end
        end

        return oldNamecall(self, ...)
    end))
end

-- АВТО-РЕДЖОЙН ЯКЩО З'ЯВИТЬСЯ ВІКНО ПОМИЛКИ
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
                print("🚨 ЗНАЙДЕНО ВІКНО ПОМИЛКИ! АВТО-РЕДЖОЙН...")
                _G.AllowTeleport = true
                _G.TargetServerId = nil
                pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, Players.LocalPlayer) end)
            end
        end)
    end
end)

-- 2. Anti-AFK
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- 3. ВИМКНЕННЯ КЛІЄНТСЬКОГО АНТИЧІТУ
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

-- 4. Платформа
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

-- 5. Завантаження налаштувань
local function LoadSettings()
    if isfile and readfile and isfile(ConfigFile) then
        local success, result = pcall(function() return HttpService:JSONDecode(readfile(ConfigFile)) end)
        if success and type(result) == "table" then
            _G.SlappleFarm = result.SlappleFarm or false
            _G.AutoEnterArena = result.AutoEnterArena or false
            _G.ServerHopWhenEmpty = result.ServerHopWhenEmpty or false
            _G.AutoExecute = (result.AutoExecute ~= nil) and result.AutoExecute or true
            _G.TotalSlapsFarmed = result.TotalSlapsFarmed or 0
            return
        end
    end
    _G.SlappleFarm = false
    _G.AutoEnterArena = false
    _G.ServerHopWhenEmpty = true
    _G.AutoExecute = true
    _G.TotalSlapsFarmed = 0
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
                TotalSlapsFarmed = _G.TotalSlapsFarmed
            }))
        end)
    end
end

LoadSettings()

-- 6. ОПТИМІЗОВАНИЙ НОУКЛІП 
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

-- 7. АГРЕСИВНЕ БЛОКУВАННЯ БРАЗИЛІЇ
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

-- 8. Server Hop (НЕЗАЛЕЖНИЙ, НЕ МОЖЕ ЗАВИСНУТИ)
local function DoServerHop()
    if _G.IsHopping then return end
    _G.IsHopping = true
    _G.AllowTeleport = true
    serverStartTime = tick() -- Оновлюємо таймер, щоб дати хопу час

    SaveSettings() 

    pcall(function()
        OrionLib:MakeNotification({ 
            Name = "Server Hop 🚀", 
            Content = "Шукаємо порожній сервер...", 
            Image = "rbxassetid://7734053426", 
            Time = 2 
        }) 
    end)

    -- Діагностика Auto-Execute (НЕ ЧІПАЮ ЦЕЙ БЛОК)
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
                warn("❌ ПОМИЛКА AUTO-EXECUTE: " .. tostring(err))
            else
                print("✅ AUTO-EXECUTE успішно заплановано!")
            end
        else
            warn("⚠️ КРИТИЧНА ПОМИЛКА: Твій експлойтер НЕ підтримує queue_on_teleport!")
        end 
    else
        warn("⚠️ Авто-екзекьют вимкнено в налаштуваннях скрипта (вкладка UI).")
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
                -- Шукаємо сервери де менше 10 гравців (щоб точно не попасти на друзів і мати яблука)
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
        _G.TargetServerId = targetServerId -- Записуємо ID для фільтра
        -- Запускаємо телепорт в окремому потоці, щоб він НІКОЛИ не завис!
        task.spawn(function()
            pcall(function() TeleportService:TeleportToPlaceInstance(placeId, targetServerId, Players.LocalPlayer) end)
        end)
    else 
        print("⚠️ Не знайдено порожнього сервера, чекаємо 2 секунди...")
        task.wait(2)
        _G.IsHopping = false
        _G.AllowTeleport = false
        _G.TargetServerId = nil
        return
    end 
end

if not _G.TeleportHooked then
    _G.TeleportHooked = true
    TeleportService.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
        if player == Players.LocalPlayer then
            _G.IsHopping = false
            _G.AllowTeleport = false
            _G.TargetServerId = nil
            task.wait(1.5)
            if _G.SlappleFarm then
                DoServerHop()
            end
        end
    end)
end

-- 9. АБСОЛЮТНИЙ ТАЙМЕР ANTI-STUCK (ПРАЦЮЄ ЗАВЖДИ, НАВІТЬ ЯКЩО ХОП ЗАВИС)
task.spawn(function()
    while task.wait(1) do
        if _G.SlappleFarm then
            if tick() - serverStartTime > 25 then
                print("⚠️ МИНУЛО 25 СЕКУНД! ПРИМУСОВИЙ СКИД ХОПА...")
                _G.IsHopping = false
                _G.AllowTeleport = false
                _G.TargetServerId = nil
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

-- 10. Збір яблук 
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

-- 11. Інтерфейс
local Window = OrionLib:MakeWindow({
    Name = "Slapple Collector Hub 👏",
    IntroText = "Instant Start",
    IntroIcon = "rbxassetid://15315284749",
    HidePremium = false,
    SaveConfig = false,
    IntroEnabled = false, 
    ConfigFolder = "SlappleFarmConfig"
})

local Tab = Window:MakeTab({
    Name = "Slapples Farm",
    Icon = "rbxassetid://7733673987",
    PremiumOnly = false
})

local StatLabel = Tab:AddLabel("Нафармовано цим скриптом: " .. tostring(_G.TotalSlapsFarmed) .. " слапів")

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            StatLabel:Set("Нафармовано цим скриптом: " .. tostring(_G.TotalSlapsFarmed) .. " слапів")
        end)
    end
end)

Tab:AddToggle({
    Name = "Autofarm Slapples (Без ТП + Hop)",
    Default = _G.SlappleFarm,
    Callback = function(Value)
        _G.SlappleFarm = Value
        SaveSettings()
        SetNoclip(Value)

        if Value then 
            task.spawn(function() 
                while _G.SlappleFarm do 
                    local char = Players.LocalPlayer.Character 
                    
                    if char and not char:FindFirstChild("entered") then 
                        EnterArena() 
                        task.wait(0.5) 
                    end 

                    if char and char:FindFirstChild("entered") then
                        local gainedSlaps = CollectAllSlapplesRemote()

                        pcall(function()
                            if gainedSlaps > 0 then
                                OrionLib:MakeNotification({ 
                                    Name = "Slapple Farm 🍏", 
                                    Content = "Отримано: +" .. tostring(gainedSlaps) .. " слапів! Перехід...", 
                                    Image = "rbxassetid://7734053426", 
                                    Time = 2 
                                }) 
                            else
                                OrionLib:MakeNotification({ 
                                    Name = "Slapple Farm 🍏", 
                                    Content = "Слапів немає. Переходимо далі...", 
                                    Image = "rbxassetid://7734053426", 
                                    Time = 2 
                                }) 
                            end
                        end)

                        task.wait(3)
                        DoServerHop()
                        
                        -- ЧЕКАЄМО, ПОКИ ХОП ЗАВЕРШИТЬСЯ АБО ЗАВИСНЕ (через 25 сек він скинеться сам)
                        while _G.IsHopping and _G.SlappleFarm do
                            task.wait(0.5)
                        end
                    end
                    
                    task.wait(0.2) 
                end 
            end) 
        end 
    end 
})

Tab:AddToggle({
    Name = "Auto Enter Arena",
    Default = _G.AutoEnterArena,
    Callback = function(Value)
        _G.AutoEnterArena = Value
        SaveSettings()

        if Value then 
            task.spawn(function() 
                while _G.AutoEnterArena do 
                    EnterArena() 
                    task.wait(0.5) 
                end 
            end) 
        end 
    end 
})

Tab:AddToggle({
    Name = "Auto-Execute (Автозбереження)",
    Default = _G.AutoExecute,
    Callback = function(Value)
        _G.AutoExecute = Value
        SaveSettings()
    end
})

Tab:AddButton({
    Name = "Ручний Server Hop",
    Callback = function()
        DoServerHop()
    end
})

Tab:AddButton({
    Name = "Скинути лічильник",
    Callback = function()
        _G.TotalSlapsFarmed = 0
        SaveSettings()
        pcall(function()
            StatLabel:Set("Нафармовано цим скриптом: 0 слапів")
        end)
        OrionLib:MakeNotification({
            Name = "Статистика 🧹",
            Content = "Лічильник успішно скинуто!",
            Image = "rbxassetid://7734053426",
            Time = 2
        })
    end
})

local BypassTab = Window:MakeTab({
    Name = "Bypasses & Utils 🛡️",
    Icon = "rbxassetid://7733960948",
    PremiumOnly = false
})

BypassTab:AddLabel("Anti-Cheat Bypass: ✅ ACTIVE")
BypassTab:AddParagraph("Знищення клієнтських скриптів", "Скрипт видалив Anti-offset, Antidream, AntiMobileExploits та CodeDetector.")
BypassTab:AddLabel("Anti-Teleport: ✅ ACTIVE")
BypassTab:AddParagraph("Абсолютний захист від телепортів", "Будь-який телепорт, окрім конкретного Server Hop, блокується. До друзів не кидає.")
BypassTab:AddLabel("Anti-AFK: ✅ ACTIVE")
BypassTab:AddLabel("Auto-Rejoin: ✅ ACTIVE")
BypassTab:AddParagraph("Авто-Реджойн", "Якщо виникне помилка Profile Loading Error або кік, скрипт сам перезапустить тебе у гру.")
BypassTab:AddLabel("PC Optimized & Stable: ✅ ACTIVE")

isInitializing = false
