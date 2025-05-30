local resourceName = "okokGasStation"
local configValue = BridgeClientConfig.Fuel
if (configValue == "auto" and GetResourceState(resourceName) ~= "started") or (configValue ~= "auto" and configValue ~= resourceName) then return end
--print("Fuel: Loading okokGasStation")
Fuel = Fuel or {}

Fuel.GetFuel = function(vehicle)
    if not DoesEntityExist(vehicle) then return 0.0 end
    return exports['okokGasStation']:GetFuel(vehicle)
end

Fuel.SetFuel = function(vehicle, fuel, type)
    if not DoesEntityExist(vehicle) then return end
    return exports['okokGasStation']:SetFuel(vehicle, fuel)
end