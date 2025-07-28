local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sloppy GnG",
   Icon = 🗿, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "SloppyGnG",
   LoadingSubtitle = "by Slppy GnG",
   ShowText = "Sloppy GnG", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "9KqBZtkg", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🗿Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

local Button = ManiTab:CreateButton({
   Name = "No Cooldown",
   Callback = function()
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local C = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
        local o = C.AbilityCooldown
        C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
        Rayfield:Notify({Title = "No Cooldown", Content = "No Cooldown Activated!", Duration = 5})
   end,
})

local Button = MainTab:CreateButton({
   Name = "Inf Awakening",
   Callback = function()
   local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local StarterGui = game:GetService("StarterGui")
        local LocalPlayer = Players.LocalPlayer
        local AbilityController = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))

        StarterGui:SetCore("SendNotification", {
            Title = "InfAwakening",
            Text = "Only works for Kaiser, King, Kurona!",
            Duration = 7
        })

        task.spawn(function()
            while task.wait(1) do
                if LocalPlayer and LocalPlayer:FindFirstChild("PlayerStats") and LocalPlayer.PlayerStats:FindFirstChild("InAwakening") then
                    LocalPlayer.PlayerStats.InAwakening.Value = true
                    AbilityController:UseAbility("Awakening")
                end
            end
        end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Anti Ragdoll",
   Callback = function()
   local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("RagdollRemote") then
            player.Character.RagdollRemote:Destroy()
        end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Speed Hack",
   Range = {16, 150},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
        end
   end,
})
