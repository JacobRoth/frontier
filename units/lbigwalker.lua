local lbigwalker = {
    name                = [[Drone Walker]],
    description         = [[Fires a powerful beam of Anti-Unit plasma. Can Burrow.]],
    acceleration        = 1,
    brakerate           = 0.1,
    buildpic            = [[lwarrior.png]],
    buildCostEnergy     = 300,
    buildCostMetal      = 300,
    buildTime           = 100,
    buildDistance       = 300,
    builder             = true,
    buildoptions        = {
        [[lwarrior]],
        [[lengineer]],
        [[kdroneminerflyer]],
    },

    CanAttack           = true,
    canAssist           = true,
    canGuard            = true,
    canMove             = true,
    canPatrol           = true,
    canReclaim          = true,
    canStop             = true,
    category            = [[LAND]],
    corpse              = [[DEAD]],
    customParams = { is_dropoff=true,   },
    reclaimable         = false,
    
    cloakCost           = 2,
    cloakCostMoving     = 2,
    cloakTimeout        = 0,
    init_Cloaked        = false,    
    
    energyMake          = 30,
    explodeAs           = [[DRONE_GROUND_UNIT]],
    footprintx          = 14,
    footprintZ          = 14,
    idleAutoHeal        = 1,
    leaveTracks         = false,
    mass                = 800,
    maxDamage           = 700,
    maxSlope            = 99999999,
    maxVelocity         = 3,
    maxWaterDepth       = 10000,
    metalMake           = 0,
    movementClass       = [[kdrone]],
    noChaseCategory     = [[MINERALS FIXEDWING GUNSHIP CRUISER SUB]],
    objectName          = "lbigwalker.s3o",
    onoffable           = false,
    seismicSignature    = 4,
    selfDestructAs      = [[DRONE_GROUND_UNIT]],
    side                = [[Drone]],
    sightDistance       = 1000,
    
    sfxtypes            = {
        explosiongenerators = {
        "custom:ct_dirt",
        },
    },  
    
    sounds          = {
          select = {
        "golgotha/vehicle_done_44khz",
        },
          ok = {
        "golgotha/vehicle_done_44khz",
        },
      },

    smoothAnim          = true,
    terraformSpeed      = 300,
    reclaimSpeed        = 300,
    repairSpeed         = 0.5,  
    turnInPlace         = 1,
    turnRate            = 1000,
    showNanospray       = 1,
    Resurrectspeed      = 100,
    workerTime          = 1,
    script              = "lbigwalker.lua",

    weapons             = {
        {
            def = [[Shield]],
        },
    },
        
    weaponDefs          = {
            
        Shield = {
            name                    = [[Energy Shield]],
            craterMult              = 0,
        
            damage                  = {
                default = 10,
            },
        
            exteriorShield          = true,
            impulseFactor           = 0,
            interceptedByShieldType = 1,
            isShield                = true,
            shieldAlpha             = 1,
            shieldBadColor          = [[1 0 0]],
            shieldGoodColor         = [[0 1 1]],
            shieldforce             = 10,
            shieldInterceptType     = 1,
            shieldPower             = 800,
            shieldPowerRegen        = 5,
            shieldPowerRegenEnergy  = 15,
            shieldRadius            = 420,
            shieldRepulser          = true,
            smartShield             = true,
            visibleShield           = true,
            visibleShieldHitFrames  = 4,
            visibleShieldRepulse    = true,
            weaponType              = [[Shield]],
        },
        
    },
    
    featureDefs         = {
    
    
    
        DEAD = {
          description      = [[Debris - Drone Warrior]],
          blocking         = false,
          category         = [[heaps]],
          damage           = 2,
          energy           = 0,
          footprintX       = 8,
          footprintZ       = 8,
          metal            = 75,
          object           = [[b8x8heap.s3o]],
          reclaimable      = true,
          reclaimTime      = 2250,
        },

      },

    }


return lowerkeys({ ["lbigwalker"] = lbigwalker })
