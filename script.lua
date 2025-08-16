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

local SupportedGames = {
    [137987263937629] = "https://raw.githubusercontent.com/ngacon69/Ngaconhub/refs/heads/main/games/slapwallhoptower.lua" -- Slap Wall Hop Tower
}

local currentGameId = game.PlaceId

if SupportedGames[currentGameId] then
    local scriptUrl = SupportedGames[currentGameId]
    local success, err = pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)

    if success then
        print("[Hub] Loaded script for Game ID:", currentGameId)
    else
        warn("[Hub] Failed to load script:", err)
    end
else
    warn("[Hub] This game is not supported! (ID: " .. currentGameId .. ")")
    game:GetService("Players").LocalPlayer:Kick("❌ This game is not supported in Script Hub ❌")
end
