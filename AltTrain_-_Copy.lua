local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local addPowerEvent = game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent

local TrainRate = 0.68
local TrainAmount = 20
local ninTickTime = tick()
local lastNin = TrainAmount


function AntiAfkFunc()
    Players.LocalPlayer.Idled:Connect(function()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

AntiAfkFunc()


local mainRun
mainRun = RunService.Heartbeat:Connect(function()
    if (tick() - ninTickTime) >= TrainRate then
        ninTickTime = tick()
        if lastNin ~= TrainAmount then
            addPowerEvent:FireServer("FromTraining",TrainAmount)
            lastNin = TrainAmount
        else
            addPowerEvent:FireServer("FromTraining",TrainAmount - 0.001)
            lastNin = TrainAmount - 0.001
        end
    end
end)

Players.LocalPlayer.Chatted:Connect(function(msg)
    if msg == ".kill" then
        mainRun:Disconnect()
    elseif msg == ".run" then
        mainRun = RunService.Heartbeat:Connect(function()
            if (tick() - ninTickTime) >= TrainRate then
                ninTickTime = tick()
                if lastNin ~= TrainAmount then
                    addPowerEvent:FireServer("FromTraining",TrainAmount)
                    lastNin = TrainAmount
                else
                    addPowerEvent:FireServer("FromTraining",TrainAmount - 0.001)
                    lastNin = TrainAmount - 0.001
                end
            end
        end)
    end
end)


local help = false

if game.Players.LocalPlayer.Character:FindFirstChild("Train") then
    help = true
end

if help then
    game.Players.LocalPlayer.Character:FindFirstChild("Train").Parent = game.Players.LocalPlayer.Backpack
end

for i,v in pairs(game.Players.LocalPlayer.Backpack.Train:GetChildren()) do
    if v.Name ~= "Handle" then
        v:Destroy()
    end
end

if help then
    game.Players.LocalPlayer.Backpack:FindFirstChild("Train").Parent = game.Players.LocalPlayer.Character
end
