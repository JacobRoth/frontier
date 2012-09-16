    unitDef = {
      unitname            = [[lsiegebreaker]],
      name                = [[Seige Breaker]],
      description         = [[Ultimate Assault Tank]],
      acceleration        = 1,
      brakeRate           = 0.1,
      buildCostEnergy     = 5000,
      buildCostMetal      = 5000,
      buildPic            = [[lsiegebreaker.png]],
      buildTime           = 200,
      canAttack           = true,
      canGuard            = true,
      canMove             = true,
      canPatrol           = true,
      canStop             = true,
      category            = [[LAND]],
      corpse              = [[DEAD]],
      reclaimable         = false,
      explodeAs           = [[DRONE_GROUND_UNIT]],
      footprintx          = 30,
      footprintZ          = 30,
      highTrajectory      = 2,
      idleAutoHeal        = 0,
      leaveTracks         = true,
      mass                = 900,
      maxDamage           = 10000,
      maxSlope            = 18,
      maxVelocity         = 2,
      maxWaterDepth       = 22,
      movementClass       = [[TANK3x3]],
      moveState           = 0,
      noAutoFire          = false,
      noChaseCategory     = [[MINERALS FIXEDWING GUNSHIP CRUISER SUB]],
      objectName          = [[lsiegebreaker.s3o]],
      seismicSignature    = 4,
      selfDestructAs      = [[DRONE_GROUND_UNIT]],

      sounds            = {
          select = {
        "argh/Argh_TankSound",
        },
          ok = {
        "argh/Argh_TankSound",
        },
      },

      side                = [[Drone]],
      sightDistance       = 1100,
      smoothAnim          = true,
      
      trackOffset         = 3,
      trackStrength       = 60,
      trackStretch        = 1,
      trackType           = [[StdTank]],
      trackWidth          = 260,
      
      turnInPlace         = 1,
      turnRate            = 1000,
      script              = [[lsiegebreaker.lua]],
    
      weapons             = {
    
        {
          def                = [[Cannon]],
          badTargetCategory  = [[SWIM LAND SHIP HOVER]],
          mainDir            = [[0 0 1]],
          maxAngleDif        = 180,
          onlyTargetCategory = [[SWIM LAND SINK FLOAT SHIP HOVER]],
        },
    
      },
    
    
      weaponDefs          = {
    
        Cannon = {
          name                    = [[Artillery Cannon]],
          areaOfEffect            = 240,
          avoidFeature            = false,
          craterMult              = 2,
          collideFriendly         = false,
    
          damage                  = {
            default = 1500,
            Meteor = 0,
          },
    
       -- model                   = [[bshell.s3o]],
          cegtag                  = [[ct_drone_energyshot]],         
          explosionGenerator      = [[custom:ct_impact_beamshot_green_big]],
          interceptedByShieldType = 1,
          myGravity               = 0.1,
          range                   = 1250,
          reloadtime              = 7,
          soundHit                = [[argh/Argh_MedExplosion]],
          soundStart              = [[argh/Argh_Whamsound]],
          turret                  = true,
          weaponType              = [[Cannon]],
          weaponVelocity          = 3000,
        },
    
      },
    
    
      featureDefs         = {
    
        DEAD  = {
          description      = [[Wreckage - Roller Drone]],
          blocking         = true,
          category         = [[corpses]],
          damage           = 1000,
          energy           = 0,
          featureDead      = [[DEAD2]],
          footprintX       = 2,
          footprintZ       = 2,
          metal            = 125,
          object           = [[wrecks/lsiegebreakerwreck.s3o]],
          reclaimable      = true,
          reclaimTime      = 3600,
        },
    
    
        DEAD2 = {
          description      = [[Debris - Roller Drone]],
          blocking         = false,
          category         = [[heaps]],
          damage           = 500,
          energy           = 0,
          footprintX       = 2,
          footprintZ       = 2,
          metal            = 62,
          object           = [[b2x2heap.s3o]],
          reclaimable      = true,
          reclaimTime      = 1800,
        },
    
      },
    
    }
    
    return lowerkeys({ lsiegebreaker = unitDef })
