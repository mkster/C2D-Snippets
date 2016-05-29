function Activity:Build()
  
	--overwrite standard starting blueprints
	function bpmenu.add_basic_blueprints(controller) 
		ctrl:AddBlueprintToMenuNoEffect("Rover Minimal Jets", No)
		ctrl:AddBlueprintToMenuNoEffect("Rover Carbon", No)
		ctrl:AddBlueprintToMenuNoEffect("Rover Climber", No)
	end
	
  --set start resources
  for i,ctrl in ipairs(scene:GetHumanControllers()) do
    local n = 300
    ctrl:AddResMetals(n)
    ctrl:AddResCarbon(n)
    ctrl:AddResWater(n)
    ctrl:AddResSilicon(n)
  end
  
  --disble lighting or discovery map
  scene:SetLightingEnabled(false)
  scene:SetDiscoveryEnabled(false)
  
	--turn off resource bars ui
	pioneer_ui.set_visible(false)
  
  --disable restart tip in spectator mode
  hud.update_restart_tip = function() return end
  
  --start player in closest vehicle
	scene:PutPioneerInsideVehicle()
  
  --setup racing gamemode (check raceing level for details or the activities of other levels for other gamemodes)
  local vehicles = {"Rover Minimal Jets", "Rover Carbon", "Rover Climber", "Fauna Crab", "Bot Frosty"}
  activities.race.build(self, vehicles)
end


function Activity:Update()
  --update racing gamemode
  activities.race.update(self)
end