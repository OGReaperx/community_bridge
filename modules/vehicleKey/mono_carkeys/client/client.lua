if GetResourceState('mono_carkeys') ~= 'started' or (BridgeClientConfig.VehicleKey ~= "mono_carkeys" and BridgeClientConfig.VehicleKey ~= "auto") then return end

VehicleKey = VehicleKey or {}
VehicleKey.GiveKeys = function(vehicle, plate)
    if type(plate) ~= 'string' then return end
    TriggerServerEvent('mono_carkeys:CreateKey', plate)
end

VehicleKey.RemoveKeys = function(vehicle, plate)
    if type(plate) ~= 'string' then return end
    TriggerServerEvent('mono_carkeys:DeleteKey', 1, plate)
end
