-- XRNL HUB con Rayfield UI
-- Compatible PC/Móvil

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "XRNL HUB",
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
   Range = {16, 200},
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
   Range = {50, 300},
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
