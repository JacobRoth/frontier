-- $Id: unit_carrier_drones.lua 3291 2008-11-25 00:36:20Z licho $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    unit_carrier_drones.lua
--  brief:   Spawns drones for aircraft carriers
--  author:  
--
--  Copyright (C) 2007.
--  Licensed under the terms of the GNU GPL, v2 or later.
--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "CarrierDrones",
    desc      = "Spawns drones for aircraft carriers",
    author    = "TheFatConroller, modified by KingRaptor",
    date      = "12.01.2008",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- SYNCED CODE
if (not gadgetHandler:IsSyncedCode()) then
  return
end


--Speed-ups

local GetUnitPosition   = Spring.GetUnitPosition
local CreateUnit        = Spring.CreateUnit
local AddUnitDamage     = Spring.AddUnitDamage
local GiveOrderToUnit   = Spring.GiveOrderToUnit
local GetCommandQueue   = Spring.GetCommandQueue
local SetUnitPosition   = Spring.SetUnitPosition
local SetUnitNoSelect   = Spring.SetUnitNoSelect
local random            = math.random
local CMD_ATTACK                = CMD.ATTACK

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local carrierDefs = include "LuaRules/Configs/drone_defs.lua"

local DEFAULT_UPDATE_ORDER_FREQUENCY = 60       -- gameframes
local DEFAULT_MAX_DRONE_RANGE = 1500

local carrierList = {}
local droneList = {}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local function InitCarrier(unitDefID, unitAllyID)
        local carrierData = carrierDefs[unitDefID]
        return {unitDefID = unitDefID, unitAllyID = unitAllyID, droneCount = 0, reload = carrierData.reloadTime, drones = {}}
end

local function NewDrone(unitID, unitDefID, droneName)
  local x, y, z = GetUnitPosition(unitID)
  local angle = math.rad(random(1,360))
  local xS = (x + (math.sin(angle) * 20))
  local zS = (z + (math.cos(angle) * 20))
  local droneID = CreateUnit(droneName,x,y,z,1,carrierList[unitID].unitAllyID)
  carrierList[unitID].reload = carrierDefs[unitDefID].reloadTime
  carrierList[unitID].droneCount = (carrierList[unitID].droneCount + 1)
  carrierList[unitID].drones[droneID] = true
 
  SetUnitPosition(droneID, xS, zS, true)
  GiveOrderToUnit(droneID, CMD.MOVE_STATE, { 2 }, {})
  GiveOrderToUnit(droneID, CMD.IDLEMODE, { 0 }, {})
  --GiveOrderToUnit(droneID, CMD.AUTOREPAIRLEVEL, { 3 }, {})
  --GiveOrderToUnit(droneID, CMD.FIGHT,  {(x + (random(0,600) - 300)), 60, (z + (random(0,600) - 300))}, {""})
  --GiveOrderToUnit(droneID, CMD.GUARD, {unitID} , {"shift"})
   
  SetUnitNoSelect(droneID,true)
 
  droneList[droneID] = unitID
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam)
  if (carrierList[unitID]) then
    for droneID in pairs(carrierList[unitID].drones) do
                droneList[droneID] = nil
                AddUnitDamage(droneID,1000)
    end
    carrierList[unitID] = nil
  elseif (droneList[unitID]) then
    local i = droneList[unitID]
        carrierList[i].droneCount = (carrierList[i].droneCount - 1)
        carrierList[i].drones[unitID] = nil
        droneList[unitID] = nil
  end
end

function gadget:UnitFinished(unitID, unitDefID, unitTeam)
  if (carrierDefs[unitDefID]) then
    carrierList[unitID] = InitCarrier(unitDefID, unitTeam)
  end
end

function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
  if (droneList[unitID]) then
        if capture then
                gadget:UnitDestroyed(unitID, unitDefID, oldTeam)
                return true
        end
    return false
  else
    if (carrierList[unitID] ~= nil) then
      gadget:UnitDestroyed(unitID, unitDefID, oldTeam)
      gadget:UnitFinished(unitID, unitDefID, newTeam)
    end    
    return true
  end
end

local function GetDistance(x1, x2, y1, y2)
        return ((x1-x2)^2 + (y1-y2)^2)^0.5
end



function gadget:AllowCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
  --[[if (droneList[unitID] ~= nil) then
    return false
  else
    return true
  end]]
  return true --modified it so that it will allow drones to be controlled by other scripts.
end

--[[
function gadget:UnitCommand(unitID, unitDefID, teamID, cmdID, cmdParams, cmdOptions)
        if (carrierList[unitID]) then
                UpdateCarrierTarget(unitID)
        end
end
]]--

function gadget:GameFrame(n)
  if (((n+1) % 30) < 0.1) then
    for i,_ in pairs(carrierList) do
          local carrier = carrierList[i]
          local carrierDef = carrierDefs[carrier.unitDefID]
      if (carrier.reload > 0) then
        carrier.reload = (carrier.reload - 1)
      elseif (carrier.droneCount < carrierDef.maxDrones) then
                for n=1,carrierDef.spawnSize do
                        if (carrier.droneCount >= carrierDef.maxDrones) then
                                break
                        end
                        NewDrone(i, carrier.unitDefID, carrierDef.drone)
        end
      end
    end
  end
  if ((n % DEFAULT_UPDATE_ORDER_FREQUENCY) < 0.1) then
        for i,_ in pairs(carrierList) do
                --UpdateCarrierTarget(i)
        end
  end
end

--[[
function gadget:Initialize()
        for udid,data in pairs(carrierDefs) do
                if data.weapon then
                        Script.SetWatchWeapon(WeaponDefNames[data.weapon].id)
                end
        end
end

]]
