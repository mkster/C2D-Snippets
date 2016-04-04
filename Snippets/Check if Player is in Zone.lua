
--add a zoned called Gravity Toggle in the scene editor
--add this snippet to the activity script

function Activity:Update()
 
  --find the player position
  local ctrl = scene:GetHumanControllerOnThisComputer()
  local player = ctrl:GetAssemblyLinked()
  local playerPos = player:GetApproxPos() 
 
  if scene:IsInsideZone(playerPos, "Gravity Toggle") then
    --if player is in zone
    scene:SetGravityAcc(-20)
  else
    --if player is not in zone
    scene:SetGravityAcc(20)
  end
 
end