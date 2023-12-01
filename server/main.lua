local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('jc-simpletrash:server:giveitems')
AddEventHandler('jc-simpletrash:server:giveitems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)

    if chance <= Config.LowChancePercentage then
        for i = 1, Config.LowChanceItemAmount do
            local item = Config.ItemsToFind[math.random(1, #Config.ItemsToFind)]

            Player.Functions.AddItem(item, Config.LowChanceCount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
        end
    elseif chance <= Config.MediumChancePercentage and chance > Config.LowChancePercentage then
        for i = 1, Config.MediumChanceItemAmount do
            local item = Config.ItemsToFind[math.random(1, #Config.ItemsToFind)]

            Player.Functions.AddItem(item, Config.MediumChanceCount)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
        end
    elseif chance > Config.MediumChanceCount and chance <= Config.HighChancePercentage then
        local item = Config.ItemsToFind[math.random(1, #Config.ItemsToFind)]

        Player.Functions.AddItem(item, Config.HighChanceCount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
    else
        QBCore.Functions.Notify(src, 'You didn\'t find anything in this trashcan!', 'error', 3000)
    end
end)