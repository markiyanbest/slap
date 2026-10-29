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
local GuiService = game:GetService("GuiService")
local BadgeService = game:GetService("BadgeService")

local LocalPlayer = Players.LocalPlayer
local MAIN_PLACE_ID = 6403373529 
local GITHUB_RAW_URL = "https://raw.githubusercontent.com/markiyanbest/slap/main/gaybattkes.lua"
local ConfigFile = "SlappleFarm_Settings.json"

pcall(function() GuiService:ClearError() end)

if game.PlaceId ~= MAIN_PLACE_ID and game.PlaceId ~= 9015014224 then
    print("⚠️ BRAZIL / OTHER PLACE DETECTED! RETURNING TO MAIN GAME...")
    _G.AllowTeleport = true
    pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, LocalPlayer) end)
    return 
end

-- ================= ТАБЛИЦЯ УДАРІВ З GIANG HUB (ПІДТРИМКА ВСІХ РУКАВИЦЬ) =================
local gloveHits = {
    ["Default"] = ReplicatedStorage:FindFirstChild("b"),
    ["Extended"] = ReplicatedStorage:FindFirstChild("b"),
    ["T H I C K"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Squid"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Gummy"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["RNG"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Tycoon"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Charge"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Baller"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Tableflip"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Booster"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Shield"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Track"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Goofy"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Confusion"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Elude"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Glitch"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Snowball"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["fish"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Killerfish"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["🗿"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Obby"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Voodoo"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Leash"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Flamarang"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Berserk"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Quake"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Rattlebones"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Chain"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Ping Pong"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Whirlwind"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Slicer"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Counter"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Hammer"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Excavator"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Home Run"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Psycho"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Kraken"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Gravity"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Lure"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Jebaited"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Meteor"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Tinkerer"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Guardian Angel"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Sun"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Necromancer"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Zombie"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Dual"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Alchemist"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Parry"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Druid"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Oven"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Jester"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Ferryman"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Scythe"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Blackhole"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Santa"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Grapple"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Iceskate"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Pan"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Blasphemy"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Blink"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Ultra Instinct"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Admin"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Prop"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Joust"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Slapstick"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Firework"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Run"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Beatdown"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["L.O.L.B.O.M.B"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Glovel"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Chicken"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Divebomb"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Lamp"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Pocket"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["BONK"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Knockoff"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Divert"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Frostbite"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Sbeve"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Plank"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Golem"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Spoonful"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Grab"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["the schlop"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["UFO"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["el gato"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Siphon"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Hive"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Wrench"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Hunter"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Relude"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Avatar"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Demolition"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Shotgun"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["Beachball"] = ReplicatedStorage:FindFirstChild("GeneralHit"),
    ["ZZZZZZZ"] = ReplicatedStorage:FindFirstChild("ZZZZZZZHit"),
    ["Brick"] = ReplicatedStorage:FindFirstChild("BrickHit"),
    ["Snow"] = ReplicatedStorage:FindFirstChild("SnowHit"),
    ["Pull"] = ReplicatedStorage:FindFirstChild("PullHit"),
    ["Flash"] = ReplicatedStorage:FindFirstChild("FlashHit"),
    ["Spring"] = ReplicatedStorage:FindFirstChild("springhit"),
    ["Swapper"] = ReplicatedStorage:FindFirstChild("HitSwapper"),
    ["Bull"] = ReplicatedStorage:FindFirstChild("BullHit"),
    ["Dice"] = ReplicatedStorage:FindFirstChild("DiceHit"),
    ["Ghost"] = ReplicatedStorage:FindFirstChild("GhostHit"),
    ["Thanos"] = ReplicatedStorage:FindFirstChild("ThanosHit"),
    ["Stun"] = ReplicatedStorage:FindFirstChild("HtStun"),
    ["Za Hando"] = ReplicatedStorage:FindFirstChild("zhramt"),
    ["Fort"] = ReplicatedStorage:FindFirstChild("Fort"),
    ["Magnet"] = ReplicatedStorage:FindFirstChild("MagnetHIT"),
    ["Pusher"] = ReplicatedStorage:FindFirstChild("PusherHit"),
    ["Anchor"] = ReplicatedStorage:FindFirstChild("hitAnchor"),
    ["Space"] = ReplicatedStorage:FindFirstChild("HtSpace"),
    ["Boomerang"] = ReplicatedStorage:FindFirstChild("BoomerangH"),
    ["Speedrun"] = ReplicatedStorage:FindFirstChild("Speedrunhit"),
    ["Mail"] = ReplicatedStorage:FindFirstChild("MailHit"),
    ["Golden"] = ReplicatedStorage:FindFirstChild("GoldenHit"),
    ["MR"] = ReplicatedStorage:FindFirstChild("MisterHit"),
    ["Reaper"] = ReplicatedStorage:FindFirstChild("ReaperHit"),
    ["Replica"] = ReplicatedStorage:FindFirstChild("ReplicaHit"),
    ["Defense"] = ReplicatedStorage:FindFirstChild("DefenseHit"),
    ["Killstreak"] = ReplicatedStorage:FindFirstChild("KSHit"),
    ["Reverse"] = ReplicatedStorage:FindFirstChild("ReverseHit"),
    ["Shukuchi"] = ReplicatedStorage:FindFirstChild("ShukuchiHit"),
    ["Duelist"] = ReplicatedStorage:FindFirstChild("DuelistHit"),
    ["woah"] = ReplicatedStorage:FindFirstChild("woahHit"),
    ["Ice"] = ReplicatedStorage:FindFirstChild("IceHit"),
    ["Adios"] = ReplicatedStorage:FindFirstChild("hitAdios"),
    ["Blocked"] = ReplicatedStorage:FindFirstChild("BlockedHit"),
    ["Engineer"] = ReplicatedStorage:FindFirstChild("engiehit"),
    ["Rocky"] = ReplicatedStorage:FindFirstChild("RockyHit"),
    ["Conveyor"] = ReplicatedStorage:FindFirstChild("ConvHit"),
    ["STOP"] = ReplicatedStorage:FindFirstChild("STOP"),
    ["Phantom"] = ReplicatedStorage:FindFirstChild("PhantomHit"),
    ["Wormhole"] = ReplicatedStorage:FindFirstChild("WormHit"),
    ["Acrobat"] = ReplicatedStorage:FindFirstChild("AcHit"),
    ["Plague"] = ReplicatedStorage:FindFirstChild("PlagueHit"),
    ["[REDACTED]"] = ReplicatedStorage:FindFirstChild("ReHit"),
    ["bus"] = ReplicatedStorage:FindFirstChild("hitbus"),
    ["Phase"] = ReplicatedStorage:FindFirstChild("PhaseH"),
    ["Warp"] = ReplicatedStorage:FindFirstChild("WarpHt"),
    ["Bomb"] = ReplicatedStorage:FindFirstChild("BombHit"),
    ["Bubble"] = ReplicatedStorage:FindFirstChild("BubbleHit"),
    ["Jet"] = ReplicatedStorage:FindFirstChild("JetHit"),
    ["Shard"] = ReplicatedStorage:FindFirstChild("ShardHIT"),
    ["potato"] = ReplicatedStorage:FindFirstChild("potatohit"),
    ["CULT"] = ReplicatedStorage:FindFirstChild("CULTHit"),
    ["bob"] = ReplicatedStorage:FindFirstChild("bobhit"),
    ["Buddies"] = ReplicatedStorage:FindFirstChild("buddiesHIT"),
    ["Spy"] = ReplicatedStorage:FindFirstChild("SpyHit"),
    ["Detonator"] = ReplicatedStorage:FindFirstChild("DetonatorHit"),
    ["Rage"] = ReplicatedStorage:FindFirstChild("GRRRR"),
    ["Trap"] = ReplicatedStorage:FindFirstChild("traphi"),
    ["Orbit"] = ReplicatedStorage:FindFirstChild("Orbihit"),
    ["Hybrid"] = ReplicatedStorage:FindFirstChild("HybridCLAP"),
    ["Slapple"] = ReplicatedStorage:FindFirstChild("SlappleHit"),
    ["Disarm"] = ReplicatedStorage:FindFirstChild("DisarmH"),
    ["Dominance"] = ReplicatedStorage:FindFirstChild("DominanceHit"),
    ["Link"] = ReplicatedStorage:FindFirstChild("LinkHit"),
    ["Rojo"] = ReplicatedStorage:FindFirstChild("RojoHit"),
    ["rob"] = ReplicatedStorage:FindFirstChild("robhit"),
    ["Rhythm"] = ReplicatedStorage:FindFirstChild("rhythmhit"),
    ["Nightmare"] = ReplicatedStorage:FindFirstChild("nightmarehit"),
    ["Hitman"] = ReplicatedStorage:FindFirstChild("HitmanHit"),
    ["Thor"] = ReplicatedStorage:FindFirstChild("ThorHit"),
    ["Retro"] = ReplicatedStorage:FindFirstChild("RetroHit"),
    ["Cloud"] = ReplicatedStorage:FindFirstChild("CloudHit"),
    ["Null"] = ReplicatedStorage:FindFirstChild("NullHit"),
    ["spin"] = ReplicatedStorage:FindFirstChild("spinhit"),
    ["Kinetic"] = ReplicatedStorage:FindFirstChild("HtStun"),
    ["Recall"] = ReplicatedStorage:FindFirstChild("HtStun"),
    ["Balloony"] = ReplicatedStorage:FindFirstChild("HtStun"),
    ["Sparky"] = ReplicatedStorage:FindFirstChild("HtStun"),
    ["Boogie"] = ReplicatedStorage:FindFirstChild("HtStun"),
    ["Coil"] = ReplicatedStorage:FindFirstChild("HtStun"),
    ["Diamond"] = ReplicatedStorage:FindFirstChild("DiamondHit"),
    ["Megarock"] = ReplicatedStorage:FindFirstChild("DiamondHit"),
    ["Moon"] = ReplicatedStorage:FindFirstChild("CelestialHit"),
    ["Jupiter"] = ReplicatedStorage:FindFirstChild("CelestialHit"),
    ["Mitten"] = ReplicatedStorage:FindFirstChild("MittenHit"),
    ["Hallow Jack"] = ReplicatedStorage:FindFirstChild("HallowHIT"),
    ["OVERKILL"] = ReplicatedStorage:FindFirstChild("Overkillhit"),
    ["The Flex"] = ReplicatedStorage:FindFirstChild("FlexHit"),
    ["Custom"] = ReplicatedStorage:FindFirstChild("CustomHit"),
    ["God's Hand"] = ReplicatedStorage:FindFirstChild("Godshand"),
    ["Error"] = ReplicatedStorage:FindFirstChild("Errorhit")
}

local isInitializing = true
local noclipConnection = nil
local keepWSConnection = nil
local currentWalkSpeed = 20
local currentJumpPower = 50
local flyConnection = nil
local flyBV = nil
local flyBG = nil

-- Потоки
local hitboxThread = nil
local hitboxSize = 10
local autoSlapThread = nil
local slapReach = 20
local espThread = nil
local antiFxThread = nil
local orbCollectThread = nil
local mainFarmThread = nil
local noHopSlappleThread = nil
local noHopCandyThread = nil
local gloveExtendThread = nil

local function StopThread(t)
    if t then pcall(task.cancel, t) end
    return nil
end

local serverStartTime = tick()
_G.AllowTeleport = false
_G.IsHopping = false
_G.HopDelay = 2

-- ================= 1. МЕГА-ХУК ТА ЗАХИСТ З GIANG HUB =================
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if self == LocalPlayer and method == "Kick" then
            print("🚨 KICK ATTEMPT! Reason: " .. tostring(args[1]) .. " | AUTO-REJOIN!")
            _G.AllowTeleport = true
            task.spawn(function()
                task.wait(0.5)
                pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, LocalPlayer) end)
            end)
            return nil 
        end

        if self == TeleportService and (method == "Teleport" or method == "TeleportToPlaceInstance" or method == "TeleportAsync") then
            if not _G.AllowTeleport then return nil end
            local targetPlaceId = method == "TeleportAsync" and args[2] or args[1]
            if targetPlaceId and targetPlaceId ~= MAIN_PLACE_ID and targetPlaceId ~= 9015014224 then
                return nil
            end
        end

        if method == "FireServer" or method == "InvokeServer" then
            if self == ReplicatedStorage:FindFirstChild("Ban") or self == ReplicatedStorage:FindFirstChild("AdminGUI") or self == ReplicatedStorage:FindFirstChild("WalkSpeedChanged") then
                return nil
            end
            if self.Name == "Kicker" or self.Name == "Ban" or self.Name == "LogTunnel" or self.Name == "ModerationRemote" or self.Name == "AdminGUI" or self.Name == "WalkSpeedChanged" then
                return nil 
            end
        end

        return oldNamecall(self, ...)
    end))
