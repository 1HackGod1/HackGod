local _a=loadstring(game:HttpGet((function()local _b={104,116,116,112,115,58,47,47,103,105,116,104,117,98,46,99,111,109,47,100,97,119,105,100,45,115,99,114,105,112,116,115,47,70,108,117,101,110,116,47,114,101,108,101,97,115,101,115,47,108,97,116,101,115,116,47,100,111,119,110,108,111,97,100,47,109,97,105,110,46,108,117,97} local _c={}for i=1,#_b do _c[i]=string.char(_b[i])end;return table.concat(_c)end)()))()
local _d=_a:CreateWindow({Title="HackGod V.1.0.0",SubTitle="",TabWidth=160,Size=UDim2.fromOffset(580,460),Acrylic=false,Theme="Dark",MinimizeKey=Enum.KeyCode.LeftControl})
local _e={(function()local _f={}local _g="Main"for i=1,#_g do table.insert(_f,string.sub(_g,i,i))end;return table.concat(_f)end)()}=_d:AddTab({Title="Main",Icon="home"})
local _h=setmetatable({},{__index=function(_,k)return {[17625359962]=true}[k]end})
local _i=false
local _j=nil
local _aimbotEnabled=false
local _espEnabled=false
local function toggleButton(state)return state and "On"or"Off"end
_e["Main"]:AddButton({Title="Find Game",Callback=coroutine.wrap(function()
    local _k=game.PlaceId
    local _l=""
    if pcall(function()return _h[_k]end)then
        _l="Connection Successful! ✅"
        if not _i then
            _j=_d:AddTab({Title="Setting",Icon="settings"})
            _i=true
            _j:AddParagraph({Title="Setting Tab",Content=(function()local _m={}local _n="You have entered a rival game!"for i=1,#_n do table.insert(_m,string.sub(_n,i,i))end;return table.concat(_m)end)()})
            _j:AddButton({Title="Aim Bot: Off",Callback=function(btn)
                _aimbotEnabled=not _aimbotEnabled
                btn:SetTitle("Aim Bot: "..toggleButton(_aimbotEnabled))
            end})
            _j:AddButton({Title="ESP: Off",Callback=function(btn)
                _espEnabled=not _espEnabled
                btn:SetTitle("ESP: "..toggleButton(_espEnabled))
                for _,plr in pairs(game.Players:GetPlayers())do
                    if plr~=game.Players.LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")then
                        local part=plr.Character.HumanoidRootPart:FindFirstChild("ESPPart")
                        if _espEnabled then
                            if not part then
                                part=Instance.new("BoxHandleAdornment",plr.Character.HumanoidRootPart)
                                part.Name="ESPPart"
                                part.Adornee=plr.Character.HumanoidRootPart
                                part.AlwaysOnTop=true
                                part.Size=Vector3.new(4,6,1)
                                part.Color3=Color3.new(1,0.5,0)
                                part.Transparency=0.5
                            end
                        else
                            if part then part:Destroy()end
                        end
                    end
                end
            end})
        end
    else
        _l=(function()local _o={}local _p="Games Not Supported ❌"for i=1,#_p do table.insert(_o,string.sub(_p,i,i))end;return table.concat(_o)end)()
    end
    pcall(function()
        _a:Notify({Title="Find Game",Content=_l,Duration=2})
    end)
end)})
pcall(function()
    _a:Notify({Title="HackGod V.1.0.0",Content=(function()local _q={}local _r="Loaded."for i=1,#_r do table.insert(_q,string.sub(_r,i,i))end;return table.concat(_q)end)(),Duration=3})
end)
