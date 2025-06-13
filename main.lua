local _a=game:GetService("HttpService")
local _b="https://raw.githubusercontent.com/1HackGod1/HackGod/main/main.lua"
local _c=game:HttpGet(_b)
if not string.find(_c,"HackGod")then error("Unauthorized execution detected.")end
local _d=123456789
local function _e(_f)local _g=0;for _h=1,#_f do _g=(_g+string.byte(_f,_h)*_h)%1000000007 end;return _g end
if _e(_c)~=_d then error("Tampering detected.")end
for _i=1,math.random(1000000,2000000)do local _j=_i*_i end
local function _k(_l)return _a:Base64Decode(_l)end
local _m="여기에 base64로 한번 더 감싼 전체 base64 문자열"
local _n=_k(_m)
local _o=_k(_n)
loadstring(_o)()

local _p=false
local _q=false
local _r={}

_j:AddToggle({
    Title="Aim Bot",
    Default=_p,
    Callback=function(_s)
        _p=_s
        _a:Notify({
            Title="Aim Bot",
            Content=_p and "Aim Bot: ON ✅"or"Aim Bot: OFF ❌",
            Duration=2
        })
    end
})

_j:AddToggle({
    Title="ESP",
    Default=_q,
    Callback=function(_t)
        _q=_t
        _a:Notify({
            Title="ESP",
            Content=_q and "ESP: ON ✅"or"ESP: OFF ❌",
            Duration=2
        })
        for _,v in pairs(_r)do pcall(function()v:Destroy()end)end
        table.clear(_r)
        if _q then
            for _,plr in pairs(game:GetService("Players"):GetPlayers())do
                if plr~=game:GetService("Players").LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")then
                    local box=Instance.new("BoxHandleAdornment")
                    box.Adornee=plr.Character.HumanoidRootPart
                    box.Size=Vector3.new(2,3,1)
                    box.Color3=Color3.fromRGB(255,127,39)
                    box.Transparency=0.5
                    box.AlwaysOnTop=true
                    box.ZIndex=10
                    box.Parent=game:GetService("CoreGui")
                    table.insert(_r,box)
                end
            end
        end
    end
})
