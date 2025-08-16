local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Window chính
local Window = Rayfield:CreateWindow({
    Name = "Slap Wall Hop Tower gui",
    LoadingTitle = "Slap Wall Hop Tower gui",
    LoadingSubtitle = "By Ngaconhub",
    ConfigurationSaving = { Enabled = true, FolderName = "VietnamSlapTower", FileName = "config" }
})

-- Tab Main
local MainTab = Window:CreateTab("Main")

-- Nút xóa 2 cái Group Part
MainTab:CreateButton({
    Name = "Delete Door",
    Callback = function()
        local deletedGroup = 0
        local deletedWalls = 0

        -- Xóa 2 cái Group
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name == "Group" then
                obj:Destroy()
                deletedGroup = deletedGroup + 1
                if deletedGroup >= 2 then break end
            end
        end

        -- Xóa WaitWall và WaitWall2 (nếu tồn tại)
        for _, wallName in pairs({"WaitWall", "WaitWall2"}) do
            local wall = workspace:FindFirstChild(wallName)
            if wall and wall:IsA("BasePart") then
                wall:Destroy()
                deletedWalls = deletedWalls + 1
            end
        end

        print("Deleted " .. deletedGroup .. " Group parts and " .. deletedWalls .. " WaitWall parts!")
    end
})

-- Toggle Anti-Slap
local antiSlapConnection
MainTab:CreateToggle({
    Name = "Anti-Slap",
    Callback = function(state)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")

        if state then
            if antiSlapConnection then antiSlapConnection:Disconnect() end
            antiSlapConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if not char or not char:FindFirstChild("HumanoidRootPart") then return end
                local hum = char:FindFirstChild("Humanoid")
                hrp = char:FindFirstChild("HumanoidRootPart")
                local lastPosition

                if hum and hum:GetState() ~= Enum.HumanoidStateType.PlatformStanding then
                    lastPosition = hrp.CFrame
                end

                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BodyVelocity") or v:IsA("BodyAngularVelocity") or v.Name:lower():find("ragdoll") then
                        v:Destroy()
                        if lastPosition then hrp.CFrame = lastPosition end
                    end
                end

                if hum and hum:GetState() == Enum.HumanoidStateType.PlatformStanding then
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                    hum.PlatformStand = false
                    if lastPosition then hrp.CFrame = lastPosition end
                end
            end)
            print("Anti-Slap ENABLED!")
        else
            if antiSlapConnection then
                antiSlapConnection:Disconnect()
                antiSlapConnection = nil
                print("Anti-Slap DISABLED!")
            end
        end
    end
})

-- Tab Teleport
local TeleportTab = Window:CreateTab("Teleport")

-- Section Troll Button
TeleportTab:CreateSection("Troll Button")

-- Tạo nút teleport từ Platform2 → Platform9
for i = 2, 9 do
    local platformName = "Troll Troll button" .. i
    local buttonName = "Teleport to " .. platformName

    TeleportTab:CreateButton({
        Name = buttonName,
        Callback = function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")

            local platform = workspace:FindFirstChild(platformName)
            if platform then
                local part = platform:FindFirstChild("Part")
                if part then
                    hrp.CFrame = part.CFrame + Vector3.new(0,3,0)
                    print("Teleported to " .. platformName .. " > Part!")
                else
                    warn(platformName .. " has no Part!")
                end
            else
                warn(platformName .. " not found in Workspace!")
            end
        end
    })
end

-- Section mới hoặc dùng chung Section cũ
TeleportTab:CreateSection("Win") -- tạo section cho dễ nhìn

-- Nút teleport đến Badge Giver
TeleportTab:CreateButton({
    Name = "Teleport to Win",
    Callback = function()
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local badgePart = workspace:FindFirstChild("Badge Giver")

        if badgePart then
            hrp.CFrame = badgePart.CFrame + Vector3.new(0,3,0) -- +3 để tránh bị dính đất
            print("Teleported to Badge Giver!")
        else
            warn("Badge Giver not found in Workspace!")
        end
    end
})