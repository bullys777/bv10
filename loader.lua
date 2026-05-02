local API_URL = "http://72.60.1.175/verify"
local SCRIPT_URL = "https://raw.githubusercontent.com/bullys777/bv10/main/main.lua"
local SECRET = "hC61yfvevPkGZxuD2LiP1LfXENMAlKKZ"

local key = _G.key
if not key then pcall(function() key = getgenv and getgenv().key end) end
if not key or key == "" then warn("[bullysprivV10] _G.key not set"); return end

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Wait only for LocalPlayer (appears early — don't wait for game.Loaded yet)
local P = Players.LocalPlayer
while not P do task.wait() P = Players.LocalPlayer end

-- Build HWID
local hwid
pcall(function()
    hwid = tostring(P.UserId) .. "_" .. tostring(P.AccountAge) .. "_" .. game:GetService("RbxAnalyticsService"):GetClientId()
end)
if not hwid or hwid == "" then warn("[bullysprivV10] HWID failed"); return end

-- Best-effort context for richer logs
local executor, jobId, placeId, userName, userId, accountAge
pcall(function() executor = (identifyexecutor and identifyexecutor()) or (getexecutorname and getexecutorname()) or "Unknown" end)
pcall(function() jobId = tostring(game.JobId) end)
pcall(function() placeId = tostring(game.PlaceId) end)
pcall(function() userName = P.Name end)
pcall(function() userId = P.UserId end)
pcall(function() accountAge = P.AccountAge end)

local req = request or http_request or (syn and syn.request) or (http and http.request)
if not req then warn("[bullysprivV10] HTTP not available"); return end

-- VERIFY FIRST (before game.Loaded — fast feedback, kick early if invalid)
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

if not ok then warn("[bullysprivV10] Connection failed"); return end

local body = {}
pcall(function() body = HttpService:JSONDecode(resp.Body) end)

if resp.StatusCode ~= 200 or not body.success then
    P:Kick("BULLYS HUB\n\n" .. (body.error or "Unauthorized") .. "\n\ndiscord.gg/Bullys")
    return
end

-- Authorized — pre-fetch the main script in parallel with game loading
local scriptBody
task.spawn(function()
    pcall(function() scriptBody = game:HttpGet(SCRIPT_URL, true) end)
end)

-- Wait for game to fully load before executing the main script
if not game:IsLoaded() then game.Loaded:Wait() end

-- Small buffer to let the world settle
task.wait(1)

-- Wait for the pre-fetch to complete if it hasn't
local timeout = 0
while not scriptBody and timeout < 10 do
    task.wait(0.1)
    timeout = timeout + 0.1
end

if not scriptBody then
    -- Fallback: fetch synchronously
    pcall(function() scriptBody = game:HttpGet(SCRIPT_URL, true) end)
end

if not scriptBody then warn("[bullysprivV10] Failed to fetch main script"); return end

local fn, err = loadstring(scriptBody)
if fn then fn() else warn("[bullysprivV10] loadstring failed: " .. tostring(err)) end
