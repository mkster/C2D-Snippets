  
--Change “Jet Leg Right” for the Jet PS to the right of your Blueprint, same thing for “Jet Leg Left”
  
function Blueprint:Update()
  local mo = self:GetMasterMO()
  if mo then
    local right = self:GetPSByName("Jet Leg Right")
    local left = self:GetPSByName("Jet Leg Left")
    local ori = mo:GetOrientation()
    local grav = mo:GetGravityVectorAngleRad() + math.halfpi
    local diff = math.frotate(0, math.twopi, (grav - ori) + math.pi) -math.pi
    local thresh = 0.6
    if diff > thresh then
      if left then left:SetParticleEmitting(true) end
      if right then right:SetParticleEmitting(false) end
    elseif diff < -thresh then
      if left then left:SetParticleEmitting(false) end
      if right then right:SetParticleEmitting(true) end
    else
      if left then left:SetParticleEmitting(false) end
      if right then right:SetParticleEmitting(false) end
    end
  end
end  
  
  