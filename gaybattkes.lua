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

local LocalPlayer = Players.LocalPlayer
local MAIN_PLACE_ID = 6403373529 
local GITHUB_RAW_URL = "https://raw.githubusercontent.com/markiyanbest/slap/main/gaybattkes.lua"
local ConfigFile = "SlappleFarm_Settings.json"

pcall(function() GuiService:ClearError() end)

if game.PlaceId ~= MAIN_PLACE_ID and game.PlaceId ~= 9015014224 then
    _G.AllowTeleport = true
    pcall(function() TeleportService:Teleport(MAIN_PLACE_ID, LocalPlayer) end)
    return 
end

-- ================= ТАБЛИЦЯ УДАРІВ =================
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

local hitboxThread = nil
local hitboxSize = 10
local autoSlapThread = nil
local slapReach = 20
local espThread = nil
local mainFarmThread = nil
local localCandyThread = nil
local candyCornListener = nil
local autoEnterThread = nil
local tycoonThread = nil

local obstacleConn = nil
local debuffConn = nil
local ragdollConn = nil
local timestopThread = nil
local rockSbeveThread = nil

local function StopThread(t)
    if t then pcall(task.cancel, t) end
    return nil
end

local serverStartTime = tick()
_G.AllowTeleport = false
_G.IsHopping = false
_G.HopDelay = 2

-- ================= 1. БЕЗПЕКА ТА АНТИ-КІК =================
if hookmetamethod then
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if self == LocalPlayer and method == "Kick" then
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
            local name = self.Name
            if name == "Ban" or name == "AdminGUI" or name == "WalkSpeedChanged" or name == "Kicker" or name == "LogTunnel" or name == "ModerationRemote" then
                return nil 
            end
        end

        return oldNamecall(self, ...)
    end))
end

task.spawn(function()
    while task.wait(3) do
        pcall(function()
            local prompt = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
            if prompt and prompt:FindFirstChild("promptOverlay") then
                local err = prompt.promptOverlay:FindFirstChild("ErrorPrompt", true)
                if err then
                    _G.AllowTeleport = true
                    TeleportService:Teleport(MAIN_PLACE_ID, LocalPlayer)
                end
            end
        end)
    end
end)

if getconnections then
    for _, v in next, getconnections(LocalPlayer.Idled) do
        v:Disable()
    end
end
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

pcall(function()
    local ps = LocalPlayer:WaitForChild("PlayerScripts", 4)
    if ps then
        local ac = ps:FindFirstChild("ClientAnticheat")
        if ac and ac:FindFirstChild("AntiMobileExploits") then ac.AntiMobileExploits:Destroy() end
        local lc = ps:FindFirstChild("LegacyClient")
        if lc then
            if lc:FindFirstChild("Anti-offset") then lc["Anti-offset"]:Destroy() end
            if lc:FindFirstChild("Antidream") then lc.Antidream:Destroy() end
        end
    end
    local dr = Workspace:FindFirstChild("Debug Room")
    if dr and dr:FindFirstChild("CodeDetector") then dr.CodeDetector:Destroy() end
end)

-- ================= 2. ПЛАТФОРМИ =================
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

if not Workspace:FindFirstChild("SafeBox") then
    local S = Instance.new("Part", Workspace)
    S.Name = "SafeBox"
    S.Anchored = true
    S.CanCollide = true
    S.Transparency = 0.5
    S.Position = Vector3.new(-5500, -5000, -5000)
    S.Size = Vector3.new(21, 5, 21)
end

if not Workspace:FindFirstChild("Safespot") then
    local Safespot = Instance.new("Part", Workspace)
    Safespot.Name = "Safespot"
    Safespot.Position = Vector3.new(10000, -50, 10000)
    Safespot.Size = Vector3.new(500, 10, 500)
    Safespot.Anchored = true
    Safespot.CanCollide = true
    Safespot.Transparency = 0.5
end

if not Workspace:FindFirstChild("VoidPart") then
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

