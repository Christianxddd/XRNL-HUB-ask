-- XRNL HUB con Rayfield UI
-- Compatible PC/Móvil

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "XRNLHUB-By Christian Sebastian",
   LoadingTitle = "XRNL Loader",
   LoadingSubtitle = "Mobile & PC Compatible",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "XRNLHub",
      FileName = "XRNL_Config"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "XRNL",
      Subtitle = "Key System",
      Note = "None",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

-- Main Tab
local MainTab = Window:CreateTab("Main", nil)
local MainSection = MainTab:CreateSection("Main")

MainTab:CreateButton({
   Name = "Finish All (Obby)",
   Callback = function()
      local plr = game.Players.LocalPlayer
      if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
         plr.Character.HumanoidRootPart.CFrame = CFrame.new(130.338, 150.083, -484.042)
      end
   end
})

MainTab:CreateButton({
   Name = "Destroy GUI",
   Callback = function()
      Rayfield:Destroy()
   end,
})

-- Utilidades Tab
local UtilTab = Window:CreateTab("Utilidades", nil)
local UtilSection = UtilTab:CreateSection("Visuales / ESP")

local espEnabled = false
UtilTab:CreateToggle({
   Name = "Activar ESP Players",
   CurrentValue = false,
   Callback = function(Value)
      espEnabled = Value
      for _, p in ipairs(game.Players:GetPlayers()) do
         if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            if Value then
               local billboard = Instance.new("BillboardGui")
               billboard.Name = "XRNL_ESP"
               billboard.Adornee = p.Character.Head
               billboard.Size = UDim2.new(0,100,0,50)
               billboard.AlwaysOnTop = true
               local label = Instance.new("TextLabel")
               label.Parent = billboard
               label.Size = UDim2.new(1,0,1,0)
               label.BackgroundTransparency = 1
               label.Text = p.Name
               label.TextColor3 = Color3.new(1,0,0)
               label.TextStrokeTransparency = 0
               billboard.Parent = p.Character.Head
            else
               if p.Character.Head:FindFirstChild("XRNL_ESP") then
                  p.Character.Head.XRNL_ESP:Destroy()
               end
            end
         end
      end
   end,
})

-- Funciones Tab
local FuncTab = Window:CreateTab("Funciones", nil)
local FuncSection = FuncTab:CreateSection("Movimientos")

local speedValue = 16
local jumpValue = 50

FuncTab:CreateSlider({
   Name = "Velocidad",
   Range = {16, 999},
   Increment = 1,
   Suffix = "WalkSpeed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      speedValue = Value
      local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
      if hum then hum.WalkSpeed = Value end
   end,
})

FuncTab:CreateSlider({
   Name = "Salto",
   Range = {50, 999},
   Increment = 5,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
      jumpValue = Value
      local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
      if hum then hum.JumpPower = Value end
   end,
})

FuncTab:CreateSlider({
   Name = "Volumen",
   Range = {0, 10},
   Increment = 1,
   Suffix = "x",
   CurrentValue = 5,
   Flag = "VolumeSlider",
   Callback = function(Value)
      game:GetService("SoundService").RespectFilteringEnabled = false
      for _, sound in ipairs(workspace:GetDescendants()) do
         if sound:IsA("Sound") then
            sound.Volume = Value
         end
      end
   end,
})
-- 🟦 Pestaña Blox Fruits | XRNL HUB 🟦
local BloxFruitsTab = Instance.new("Frame")
BloxFruitsTab.Name = "BloxFruitsTab"
BloxFruitsTab.Size = UDim2.new(1,0,1,0)
BloxFruitsTab.BackgroundTransparency = 1
BloxFruitsTab.Visible = false
BloxFruitsTab.Parent = MainContent -- Aquí va dentro de tu contenedor de secciones

-- Título
local Title = Instance.new("TextLabel", BloxFruitsTab)
Title.Text = "⚔️ Blox Fruits - Scripts Populares ⚔️"
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0,10,0,10)
Title.BackgroundTransparency = 1
Title.TextScaled = true
Title.TextColor3 = Color3.fromRGB(0,200,255)
Title.Font = Enum.Font.FredokaOne

