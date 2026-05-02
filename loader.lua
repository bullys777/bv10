local API_URL = "http://72.60.1.175/verify"
local SCRIPT_URL = "https://raw.githubusercontent.com/bullys777/bv10/main/main.lua"
local SECRET = "hC61yfvevPkGZxuD2LiP1LfXENMAlKKZ"

local ALLOWED_PLACES = { 109983668079237 }  -- Steal a Brainrot

local key = _G.key or (getgenv and getgenv().key)
if not key or key == "" then return warn("[bullys] _G.key not set") end

if not table.find(ALLOWED_PLACES, game.PlaceId) then
    return warn("[bullys] not allowed in this game (PlaceId " .. tostring(game.PlaceId) .. ")")
end

local Players = game:GetService("Players")
local Http = game:GetService("HttpService")

local P = Players.LocalPlayer
while not P do task.wait() P = Players.LocalPlayer end

local hwidOk, hwid = pcall(function()
    return P.UserId .. "_" .. P.AccountAge .. "_" .. game:GetService("RbxAnalyticsService"):GetClientId()
end)
if not hwidOk or not hwid or hwid == "" then return warn("[bullys] HWID failed") end

local ctx = { executor = "Unknown" }
pcall(function()
    ctx.executor = (identifyexecutor and identifyexecutor()) or (getexecutorname and getexecutorname()) or "Unknown"
    ctx.username = P.Name
    ctx.user_id = P.UserId
    ctx.account_age = P.AccountAge
    ctx.job_id = tostring(game.JobId)
    ctx.place_id = tostring(game.PlaceId)
end)

local httpRequest = request or http_request or (syn and syn.request) or (http and http.request)
if not httpRequest then return warn("[bullys] HTTP not available") end

local payload = Http:JSONEncode({
    key = key, hwid = hwid, secret = SECRET,
    executor = ctx.executor, username = ctx.username, user_id = ctx.user_id,
    account_age = ctx.account_age, job_id = ctx.job_id, place_id = ctx.place_id
})

-- Verify (security gate) and fetch run in parallel
local verify, body = nil, nil

task.spawn(function()
    local ok, resp = pcall(httpRequest, {
        Url = API_URL, Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = payload
    })
    if not ok then verify = { ok = false, err = "Connection failed" } return end
    local b = {}
    pcall(function() b = Http:JSONDecode(resp.Body) end)
    verify = (resp.StatusCode == 200 and b.success)
        and { ok = true }
        or { ok = false, err = b.error or "Unauthorized" }
end)

task.spawn(function()
    pcall(function() body = game:HttpGet(SCRIPT_URL, true) end)
    if not body then pcall(function() body = game:HttpGet(SCRIPT_URL, true) end) end
end)

while not verify do task.wait() end
if not verify.ok then
    P:Kick("BULLYS HUB\n\n" .. verify.err .. "\n\ndiscord.gg/Bullys")
    return
end

if not game:IsLoaded() then game.Loaded:Wait() end

local deadline = os.clock() + 10
while not body and os.clock() < deadline do task.wait() end
if not body then return warn("[bullys] Failed to fetch main script") end

local fn, err = loadstring(body)
if fn then fn() else warn("[bullys] loadstring failed: " .. tostring(err)) end