end

-- АВТО-РЕДЖОЙН ПРИ ПОМИЛКАХ / КІКУ
task.spawn(function()
    while task.wait(1.5) do
        pcall(function()
            local promptOverlay = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
            if promptOverlay and promptOverlay:FindFirstChild("promptOverlay") then
                for _, v in pairs(promptOverlay.promptOverlay:GetDescendants()) do
                    if v.Name == "ErrorPrompt" then
                        _G.AllowTeleport = true
                        TeleportService:Teleport(MAIN_PLACE_ID, LocalPlayer)
                        break
                    end
                end
            end
        end)
    end
end)

-- ANTI-AFK (GetConnections + VirtualUser)
if getconnections then
    for _, v in next, getconnections(LocalPlayer.Idled) do
        v:Disable()
    end
end
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local function DisableClientAnticheats()
    pcall(function()
        local playerScripts = LocalPlayer:WaitForChild("PlayerScripts", 5)
        if playerScripts then
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
        end
        local debugRoom = Workspace:FindFirstChild("Debug Room")
        if debugRoom then
            local detector = debugRoom:FindFirstChild("CodeDetector")
            if detector then detector.Disabled = true; detector:Destroy() end
        end
    end)
end
DisableClientAnticheats()

-- ================= 2. ПЛАТФОРМИ, SAFEBOX ТА ANTI-VOID З GIANG HUB =================
local safePlatform = Workspace:FindFirstChild("SlappleSafePlatform")
if not safePlatform then
    safePlatform = Instance.new("Part")
    safePlatform.Name = "SlappleSafePlatform"
    safePlatform.Size = Vector3.new(30, 2, 30)
    safePlatform.Anchored = true
    safePlatform.Transparency = 1
    safePlatform.CanCollide = true
    safePlatform.Parent = Workspace