-- Botón 1: Auto Farm
local AutoFarm = Instance.new("TextButton", BloxFruitsTab)
AutoFarm.Text = "🌌 Auto Farm"
AutoFarm.Size = UDim2.new(0, 200, 0, 40)
AutoFarm.Position = UDim2.new(0,20,0,60)
AutoFarm.BackgroundColor3 = Color3.fromRGB(30,30,30)
AutoFarm.TextColor3 = Color3.fromRGB(255,255,255)
AutoFarm.Font = Enum.Font.GothamBold
AutoFarm.TextSize = 16
AutoFarm.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/NEWBF"))()
end)

-- Botón 2: ESP Players
local ESP = Instance.new("TextButton", BloxFruitsTab)
ESP.Text = "👁 ESP Players"
ESP.Size = UDim2.new(0, 200, 0, 40)
ESP.Position = UDim2.new(0,20,0,110)
ESP.BackgroundColor3 = Color3.fromRGB(30,30,30)
ESP.TextColor3 = Color3.fromRGB(255,255,255)
ESP.Font = Enum.Font.GothamBold
ESP.TextSize = 16
ESP.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaqueHub/BF/main/ESP"))()
end)

-- Botón 3: Fruit Sniper
local FruitSniper = Instance.new("TextButton", BloxFruitsTab)
FruitSniper.Text = "🍇 Fruit Sniper"
FruitSniper.Size = UDim2.new(0, 200, 0, 40)
FruitSniper.Position = UDim2.new(0,20,0,160)
FruitSniper.BackgroundColor3 = Color3.fromRGB(30,30,30)
FruitSniper.TextColor3 = Color3.fromRGB(255,255,255)
FruitSniper.Font = Enum.Font.GothamBold
FruitSniper.TextSize = 16
FruitSniper.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SHAREHACK/script/main/BF-FruitSniper"))()
end)

-- Botón 4: Teleport Island
local TeleportIslands = Instance.new("TextButton", BloxFruitsTab)
TeleportIslands.Text = "🛶 Teleport Islas"
TeleportIslands.Size = UDim2.new(0, 200, 0, 40)
TeleportIslands.Position = UDim2.new(0,20,0,210)
TeleportIslands.BackgroundColor3 = Color3.fromRGB(30,30,30)
TeleportIslands.TextColor3 = Color3.fromRGB(255,255,255)
TeleportIslands.Font = Enum.Font.GothamBold
TeleportIslands.TextSize = 16
TeleportIslands.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SypherPKScripts/BF-Teleport/main/Islands"))()
end)

-- Botón 5: Kill Aura
local KillAura = Instance.new("TextButton", BloxFruitsTab)
KillAura.Text = "💥 Kill Aura"
KillAura.Size = UDim2.new(0, 200, 0, 40)
KillAura.Position = UDim2.new(0,20,0,260)
KillAura.BackgroundColor3 = Color3.fromRGB(30,30,30)
KillAura.TextColor3 = Color3.fromRGB(255,255,255)
KillAura.Font = Enum.Font.GothamBold
KillAura.TextSize = 16
KillAura.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BF-Scripts/KillAura/main/script"))()
end)

-- 📌 Botón en el menú para abrir esta pestaña
local BloxButton = Instance.new("TextButton", SideMenu)
BloxButton.Text = "⚔️ Blox Fruits"
BloxButton.Size = UDim2.new(1,0,0,40)
BloxButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
BloxButton.TextColor3 = Color3.fromRGB(0,255,200)
BloxButton.Font = Enum.Font.GothamBold
BloxButton.TextSize = 16
BloxButton.MouseButton1Click:Connect(function()
    for _,tab in pairs(MainContent:GetChildren()) do
        if tab:IsA("Frame") then
            tab.Visible = false
        end
    end
    BloxFruitsTab.Visible = true
end)
--// XRNL HUB - Jailbreak Tab //--

local jailbreakTab = Instance.new("Frame")
jailbreakTab.Name = "JailbreakTab"
jailbreakTab.Size = UDim2.new(0, 350, 0, 300)
jailbreakTab.Position = UDim2.new(0.5, -175, 0.5, -150)
jailbreakTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
jailbreakTab.BorderSizePixel = 0
jailbreakTab.Visible = false
jailbreakTab.Parent = mainFrame

