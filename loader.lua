local API_URL = "http://72.60.1.175/verify"
local SCRIPT_URL = "https://raw.githubusercontent.com/bullys777/bv10/main/main.lua"
local SECRET = "hC61yfvevPkGZxuD2LiP1LfXENMAlKKZ"

local key = _G.key
if not key then pcall(function() key = getgenv and getgenv().key end) end
if not key or key == "" then warn("[bullysprivV10] _G.key not set"); return end

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local P = Players.LocalPlayer
while not P do task.wait() P = Players.LocalPlayer end

local hwid
pcall(function()
    hwid = tostring(P.UserId) .. "_" .. tostring(P.AccountAge) .. "_" .. game:GetService("RbxAnalyticsService"):GetClientId()
end)
if not hwid or hwid == "" then warn("[bullysprivV10] HWID failed"); return end

local executor, jobId, placeId, userName, userId, accountAge
pcall(function() executor = (identifyexecutor and identifyexecutor()) or (getexecutorname and getexecutorname()) or "Unknown" end)
pcall(function() jobId = tostring(game.JobId) end)
pcall(function() placeId = tostring(game.PlaceId) end)
pcall(function() userName = P.Name end)
pcall(function() userId = P.UserId end)
pcall(function() accountAge = P.AccountAge end)

local req = request or http_request or (syn and syn.request) or (http and http.request)
if not req then warn("[bullysprivV10] HTTP not available"); return end

-- Run verify and main-script fetch in parallel — verify gates execution, fetch saves time
local verifyDone, verifyOK, verifyError = false, false, nil
local fetchDone, scriptBody = false, nil

task.spawn(function()
    local ok, resp = pcall(function()
        return req({
            Url = API_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode({
                key = key, hwid = hwid, secret = SECRET,
                executor = executor, username = userName, user_id = userId,
                account_age = accountAge, job_id = jobId, place_id = placeId
            })
        })
    end)
    if not ok then
        verifyError = "Connection failed"
    else
        local b = {}
        pcall(function() b = HttpService:JSONDecode(resp.Body) end)
        if resp.StatusCode == 200 and b.success then
            verifyOK = true
        else
            verifyError = b.error or "Unauthorized"
        end
    end
    verifyDone = true
end)

task.spawn(function()
    pcall(function() scriptBody = game:HttpGet(SCRIPT_URL, true) end)
    fetchDone = true
end)

-- Block on verify result first — this is the security gate
while not verifyDone do task.wait(0.05) end

if not verifyOK then
    P:Kick("BULLYS HUB\n\n" .. (verifyError or "Unauthorized") .. "\n\ndiscord.gg/Bullys")
    return
end

-- Authorized — wait for game to be ready (skipped if already loaded)
if not game:IsLoaded() then game.Loaded:Wait() end

-- Wait for the parallel fetch to finish (usually already done by now)
local timeout = 0
while not fetchDone and timeout < 10 do
    task.wait(0.05)
    timeout = timeout + 0.05
end

if not scriptBody then
    pcall(function() scriptBody = game:HttpGet(SCRIPT_URL, true) end)
end

if not scriptBody then warn("[bullysprivV10] Failed to fetch main script"); return end

local fn, err = loadstring(scriptBody)
if fn then fn() else warn("[bullysprivV10] loadstring failed: " .. tostring(err)) end
