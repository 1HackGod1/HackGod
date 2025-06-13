local rawUrl = "https://raw.githubusercontent.com/1HackGod1/HackGod/main/main.lua"
local response = game:HttpGet(rawUrl)
if not string.find(response, "HackGod") then
    error("Unauthorized execution detected. This script will not run.")
end

local expectedChecksum = 123456789
local function calculateChecksum(str)
    local sum = 0
    for i = 1, #str do
        sum = (sum + string.byte(str, i) * i) % 1000000007
    end
    return sum
end
if calculateChecksum(response) ~= expectedChecksum then
    error("Tampering detected. Stopping execution.")
end

for i = 1, math.random(1000000, 2000000) do
    local a = i * i
end

local HttpService = game:GetService("HttpService")
local function decode_base64(data)
    return HttpService:Base64Decode(data)
end

local encoded_outer = "여기에 base64로 한번 더 감싼 전체 base64 문자열"

local inner_encoded = decode_base64(encoded_outer)
local final_code = decode_base64(inner_encoded)

loadstring(final_code)()