-- Título
local jailTitle = Instance.new("TextLabel", jailbreakTab)
jailTitle.Size = UDim2.new(1, 0, 0, 30)
jailTitle.BackgroundTransparency = 1
jailTitle.Text = "🚔 XRNL HUB - Jailbreak"
jailTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
jailTitle.TextSize = 20
jailTitle.Font = Enum.Font.GothamBold

-- Botón: Auto Rob
local autoRobBtn = Instance.new("TextButton", jailbreakTab)
autoRobBtn.Size = UDim2.new(1, -20, 0, 40)
autoRobBtn.Position = UDim2.new(0, 10, 0, 50)
autoRobBtn.Text = "💰 Auto Rob"
autoRobBtn.TextColor3 = Color3.fromRGB(255,255,255)
autoRobBtn.TextSize = 18
autoRobBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
autoRobBtn.Font = Enum.Font.GothamBold

autoRobBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/regularsteve1234/AutoRobJailbreak/main/AutoRob.lua"))()
end)

-- Botón: Kill Aura
local killAuraBtn = Instance.new("TextButton", jailbreakTab)
killAuraBtn.Size = UDim2.new(1, -20, 0, 40)
killAuraBtn.Position = UDim2.new(0, 10, 0, 100)
killAuraBtn.Text = "⚔️ Kill Aura"
killAuraBtn.TextColor3 = Color3.fromRGB(255,255,255)
killAuraBtn.TextSize = 18
killAuraBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
killAuraBtn.Font = Enum.Font.GothamBold

killAuraBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ByD3v/Jailbreak-KillAura/main/script.lua"))()
end)

-- Botón: Walkspeed Hack
local speedBtn = Instance.new("TextButton", jailbreakTab)
speedBtn.Size = UDim2.new(1, -20, 0, 40)
speedBtn.Position = UDim2.new(0, 10, 0, 150)
speedBtn.Text = "⚡ WalkSpeed Hack"
speedBtn.TextColor3 = Color3.fromRGB(255,255,255)
speedBtn.TextSize = 18
speedBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
speedBtn.Font = Enum.Font.GothamBold

speedBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularSteve1234/JailbreakSpeedHack/main/SpeedHack.lua"))()
end)

-- Botón: Teleport a Base Criminal
local tpBaseBtn = Instance.new("TextButton", jailbreakTab)
tpBaseBtn.Size = UDim2.new(1, -20, 0, 40)
tpBaseBtn.Position = UDim2.new(0, 10, 0, 200)
tpBaseBtn.Text = "🚨 Teleport Base Criminal"
tpBaseBtn.TextColor3 = Color3.fromRGB(255,255,255)
tpBaseBtn.TextSize = 18
tpBaseBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
tpBaseBtn.Font = Enum.Font.GothamBold

tpBaseBtn.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(214.32, 17.72, 1085.66) -- Coordenadas base criminal
end)

-- Función para mostrar pestaña Jailbreak
function showJailbreakTab()
    hideAllTabs()
    jailbreakTab.Visible = true
end
--// Pestaña Brookhaven 🏡RP
local BrookhavenTab = PopularSection:CreateTab("Brookhaven 🏡RP")

BrookhavenTab:CreateButton("Brookhaven GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/raw/main/Brookhaven"))()
end)

BrookhavenTab:CreateButton("Brookhaven Admin", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/GEpG2vsN"))()
end)

BrookhavenTab:CreateButton("Brookhaven Troll", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kiroftt/RobloxScripts/main/BrookhavenTroll.lua"))()
end)

BrookhavenTab:CreateButton("Brookhaven Fly", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/YJMz7s3Y"))()
end)
-- Pestaña Murder Mystery 2
local mm2Frame = Instance.new("Frame")
mm2Frame.Name = "MM2Frame"
mm2Frame.Size = UDim2.new(0, 350, 0, 320)
mm2Frame.Position = UDim2.new(0.5, -175, 0.5, -160)
mm2Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mm2Frame.Visible = false
mm2Frame.Parent = screenGui
table.insert(pestanas, mm2Frame)

