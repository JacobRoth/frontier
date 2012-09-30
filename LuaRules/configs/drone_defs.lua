local carrierDefs = {}

local carrierDefNames = {
        --[[lengineer = {drone = UnitDefNames.kdroneminerflyer.id, reloadTime = 15, maxDrones = 6, spawnSize = 1, range = 1600, managed=false},
        lbigwalker = {drone = UnitDefNames.lwarrior.id, reloadTime = 10, maxDrones = 6, spawnSize = 2, range = 10, managed=true},
        ktridroneroller = {drone = UnitDefNames.kdroneroller.id, reloadTime = 10, maxDrones = 6, spawnSize = 2, range = 10, managed=true},]]
        {host = UnitDefNames.lbigwalker.id, drone=UnitDefNames.lwarrior.id, reloadTime=10, maxDrones = 6, spawnSize=2, managed=true, hostUnitID = nil, drones = {  }, reload = nil}
}

for name, data in pairs(carrierDefNames) do
        if UnitDefNames[name] then carrierDefs[UnitDefNames[name].id] = data    end
end

return carrierDefs
