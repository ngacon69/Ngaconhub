local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Squabble Game gui",
    LoadingTitle = "Squabble Game gui",
    LoadingSubtitle = "By Ngaconhub",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Ngaconfolder",
        FileName = "Config"
    }
})

-- Tab Games
local GamesTab = Window:CreateTab("Games")

-- ===== RedLight GreenLight Section =====
GamesTab:CreateLabel("RedLight GreenLight") -- just a visual label
GamesTab:CreateButton({
    Name = "Win RedLight GreenLight",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local stages = workspace:WaitForChild("Stages")
        local model2 = stages:WaitForChild("2")
        local batatinha = model2:WaitForChild("Batatinha")
        local floor1 = batatinha:WaitForChild("Floor1")
        hrp.CFrame = CFrame.new(floor1.Position + Vector3.new(0,3,0))
    end
})

-- ===== Glass Bridge Section =====
GamesTab:CreateLabel("Glass Bridge") -- visual label

-- Button 1: Check All Glass (visual)
GamesTab:CreateButton({
    Name = "Check All Glass (visual)",
    Callback = function()
        local model3 = workspace:WaitForChild("3")
        local glasses = model3:WaitForChild("Glasses")
        for i = 1,23 do
            local folder = glasses:FindFirstChild(tostring(i))
            if folder then
                for _, name in pairs({"Glass1","Glass2"}) do
                    local glass = folder:FindFirstChild(name)
                    if glass then
                        if glass:FindFirstChild("TouchInterest") then
                            glass.BrickColor = BrickColor.new("Really red")
                        else
                            glass.BrickColor = BrickColor.new("Bright green")
                        end
                    end
                end
            end
        end
    end
})

-- mingle
GamesTab:CreateLabel("Mingle") -- visual label

GamesTab:CreateButton({
    Name = "Skip Mingle",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local StagesFolder = workspace:WaitForChild("Stages")
        local model6 = StagesFolder:WaitForChild("6")
        local stairs = model6:WaitForChild("Stairs")
        hrp.CFrame = stairs.CFrame + Vector3.new(0,3,0)
    end
})
-- jump rope
GamesTab:CreateLabel("Jump Rope") -- visual label

GamesTab:CreateButton({
    Name = "Delete Rope",
    Callback = function()
        local stage7 = workspace:WaitForChild("Stages"):WaitForChild("7")
        local rope = stage7:FindFirstChild("Rope")
        if rope then
            rope:Destroy() -- delete the rope part
            print("Rope deleted!")
        else
            print("Rope not found!")
        end
    end
})

GamesTab:CreateLabel("Win Game") -- visual label

GamesTab:CreateButton({
    Name = "Go to win",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")

        local stage8 = workspace:WaitForChild("Stages"):WaitForChild("8")
        local floor = stage8:FindFirstChild("Floor")
        if floor then
            hrp.CFrame = floor.CFrame + Vector3.new(0,3,0) -- teleport above the floor
            print("Teleported to Floor!")
        else
            print("Floor not found in Stage 8!")
        end
    end
})