local mm2Title = Instance.new("TextLabel")
mm2Title.Size = UDim2.new(1, 0, 0, 30)
mm2Title.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
mm2Title.Text = "Murder Mystery 2 - XRNL HUB"
mm2Title.TextColor3 = Color3.new(1, 1, 1)
mm2Title.Font = Enum.Font.GothamBold
mm2Title.TextSize = 16
mm2Title.Parent = mm2Frame

-- Botón ESP Jugadores
crearBoton("ESP Players", mm2Frame, function()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(0, 255, 0)
        end
    end
end)

-- Botón Auto Collect Coins
crearBoton("Auto Collect Coins", mm2Frame, function()
    spawn(function()
        while task.wait(0.5) do
            pcall(function()
                for _, coin in pairs(workspace:GetChildren()) do
                    if coin.Name == "Coin" then
                        coin.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end)
end)

-- Botón Knife Reach
crearBoton("Knife Reach", mm2Frame, function()
    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool then
        tool.Handle.Size = Vector3.new(10, 10, 10)
        tool.Handle.Massless = true
    end
end)

-- Botón Grab Gun
crearBoton("Grab Gun", mm2Frame, function()
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "GunDrop" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end)

-- Botón Kill Aura
crearBoton("Kill Aura (Sheriff/Murder)", mm2Frame, function()
    spawn(function()
        while task.wait(0.3) do
            pcall(function()
                local char = game.Players.LocalPlayer.Character
                local tool = char:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild("Handle") then
                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local hrp = player.Character.HumanoidRootPart
                            if (char.HumanoidRootPart.Position - hrp.Position).Magnitude < 10 then
                                firetouchinterest(tool.Handle, hrp, 0)
                                firetouchinterest(tool.Handle, hrp, 1)
                            end
                        end
                    end
                end
            end)
        end
    end)
end)
-- Settings Tab
local SettingsTab = Window:CreateTab("Settings", nil)
local SetSection = SettingsTab:CreateSection("Ajustes de Tema / UI")

SettingsTab:CreateColorPicker({
   Name = "Color Principal",
   Color = Color3.fromRGB(255,255,255),
   Flag = "ColorPicker",
   Callback = function(Value)
      Rayfield:ChangeColor(Value)
   end
})

SettingsTab:CreateKeybind({
   Name = "Toggle UI",
   CurrentKeybind = "RightShift",
   HoldToInteract = false,
   Flag = "UI_Toggle",
   Callback = function()
      Rayfield:ToggleUI()
   end,
})
-- Troll Tab
local TrollTab = Window:CreateTab("Troll", nil)
local TrollSection = TrollTab:CreateSection("Scripts de Broma / Troll")

-- 1. Cambio de color loco
TrollTab:CreateButton({
    Name = "Cambio de color loco",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character then
            for _, part in ipairs(plr.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Color = Color3.new(math.random(), math.random(), math.random())
                end
            end
        end
    end
})

-- 2. Super Jump Troll
TrollTab:CreateButton({
    Name = "Super Jump Troll",
    Callback = function()
        local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            local original = hum.JumpPower
            hum.JumpPower = 500
            wait(3)
            hum.JumpPower = original
        end
    end
})

-- 3. Spam de broma
TrollTab:CreateButton({
    Name = "Spam Troll Chat",
    Callback = function()
        for i = 1,5 do
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Troll XD!", "All")
            wait(0.5)
        end
    end
})

-- 4. Teleport Aleatorio
TrollTab:CreateButton({
    Name = "Teleport Aleatorio",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-500,500),50,math.random(-500,500))
        end
    end
})

