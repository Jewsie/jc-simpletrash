local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.Trashcans, {
        options = {
            {
                label = 'Search trashcan',
                icon = 'fas fa-trashcan',
                targeticon = 'fas fa-eye',
                action = function()
                    local playerPos = GetEntityCoords(PlayerPedId())
                    local closestTrashcan = 0

                    for _, binModel in pairs(Config.Trashcans) do
                        closestTrashcan = GetClosestObjectOfType(playerPos.x, playerPos.y, playerPos.z, 1.0, GetHashKey(binModel), false, false, false)
                        
                        if closestTrashcan ~= 0 then
                            break
                        end
                    end

                    if closestTrashcan ~= 0 then
                        local binPos = GetEntityCoords(closestTrashcan)
                        TriggerServerEvent('jc-simpletrash:server:searchtrash', binPos)
                    else
                        print("No trashcan found nearby.")
                    end
                end
            }
        }
    })
end)

RegisterNetEvent('jc-simpletrash:client:searchtrash')
AddEventHandler('jc-simpletrash:client:searchtrash', function(binPosition)
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 10000, false)
    QBCore.Functions.Progressbar('searching_trash', 'Searching Trashcan...', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {}, {}, {}, function()
            TriggerServerEvent('jc-simpletrash:server:giveitems', binPosition)
            ClearPedTasks(PlayerPedId())
        end, function()
            ClearPedTasks(PlayerPedId())
    end)
end)
