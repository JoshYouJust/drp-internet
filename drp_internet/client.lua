local display = false

RegisterNUICallback("exit", function(data)
    NuiStatus(false)
end)

RegisterCommand("nui", function()
    NuiStatus(not display)
end)

RegisterCommand("of", function()
    NuiStatus(false)
end)

Citizen.CreateThread(function()
    while display do
        DisableAllMovement(true)
    end
end)


function DisableAllMovement(status)
    Citizen.Wait(1)
    DisableControlAction(0, 1, status)
    DisableControlAction(0, 2, status)
    DisableControlAction(0, 142, status)
    DisableControlAction(0, 18, status)
    DisableControlAction(0, 322, status)
    DisableControlAction(0, 106, status)
    DisableControlAction(0, 32, status)
    DisableControlAction(0, 34, status)
    DisableControlAction(0, 33, status)
    DisableControlAction(0, 39, status)
end

function NuiStatus(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