-- 5. Crecimiento Loco
TrollTab:CreateButton({
    Name = "Crecimiento Loco",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character then
            for _, part in ipairs(plr.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Size = part.Size * math.random(1,3)
                end
            end
        end
    end
})

-- 6. Mini Personaje
TrollTab:CreateButton({
    Name = "Encoger Personaje",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character then
            for _, part in ipairs(plr.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Size = part.Size * 0.5
                end
            end
        end
    end
})

-- 7. Personaje Gigante
TrollTab:CreateButton({
    Name = "Gigante Troll",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character then
            for _, part in ipairs(plr.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Size = part.Size * 3
                end
            end
        end
    end
})

-- 8. Giro Loco
TrollTab:CreateButton({
    Name = "Giro Loco",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,math.rad(180),0)
        end
    end
})

-- 9. Volar Troll
TrollTab:CreateButton({
    Name = "Volar Troll",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local hum = plr.Character.Humanoid
            hum.PlatformStand = true
            plr.Character.HumanoidRootPart.Velocity = Vector3.new(0,100,0)
            wait(2)
            hum.PlatformStand = false
        end
    end
})

-- 10. Explosion de bromas
TrollTab:CreateButton({
    Name = "Explosión Troll",
    Callback = function()
        local plr = game.Players.LocalPlayer
        if plr.Character then
            for _, part in ipairs(plr.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    local explosion = Instance.new("Explosion")
                    explosion.Position = part.Position
                    explosion.BlastRadius = 5
                    explosion.BlastPressure = 0
                    explosion.Parent = workspace
                end
            end
        end
    end
})
-- Juegos Tab
local GamesTab = Window:CreateTab("Juegos", nil)
local GameSection = GamesTab:CreateSection("Scripts Populares")

GamesTab:CreateButton({
   Name = "Infinity Yield",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

GamesTab:CreateButton({
   Name = "Fly v3",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})

GamesTab:CreateButton({
   Name = "INK GAMES",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()
   end,
})

GamesTab:CreateButton({
   Name = "Blue Lock Rivals",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XZuuyaX/XZuyaX-s-Hub/refs/heads/main/Main.Lua", true))()
   end,
})

GamesTab:CreateButton({
   Name = "Sin cooldown Blue lock",
   Callback = function()
      local C = require(game:GetService("ReplicatedStorage").Controllers.AbilityController)
local o = C.AbilityCooldown

C.AbilityCooldown = function(s, n, ...)
    return o(s, n, 0, ...)
end
   end,
})

GamesTab:CreateButton({
   Name = "Teleport",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Christianxddd/TELEPORT/1bb8e93b66b1a15ada295b5d3e4bcda8f888dda7/main.lua"))()
   end,
})

GamesTab:CreateButton({
   Name = "Roba un brainlot",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()
   end,
})
-- 📌 Sección de Créditos
local creditosFrame = Instance.new("Frame")
creditosFrame.Name = "CreditosFrame"
creditosFrame.Size = UDim2.new(1, 0, 1, 0)
creditosFrame.BackgroundTransparency = 1
creditosFrame.Visible = false
creditosFrame.Parent = panelFrame

-- Título
local title = Instance.new("TextLabel")
title.Text = "✨ Créditos ✨"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 22
title.Font = Enum.Font.SourceSansBold
title.BackgroundTransparency = 1
title.Parent = creditosFrame

-- Función rápida para crear botones de créditos
local function CrearBoton(nombre, link, posY)
    local boton = Instance.new("TextButton")
    boton.Text = nombre
    boton.Size = UDim2.new(0.8, 0, 0, 40)
    boton.Position = UDim2.new(0.1, 0, 0, posY)
    boton.BackgroundColor3 = Color3.fromRGB(30,30,30)
    boton.TextColor3 = Color3.fromRGB(255,255,255)
    boton.TextSize = 18
    boton.Font = Enum.Font.SourceSansBold
    boton.Parent = creditosFrame
    boton.MouseButton1Click:Connect(function()
        setclipboard(link)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "📌 Créditos",
            Text = "Se copió el link de " .. nombre .. " al portapapeles!",
            Duration = 3
        })
    end)
end

-- Botones de redes sociales ✨
CrearBoton("TikTok", "https://www.tiktok.com/@tuusuario", 60)
CrearBoton("Instagram", "https://www.instagram.com/tuusuario", 110)
CrearBoton("GitHub", "https://github.com/Christianxddd", 160)
CrearBoton("YouTube", "https://www.youtube.com/@tuusuario", 210)

print("XRNL HUB cargado con pestañas adicionales (móvil/PC)")
