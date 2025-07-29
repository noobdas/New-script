local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sloppy GnG",
   Icon = 0,
   LoadingTitle = "SloppyGnG",
   LoadingSubtitle = "by Sloppy GnG",
   Text = "Sloppy GnG",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/Xf8Pf8N5U8",
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

local MainTab = Window:CreateTab("🗿Home", nil)
local MainSection = MainTab:CreateSection("Main")

local Toggle = MainTab:CreateToggle({
   Name = "Inf Stamin",
   CurrentValue = false,
   Flag = "stamina_toggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(enabled)
     local player = game:GetService("Players").LocalPlayer
while true do
    player.PlayerStats.Stamina.Value = 100
    task.wait(0.000001)
end

local Toggle = MainTab:CreateToggle({
   Name = "No Cooldown",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(enabled)
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local C = require(ReplicatedStorage:WaitForChild("Controllers"):WaitForChild("AbilityController"))
      local o = C.AbilityCooldown
      C.AbilityCooldown = function(s, n, ...) return o(s, n, 0, ...) end
      Rayfield:Notify({Title = "No Cooldown", Content = "No Cooldown Activated!", Duration = 5})
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Inf Awakening",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(enabled)
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

local Toggle = MainTab:CreateToggle({
   Name = "Anti Ragdoll",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(enabled)
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("RagdollRemote") then
         player.Character.RagdollRemote:Destroy()
      end
   end,
})

local cfSpeed = 0.2
local cfEnabled = false

MainTab:CreateSlider({
	Name = "Speed Hack",
	Range = {0.2, 0.7},
	Increment = 0.05,
	Suffix = "Speed",
	CurrentValue = cfSpeed,
	Flag = "cf_slider",
	Callback = function(val)
		cfSpeed = val
	end,
})

MainTab:CreateToggle({
	Name = "Toggle Speed Hack",
	CurrentValue = false,
	Flag = "cf_toggle",
	Callback = function(enabled)
		cfEnabled = enabled
		if enabled then
			task.spawn(function()
				while cfEnabled and task.wait() do
					local p = game.Players.LocalPlayer
					local c = p.Character
					if c then
						local h = c:FindFirstChildOfClass("Humanoid")
						local hrp = c:FindFirstChild("HumanoidRootPart")
						if h and hrp then
							hrp.CFrame = hrp.CFrame + (h.MoveDirection * cfSpeed)
						end
					end
				end
			end)
		end
	end,
})
