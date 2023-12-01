local QBCore = exports['qb-core']:GetCoreObject()

local trashData = {}
local hasSearched = false

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.Trashcans, {
        options = {
            {
                label = 'Search trashcan',
                icon = 'fas fa-trashcan',
                targeticon = 'fas fa-eye',
                type = 'client',
                event = 'jc-simpletrash:client:searchtrash'
            }
        }
    })
end)

RegisterNetEvent('jc-simpletrash:client:searchtrash')
AddEventHandler('jc-simpletrash:client:searchtrash', function(data)
    local trashID = tostring(data.entity)

    if not trashData[trashID] then
        trashData[trashID] = {hasSearched = false}
    end

    if trashData[trashID].hasSearched then
        QBCore.Functions.Notify('You have already searched this trashcan!', 'error', 3000)
    else
        TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 10000, false)
        QBCore.Functions.Progressbar('searching_trash', 'Searching Trashcan...', 10000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, function()
                TriggerServerEvent('jc-simpletrash:server:giveitems')
                trashData[trashID].hasSearched = true

                Wait(Config.SearchCooldownTimer * 1000)
                trashData[trashID].hasSearched = false
            end, function()
                -- This code runs if the progress bar gets cancelled
        end)
    end
end)