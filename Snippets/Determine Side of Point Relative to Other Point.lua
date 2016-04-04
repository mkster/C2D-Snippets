function Blueprint:Update()

  local master = self:GetMasterMO()
  
  --set the pos of the target here 
  --for example targetAssembly:GetApproxPos() or the mouse position
  --find targetAssembly with ray casts or radars(check other snipptes)
  local posTarget = self.aim_point--VectorF(500, 500)
  local posSelf = master:GetPosition()
  
  local side = master:UnRotateVectorForGravity(posTarget - posSelf)
  
  if side.mX < 0 then
    print("posTarget is left of posSelf")
  else
    print("posTarget is right of posSelf")
  end
  
  if side.mY < 0 then
    print("posTarget is lower then posSelf")
  else
    print("posTarget is higher then posSelf")
  end  
  
  --draw line from self to target
  self:DrawWireLine(posSelf, posTarget, ColorRGBA(0, 255, 0, 255))
  
end