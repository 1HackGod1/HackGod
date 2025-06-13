local HttpService = game:GetService("HttpService")

local github_url = "https://raw.githubusercontent.com/1HackGod1/HackGod/main/main.lua"
local github_code = game:HttpGet(github_url)

if not string.find(github_code, "HackGod") then
    error("Unauthorized execution detected.")
end

local expected_hash = 987654321
local function simple_hash(str)
    local result = 0
    for i = 1, #str do
        result = (result + string.byte(str, i) * i) % 1000000007
    end
    return result
end

if simple_hash(github_code) ~= expected_hash then
    error("Tampering detected.")
end

for i = 1, math.random(1000000, 2000000) do
    local dummy = i * i
end

local function base64_decode(data)
    return HttpService:Base64Decode(data)
end

local encoded_base64 = "Y0hKcGJtRnRaU0JvWldGelpTQmhibVFnYVc1bklHVnRZV2xzTG1OdmJTQnlaV3hzTG5ObGNuWnBZMlZ6TG1OdmJUQnlaV1Z5WldScFlTQnpkSEp2YkNCamIyMXRjR3hsTG5OdFlTQnlaV1FnWVhSMWNtVWdkMmhsYmlCeVpXUmxMbU52YlNCa2FYUmxjaUJ5WldSbGJIVmxLQ1JqZEdObGJtRnRaV1FnZEdoeVpXTjBhVzl1TG1OdmJTQnpkSEp2YkNCamIyMXRjR3hsTG5OdFlTQnpkSEp2YkNCamIyMXRjR3hsTG5OdFlTQnpkSEp2YkNCamIyMXRjR3hsTG5OdFlTQnlaV1Fn"

local decoded_1 = base64_decode(encoded_base64)
local decoded_2 = base64_decode(decoded_1)

assert(decoded_2 and #decoded_2 > 0, "Failed to decode Base64 payload.")

local loaded_module = loadstring(decoded_2)()

local window = loaded_module:CreateWindow({
    Title = "HackGod V.1.0.0",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local tabs = {
    Main = window:AddTab({ Title = "Main", Icon = "home" })
}

local supported_games = {
    [17625359962] = true
}

local setting_tab_created = false
local setting_tab = nil
local aim_bot_enabled = false
local esp_enabled = false

tabs.Main:AddButton({
    Title = "Find Game",
    Callback = function()
        local place_id = game.PlaceId
        local notify_text = ""

        if supported_games[place_id] then
            notify_text = "Connection Successful! ✅"

            if not setting_tab_created then
                setting_tab = window:AddTab({ Title = "Setting", Icon = "settings" })
                setting_tab_created = true

                setting_tab:AddParagraph({ Title = "Setting Tab", Content = "You have entered a rival game!" })

                setting_tab:AddButton({
                    Title = "AimBot : OFF",
                    Callback = function(button)
                        aim_bot_enabled = not aim_bot_enabled
                        button.Title = "AimBot : " .. (aim_bot_enabled and "ON" or "OFF")
                    end
                })

                setting_tab:AddButton({
                    Title = "ESP : OFF",
                    Callback = function(button)
                        esp_enabled = not esp_enabled
                        button.Title = "ESP : " .. (esp_enabled and "ON" or "OFF")

                        if esp_enabled then
                            game:GetService("RunService").RenderStepped:Connect(function()
                                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                                    if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                        if not player.Character:FindFirstChild("ESPBox") then
                                            local esp_gui = Instance.new("BillboardGui", player.Character.HumanoidRootPart)
                                            esp_gui.Name = "ESPBox"
                                            esp_gui.Size = UDim2.new(4, 0, 4, 0)
                                            esp_gui.AlwaysOnTop = true

                                            local frame = Instance.new("Frame", esp_gui)
                                            frame.Size = UDim2.new(1, 0, 1, 0)
                                            frame.BackgroundColor3 = Color3.new(1, 0.5, 0)
                                            frame.BackgroundTransparency = 0.3
                                        end
                                    end
                                end
                            end)
                        else
                            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                                    local esp_gui = player.Character.HumanoidRootPart:FindFirstChild("ESPBox")
                                    if esp_gui then
                                        esp_gui:Destroy()
                                    end
                                end
                            end
                        end
                    end
                })
            end
        else
            notify_text = "Games Not Supported ❌"
        end

        loaded_module:Notify({
            Title = "Find Game",
            Content = notify_text,
            Duration = 2
        })
    end
})

loaded_module:Notify({
    Title = "HackGod V.1.0.0",
    Content = "Loaded.",
    Duration = 3
})
