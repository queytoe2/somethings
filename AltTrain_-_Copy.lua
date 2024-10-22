local RunService = game:GetService("RunService")

local TrainRate = 0.68
local TrainAmount = 20
local GuiUpdateRate = 30
local ninTickTime = tick()
local guiTickTime = tick()
local lastNin = TrainAmount

local Players = game:GetService("Players")

function AntiAfkFunc()
    Players.LocalPlayer.Idled:Connect(function()
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end

AntiAfkFunc()

print("Executed anti afk")




-- Gui to Lua
-- Version: 3.2

-- Instances:

local StatGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local MidFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local TotalNin = Instance.new("TextLabel")
local SessionTime = Instance.new("TextLabel")
local TotalTime = Instance.new("TextLabel")
local NinGained = Instance.new("TextLabel")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SecondMainFrame = Instance.new("Frame")
local SecondMidFrame = Instance.new("Frame")
local SecondUIListLayout = Instance.new("UIListLayout")
local NinPerDay = Instance.new("TextLabel")
local AvgNin = Instance.new("TextLabel")
local AvgInterval = Instance.new("TextLabel")
local NinPerSec = Instance.new("TextLabel")
local SecondTopBar = Instance.new("Frame")
local SecondTitle = Instance.new("TextLabel")

--Properties:

StatGui.Name = "StatGui"
StatGui.Parent = game:GetService("CoreGui")
StatGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
StatGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = StatGui
MainFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.BackgroundTransparency = 1.000
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Position = UDim2.new(0.0110202646, 0, 0.356649399, 0)
MainFrame.Size = UDim2.new(0.115653209, 0, 0.241796196, 0)

MidFrame.Name = "MidFrame"
MidFrame.Parent = MainFrame
MidFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MidFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MidFrame.BorderSizePixel = 0
MidFrame.Position = UDim2.new(0, 0, 0.107000001, 0)
MidFrame.Size = UDim2.new(1, 0, 0.892857134, 0)

UIListLayout.Parent = MidFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

TotalNin.Name = "TotalNin"
TotalNin.Parent = MidFrame
TotalNin.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
TotalNin.BorderColor3 = Color3.fromRGB(0, 0, 0)
TotalNin.LayoutOrder = 3
TotalNin.Position = UDim2.new(0, 0, 0.74845165, 0)
TotalNin.Size = UDim2.new(1, 0, 0.249484003, 0)
TotalNin.Font = Enum.Font.Fantasy
TotalNin.Text = "0"
TotalNin.TextColor3 = Color3.fromRGB(255, 255, 255)
TotalNin.TextScaled = true
TotalNin.TextSize = 14.000
TotalNin.TextWrapped = true

SessionTime.Name = "SessionTime"
SessionTime.Parent = MidFrame
SessionTime.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SessionTime.BorderColor3 = Color3.fromRGB(0, 0, 0)
SessionTime.Position = UDim2.new(0, 0, -1.22070318e-07, 0)
SessionTime.Size = UDim2.new(1, 0, 0.249483943, 0)
SessionTime.Font = Enum.Font.Fantasy
SessionTime.Text = "00:00:00"
SessionTime.TextColor3 = Color3.fromRGB(255, 255, 255)
SessionTime.TextScaled = true
SessionTime.TextSize = 14.000
SessionTime.TextWrapped = true

TotalTime.Name = "TotalTime"
TotalTime.Parent = MidFrame
TotalTime.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
TotalTime.BorderColor3 = Color3.fromRGB(0, 0, 0)
TotalTime.LayoutOrder = 1
TotalTime.Position = UDim2.new(0, 0, 0.249484137, 0)
TotalTime.Size = UDim2.new(1, 0, 0.249483943, 0)
TotalTime.Font = Enum.Font.Fantasy
TotalTime.Text = "00:00:00"
TotalTime.TextColor3 = Color3.fromRGB(255, 255, 255)
TotalTime.TextScaled = true
TotalTime.TextSize = 14.000
TotalTime.TextWrapped = true

NinGained.Name = "NinGained"
NinGained.Parent = MidFrame
NinGained.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
NinGained.BorderColor3 = Color3.fromRGB(0, 0, 0)
NinGained.LayoutOrder = 2
NinGained.Position = UDim2.new(0, 0, 0.498967767, 0)
NinGained.Size = UDim2.new(1, 0, 0.249483883, 0)
NinGained.Font = Enum.Font.Fantasy
NinGained.Text = "0"
NinGained.TextColor3 = Color3.fromRGB(255, 255, 255)
NinGained.TextScaled = true
NinGained.TextSize = 14.000
NinGained.TextWrapped = true

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopBar.Size = UDim2.new(1, 0, 0.107000001, 0)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Font = Enum.Font.Fantasy
Title.Text = "Stats"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

SecondMainFrame.Name = "SecondMainFrame"
SecondMainFrame.Parent = StatGui
SecondMainFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
SecondMainFrame.BackgroundTransparency = 1.000
SecondMainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
SecondMainFrame.Position = UDim2.new(0.150999993, 0, 0.356999993, 0)
SecondMainFrame.Size = UDim2.new(0.115653209, 0, 0.241796196, 0)

SecondMidFrame.Name = "SecondMidFrame"
SecondMidFrame.Parent = SecondMainFrame
SecondMidFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SecondMidFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
SecondMidFrame.BorderSizePixel = 0
SecondMidFrame.Position = UDim2.new(0, 0, 0.107000001, 0)
SecondMidFrame.Size = UDim2.new(1, 0, 0.892857134, 0)

SecondUIListLayout.Name = "SecondUIListLayout"
SecondUIListLayout.Parent = SecondMidFrame
SecondUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

NinPerDay.Name = "NinPerDay"
NinPerDay.Parent = SecondMidFrame
NinPerDay.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
NinPerDay.BorderColor3 = Color3.fromRGB(0, 0, 0)
NinPerDay.LayoutOrder = 3
NinPerDay.Position = UDim2.new(0, 0, 0.74845165, 0)
NinPerDay.Size = UDim2.new(1, 0, 0.249484003, 0)
NinPerDay.Font = Enum.Font.Fantasy
NinPerDay.Text = "Calculating.."
NinPerDay.TextColor3 = Color3.fromRGB(255, 255, 255)
NinPerDay.TextScaled = true
NinPerDay.TextSize = 14.000
NinPerDay.TextWrapped = true

AvgNin.Name = "AvgNin"
AvgNin.Parent = SecondMidFrame
AvgNin.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
AvgNin.BorderColor3 = Color3.fromRGB(0, 0, 0)
AvgNin.Position = UDim2.new(0, 0, -1.22070318e-07, 0)
AvgNin.Size = UDim2.new(1, 0, 0.249483943, 0)
AvgNin.Font = Enum.Font.Fantasy
AvgNin.Text = "Calculating.."
AvgNin.TextColor3 = Color3.fromRGB(255, 255, 255)
AvgNin.TextScaled = true
AvgNin.TextSize = 14.000
AvgNin.TextWrapped = true

AvgInterval.Name = "AvgInterval"
AvgInterval.Parent = SecondMidFrame
AvgInterval.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
AvgInterval.BorderColor3 = Color3.fromRGB(0, 0, 0)
AvgInterval.LayoutOrder = 1
AvgInterval.Position = UDim2.new(0, 0, 0.249484137, 0)
AvgInterval.Size = UDim2.new(1, 0, 0.249483943, 0)
AvgInterval.Font = Enum.Font.Fantasy
AvgInterval.Text = "Calculating.."
AvgInterval.TextColor3 = Color3.fromRGB(255, 255, 255)
AvgInterval.TextScaled = true
AvgInterval.TextSize = 14.000
AvgInterval.TextWrapped = true

NinPerSec.Name = "NinPerSec"
NinPerSec.Parent = SecondMidFrame
NinPerSec.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
NinPerSec.BorderColor3 = Color3.fromRGB(0, 0, 0)
NinPerSec.LayoutOrder = 2
NinPerSec.Position = UDim2.new(0, 0, 0.498967767, 0)
NinPerSec.Size = UDim2.new(1, 0, 0.249483883, 0)
NinPerSec.Font = Enum.Font.Fantasy
NinPerSec.Text = "Calculating.."
NinPerSec.TextColor3 = Color3.fromRGB(255, 255, 255)
NinPerSec.TextScaled = true
NinPerSec.TextSize = 14.000
NinPerSec.TextWrapped = true

SecondTopBar.Name = "SecondTopBar"
SecondTopBar.Parent = SecondMainFrame
SecondTopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SecondTopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
SecondTopBar.Size = UDim2.new(1, 0, 0.107000001, 0)

SecondTitle.Name = "SecondTitle"
SecondTitle.Parent = SecondTopBar
SecondTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SecondTitle.BackgroundTransparency = 1.000
SecondTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
SecondTitle.BorderSizePixel = 0
SecondTitle.Size = UDim2.new(1, 0, 1, 0)
SecondTitle.Font = Enum.Font.Fantasy
SecondTitle.Text = "Specs"
SecondTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SecondTitle.TextScaled = true
SecondTitle.TextSize = 14.000
SecondTitle.TextWrapped = true


local totalTime = 0
local sessionNin = 0
local lastVal = game.Players.LocalPlayer.leaderstats.Ninjutsu.Value
local filename = "Ninja_Assassin_Stats.txt"
local numOfTimes = 0
local currentTime = tick()
local totalInterval = 0
local avgInterval = 0
local avgNin = 0


local function comma_value(n)
    if tonumber(n) then
    	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
    	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
    else
        return n
    end
end

local function TimeFormat(Int)
	return string.format("%02i", Int)
end

local function convertToDHM(value)
    local minutes = math.floor(value / 60)
    local hours = math.floor((value / 60) / 60)
    local days = math.floor(((value / 60) / 60) / 24)
    minutes = minutes - (hours * 60)
    hours = hours - (days * 24)
	return TimeFormat(days)..":"..TimeFormat(hours)..":"..TimeFormat(minutes)
end

function loadSettings()
    local httpservice = game:GetService("HttpService")
    if (readfile and isfile and isfile(filename)) then
        local savedTime = httpservice:JSONDecode(readfile(filename))
        totalTime = savedTime
    end
end

function saveSettings()
    local httpservice = game:GetService("HttpService")
    if (writefile) then
        writefile(filename,httpservice:JSONEncode(totalTime + workspace.DistributedGameTime))
    end
end

loadSettings()

local function Roundf(n)
    n = string.format("%.3f", n)
    return(tostring(n))
end

game.Players.LocalPlayer.leaderstats.Ninjutsu:GetPropertyChangedSignal("Value"):Connect(function()
    numOfTimes += 1
    local ninVar = game.Players.LocalPlayer.leaderstats.Ninjutsu.Value - lastVal
    lastVal = game.Players.LocalPlayer.leaderstats.Ninjutsu.Value
    sessionNin += ninVar
    local interval = tick() - currentTime
    currentTime = tick()
    totalInterval += interval
    avgInterval = totalInterval / numOfTimes
    avgNin = sessionNin / numOfTimes
end)

game.Players.PlayerRemoving:Connect(function()
    saveSettings()
end)


RunService.Heartbeat:Connect(function()
    if (tick() - tickTime) >= TrainRate then
        tickTime = tick()
        if lastNin ~= TrainAmount then
            game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",TrainAmount)
            lastNin = TrainAmount
        else
            game:GetService("ReplicatedStorage").RemoteEvent.AddPowerEvent:FireServer("FromTraining",TrainAmount - 0.001)
            lastNin = TrainAmount - 0.001
        end
        local tempTime = totalTime + workspace.DistributedGameTime
        SessionTime.Text = convertToDHM(workspace.DistributedGameTime)
        TotalTime.Text = convertToDHM(tempTime)
        NinGained.Text = comma_value(sessionNin)
        TotalNin.Text = comma_value(game.Players.LocalPlayer.leaderstats.Ninjutsu.Value)
    end
    if (tick() - guiTickTime) >= GuiUpdateRate then
        guiTickTime = tick()
        AvgNin.Text = Roundf(avgNin)
        AvgInterval.Text = Roundf(avgInterval)
        NinPerSec.Text = Roundf(avgNin / avgInterval)
        NinPerDay.Text = comma_value(math.round((avgNin / avgInterval) * 60 * 60 * 24))
    end
end)

print("Executed AltTrain")




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
