test

local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.Trashcans, {
        options = {
            {
                label = 'Search trashcan',
                icon = 'fas fa-trashcan',
                targeticon = 'fas fa-eye',
                action = function(entity)
                    local net_ent = ObjToNet(entity)

                    QBCore.Functions.TriggerCallback('jc-trash:getData', function(data)
                        if data then
                            if #data > 0 then
                                if Config.QBVersion == 'oldqb' then
                                    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'dumpster_' .. net_ent, {
                                        maxweight = 1000000,
                                        slots = 30,
                                    })
                                    TriggerEvent('inventory:client:SetCurrentStash', 'dumpster_' .. net_ent)
                                else
                                    TriggerServerEvent('simpletrash:server:openInventory', net_ent, 1000000, 30)
                                end
                            else
                                QBCore.Functions.Notify('Trash is empty!', 'error', 3000)
                            end
                        else
                            local tableData = {}
                            for i = 1, Config.AmountToFind do
                                local item = Config.ItemsToFind[math.random(1, #Config.ItemsToFind)]
                                local chance = math.random(1, 100)

                                while chance > item.chance do
                                    Wait(1)
                                    item = Config.ItemsToFind[math.random(1, #Config.ItemsToFind)]
                                end
                                tableData[#tableData + 1] = item
                                TriggerServerEvent('jc-trash:server:initialize', 'dumpster_' .. net_ent, tableData)
                                Wait(500)
                                if Config.QBVersion == 'oldqb' then
                                    TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'dumpster_' .. net_ent, {
                                        maxweight = 1000000,
                                        slots = 30,
                                    })
                                    TriggerEvent('inventory:client:SetCurrentStash', 'dumpster_' .. net_ent)
                                else
                                    TriggerServerEvent('qb-inventory:server:OpenInventory', 'stash', 'dumpster_' .. net_ent, {
                                        maxweight = 1000000,
                                        slots = 30,
                                    })
                                    TriggerEvent('qb-inventory:client:SetCurrentStash', 'dumpster_' .. net_ent)
                                end
                            end
                        end
                    end, 'dumpster_' .. net_ent)
                end
            }
        }
    })
end)