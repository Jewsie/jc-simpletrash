local QBCore = exports['qb-core']:GetCoreObject()
local trashSearched = {}

RegisterNetEvent('jc-trash:server:initialize', function(key, items)
    for i, v in pairs(items) do
        if not v.slot then
            v.slot = i
        end
    end

    if not trashSearched[key] then
        trashSearched[key] = items
    end

    MySQL.query('SELECT `items` FROM `stashitems` WHERE `stash` = ?', {key}, function(response)
        if response and #response > 0 then
            for i = 1, #response do
                local row = response[i]
                local dbItems = json.decode(row.items)
                dbItems = items
                MySQL.update.await('UPDATE stashitems SET items = ? WHERE stash = ?', {json.encode(dbItems), key})
            end
        else
            MySQL.insert.await('INSERT INTO `stashitems` (stash, items) VALUES (?, ?)', {key, json.encode(items)})
        end
    end)

    Wait(30 * 60000)
    trashSearched[key] = nil
end)