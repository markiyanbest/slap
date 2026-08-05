local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- 1. ВЛАСНИЙ ІНТЕРФЕЙС (Без конфліктів)
local guiName = "StickyKillFarm_UI_9921"
if CoreGui:FindFirstChild(guiName) then CoreGui[guiName]:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 230)
MainFrame.Position = UDim2.new(0.5, -140, 0.5, -115)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Title.Text = "🔪 Slap Battles Kill Farm"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 260, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 40)
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 14
TextBox.PlaceholderText = "Впишіть нік (можна половину)"
TextBox.Text = ""
TextBox.Parent = MainFrame

local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0, 260, 0, 40)
StartBtn.Position = UDim2.new(0, 10, 0, 90)
StartBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.Font = Enum.Font.GothamBold
StartBtn.TextSize = 14
StartBtn.Text = "СТАРТ (Чекаємо Слап + Ресет)"
StartBtn.Parent = MainFrame

local StopBtn = Instance.new("TextButton")
StopBtn.Size = UDim2.new(0, 260, 0, 40)
StopBtn.Position = UDim2.new(0, 10, 0, 140)
StopBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
StopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StopBtn.Font = Enum.Font.GothamBold
StopBtn.TextSize = 14
StopBtn.Text = "АВАРІЙНИЙ СТОП (Відклеїтись)"
StopBtn.Parent = MainFrame

local StatusTxt = Instance.new("TextLabel")
StatusTxt.Size = UDim2.new(0, 260, 0, 30)
StatusTxt.Position = UDim2.new(0, 10, 0, 190)
StatusTxt.BackgroundTransparency = 1
StatusTxt.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusTxt.Font = Enum.Font.Gotham
StatusTxt.TextSize = 12
StatusTxt.Text = "Очікування..."
StatusTxt.Parent = MainFrame

-- 2. ЛОГІКА СКРИПТА
getgenv().FarmKills = false
local currentStickConn = nil
local targetName = ""

TextBox.FocusLost:Connect(function(enter)
    targetName = TextBox.Text
end)

local function Unstick()
    if currentStickConn then
        currentStickConn:Disconnect()
        currentStickConn = nil
    end
end

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

StartBtn.MouseButton1Click:Connect(function()
    getgenv().FarmKills = true
    StatusTxt.Text = "Фарм активовано..."
    
    task.spawn(function()
        while getgenv().FarmKills do
            if targetName == "" then
                StatusTxt.Text = "Помилка: Впишіть нік!"
                task.wait(1)
                continue
            end
            
            if not lp.Character or not lp.Character:FindFirstChild("entered") then
                StatusTxt.Text = "Захід на арену..."
                EnterArena()
                task.wait(1)
                continue
            end
            
            local target = FindTarget()
            
            if not target or not target:FindFirstChild("HumanoidRootPart") or not target:FindFirstChild("Humanoid") or target.Humanoid.Health <= 0 then
                StatusTxt.Text = "Ціль мертва або не знайдена..."
                Unstick()
                task.wait(0.5)
                continue
            end
            
            local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
            local targetHrp = target:FindFirstChild("HumanoidRootPart")
            
            if hrp and targetHrp then
                Unstick()
                
                StatusTxt.Text = "Приклеюємось до " .. target.Name
                
                -- 1. ПРИКЛЕЮЄМОСЬ
                currentStickConn = RunService.Heartbeat:Connect(function()
                    if hrp and targetHrp and hrp.Parent and targetHrp.Parent and target.Humanoid.Health > 0 then
                        local targetCFrame = targetHrp.CFrame * CFrame.new(0, 0, -3)
                        hrp.CFrame = CFrame.lookAt(targetCFrame.Position, targetHrp.Position)
                        -- Коли ми приклеєні, швидкість 0. Якщо нас вдарять, вона різко злетить.
                        hrp.AssemblyLinearVelocity = Vector3.zero
                    else
                        Unstick()
                    end
                end)
                
                -- 2. ЧЕКАЄМО УДАРУ (Перевіряємо швидкість відкидання)
                local gotSlapped = false
                local startTime = tick()
                
                while tick() - startTime < 3 do -- Макс 3 секунди очікування
                    if not getgenv().FarmKills then break end
                    if hrp and hrp.Parent then
                        local vel = hrp.AssemblyLinearVelocity.Magnitude
                        -- Якщо швидкість різко зросла (нас вдарили і відкинули)
                        if vel > 100 then
                            gotSlapped = true
                            break
                        end
                    else
                        break -- Ми вже померли від удару
                    end
                    task.wait(0.03)
                end
                
                -- Відклеюємось
                Unstick()
                
                -- 3. РЕСЕТ (Якщо нас вдарили, або якщо вийшов таймаут 3 сек)
                if getgenv().FarmKills and lp.Character and lp.Character:FindFirstChild("Humanoid") then
                    if gotSlapped then
                        StatusTxt.Text = "Удар отримано! Ресет..."
                    else
                        StatusTxt.Text = "Таймаут. Ресет..."
                    end
                    lp.Character.Humanoid.Health = 0
                end
                
                -- Чекаємо респавн
                task.wait(3)
            end
            task.wait(0.2)
        end 
    end)
end)

StopBtn.MouseButton1Click:Connect(function()
    getgenv().FarmKills = false
    Unstick()
    StatusTxt.Text = "Зупинено. Можеш ходити!"
end)
