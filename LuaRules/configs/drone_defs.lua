local carrierDefs = {}

local carrierDefNames = {
        --armcarry = {drone = UnitDefNames.carrydrone.id, reloadTime = 15, maxDrones = 8, spawnSize = 2, range = 1600}, -- this line was from Zero-K
        lengineer = {drone = UnitDefNames.kdroneminerflyer.id, reloadTime = 15, maxDrones = 6, spawnSize = 1, range = 1600, managed=false},
        lbigwalker = {drone = UnitDefNames.lwarrior.id, reloadTime = 10, maxDrones = 6, spawnSize = 2, range = 10, managed=true},
}

for name, data in pairs(carrierDefNames) do
        if UnitDefNames[name] then carrierDefs[UnitDefNames[name].id] = data    end
end

return carrierDefs
