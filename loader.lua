local API_URL = "http://72.60.1.175/verify"
local SCRIPT_URL = "https://raw.githubusercontent.com/bullys777/bv10/main/main.lua"
local SECRET = "hC61yfvevPkGZxuD2LiP1LfXENMAlKKZ"

local key = _G.key
if not key then pcall(function() key = getgenv and getgenv().key end) end
if not key or key == "" then warn("[bullysprivV10] _G.key not set"); return end

local Players = game:GetService("Players")
if not game:IsLoaded() then game.Loaded:Wait() end
local P = Players.LocalPlayer
while not P do task.wait() P = Players.LocalPlayer end

local hwid
pcall(function()
    hwid = tostring(P.UserId) .. "_" .. tostring(P.AccountAge) .. "_" .. game:GetService("RbxAnalyticsService"):GetClientId()
end)
if not hwid or hwid == "" then warn("[bullysprivV10] HWID failed"); return end

local HttpService = game:GetService("HttpService")
local req = request or http_request or (syn and syn.request) or (http and http.request)
if not req then warn("[bullysprivV10] HTTP not available"); return end

local ok, resp = pcall(function()
    return req({
        Url = API_URL,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = HttpService:JSONEncode({ key = key, hwid = hwid, secret = SECRET })
    })
end)

if not ok then warn("[bullysprivV10] Connection failed"); return end

local body = {}
pcall(function() body = HttpService:JSONDecode(resp.Body) end)

if resp.StatusCode ~= 200 or not body.success then
    local LP = game:GetService("Players").LocalPlayer
    if LP then LP:Kick("bullysprivV10\n\n" .. (body.error or "Unauthorized") .. "\n\ndiscord.gg/Bullys") end
    return
end

loadstring(game:HttpGet(SCRIPT_URL, true))()