end

if Workspace:FindFirstChild("SafeBox") == nil then
    local S = Instance.new("Part", Workspace)
    S.Name = "SafeBox"
    S.Anchored = true
    S.CanCollide = true
    S.Transparency = 0.5
    S.Position = Vector3.new(-5500, -5000, -5000)
    S.Size = Vector3.new(21, 5, 21)
end

if Workspace:FindFirstChild("Safespot") == nil then
    local Safespot = Instance.new("Part", Workspace)
    Safespot.Name = "Safespot"
    Safespot.Position = Vector3.new(10000, -50, 10000)
    Safespot.Size = Vector3.new(500, 10, 500)
    Safespot.Anchored = true
    Safespot.CanCollide = true
    Safespot.Transparency = 0.5
end

if Workspace:FindFirstChild("VoidPart") == nil then
    local VoidPart = Instance.new("Part", Workspace)
    VoidPart.Position = Vector3.new(-80.5, -10.005, -246.5)
    VoidPart.Name = "VoidPart"
    VoidPart.Size = Vector3.new(2048, 1, 2048)
    VoidPart.Material = Enum.Material.ForceField
    VoidPart.Anchored = true
    VoidPart.Transparency = 1
    VoidPart.CanCollide = false

    local TAntiVoid = Instance.new("Part", VoidPart)
    TAntiVoid.Name = "TAntiVoid"
    TAntiVoid.Size = Vector3.new(2048, 15, 2048)
    TAntiVoid.Position = Vector3.new(3450, 59.009, 68)
    TAntiVoid.Anchored = true
    TAntiVoid.Transparency = 1
    TAntiVoid.CanCollide = false
end

-- ================= 3. КОНФІГ =================
local function LoadSettings()
    if isfile and readfile and isfile(ConfigFile) then
        local success, result = pcall(function() return HttpService:JSONDecode(readfile(ConfigFile)) end)
        if success and type(result) == "table" then
            _G.SlappleFarm = result.SlappleFarm or false
            _G.CandyCornFarm = result.CandyCornFarm or false
            _G.AutoExecute = (result.AutoExecute ~= nil) and result.AutoExecute or true
            _G.TotalSlapsFarmed = result.TotalSlapsFarmed or 0
            _G.TotalCandyFarmed = result.TotalCandyFarmed or 0
            _G.HopDelay = result.HopDelay or 2
            return
        end
    end
    _G.SlappleFarm = false
    _G.CandyCornFarm = false
    _G.AutoExecute = true
    _G.TotalSlapsFarmed = 0
    _G.TotalCandyFarmed = 0
    _G.HopDelay = 2
end

