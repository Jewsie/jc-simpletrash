local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.Trashcans, {
        options = {
            {
                label = 'Search trashcan',
                icon = 'fas fa-trashcan',
                targeticon = 'fas fa-eye',
                type = 'server',
                event = 'jc-simpletrash:server:searchtrash'
            }
        }
    })
end)

RegisterNetEvent('jc-simpletrash:client:searchtrash')
AddEventHandler('jc-simpletrash:client:searchtrash', function(entity)
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 10000, false)
    QBCore.Functions.Progressbar('searching_trash', 'Searching Trashcan...', 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
        }, {}, {}, {}, function()
            TriggerServerEvent('jc-simpletrash:server:giveitems', entity)
            ClearPedTasks(PlayerPedId())
        end, function()
            ClearPedTasks(PlayerPedId())
    end)
end)
