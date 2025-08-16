local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Ngacon's Script Hub",
    Icon = 0,
    LoadingTitle = "Script Hub Loading",
    LoadingSubtitle = "By Ngacon",
    ShowText = "Rayfield",
    Theme = "Default",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Ngacon's Hub"
    },
    Discord = {
        Enabled = true,
        Invite = "ySchsguvfq",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Ngacon's Script Hub",
        Subtitle = "Key System",
        Note = "Join Discord to get the key: https://discord.gg/ySchsguvfq",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"NgaconVerySigma"}
    }
})

repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character
if not game:IsLoaded() then
    game.Loaded:Wait()
end

print("Supported game!")
local creator = game.CreatorId

local games = {
    [137987263937629] = "https://raw.githubusercontent.com/ngacon69/Ngaconhub/refs/heads/main/games/slapwallhoptower.lua",
    [130733429041738] = "https://raw.githubusercontent.com/ngacon69/Ngaconhub/refs/heads/main/games/squabblegame.lua"
} 

if games[creator] then 
    print("Please wait, daddyhh~ loading..")
    loadstring(game:HttpGet(games[creator]))()
else
    warn("Unsupported game.")
end
