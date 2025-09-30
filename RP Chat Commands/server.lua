-- Utility function to send styled chat messages
local function sendChatMessage(source, prefix, msg, color)
    local name = GetPlayerName(source)
    TriggerClientEvent("chat:addMessage", -1, {
        color = color,
        multiline = true,
        args = { prefix .. " " .. name, msg }
    })
end

-- /me (local action)
RegisterCommand("me", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(source, "[ME]", msg, { 200, 150, 255 }) -- purple
end)

-- /gme (global action)
RegisterCommand("gme", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(source, "[GME]", msg, { 128, 0, 128 }) -- darker purple
end)

-- /do (situation/explanation)
RegisterCommand("do", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(source, "[DO]", msg, { 0, 191, 255 }) -- cyan
end)

-- /ad (advertisement)
RegisterCommand("ad", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(source, "[AD]", msg, { 255, 215, 0 }) -- gold
end)

-- /med (medical roleplay)
RegisterCommand("med", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(source, "[MED]", msg, { 220, 20, 60 }) -- red
end)

-- /pol (police roleplay)
RegisterCommand("pol", function(source, args)
    local msg = table.concat(args, " ")
    sendChatMessage(source, "[POL]", msg, { 30, 144, 255 }) -- blue
end)
