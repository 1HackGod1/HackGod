local _0=game:GetService("HttpService")
local _1="https://raw.githubusercontent.com/1HackGod1/HackGod/main/main.lua"
local _2=game:HttpGet(_1)
if not string.find(_2,"HackGod")then error("Unauthorized execution detected.")end
local _3=987654321
local function _4(_5)local _6=0;for _7=1,#_5 do _6=(_6+string.byte(_5,_7)*_7)%1000000007 end;return _6 end
if _4(_2)~=_3 then error("Tampering detected.")end
for _8=1,math.random(1000000,2000000)do local _9=_8*_8 end
local function _a(_b)return _0:Base64Decode(_b)end
local _c="여기에_2중_Base64_문자열_넣을것"
local _d=_a(_c)local _e=_a(_d)
local _f=loadstring(_e)();local _g=_f:CreateWindow({Title="HackGod V.1.0.0",SubTitle="",TabWidth=160,Size=UDim2.fromOffset(580,460),Acrylic=false,Theme="Dark",MinimizeKey=Enum.KeyCode.LeftControl})
local _h={Main=_g:AddTab({Title="Main",Icon="home"})}
local _i={[17625359962]=true}
local _j=false;local _k=nil;local _l=false;local _m=false
_h.Main:AddButton({Title="Find Game",Callback=function()
    local _n=game.PlaceId;local _o=""
    if _i[_n]then _o="Connection Successful! ✅"
        if not _j then _k=_g:AddTab({Title="Setting",Icon="settings"});_j=true
            _k:AddParagraph({Title="Setting Tab",Content="You have entered a rival game!"})
            _k:AddButton({Title="AimBot : OFF",Callback=function(_p)_l=not _l;_p.Title="AimBot : "..(_l and "ON"or"OFF")end})
            _k:AddButton({Title="ESP : OFF",Callback=function(_q)_m=not _m;_q.Title="ESP : "..(_m and"ON"or"OFF")
                if _m then
                    game:GetService("RunService").RenderStepped:Connect(function()
                        for _,_r in pairs(game:GetService("Players"):GetPlayers())do
                            if _r~=game.Players.LocalPlayer and _r.Character and _r.Character:FindFirstChild("HumanoidRootPart")then
                                if not _r.Character:FindFirstChild("ESPBox")then
                                    local _s=Instance.new("BillboardGui",_r.Character.HumanoidRootPart)
                                    _s.Name="ESPBox";_s.Size=UDim2.new(4,0,4,0);_s.AlwaysOnTop=true
                                    local _t=Instance.new("Frame",_s)
                                    _t.Size=UDim2.new(1,0,1,0);_t.BackgroundColor3=Color3.new(1,0.5,0);_t.BackgroundTransparency=0.3
                                end
                            end
                        end
                    end)
                else
                    for _,_r in pairs(game:GetService("Players"):GetPlayers())do
                        if _r.Character and _r.Character:FindFirstChild("HumanoidRootPart")then
                            local _u=_r.Character.HumanoidRootPart:FindFirstChild("ESPBox")
                            if _u then _u:Destroy()end
                        end
                    end
                end
            end})
        end
    else _o="Games Not Supported ❌"end
    _f:Notify({Title="Find Game",Content=_o,Duration=2})
end})
_f:Notify({Title="HackGod V.1.0.0",Content="Loaded.",Duration=3})
