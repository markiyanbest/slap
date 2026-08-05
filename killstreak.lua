local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- НОВА БІБЛІОТЕКА ІНТЕРФЕЙСУ (Rayfield)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Killstreak & Reaper Farmer 🔪", 
   LoadingTitle = "Loading Farm...",
   LoadingSubtitle = "Sticky Kill Mode",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Main Farm", 4483362458)

local targetName = ""

Tab:CreateInput({
   Name = "Нік гравця (можна половину)",
   PlaceholderText = "Наприклад: slap",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
        targetName = Text
   end,
})

local function FindTarget()
    if targetName == "" then return nil end
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("entered") then
            if string.find(string.lower(p.Name), string.lower(targetName)) then
                return p.Character
            end
        end
    end
    return nil
end

local function EnterArena()
    if lp.Character and lp.Character:FindFirstChild("Head") and not lp.Character:FindFirstChild("entered") then
        local lobby = workspace:FindFirstChild("Lobby")
        if lobby and lobby:FindFirstChild("Teleport1") then
            firetouchinterest(lp.Character.Head, lobby.Teleport1, 0)
            task.wait(0.1)
            firetouchinterest(lp.Character.Head, lobby.Teleport1, 1)
        end
    end
end

Tab:CreateToggle({
   Name = "Фармити (Приклеїтись + Удар + Ресет)",
   CurrentValue = false,
   Flag = "FarmToggle",
   Callback = function(Value)
        getgenv().FarmKills = Value
        
        if Value then
            task.spawn(function()
                while getgenv().FarmKills do
                    if targetName == "" then
                        task.wait(1)
                        continue
                    end
                    
                    if not lp.Character or not lp.Character:FindFirstChild("entered") then
                        EnterArena()
                        task.wait(1)
                        continue
                    end
                    
                    local target = FindTarget()
                    if not target then
                        task.wait(0.5)
                        continue
                    end
                    
                    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
                    local targetHrp = target:FindFirstChild("HumanoidRootPart")
                    
                    if hrp and targetHrp then
                        -- 1. ПРИКЛЕЮЄМОСЬ (Кожен кадр стоїмо спереду нього)
                        local stickConn
                        stickConn = RunService.Heartbeat:Connect(function()
                            if hrp and targetHrp and hrp.Parent and targetHrp.Parent then
                                -- Стоїмо чітко спереду нього на відстані удару
                                hrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, -3)
                                hrp.AssemblyLinearVelocity = Vector3.zero
                            end
                        end)
                        
                        -- Чекаємо 0.5 секунди, щоб міцно приклеїтись і прогрузитись
                        task.wait(0.5)
                        
                        -- 2. ВДАРЯЄМО (Шукаємо рукавицю і б'ємо нею)
                        local tool = lp.Character:FindFirstChildOfClass("Tool")
                        if tool then
                            pcall(function()
                                tool:Activate() -- Пряма активація рукавиці
                            end)
                        end
                        -- Запасний клік мишкою
                        pcall(function()
                            if mouse1click then mouse1click() end
                        end)
                        
                        -- ЧЕКАЄМО ЦІЛУ СЕКУНДУ, щоб сервер 100% ЗАРАХУВАВ УДАР
                        task.wait(1.0)
                        
                        -- Відклеюємось
                        if stickConn then stickConn:Disconnect() end
                        
                        -- 3. РЕСЕТ (Вбиваємо самі себе)
                        if getgenv().FarmKills and lp.Character and lp.Character:FindFirstChild("Humanoid") then
                            lp.Character.Humanoid.Health = 0
                        end
                        
                        -- Чекаємо респавн
                        task.wait(3)
                    end
                    task.wait(0.2)
                end 
            end)
        end
   end,
})

Tab:CreateButton({
   Name = "АВАРІЙНИЙ СТОП",
   Callback = function()
        getgenv().FarmKills = false
        Rayfield:Notify({
            Title = "Стоп",
            Content = "Фарм зупинено.",
            Duration = 3,
        })
   end,
})
