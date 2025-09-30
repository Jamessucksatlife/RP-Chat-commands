-- Utility function to send styled chat messages
local function sendChatMessage(target, source, prefix, msg, color)
    local name = GetPlayerName(source)
    TriggerClientEvent("chat:addMessage", target, {
        color = color,
        multiline = true,
        args = { prefix .. " " .. name, msg }
    })
end

-- Function to send local messages
local function sendLocalMessage(source, prefix, msg, color, range)
    local srcPed = GetPlayerPed(source)
    local srcCoords = GetEntityCoords(srcPed)

    for _, playerId in ipairs(GetPlayers()) do
        local targetPed = GetPlayerPed(playerId)
        local targetCoords = GetEntityCoords(targetPed)

        if #(srcCoords - targetCoords) <= range then
            sendChatMessage(playerId, source, prefix, msg, color)
        end
    end
end

-- /me (local action) - light green
RegisterCommand("me", function(source, args)
    local msg = table.concat(args, " ")
    sendLocalMessage(source, "[ME]", msg, { 69, 206, 162 }, 20.0) -- 20 units range
end)

-- /gme (global action) - dark green
RegisterCommand("gme", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(-1, source, "[GME]", msg, { 102, 204, 0 }) -- global
end)

-- /do (situation/explanation) - dark blue
RegisterCommand("do", function(source, args)
    local msg = table.concat(args, " ")
    sendLocalMessage(source, "[DO]", msg, { 51, 51, 255 }, 20.0) -- 20 units range
end)

-- /ad (advertisement) - gold
RegisterCommand("ad", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(-1, source, "[AD]", msg, { 255, 215, 0 }) -- global
end)

-- /med (medical roleplay) - red
RegisterCommand("med", function(source, args)
    local msg = table.concat(args, " ")
    sendLocalMessage(source, "[MED]", msg, { 220, 20, 60 }, 20.0) -- 20 units range

-- /pol (police roleplay) - blue
RegisterCommand("pol", function(source, args)
    local msg = table.concat(args, " ")
    sendLocalMessage(source, "[POL]", msg, { 30, 144, 255 }, 20.0) -- 20 units range

-- /ooc (out of character) - orange
RegisterCommand("ooc", function(source, args)
    local msg = table.concat(args, " ")
    sendLocalMessage(source, "[OOC]", msg, { 255, 128, 0 }, 20.0) -- 20 units range
