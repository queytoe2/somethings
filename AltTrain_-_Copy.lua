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


local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass('Terrain')
Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
settings().Rendering.QualityLevel = 1
for i,v in pairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    end
end
for i,v in pairs(Lighting:GetDescendants()) do
    if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
        v.Enabled = false
    end
end
workspace.DescendantAdded:Connect(function(child)
    task.spawn(function()
        if child:IsA('ForceField') then
            RunService.Heartbeat:Wait()
            child:Destroy()
        elseif child:IsA('Sparkles') then
            RunService.Heartbeat:Wait()
            child:Destroy()
        elseif child:IsA('Smoke') or child:IsA('Fire') then
            RunService.Heartbeat:Wait()
            child:Destroy()
        end
    end)
end)
