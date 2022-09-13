if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Prison Life", "Sentinel")

    -- MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")

    MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47", "Riot Shield", "M4A1"}, function(v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)

    MainSection:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.000001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true
        end
    end)

    MainSection:NewButton("Get all gamepasses", "Unlocks all gamepasses", function()
        game.Players.LocalPlayer.UserId = "53537032"
    end)

    -- PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")

    PlayerSection:NewSlider("Walkspeed", "Changes the walkspeed", 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    PlayerSection:NewSlider("Jumppower", "Changes the jumppower", 250, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)

    PlayerSection:NewButton("Noclip", "Makes you go through walls", function()
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end)

    PlayerSection:NewButton("Make criminal", "Makes you a criminal", function()
        local Player = game:GetService("Players").LocalPlayer
        if Player then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(-919, 96, 2138)
            print("Crimmed "..Player.Name.."Successfully")
        else
            print("No player found")
        end
    end)

    PlayerSection:NewTextBox("Teleport", "Teleport to player", function(txt)
        local playerToTP = game:GetService("Players"):FindFirstChild(txt)
        if playerToTP then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = playerToTP.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
        else
            print("Player not found")
        end
    end)
end
