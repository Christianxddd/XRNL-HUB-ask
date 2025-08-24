local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Super Fun Obby",
   LoadingTitle = "Obby Hub",
   LoadingSubtitle = "by a Random Exploiter",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Obby Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local MainTab = Window:CreateTab("Main", nil)
local MainSection = MainTab:CreateSection("Main")

local Button = Tab:CreateButton({
   Name = "Finish All",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(130.338, 150.083, -484.042)
   end,
})

local OtherSection = MainTab:CreateSection("Other")    

local Button = MainTab:CreateButton({
   Name = "Destroy GUI",
   Callback = function()
      Rayfield:Destroy()
   end,
})   
