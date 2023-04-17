if not game:IsLoaded() then game.Loaded:Wait() end


local webhook = "Your webhook here"


local username = tostring(game.Players.localPlayer.Name)
local gameid = tostring(game.PlaceId)
local GameName = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)
local JobID = tostring(game.JobId)


local embed=	{
    ["content"] = "@here",
    ["embeds"] = {{
        ["title"] = "your account joined a game!",
        ["description"] = "",
        ["type"] = "rich",
        ["color"] = tonumber(0x690b9c),
        ["fields"] = {
            {
                ["name"] = "**Username**",
                ["value"] = username,
                ["inline"] = false
            },
            {
                ["name"] = "**Place Name**",
                ["value"] = GameName,
                ["inline"] = false
                            },
            {
                ["name"] = "**Place ID**",
                ["value"] = gameid,
                ["inline"] = false
                            },
            {
                ["name"] = "**Job ID**",
                ["value"] = "```"..JobID.."```",
                ["inline"] = false
            },
        }
    }}
}

syn.request({
    ["Url"] = webhook,
    ["Method"] = "POST",
    ["Headers"] = {
        ["Content-Type"] = "application/json"
    },
    ["Body"] = game.HttpService:JSONEncode(embed)
})