local function SaveSettings()
    if isInitializing then return end
    if writefile then
        pcall(function()
            writefile(ConfigFile, HttpService:JSONEncode({
                SlappleFarm = _G.SlappleFarm,
                CandyCornFarm = _G.CandyCornFarm,
                AutoExecute = _G.AutoExecute,
                TotalSlapsFarmed = _G.TotalSlapsFarmed,
                TotalCandyFarmed = _G.TotalCandyFarmed,
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
                local char = LocalPlayer.Character
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

-- Вимкнення порталу в Бразилію
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local lobby = Workspace:FindFirstChild("Lobby")
            if lobby and lobby:FindFirstChild("brazil") then
                for _, v in pairs(lobby.brazil:GetDescendants()) do
                    if v:IsA("BasePart") then v.CanTouch = false end
                end
            end
        end)
    end
end)

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Orion_Library_PE_V2.lua"))()

-- ================= 4. SERVER HOP ТА ФАРМ ЯБЛУК І ЦУКЕРОК (МЕТОД GIANG HUB) =================
local function DoServerHop()
    if _G.IsHopping then return end
    _G.IsHopping = true
    _G.AllowTeleport = true
    serverStartTime = tick()

    SaveSettings() 

    pcall(function()
        OrionLib:MakeNotification({ 
            Name = "Server Hop", 
            Content = "Searching for new server...", 
            Image = "rbxassetid://7734053426", 
            Time = 2 
        }) 
    end)

    if _G.AutoExecute then 
        local q = queue_on_teleport or queueonteleport or (getgenv and (getgenv().queue_on_teleport or getgenv().queueonteleport))
        if q then 
            local execCode = 'repeat task.wait() until game:IsLoaded(); loadstring(game:HttpGet("' .. GITHUB_RAW_URL .. '"))()'
            pcall(function() q(execCode) end)
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
                if type(server) == "table" and server.playing and server.maxPlayers and server.playing < server.maxPlayers and server.id ~= jobId then 
                    table.insert(validServers, server.id) 
                end 
            end 
            if #validServers > 0 then 
                targetServerId = validServers[math.random(1, #validServers)] 
            end 
        end 
    end 

    if targetServerId then 
        local tpSuccess = pcall(function() 
            TeleportService:TeleportToPlaceInstance(placeId, targetServerId, LocalPlayer) 
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
    TeleportService.TeleportInitFailed:Connect(function(player)
        if player == LocalPlayer then
            _G.IsHopping = false
            _G.AllowTeleport = false
            task.wait(1.5)
            if _G.SlappleFarm or _G.CandyCornFarm then
                DoServerHop()
            end
        end
    end)
end

task.spawn(function()
    while task.wait(1) do
        if _G.SlappleFarm or _G.CandyCornFarm then
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
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Head") and not char:FindFirstChild("entered") then
        local lobby = Workspace:FindFirstChild("Lobby")
        if lobby and lobby:FindFirstChild("Teleport1") then
            firetouchinterest(char.Head, lobby.Teleport1, 0)
            firetouchinterest(char.Head, lobby.Teleport1, 1)
        end
    end
end

local function MoveToHiddenPlatform()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local hrp = char.HumanoidRootPart
    local arena = Workspace:FindFirstChild("Arena")

    if arena and arena:FindFirstChild("island5") then
        local island = arena.island5
        local islandCFrame = island:IsA("Model") and island:GetPivot() or island.CFrame
        local safeCFrame = islandCFrame * CFrame.new(0, -15, 0)
        safePlatform.CFrame = islandCFrame * CFrame.new(0, -17, 0)

        if (hrp.Position - safeCFrame.Position).Magnitude > 5 then
            pcall(function()
                hrp.CFrame = safeCFrame
                hrp.AssemblyLinearVelocity = Vector3.zero
            end)
        end
    end
    return hrp
end

-- ТОЧНИЙ МЕТОД З GIANG HUB ДЛЯ SLAPPLES (МИТТЄВИЙ ЗБІР ЗА 1 КАДР БЕЗ ТЕЛЕПОРТУ)
local function LootSlapplesGiangMethod()
    local char = LocalPlayer.Character
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    local startSlaps = (leaderstats and leaderstats:FindFirstChild("Slaps")) and leaderstats.Slaps.Value or 0

    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("entered") then
        MoveToHiddenPlatform()
        local arena = Workspace:FindFirstChild("Arena")
        if arena and arena:FindFirstChild("island5") and arena.island5:FindFirstChild("Slapples") then
            for _ = 1, 8 do
                for _, v in pairs(arena.island5.Slapples:GetChildren()) do
                    if char:FindFirstChild("HumanoidRootPart") and (v.Name == "Slapple" or v.Name == "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(char.HumanoidRootPart, v.Glove, 0)
                        firetouchinterest(char.HumanoidRootPart, v.Glove, 1)
                    end
                end
                task.wait(0.05)
            end
        end
    end

    local endSlaps = (leaderstats and leaderstats:FindFirstChild("Slaps")) and leaderstats.Slaps.Value or 0
    local gained = math.max(0, endSlaps - startSlaps)
    if gained > 0 then
        _G.TotalSlapsFarmed = _G.TotalSlapsFarmed + gained
        SaveSettings()
    end
    return gained
end

-- ТОЧНИЙ МЕТОД З GIANG HUB ДЛЯ CANDY CORN (ЧЕРЕЗ HEAD + TOUCHTRANSMITTER ЗА 1 КАДР БЕЗ ТЕЛЕПОРТУ)
local function LootCandyGiangMethod()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Head") then return 0 end

    MoveToHiddenPlatform()
    local candyFolder = Workspace:FindFirstChild("CandyCorns")
    if not candyFolder then return 0 end

    local touched = {}
    for _ = 1, 10 do
        if not char:FindFirstChild("Head") then break end
        for _, v in pairs(candyFolder:GetChildren()) do
            if v:FindFirstChildWhichIsA("TouchTransmitter") then
                touched[v] = true
                firetouchinterest(char.Head, v, 0)
                firetouchinterest(char.Head, v, 1)
            end
        end
        task.wait(0.05)
    end

    local count = 0
    for _ in pairs(touched) do count = count + 1 end
    if count > 0 then
        _G.TotalCandyFarmed = _G.TotalCandyFarmed + count
        SaveSettings()
    end
    return count
end

-- ГОЛОВНИЙ ЦИКЛ АВТОФАРМУ З SERVER HOP
local function UpdateMainFarmLoop()
    SetNoclip(_G.SlappleFarm or _G.CandyCornFarm)

    if _G.SlappleFarm or _G.CandyCornFarm then
        if not mainFarmThread then
            mainFarmThread = task.spawn(function()
                while _G.SlappleFarm or _G.CandyCornFarm do
                    local char = LocalPlayer.Character

                    if char and not char:FindFirstChild("entered") then
                        EnterArena()
                        task.wait(0.3)
                    end

                    if char and char:FindFirstChild("entered") then
                        local slaps = 0
                        local candies = 0

                        if _G.SlappleFarm then
                            slaps = LootSlapplesGiangMethod()
                        end
                        if _G.CandyCornFarm then
                            candies = LootCandyGiangMethod()
                        end

                        if slaps > 0 or candies > 0 then
                            pcall(function()
                                OrionLib:MakeNotification({
                                    Name = "Autofarm",
                                    Content = string.format("+%d Slaps | +%d Candy", slaps, candies),
                                    Image = "rbxassetid://7734053426",
                                    Time = 2
                                })
                            end)
                        end

                        task.wait(_G.HopDelay)
                        DoServerHop()
                        while _G.IsHopping and (_G.SlappleFarm or _G.CandyCornFarm) do
                            task.wait(0.5)
                        end
                    end
                    task.wait(0.15)
                end
                mainFarmThread = nil
            end)
        end
    else
        mainFarmThread = StopThread(mainFarmThread)
    end
end

-- ================= 5. ПОЛІТ ТА БОЙОВІ ФУНКЦІЇ =================
local function SetFly(state, speed)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local hum = char:FindFirstChildOfClass("Humanoid")

    if state then
        if hum then hum.PlatformStand = true end
        if not hrp:FindFirstChild("FlyBV") then
            flyBV = Instance.new("BodyVelocity")
            flyBV.Name = "FlyBV"
            flyBV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            flyBV.Velocity = Vector3.zero
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
            
            -- Підтримка і ПК (WASD), і мобільного джойстика (ControlModule з Giang Hub)
            local moveVec = Vector3.zero
            pcall(function()
                moveVec = require(LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector()
            end)

            if moveVec.Magnitude > 0 then
                velocity = (cframe.RightVector * moveVec.X) - (cframe.LookVector * moveVec.Z)
            else
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then velocity = velocity + cframe.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then velocity = velocity - cframe.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then velocity = velocity + cframe.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then velocity = velocity - cframe.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then velocity = velocity + cframe.UpVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then velocity = velocity - cframe.UpVector end
            end

            if velocity.Magnitude > 0 then
                velocity = velocity.Unit * speed
            end
            
            if flyBV and flyBV.Parent then flyBV.Velocity = velocity end
            if flyBG and flyBG.Parent then flyBG.CFrame = cframe end
        end)
    else
        if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
        if hrp:FindFirstChild("FlyBV") then hrp.FlyBV:Destroy() end
        if hrp:FindFirstChild("FlyBG") then hrp.FlyBG:Destroy() end
        if hum then hum.PlatformStand = false end
    end
end

local function SetHitbox(state)
    hitboxThread = StopThread(hitboxThread)
    if state then
        getgenv().HitboxEnabled = true
        hitboxThread = task.spawn(function()
            while getgenv().HitboxEnabled do
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        pcall(function()
                            local hrp = v.Character.HumanoidRootPart
                            hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                            hrp.Transparency = 0.75
                            hrp.CanCollide = false
                        end)
                    end
                end
                task.wait()
            end
        end)
    else
        getgenv().HitboxEnabled = false
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = v.Character.HumanoidRootPart
                    hrp.Size = Vector3.new(2, 2, 1)
                    hrp.Transparency = 1
                end)
            end
        end
    end
end

local function SetGloveESP(state)
    espThread = StopThread(espThread)
    if state then
        getgenv().GloveESP = true
        espThread = task.spawn(function()
            while getgenv().GloveESP do
                for _, v in ipairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v:FindFirstChild("leaderstats") then
                        local gloveStat = v.leaderstats:FindFirstChild("Glove")
                        if gloveStat then
                            local head = v.Character.Head
                            local esp = head:FindFirstChild("GloveEsp")
                            if not esp then
                                esp = Instance.new("BillboardGui", head)
                                esp.Adornee = head
                                esp.Name = "GloveEsp"
                                esp.Size = UDim2.new(0, 100, 0, 150)
                                esp.StudsOffset = Vector3.new(0, 3, 0)
                                esp.AlwaysOnTop = true
                                
                                local txt = Instance.new("TextLabel", esp)
                                txt.BackgroundTransparency = 1
                                txt.Size = UDim2.new(0, 100, 0, 100)
                                txt.TextSize = 18
                                txt.Font = Enum.Font.FredokaOne
                                txt.TextColor3 = Color3.fromRGB(111, 255, 0)
                                txt.TextStrokeTransparency = 0.3
                            end
                            esp.TextLabel.Text = "Glove [ " .. tostring(gloveStat.Value) .. " ]"
                        end
                    end
                end
                task.wait(0.3)
            end
        end)
    else
        getgenv().GloveESP = false
        for _, v in ipairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloveEsp") then
                v.Character.Head.GloveEsp:Destroy()
            end
        end
    end
end

-- ================= 6. ІНТЕРФЕЙС ORION UI =================
local Window = OrionLib:MakeWindow({
    Name = "Slap Battles Ultimate + Giang Hub 👏",
    IntroText = "Slap Battles 👏",
    IntroIcon = "rbxassetid://15315284749",
    HidePremium = false,
    SaveConfig = false,
    IntroEnabled = false,
    ConfigFolder = "SlapBattlesUltimate"
})

-- ВКЛАДКА 1: ФАРМ (HOP + NO-HOP З GIANG HUB)
local FarmTab = Window:MakeTab({Name = "Autofarm", Icon = "rbxassetid://7733673987", PremiumOnly = false})

local SlapLabel = FarmTab:AddLabel("Slaps Farmed: " .. tostring(_G.TotalSlapsFarmed))
local CandyLabel = FarmTab:AddLabel("Candy Corns Farmed: " .. tostring(_G.TotalCandyFarmed))

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            SlapLabel:Set("Slaps Farmed: " .. tostring(_G.TotalSlapsFarmed))
            CandyLabel:Set("Candy Corns Farmed: " .. tostring(_G.TotalCandyFarmed))
        end)
    end
end)

local HopSection = FarmTab:AddSection({Name = "Server-Hop Farm (0 Палива під островом)"})

HopSection:AddSlider({
    Name = "Delay before Server Hop (sec)", 
    Min = 1, Max = 5, Default = _G.HopDelay, 
    Color = Color3.fromRGB(255,255,255), Increment = 1, 
    Callback = function(Value) 
        _G.HopDelay = Value; SaveSettings() 
    end
})

HopSection:AddToggle({
    Name = "Autofarm Slapples (No TP + Server Hop)", 
    Default = _G.SlappleFarm, 
    Callback = function(Value)
        _G.SlappleFarm = Value
        SaveSettings()
        UpdateMainFarmLoop()
    end
})

HopSection:AddToggle({
    Name = "Autofarm Candy Corn (No TP + Server Hop)", 
    Default = _G.CandyCornFarm, 
    Callback = function(Value)
        _G.CandyCornFarm = Value
        SaveSettings()
        UpdateMainFarmLoop()
    end
})

local NoHopSection = FarmTab:AddSection({Name = "Giang Hub Farm (На одному сервері без Hop)"})

NoHopSection:AddToggle({
    Name = "Autofarm Slapples (No Hop)",
    Default = false,
    Callback = function(Value)
        _G.NoHopSlapples = Value
        noHopSlappleThread = StopThread(noHopSlappleThread)
        if Value then
            noHopSlappleThread = task.spawn(function()
                while _G.NoHopSlapples do
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("entered") and char:FindFirstChild("HumanoidRootPart") and Workspace:FindFirstChild("Arena") and Workspace.Arena:FindFirstChild("island5") then
                        for _, v in pairs(Workspace.Arena.island5.Slapples:GetChildren()) do
                            if (v.Name == "Slapple" or v.Name == "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                                firetouchinterest(char.HumanoidRootPart, v.Glove, 0)
                                firetouchinterest(char.HumanoidRootPart, v.Glove, 1)
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

NoHopSection:AddToggle({
    Name = "Autofarm Candy (Giang Hub Method - No Hop)",
    Default = false,
    Callback = function(Value)
        _G.NoHopCandy = Value
        noHopCandyThread = StopThread(noHopCandyThread)
        if Value then
            noHopCandyThread = task.spawn(function()
                while _G.NoHopCandy do
                    local char = LocalPlayer.Character
                    local candyFolder = Workspace:FindFirstChild("CandyCorns")
                    if char and char:FindFirstChild("Head") and candyFolder then
                        for _, v in pairs(candyFolder:GetChildren()) do
                            if v:FindFirstChildWhichIsA("TouchTransmitter") then
                                firetouchinterest(char.Head, v, 0)
                                firetouchinterest(char.Head, v, 1)
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

NoHopSection:AddToggle({
    Name = "Auto Collect Jet/Phase/Siphon Orbs & Gifts",
    Default = false,
    Callback = function(Value)
        _G.OrbFarm = Value
        orbCollectThread = StopThread(orbCollectThread)
        if Value then
            orbCollectThread = task.spawn(function()
                while _G.OrbFarm do
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("Head") and char:FindFirstChild("HumanoidRootPart") then
                        for _, v in pairs(Workspace:GetChildren()) do
                            if v.Name == "JetOrb" or v.Name == "PhaseOrb" or v.Name == "SiphonOrb" then
                                firetouchinterest(char.Head, v, 0)
                                firetouchinterest(char.Head, v, 1)
                            elseif v.Name == "Gift" then
                                firetouchinterest(char.HumanoidRootPart, v, 0)
                                firetouchinterest(char.HumanoidRootPart, v, 1)
                            elseif v.Name == "Toolbox" and v:FindFirstChild("ClickDetector") then
                                fireclickdetector(v.ClickDetector, 0)
                                fireclickdetector(v.ClickDetector, 1)
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

FarmTab:AddToggle({
    Name = "Auto-Execute on Teleport", 
    Default = _G.AutoExecute, 
    Callback = function(Value) 
        _G.AutoExecute = Value; SaveSettings() 
    end
})

FarmTab:AddButton({Name = "Manual Server Hop", Callback = function() DoServerHop() end})
FarmTab:AddButton({
    Name = "Reset Counters", 
    Callback = function() 
        _G.TotalSlapsFarmed = 0; _G.TotalCandyFarmed = 0; SaveSettings()
        SlapLabel:Set("Slaps Farmed: 0"); CandyLabel:Set("Candy Corns Farmed: 0")
    end
})

-- ВКЛАДКА 2: БОЙОВІ (SLAP AURA НА ВСІ РУКАВИЦІ + EXTEND GLOVE З GIANG HUB)
local CombatTab = Window:MakeTab({Name = "Combat", Icon = "rbxassetid://7733674079", PremiumOnly = false})

CombatTab:AddSlider({
    Name = "Slap Aura Reach", 
    Min = 10, Max = 50, Default = 25, Increment = 1, 
    Callback = function(Value) slapReach = Value end
})

local slapAuraTargetPart = "HumanoidRootPart"
CombatTab:AddDropdown({
    Name = "Slap Aura Target Part",
    Default = "HumanoidRootPart",
    Options = {"HumanoidRootPart", "Head", "Torso"},
    Callback = function(Value) slapAuraTargetPart = Value end
})

CombatTab:AddToggle({
    Name = "Slap Aura (All Gloves Supported)", 
    Default = false, 
    Callback = function(Value) 
        getgenv().AutoSlap = Value
        autoSlapThread = StopThread(autoSlapThread)
        if Value then
            autoSlapThread = task.spawn(function()
                while getgenv().AutoSlap do
                    pcall(function()
                        local char = LocalPlayer.Character
                        local myGlove = LocalPlayer.leaderstats.Glove.Value
                        local hitRemote = gloveHits[myGlove] or ReplicatedStorage:FindFirstChild("GeneralHit") or ReplicatedStorage:FindFirstChild("b")

                        if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("entered") and hitRemote then
                            for _, v in pairs(Players:GetPlayers()) do
                                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") then
                                    local tChar = v.Character
                                    if not tChar:FindFirstChild("stevebody") and not tChar:FindFirstChild("rock") and tChar.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and (not tChar:FindFirstChild("Ragdolled") or tChar.Ragdolled.Value == false) then
                                        if not tChar.Head:FindFirstChild("UnoReverseCard") or myGlove == "Error" then
                                            local dist = (char.HumanoidRootPart.Position - tChar.HumanoidRootPart.Position).Magnitude
                                            if dist <= slapReach then
                                                local part = tChar:FindFirstChild(slapAuraTargetPart) or tChar.HumanoidRootPart
                                                hitRemote:FireServer(part, true)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end
})

CombatTab:AddSlider({
    Name = "Hitbox Size", 
    Min = 2, Max = 50, Default = 10, Increment = 1, 
    Callback = function(Value) hitboxSize = Value end
})

CombatTab:AddToggle({
    Name = "Hitbox Player Expander", 
    Default = false, 
    Callback = function(Value) SetHitbox(Value) end
})

local gloveExtendReach = 10
local gloveExtendOption = "Meat Stick"
CombatTab:AddSlider({
    Name = "Extend Glove Size",
    Min = 2, Max = 50, Default = 10, Increment = 1,
    Callback = function(Value) gloveExtendReach = Value end
})

CombatTab:AddDropdown({
    Name = "Extend Glove Shape",
    Default = "Meat Stick",
    Options = {"Meat Stick", "Pancake", "Growth", "North Korea Wall", "Slight Extend"},
    Callback = function(Value) gloveExtendOption = Value end
})

CombatTab:AddToggle({
    Name = "Extend Glove (Giang Hub)",
    Default = false,
    Callback = function(Value)
        _G.GloveExtendGet = Value
        gloveExtendThread = StopThread(gloveExtendThread)
        local function ResizeGloves(container, reset)
            for _, v in pairs(container:GetChildren()) do
                if v:IsA("Tool") and v.Name ~= "Radio" and v:FindFirstChild("Glove") then
                    if reset then
                        v.Glove.Size = Vector3.new(2.5, 2.5, 1.7)
                        v.Glove.Transparency = 0
                    else
                        if gloveExtendOption == "Meat Stick" then
                            v.Glove.Size = Vector3.new(0, gloveExtendReach, 2)
                        elseif gloveExtendOption == "Pancake" then
                            v.Glove.Size = Vector3.new(0, gloveExtendReach, gloveExtendReach)
                        elseif gloveExtendOption == "Growth" then
                            v.Glove.Size = Vector3.new(gloveExtendReach, gloveExtendReach, gloveExtendReach)
                        elseif gloveExtendOption == "North Korea Wall" then
                            v.Glove.Size = Vector3.new(gloveExtendReach, 0, gloveExtendReach)
                        elseif gloveExtendOption == "Slight Extend" then
                            v.Glove.Size = Vector3.new(3, 3, 3.7)
                        end
                        v.Glove.Transparency = 0.5
                    end
                end
            end
        end
        if Value then
            gloveExtendThread = task.spawn(function()
                while _G.GloveExtendGet do
                    pcall(function()
                        if LocalPlayer:FindFirstChild("Backpack") then ResizeGloves(LocalPlayer.Backpack, false) end
                        if LocalPlayer.Character then ResizeGloves(LocalPlayer.Character, false) end
                    end)
                    task.wait(0.2)
                end
            end)
        else
            pcall(function()
                if LocalPlayer:FindFirstChild("Backpack") then ResizeGloves(LocalPlayer.Backpack, true) end
                if LocalPlayer.Character then ResizeGloves(LocalPlayer.Character, true) end
            end)
        end
    end
})

-- ВКЛАДКА 3: ANTI & BYPASSES (ПОВНИЙ НАБІР З GIANG HUB)
local AntiTab = Window:MakeTab({Name = "Anti & Bypass", Icon = "rbxassetid://7734056608", PremiumOnly = false})

AntiTab:AddToggle({
    Name = "Anti Void (Solid Floor Platform)",
    Default = false,
    Callback = function(Value)
        if Workspace:FindFirstChild("VoidPart") then
            Workspace.VoidPart.CanCollide = Value
            Workspace.VoidPart.Transparency = Value and 0.5 or 1
            if Workspace.VoidPart:FindFirstChild("TAntiVoid") then
                Workspace.VoidPart.TAntiVoid.CanCollide = Value
                Workspace.VoidPart.TAntiVoid.Transparency = Value and 0.5 or 1
            end
        end
    end
})

AntiTab:AddToggle({
    Name = "Anti Ragdoll (Anchor Torso Method)",
    Default = false,
    Callback = function(Value)
        _G.AntiRagdoll = Value
        task.spawn(function()
            while _G.AntiRagdoll do
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Torso") and char:FindFirstChild("Ragdolled") and char.Ragdolled.Value == true then
                    char.Torso.Anchored = true
                    repeat task.wait() until not char:FindFirstChild("Ragdolled") or char.Ragdolled.Value == false or not _G.AntiRagdoll
                    if char:FindFirstChild("Torso") then char.Torso.Anchored = false end
                end
                task.wait()
            end
        end)
    end
})

AntiTab:AddToggle({
    Name = "Anti TimeStop & Stop",
    Default = false,
    Callback = function(Value)
        _G.AntiTimestop = Value
        task.spawn(function()
            while _G.AntiTimestop do
                if LocalPlayer.Character then
                    for _, v in pairs(LocalPlayer.Character:GetChildren()) do
                        if v.ClassName == "Part" then v.Anchored = false end
                    end
                end
                task.wait()
            end
        end)
    end
})

AntiTab:AddToggle({
    Name = "Anti Megarock / Custom / Sbeve",
    Default = false,
    Callback = function(Value)
        _G.AntiRockSbeve = Value
        task.spawn(function()
            while _G.AntiRockSbeve do
                for _, v in pairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character then
                        if v.Character:FindFirstChild("rock") then
                            v.Character.rock.CanTouch = false
                            v.Character.rock.CanQuery = false
                        end
                        if v.Character:FindFirstChild("stevebody") then
                            v.Character.stevebody.CanTouch = false
                            v.Character.stevebody.CanQuery = false
                            v.Character.stevebody.CanCollide = false
                        end
                    end
                end
                task.wait(0.2)
            end
        end)
    end
})

AntiTab:AddToggle({
    Name = "Anti Za Hando / Pusher / Fort / Bus",
    Default = false,
    Callback = function(Value)
        _G.AntiObstacles = Value
        task.spawn(function()
            while _G.AntiObstacles do
                for _, v in pairs(Workspace:GetChildren()) do
                    if v.Name == "Part" and v.ClassName == "Part" then
                        v.CanCollide = false
                    elseif v.Name == "wall" then
                        v.CanCollide = false
                    elseif v.Name == "BusModel" then
                        v.CanTouch = false
                    end
                end
                task.wait(0.2)
            end
        end)
    end
})

AntiTab:AddToggle({
    Name = "Anti Reaper / Ice / Mail / Squid / Mitten",
    Default = false,
    Callback = function(Value)
        _G.AntiDebuffs = Value
        task.spawn(function()
            while _G.AntiDebuffs do
                pcall(function()
                    local char = LocalPlayer.Character
                    if char then
                        if char:FindFirstChild("DeathMark") then
                            ReplicatedStorage.ReaperGone:FireServer(char.DeathMark)
                            if Lighting:FindFirstChild("DeathMarkColorCorrection") then
                                Lighting.DeathMarkColorCorrection:Destroy()
                            end
                        end
                        if char:FindFirstChild("Icecube") then
                            char.Icecube:Destroy()
                            char.Humanoid.PlatformStand = false
                            char.Humanoid.AutoRotate = true
                        end
                        if char:FindFirstChild("YouHaveGotMail") then
                            char.YouHaveGotMail.Disabled = true
                        end
                    end
                    local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                    if pGui then
                        if pGui:FindFirstChild("SquidInk") then pGui.SquidInk.Enabled = false end
                        if pGui:FindFirstChild("MittenBlind") then pGui.MittenBlind:Destroy() end
                    end
                end)
                task.wait(0.2)
            end
        end)
    end
})

AntiTab:AddToggle({
    Name = "Anti Death Barriers & Cube of Death",
    Default = false,
    Callback = function(Value)
        pcall(function()
            local touchState = not Value
            if Workspace:FindFirstChild("DEATHBARRIER") then
                Workspace.DEATHBARRIER.CanTouch = touchState
                for _, v in pairs(Workspace.DEATHBARRIER:GetChildren()) do
                    if v:IsA("BasePart") then v.CanTouch = touchState end
                end
            end
            if Workspace:FindFirstChild("DEATHBARRIER2") then Workspace.DEATHBARRIER2.CanTouch = touchState end
            if Workspace:FindFirstChild("dedBarrier") then Workspace.dedBarrier.CanTouch = touchState end
            if Workspace:FindFirstChild("ArenaBarrier") then Workspace.ArenaBarrier.CanTouch = touchState end
            if Workspace:FindFirstChild("AntiDefaultArena") then Workspace.AntiDefaultArena.CanTouch = touchState end
            if Workspace.Arena and Workspace.Arena:FindFirstChild("CubeOfDeathArea") then
                local cod = Workspace.Arena.CubeOfDeathArea:FindFirstChild("the cube of death(i heard it kills)")
                if cod then
                    cod.CanTouch = touchState
                    if cod:FindFirstChild("Part") then cod.Part.CanTouch = touchState end
                end
            end
        end)
    end
})

AntiTab:AddToggle({
    Name = "Anti Null (Auto Slap Imps)",
    Default = false,
    Callback = function(Value)
        _G.AntiNull = Value
        task.spawn(function()
            while _G.AntiNull do
                pcall(function()
                    local myGlove = LocalPlayer.leaderstats.Glove.Value
                    local hitRemote = gloveHits[myGlove] or ReplicatedStorage.GeneralHit
                    for _, v in pairs(Workspace:GetChildren()) do
                        if v.Name == "Imp" and v:FindFirstChild("Body") then
                            hitRemote:FireServer(v.Body, true)
                        end
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
})

-- ВКЛАДКА 4: БЕЙДЖІ ТА КВЕСТИ З GIANG HUB
local BadgesTab = Window:MakeTab({Name = "Badges & Glove", Icon = "rbxassetid://7733673987", PremiumOnly = false})

BadgesTab:AddButton({
    Name = "Get Duck + Orange + Knife Badges (1-Click)", 
    Callback = function() 
        pcall(function() 
            fireclickdetector(Workspace.Lobby.Scene.knofe.ClickDetector)
            fireclickdetector(Workspace.Arena.island5.Orange.ClickDetector) 
            fireclickdetector(Workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
        end) 
    end
})

BadgesTab:AddButton({
    Name = "Get Free Ice Skate Badge",
    Callback = function()
        pcall(function() ReplicatedStorage.IceSkate:FireServer("Freeze") end)
    end
})

BadgesTab:AddButton({
    Name = "Auto Enter Keypad Code (Elude Maze)",
    Callback = function()
        if not Workspace:FindFirstChild("Keypad") then
            OrionLib:MakeNotification({Name = "Keypad", Content = "No Keypad on this server!", Image = "rbxassetid://7733658504", Time = 4})
        else
            fireclickdetector(Workspace.Keypad.Buttons.Reset.ClickDetector)
            local digits = tostring((#Players:GetPlayers()) * 25 + 1100 - 7)
            for i = 1, #digits do
                task.wait(0.4)
                local d = digits:sub(i, i)
                fireclickdetector(Workspace.Keypad.Buttons:FindFirstChild(d).ClickDetector)
            end
            task.wait(0.5)
            fireclickdetector(Workspace.Keypad.Buttons.Enter.ClickDetector)
        end
    end
})

BadgesTab:AddButton({
    Name = "Auto Dig Treasure Chest (Bounty Hunter)",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("entered") then
            repeat task.wait()
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(289, 13, 261)
                ReplicatedStorage.DigEvent:FireServer({["index"] = 2, ["cf"] = CFrame.new(42.722, -6.174, 91.517)})
            until Workspace:FindFirstChild("TreasureChestFolder") and Workspace.TreasureChestFolder:FindFirstChild("TreasureChest")
            task.wait(1)
            Workspace.TreasureChestFolder.TreasureChest.OpenRemote:FireServer()
        else
            OrionLib:MakeNotification({Name = "Error", Content = "Enter the arena first!", Image = "rbxassetid://7733658504", Time = 4})
        end
    end
})

BadgesTab:AddToggle({
    Name = "Auto Get All Alchemist Ingredients",
    Default = false,
    Callback = function(Value)
        _G.AlchIng = Value
        task.spawn(function()
            local items = {"Mushroom","Glowing Mushroom","Fire Flower","Winter Rose","Dark Root","Dire Flower","Autumn Sprout","Elder Wood","Hazel Lily","Wild Vine","Jade Stone","Lamp Grass","Plane Flower","Blood Rose","Red Crystal","Blue Crystal","Cake Mix"}
            while _G.AlchIng do
                if LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
                    for _, item in ipairs(items) do
                        ReplicatedStorage.AlchemistEvent:FireServer("AddItem", item)
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

BadgesTab:AddToggle({
    Name = "Fast Brick Farm (Brick Master)",
    Default = false,
    Callback = function(Value)
        _G.BrickFarm = Value
        task.spawn(function()
            while _G.BrickFarm do
                if LocalPlayer.leaderstats.Glove.Value == "Brick" then
                    ReplicatedStorage.lbrick:FireServer()
                    pcall(function()
                        local lbl = LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.TextLabel
                        lbl.Text = tostring((tonumber(lbl.Text) or 0) + 1)
                    end)
                end
                task.wait(1.5)
            end
        end)
    end
})

-- ВКЛАДКА 5: ТЕЛЕПОРТИ
local TeleportsTab = Window:MakeTab({Name = "Teleports", Icon = "rbxassetid://4370318685", PremiumOnly = false})

TeleportsTab:AddDropdown({
    Name = "Teleport Location",
    Default = "",
    Options = {"Arena", "Lobby", "SafeBox 1.0", "Safespot 2.0", "Slapple Island", "Moai Island", "Plate", "Cannon Island", "Tournament", "Hunter Room", "Cube Of Death"},
    Callback = function(Value)
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart
        if Value == "Arena" and Workspace:FindFirstChild("Origo") then
            hrp.CFrame = Workspace.Origo.CFrame * CFrame.new(0, -5, 0)
        elseif Value == "Lobby" then
            hrp.CFrame = CFrame.new(-800, 328, -2.5)
        elseif Value == "SafeBox 1.0" and Workspace:FindFirstChild("SafeBox") then
            hrp.CFrame = Workspace.SafeBox.CFrame * CFrame.new(0, 5, 0)
        elseif Value == "Safespot 2.0" and Workspace:FindFirstChild("Safespot") then
            hrp.CFrame = Workspace.Safespot.CFrame * CFrame.new(0, 10, 0)
        elseif Value == "Slapple Island" then
            hrp.CFrame = Workspace.Arena.island5.Union.CFrame * CFrame.new(0, 3.25, 0)
        elseif Value == "Moai Island" then
            hrp.CFrame = CFrame.new(215, -15.5, 0.5)
        elseif Value == "Plate" then
            hrp.CFrame = Workspace.Arena.Plate.CFrame * CFrame.new(0, 3, 0)
        elseif Value == "Cannon Island" then
            hrp.CFrame = Workspace.Arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0, 0, 35)
        elseif Value == "Tournament" and Workspace:FindFirstChild("Battlearena") then
            hrp.CFrame = Workspace.Battlearena.Arena.CFrame * CFrame.new(0, 10, 0)
        elseif Value == "Hunter Room" and Workspace:FindFirstChild("BountyHunterRoom") then
            hrp.CFrame = Workspace.BountyHunterRoom.Union.CFrame * CFrame.new(0, 5, 0)
        elseif Value == "Cube Of Death" then
            hrp.CFrame = Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CFrame * CFrame.new(0, 5, 0)
        end
    end
})

-- ВКЛАДКА 6: РУХ ТА ВІЗУАЛ
local MovementTab = Window:MakeTab({Name = "Local & Visuals", Icon = "rbxassetid://4335489011", PremiumOnly = false})

MovementTab:AddSlider({
    Name = "WalkSpeed", 
    Min = 20, Max = 500, Default = 20, Increment = 1, 
    Callback = function(Value)
        currentWalkSpeed = Value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end
})

MovementTab:AddToggle({
    Name = "Keep WalkSpeed", 
    Default = false, 
    Callback = function(Value)
        if keepWSConnection then keepWSConnection:Disconnect() end
        if Value then
            keepWSConnection = RunService.Heartbeat:Connect(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    if LocalPlayer.Character.Humanoid.WalkSpeed ~= currentWalkSpeed then
                        LocalPlayer.Character.Humanoid.WalkSpeed = currentWalkSpeed
                    end
                end
            end)
        end
    end
})

MovementTab:AddSlider({
    Name = "JumpPower", 
    Min = 50, Max = 500, Default = 50, Increment = 1, 
    Callback = function(Value)
        currentJumpPower = Value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end
})

MovementTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        _G.InfiniteJump = Value
    end
})
UserInputService.JumpRequest:Connect(function()
    if _G.InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    end
end)

MovementTab:AddToggle({
    Name = "Noclip", 
    Default = false, 
    Callback = function(Value) SetNoclip(Value) end
})

local flySpeedVal = 75
MovementTab:AddSlider({
    Name = "Fly Speed", 
    Min = 10, Max = 300, Default = 75, Increment = 1, 
    Callback = function(Value) flySpeedVal = Value end
})

MovementTab:AddToggle({
    Name = "Fly (PC & Mobile ControlModule)", 
    Default = false, 
    Callback = function(Value) SetFly(Value, flySpeedVal) end
})

MovementTab:AddToggle({
    Name = "Glove ESP", 
    Default = false, 
    Callback = function(Value) SetGloveESP(Value) end
})

MovementTab:AddToggle({
    Name = "FPS Booster", 
    Default = false, 
    Callback = function(Value)
        if Value then
            Lighting.GlobalShadows = false; Lighting.FogEnd = 9e9
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") then v.Enabled = false end
            end
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    pcall(function() v.Enabled = false end)
                end
            end
        else
            Lighting.GlobalShadows = true
        end
    end
})

-- ================= ПЛАВАЮЧА КНОПКА ЗГОРТАННЯ МЕНЮ З GIANG HUB =================
pcall(function()
    if gethui and gethui():FindFirstChild("Orion") and LocalPlayer.PlayerGui:FindFirstChild("ToggleUi") == nil then
        local Ui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
        Ui.Name = "ToggleUi"
        Ui.ResetOnSpawn = false

        local DaIcon = Instance.new("ImageButton", Ui)
        DaIcon.Size = UDim2.new(0, 45, 0, 45)
        DaIcon.Position = UDim2.new(0, 15, 0.5, 0)
        DaIcon.Draggable = true
        DaIcon.Image = "rbxassetid://15315284749"
        DaIcon.BackgroundColor3 = Color3.fromRGB(255, 186, 117)

        local Corner = Instance.new("UICorner", DaIcon)
        Corner.CornerRadius = UDim.new(0.2, 0)

        task.spawn(function()
            while Ui.Parent do
                for i = 0, 255, 4 do
                    if not Ui.Parent then break end
                    DaIcon.BorderColor3 = Color3.fromHSV(i/256, 1, 1)
                    DaIcon.BackgroundColor3 = Color3.fromHSV(i/256, 0.5, 0.8)
                    task.wait()
                end
            end
        end)

        DaIcon.MouseButton1Click:Connect(function()
            for _, v in pairs(gethui():GetChildren()) do
                if v.Name == "Orion" then
                    v.Enabled = not v.Enabled
                end
            end
        end)
    end
end)

isInitializing = false
UpdateMainFarmLoop()
