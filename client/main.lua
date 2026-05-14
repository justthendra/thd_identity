local QBCore = exports['qb-core']:GetCoreObject()
local creatingCid = nil

RegisterNetEvent('thd_identity:showRegisterScreen', function(data)
    creatingCid = data and data.cid or 1 -- Slot bilgisini kaydet
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "open_identity"
    })
end)

RegisterNUICallback('register', function(data)
    SetNuiFocus(false, false)
    data.cid = creatingCid -- Server'a gönderirken slot bilgisini ekle
    TriggerServerEvent('thd_identity:server:createCharacter', data)
end)