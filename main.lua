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
print("XRNL HUB cargado con pestañas adicionales (móvil/PC)")
