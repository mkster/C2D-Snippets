
function Blueprint:Update()
  local ctrl = scene:GetHumanControllerOnThisComputer()
  local mousePos
  if ctrl then mousePos = ctrl:AimPoint() end
end