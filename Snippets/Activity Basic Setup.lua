function Activity:Build()
  
  --overwrite standard starting blueprints
  function bpmenu.add_basic_blueprints(controller) 
    ctrl:AddBlueprintToMenuNoEffect("Rover Minimal Jets", No)
    ctrl:AddBlueprintToMenuNoEffect("Rover Carbon", No)
    ctrl:AddBlueprintToMenuNoEffect("Rover Climber", No)
  end
  
  --set start resources, disable assembling / atomizing
  for i,ctrl in ipairs(scene:GetHumanControllers()) do
    local n = 300
    ctrl:AddResMetals(n)
    ctrl:AddResCarbon(n)
    ctrl:AddResWater(n)
    ctrl:AddResSilicon(n)
    
    local pio = ctrl:GetAssemblyLinked()
    if pio then 
      GetAssemblyLuaObj(pio).set_allow_atomize(false)
      GetAssemblyLuaObj(pio).set_allow_assemble(false)
    end
  end
  
  --start player in closest vehicle
  scene:PutPioneerInsideVehicle()
  
  --disble lighting or discovery map
  scene:SetLightingEnabled(false)
  scene:SetDiscoveryEnabled(false)
  
  --turn off resource bars ui
  pioneer_ui.set_visible(false)
  
  --disable restart tip in spectator mode
  hud.update_restart_tip = function() return end
  
  --setup racing gamemode (check raceing level for details or the activities of other levels for other gamemodes)
  local vehicles = {"Rover Minimal Jets", "Rover Carbon", "Rover Climber", "Fauna Crab", "Bot Frosty"}
  activities.race.build(self, vehicles)
end


function Activity:Update()
  --update racing gamemode
  activities.race.update(self)
  
  --fix zoom level
  for i,ctrl in ipairs(scene:GetHumanControllers()) do
    ctrl:SetCameraZoom(1.27)
  end
end