-- ================= 3. NOCLIP =================
local function SetNoclip(state)
    if state then
        if not noclipConnection then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    for _, v in ipairs(char:GetChildren()) do
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

-- ================= 4. КОНФІГ ТА СЕРВЕРХОП =================
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
            Content = "Searching for server...", 
            Image = "rbxassetid://7734053426", 
            Time = 1.5 
        }) 
    end)

    if _G.AutoExecute then 
        local q = queue_on_teleport or queueonteleport or (getgenv and (getgenv().queue_on_teleport or getgenv().queueonteleport))
        if q then 
            pcall(function()
                q('repeat task.wait() until game:IsLoaded(); loadstring(game:HttpGet("' .. GITHUB_RAW_URL .. '"))()')
            end)
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
            task.wait(1)
            if _G.SlappleFarm or _G.CandyCornFarm then DoServerHop() end
        end
    end)
end

task.spawn(function()
    while task.wait(1.5) do
        if (_G.SlappleFarm or _G.CandyCornFarm) and (tick() - serverStartTime > 30) then
            _G.IsHopping = false
            _G.AllowTeleport = false
            DoServerHop()
            serverStartTime = tick() 
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

-- ================= ЗБІР ЯБЛУК ТА ЦУКЕРОК =================
local function FastLootSlapples()
    local char = LocalPlayer.Character
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    local startSlaps = (leaderstats and leaderstats:FindFirstChild("Slaps")) and leaderstats.Slaps.Value or 0

    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("entered") then
        MoveToHiddenPlatform()
        local arena = Workspace:FindFirstChild("Arena")
        if arena and arena:FindFirstChild("island5") and arena.island5:FindFirstChild("Slapples") then
            for _ = 1, 5 do
                for _, v in ipairs(arena.island5.Slapples:GetChildren()) do
                    if (v.Name == "Slapple" or v.Name == "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                        firetouchinterest(char.HumanoidRootPart, v.Glove, 0)
                        firetouchinterest(char.HumanoidRootPart, v.Glove, 1)
                    end
                end
                task.wait(0.06)
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

local function FastLootCandy()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("Head") then return 0 end

    MoveToHiddenPlatform()
    local candyFolder = Workspace:FindFirstChild("CandyCorns")
    if not candyFolder then return 0 end

    local touched = 0
    for _ = 1, 6 do
        if not char:FindFirstChild("Head") then break end
        for _, v in ipairs(candyFolder:GetChildren()) do
            if v:FindFirstChildWhichIsA("TouchTransmitter") then
                touched = touched + 1
                firetouchinterest(char.Head, v, 0)
                firetouchinterest(char.Head, v, 1)
            end
        end
        task.wait(0.06)
    end

    if touched > 0 then
        _G.TotalCandyFarmed = _G.TotalCandyFarmed + touched
        SaveSettings()
    end
    return touched
end

local function UpdateMainFarmLoop()
    SetNoclip(_G.SlappleFarm or _G.CandyCornFarm)

    if _G.SlappleFarm or _G.CandyCornFarm then
        if not mainFarmThread then
            mainFarmThread = task.spawn(function()
                while _G.SlappleFarm or _G.CandyCornFarm do
                    local char = LocalPlayer.Character

                    if char and not char:FindFirstChild("entered") then
                        EnterArena()
                        task.wait(0.4)
                    end

                    if char and char:FindFirstChild("entered") then
                        local slaps = _G.SlappleFarm and FastLootSlapples() or 0
                        local candies = _G.CandyCornFarm and FastLootCandy() or 0

                        if slaps > 0 or candies > 0 then
                            pcall(function()
                                OrionLib:MakeNotification({
                                    Name = "Autofarm",
                                    Content = string.format("+%d Slaps | +%d Candy", slaps, candies),
                                    Image = "rbxassetid://7734053426",
                                    Time = 1.5
                                })
                            end)
                        end

                        task.wait(_G.HopDelay)
                        DoServerHop()
                        while _G.IsHopping and (_G.SlappleFarm or _G.CandyCornFarm) do
                            task.wait(0.5)
                        end
                    end
                    task.wait(0.2)
                end
                mainFarmThread = nil
            end)
        end
    else
        mainFarmThread = StopThread(mainFarmThread)
    end
end

-- ================= ПОЛІТ =================
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

-- ================= HITBOX EXPANDER =================
local function SetHitbox(state)
    hitboxThread = StopThread(hitboxThread)
    if state then
        getgenv().HitboxEnabled = true
        hitboxThread = task.spawn(function()
            while getgenv().HitboxEnabled do
                for _, v in ipairs(Players:GetPlayers()) do
                    if v ~= LocalPlayer and v.Character then
                        local hrp = v.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and hrp.Size.X ~= hitboxSize then
                            hrp.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                            hrp.Transparency = 0.75
                            hrp.CanCollide = false
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    else
        getgenv().HitboxEnabled = false
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character then
                local hrp = v.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(2, 2, 1)
                    hrp.Transparency = 1
                end
            end
        end
    end
end

-- ================= EVENT-DRIVEN ANTI МОДУЛІ =================
local function SetAntiObstacles(val)
    _G.AntiObstacles = val
    if obstacleConn then obstacleConn:Disconnect(); obstacleConn = nil end
    if val then
        for _, v in ipairs(Workspace:GetChildren()) do
            if v.Name == "wall" or (v.Name == "Part" and v.ClassName == "Part") then
                v.CanCollide = false
            elseif v.Name == "BusModel" then
                v.CanTouch = false
            end
        end
        obstacleConn = Workspace.ChildAdded:Connect(function(v)
            if not _G.AntiObstacles then return end
            task.wait()
            if v.Name == "wall" or (v.Name == "Part" and v.ClassName == "Part") then
                v.CanCollide = false
            elseif v.Name == "BusModel" then
                v.CanTouch = false
            end
        end)
    end
end

local function SetAntiDebuffs(val)
    _G.AntiDebuffs = val
    if debuffConn then debuffConn:Disconnect(); debuffConn = nil end
    if val then
        local function cleanChild(child)
            if not _G.AntiDebuffs then return end
            if child.Name == "Icecube" then
                task.wait()
                child:Destroy()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.PlatformStand = false; hum.AutoRotate = true end
            elseif child.Name == "DeathMark" then
                task.wait()
                ReplicatedStorage.ReaperGone:FireServer(child)
                if Lighting:FindFirstChild("DeathMarkColorCorrection") then
                    Lighting.DeathMarkColorCorrection:Destroy()
                end
            elseif child.Name == "YouHaveGotMail" then
                task.wait()
                child.Disabled = true
            end
        end

        if LocalPlayer.Character then
            for _, c in ipairs(LocalPlayer.Character:GetChildren()) do cleanChild(c) end
            debuffConn = LocalPlayer.Character.ChildAdded:Connect(cleanChild)
        end
        LocalPlayer.CharacterAdded:Connect(function(char)
            if debuffConn then debuffConn:Disconnect() end
            debuffConn = char.ChildAdded:Connect(cleanChild)
        end)

        task.spawn(function()
            while _G.AntiDebuffs do
                local pGui = LocalPlayer:FindFirstChild("PlayerGui")
                if pGui then
                    local ink = pGui:FindFirstChild("SquidInk")
                    if ink and ink.Enabled then ink.Enabled = false end
                    local blind = pGui:FindFirstChild("MittenBlind")
                    if blind then blind:Destroy() end
                end
                task.wait(1)
            end
        end)
    end
end

local function SetAntiRagdoll(val)
    _G.AntiRagdoll = val
    if ragdollConn then ragdollConn:Disconnect(); ragdollConn = nil end
    if val then
        local function bindRag(char)
            local rag = char:WaitForChild("Ragdolled", 5)
            if rag then
                rag.Changed:Connect(function(isRag)
                    if isRag and _G.AntiRagdoll then
                        local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
                        if torso then torso.Anchored = true end
                        repeat task.wait(0.05) until not rag.Value or not _G.AntiRagdoll
                        if torso then torso.Anchored = false end
                    end
                end)
            end
        end
        if LocalPlayer.Character then bindRag(LocalPlayer.Character) end
        ragdollConn = LocalPlayer.CharacterAdded:Connect(bindRag)
    end
end

-- ================= 5. ІНТЕРФЕЙС =================
local Window = OrionLib:MakeWindow({
    Name = "Slap Battles Hub [Ultimate] 👏",
    IntroText = "Slap Battles 👏",
    IntroIcon = "rbxassetid://15315284749",
    HidePremium = false,
    SaveConfig = false,
    IntroEnabled = false,
    ConfigFolder = "SlapBattlesUltimate"
})

-- ВКЛАДКА 1: AUTOFARM
local FarmTab = Window:MakeTab({Name = "Autofarm", Icon = "rbxassetid://7733673987", PremiumOnly = false})
local SlapLabel = FarmTab:AddLabel("Slaps Farmed: " .. tostring(_G.TotalSlapsFarmed))
local CandyLabel = FarmTab:AddLabel("Candy Corns Farmed: " .. tostring(_G.TotalCandyFarmed))

task.spawn(function()
    while task.wait(1.5) do
        pcall(function()
            SlapLabel:Set("Slaps Farmed: " .. tostring(_G.TotalSlapsFarmed))
            CandyLabel:Set("Candy Corns Farmed: " .. tostring(_G.TotalCandyFarmed))
        end)
    end
end)

local HopSection = FarmTab:AddSection({Name = "Server-Hop Farm (0 Палива)"})

HopSection:AddSlider({
    Name = "Delay before Server Hop (sec)", 
    Min = 1, Max = 5, Default = _G.HopDelay, 
    Color = Color3.fromRGB(255,255,255), Increment = 1, 
    Callback = function(Value) 
        _G.HopDelay = Value; SaveSettings() 
    end
})

HopSection:AddToggle({
    Name = "Autofarm Slapples (+ Server Hop)", 
    Default = _G.SlappleFarm, 
    Callback = function(Value)
        _G.SlappleFarm = Value
        SaveSettings()
        UpdateMainFarmLoop()
    end
})

HopSection:AddToggle({
    Name = "Autofarm Candy Corn (+ Server Hop)", 
    Default = _G.CandyCornFarm, 
    Callback = function(Value)
        _G.CandyCornFarm = Value
        SaveSettings()
        UpdateMainFarmLoop()
    end
})

local InServerSection = FarmTab:AddSection({Name = "In-Server Farm (Без виходу з сервера)"})

-- АВТО-ЛУТАННЯ CANDY CORN БЕЗ ВИХОДУ
InServerSection:AddToggle({
    Name = "Candy Corn Farm (In-Server / No Hop)",
    Default = false,
    Callback = function(Value)
        _G.InServerCandy = Value
        localCandyThread = StopThread(localCandyThread)
        if candyCornListener then candyCornListener:Disconnect(); candyCornListener = nil end

        if Value then
            SetNoclip(true)

            local function LootOneCandy(item)
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Head") and item:FindFirstChildWhichIsA("TouchTransmitter") then
                    pcall(function()
                        firetouchinterest(char.Head, item, 0)
                        firetouchinterest(char.Head, item, 1)
                        _G.TotalCandyFarmed = _G.TotalCandyFarmed + 1
                        SaveSettings()
                    end)
                end
            end

            local candyFolder = Workspace:FindFirstChild("CandyCorns")
            if candyFolder then
                candyCornListener = candyFolder.ChildAdded:Connect(function(child)
                    if _G.InServerCandy then
                        task.wait(0.02)
                        LootOneCandy(child)
                    end
                end)
            end

            localCandyThread = task.spawn(function()
                while _G.InServerCandy do
                    local char = LocalPlayer.Character
                    if char and not char:FindFirstChild("entered") then
                        EnterArena()
                        task.wait(0.4)
                    end

                    MoveToHiddenPlatform()

                    local folder = Workspace:FindFirstChild("CandyCorns")
                    if folder and char and char:FindFirstChild("Head") then
                        for _, v in ipairs(folder:GetChildren()) do
                            LootOneCandy(v)
                        end
                    end
                    task.wait(0.3)
                end
            end)
        end
    end
})

InServerSection:AddToggle({
    Name = "Slapples Farm (In-Server / No Hop)",
    Default = false,
    Callback = function(Value)
        _G.NoHopSlapples = Value
        noHopSlappleThread = StopThread(noHopSlappleThread)
        if Value then
            SetNoclip(true)
            noHopSlappleThread = task.spawn(function()
                while _G.NoHopSlapples do
                    local char = LocalPlayer.Character
                    if char and not char:FindFirstChild("entered") then
                        EnterArena()
                        task.wait(0.4)
                    end

                    MoveToHiddenPlatform()

                    if char and char:FindFirstChild("HumanoidRootPart") and Workspace:FindFirstChild("Arena") and Workspace.Arena:FindFirstChild("island5") then
                        for _, v in ipairs(Workspace.Arena.island5.Slapples:GetChildren()) do
                            if (v.Name == "Slapple" or v.Name == "GoldenSlapple") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
                                firetouchinterest(char.HumanoidRootPart, v.Glove, 0)
                                firetouchinterest(char.HumanoidRootPart, v.Glove, 1)
                            end
                        end
                    end
                    task.wait(0.3)
                end
            end)
        end
    end
})

InServerSection:AddToggle({
    Name = "Auto-Enter Arena (Always Alive in Arena)",
    Default = false,
    Callback = function(Value)
        _G.AutoEnterArenaLoop = Value
        autoEnterThread = StopThread(autoEnterThread)
        if Value then
            autoEnterThread = task.spawn(function()
                while _G.AutoEnterArenaLoop do
                    local char = LocalPlayer.Character
                    if char and not char:FindFirstChild("entered") then
                        EnterArena()
                    end
                    task.wait(0.5)
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

-- ВКЛАДКА 2: COMBAT
local CombatTab = Window:MakeTab({Name = "Combat", Icon = "rbxassetid://7733674079", PremiumOnly = false})

CombatTab:AddSlider({
    Name = "Slap Aura Reach", 
    Min = 10, Max = 50, Default = 25, Increment = 1, 
    Callback = function(Value) slapReach = Value end
})

local slapAuraTargetPart = "HumanoidRootPart"
CombatTab:AddDropdown({
    Name = "Slap Aura Target",
    Default = "HumanoidRootPart",
    Options = {"HumanoidRootPart", "Head"},
    Callback = function(Value) slapAuraTargetPart = Value end
})

CombatTab:AddToggle({
    Name = "Slap Aura (Anti-Reverse + All Gloves)", 
    Default = false, 
    Callback = function(Value) 
        getgenv().AutoSlap = Value
        autoSlapThread = StopThread(autoSlapThread)
        if Value then
            autoSlapThread = task.spawn(function()
                while getgenv().AutoSlap do
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("entered") then
                        local myHrp = char.HumanoidRootPart
                        local myGlove = (LocalPlayer:FindFirstChild("leaderstats") and LocalPlayer.leaderstats:FindFirstChild("Glove")) and LocalPlayer.leaderstats.Glove.Value or "Default"
                        local hitRemote = gloveHits[myGlove] or ReplicatedStorage:FindFirstChild("GeneralHit") or ReplicatedStorage:FindFirstChild("b")

                        if hitRemote then
                            for _, v in ipairs(Players:GetPlayers()) do
                                if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("entered") then
                                    local tChar = v.Character
                                    local tHrp = tChar:FindFirstChild("HumanoidRootPart")
                                    if tHrp and not tChar:FindFirstChild("stevebody") and not tChar:FindFirstChild("rock") and tHrp.BrickColor ~= BrickColor.new("New Yeller") then
                                        local rag = tChar:FindFirstChild("Ragdolled")
                                        if not rag or rag.Value == false then
                                            local head = tChar:FindFirstChild("Head")
                                            -- Захист: пропускаємо гравців під Uno Reverse, щоб не вбивати себе
                                            if not head or not head:FindFirstChild("UnoReverseCard") or myGlove == "Error" then
                                                if (myHrp.Position - tHrp.Position).Magnitude <= slapReach then
                                                    local targetPart = tChar:FindFirstChild(slapAuraTargetPart) or tHrp
                                                    pcall(function() hitRemote:FireServer(targetPart, true) end)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.12)
                end
            end)
        end
    end
})

CombatTab:AddSlider({
    Name = "Hitbox Expander Size", 
    Min = 2, Max = 40, Default = 10, Increment = 1, 
    Callback = function(Value) hitboxSize = Value end
})

CombatTab:AddToggle({
    Name = "Hitbox Expander", 
    Default = false, 
    Callback = function(Value) SetHitbox(Value) end
})

-- ВКЛАДКА 3: ANTI & DETECTORS
local AntiTab = Window:MakeTab({Name = "Anti & Bypass", Icon = "rbxassetid://7734056608", PremiumOnly = false})

-- ДЕТЕКТОР АДМІНІВ З ПЕРЕВІРКОЮ РАНГУ
AntiTab:AddToggle({
    Name = "Admin / Mod Join Alert",
    Default = true,
    Callback = function(Value)
        _G.AdminAlert = Value
    end
})

local function CheckAdmin(p)
    if not _G.AdminAlert or p == LocalPlayer then return end
    pcall(function()
        if p:GetRankInGroup(9950771) >= 2 then
            OrionLib:MakeNotification({
                Name = "⚠️ STAFF DETECTED!",
                Content = string.format("Mod/Admin %s joined the server!", p.Name),
                Image = "rbxassetid://7733658504",
                Time = 8
            })
        end
    end)
end
for _, p in ipairs(Players:GetPlayers()) do CheckAdmin(p) end
Players.PlayerAdded:Connect(CheckAdmin)

AntiTab:AddToggle({
    Name = "Anti Void (Solid Platform)",
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
    Name = "Anti Ragdoll (Torso Anchor)",
    Default = false,
    Callback = function(Value) SetAntiRagdoll(Value) end
})

AntiTab:AddToggle({
    Name = "Anti TimeStop & Stop",
    Default = false,
    Callback = function(Value)
        _G.AntiTimestop = Value
        timestopThread = StopThread(timestopThread)
        if Value then
            timestopThread = task.spawn(function()
                while _G.AntiTimestop do
                    local char = LocalPlayer.Character
                    if char then
                        for _, v in ipairs(char:GetChildren()) do
                            if v:IsA("BasePart") and v.Anchored and v.Name ~= "HumanoidRootPart" then
                                v.Anchored = false
                            end
                        end
                    end
                    task.wait(0.3)
                end
            end)
        end
    end
})

AntiTab:AddToggle({
    Name = "Anti Megarock / Custom / Sbeve",
    Default = false,
    Callback = function(Value)
        _G.AntiRockSbeve = Value
        rockSbeveThread = StopThread(rockSbeveThread)
        if Value then
            rockSbeveThread = task.spawn(function()
                while _G.AntiRockSbeve do
                    for _, v in ipairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character then
                            local r = v.Character:FindFirstChild("rock")
                            if r then r.CanTouch = false; r.CanQuery = false end
                            local s = v.Character:FindFirstChild("stevebody")
                            if s then s.CanTouch = false; s.CanQuery = false; s.CanCollide = false end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    end
})

AntiTab:AddToggle({
    Name = "Anti Za Hando / Pusher / Fort / Bus",
    Default = false,
    Callback = function(Value) SetAntiObstacles(Value) end
})

AntiTab:AddToggle({
    Name = "Anti Reaper / Ice / Mail / Squid / Mitten",
    Default = false,
    Callback = function(Value) SetAntiDebuffs(Value) end
})

AntiTab:AddToggle({
    Name = "Anti Death Barriers & Cube of Death",
    Default = false,
    Callback = function(Value)
        pcall(function()
            local touchState = not Value
            if Workspace:FindFirstChild("DEATHBARRIER") then
                Workspace.DEATHBARRIER.CanTouch = touchState
                for _, v in ipairs(Workspace.DEATHBARRIER:GetChildren()) do
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

-- ВКЛАДКА 4: BADGES & GLOVES
local BadgesTab = Window:MakeTab({Name = "Badges & Farm", Icon = "rbxassetid://7733673987", PremiumOnly = false})

BadgesTab:AddButton({
    Name = "Get Duck + Orange + Knife Badges", 
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
            OrionLib:MakeNotification({Name = "Keypad", Content = "No Keypad on server!", Image = "rbxassetid://7733658504", Time = 3})
        else
            fireclickdetector(Workspace.Keypad.Buttons.Reset.ClickDetector)
            local digits = tostring((#Players:GetPlayers()) * 25 + 1100 - 7)
            for i = 1, #digits do
                task.wait(0.3)
                fireclickdetector(Workspace.Keypad.Buttons:FindFirstChild(digits:sub(i, i)).ClickDetector)
            end
            task.wait(0.4)
            fireclickdetector(Workspace.Keypad.Buttons.Enter.ClickDetector)
        end
    end
})

BadgesTab:AddToggle({
    Name = "Auto Click & Collect Tycoon",
    Default = false,
    Callback = function(Value)
        _G.AutoTycoon = Value
        tycoonThread = StopThread(tycoonThread)
        if Value then
            tycoonThread = task.spawn(function()
                while _G.AutoTycoon do
                    for _, v in ipairs(Workspace:GetChildren()) do
                        if string.find(v.Name, "ÅTycoon") and v:FindFirstChild("Click") and v.Click:FindFirstChild("ClickDetector") then
                            fireclickdetector(v.Click.ClickDetector)
                        end
                        if v.Name:match(LocalPlayer.Name) and v:FindFirstChild("End") then
                            for _, drop in ipairs(v:GetChildren()) do
                                if drop.Name == "TycoonDrop" then
                                    drop.CFrame = v.End.CFrame
                                end
                            end
                        end
                    end
                    task.wait(0.3)
                end
            end)
        end
    end
})

BadgesTab:AddToggle({
    Name = "Fast Brick Farm",
    Default = false,
    Callback = function(Value)
        _G.BrickFarm = Value
        task.spawn(function()
            while _G.BrickFarm do
                if LocalPlayer.leaderstats.Glove.Value == "Brick" then
                    ReplicatedStorage.lbrick:FireServer()
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
        elseif Value == "Slapple Island" and Workspace.Arena:FindFirstChild("island5") then
            hrp.CFrame = Workspace.Arena.island5.Union.CFrame * CFrame.new(0, 3.25, 0)
        elseif Value == "Moai Island" then
            hrp.CFrame = CFrame.new(215, -15.5, 0.5)
        elseif Value == "Plate" and Workspace.Arena:FindFirstChild("Plate") then
            hrp.CFrame = Workspace.Arena.Plate.CFrame * CFrame.new(0, 3, 0)
        elseif Value == "Cannon Island" and Workspace.Arena:FindFirstChild("CannonIsland") then
            hrp.CFrame = Workspace.Arena.CannonIsland.Cannon.Base.CFrame * CFrame.new(0, 0, 35)
        elseif Value == "Tournament" and Workspace:FindFirstChild("Battlearena") then
            hrp.CFrame = Workspace.Battlearena.Arena.CFrame * CFrame.new(0, 10, 0)
        elseif Value == "Hunter Room" and Workspace:FindFirstChild("BountyHunterRoom") then
            hrp.CFrame = Workspace.BountyHunterRoom.Union.CFrame * CFrame.new(0, 5, 0)
        elseif Value == "Cube Of Death" and Workspace.Arena.CubeOfDeathArea:FindFirstChild("the cube of death(i heard it kills)") then
            hrp.CFrame = Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CFrame * CFrame.new(0, 5, 0)
        end
    end
})

-- ВКЛАДКА 6: LOCAL & VISUALS
local MovementTab = Window:MakeTab({Name = "Local & Visuals", Icon = "rbxassetid://4335489011", PremiumOnly = false})

MovementTab:AddSlider({
    Name = "WalkSpeed", 
    Min = 20, Max = 500, Default = 20, Increment = 1, 
    Callback = function(Value)
        currentWalkSpeed = Value
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = Value end
    end
})

MovementTab:AddToggle({
    Name = "Keep WalkSpeed", 
    Default = false, 
    Callback = function(Value)
        if keepWSConnection then keepWSConnection:Disconnect() end
        if Value then
            keepWSConnection = RunService.Heartbeat:Connect(function()
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum and hum.WalkSpeed ~= currentWalkSpeed then
                    hum.WalkSpeed = currentWalkSpeed
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
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = Value end
    end
})

MovementTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value) _G.InfiniteJump = Value end
})
UserInputService.JumpRequest:Connect(function()
    if _G.InfiniteJump then
        local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
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
    Name = "Fly (PC & Mobile)", 
    Default = false, 
    Callback = function(Value) SetFly(Value, flySpeedVal) end
})

MovementTab:AddToggle({
    Name = "Glove ESP", 
    Default = false, 
    Callback = function(Value)
        getgenv().GloveESP = Value
        espThread = StopThread(espThread)
        if Value then
            espThread = task.spawn(function()
                while getgenv().GloveESP do
                    for _, v in ipairs(Players:GetPlayers()) do
                        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v:FindFirstChild("leaderstats") then
                            local gStat = v.leaderstats:FindFirstChild("Glove")
                            if gStat then
                                local esp = v.Character.Head:FindFirstChild("GloveEsp")
                                if not esp then
                                    esp = Instance.new("BillboardGui", v.Character.Head)
                                    esp.Adornee = v.Character.Head
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
                                end
                                esp.TextLabel.Text = "Glove [ " .. tostring(gStat.Value) .. " ]"
                            end
                        end
                    end
                    task.wait(1)
                end
            end)
        else
            for _, v in ipairs(Players:GetPlayers()) do
                if v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloveEsp") then
                    v.Character.Head.GloveEsp:Destroy()
                end
            end
        end
    end
})

MovementTab:AddToggle({
    Name = "FPS Booster", 
    Default = false, 
    Callback = function(Value)
        if Value then
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            for _, v in ipairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") then v.Enabled = false end
            end
            for _, v in ipairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    pcall(function() v.Enabled = false end)
                end
            end
        else
            Lighting.GlobalShadows = true
        end
    end
})

-- ================= КНОПКА ЗГОРТАННЯ UI =================
pcall(function()
    if gethui and gethui():FindFirstChild("Orion") and not LocalPlayer.PlayerGui:FindFirstChild("ToggleUi") then
        local Ui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
        Ui.Name = "ToggleUi"
        Ui.ResetOnSpawn = false

        local DaIcon = Instance.new("ImageButton", Ui)
        DaIcon.Size = UDim2.new(0, 42, 0, 42)
        DaIcon.Position = UDim2.new(0, 15, 0.5, -21)
        DaIcon.Draggable = true
        DaIcon.Image = "rbxassetid://15315284749"
        DaIcon.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
        DaIcon.BorderColor3 = Color3.fromRGB(255, 170, 0)

        local Corner = Instance.new("UICorner", DaIcon)
        Corner.CornerRadius = UDim.new(0.25, 0)

        DaIcon.MouseButton1Click:Connect(function()
            for _, v in ipairs(gethui():GetChildren()) do
                if v.Name == "Orion" then v.Enabled = not v.Enabled end
            end
        end)
    end
end)

isInitializing = false
UpdateMainFarmLoop()
