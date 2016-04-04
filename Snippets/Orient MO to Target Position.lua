function Blueprint:Update()

  local mo = self:GetMasterMO()
	
	--set the pos of the target here 
	--for example targetAssembly:GetApproxPos() or the mouse position
	--find targetAssembly with ray casts or radars(check other snipptes)
	local posTarget = VectorF(500, 500)
	local posSelf = mo:GetPosition()
	
	--calc angle to target
	local vecToTarget = posTarget - posSelf
	local angle = -vecToTarget:GetAngleRad()
	if self:IsMirrored() then angle = angle + math.pi end
	
	--set to balance to angle
	mo:SetBalancer(true)
	mo:SetBalancerPower(5000)
	mo:SetBalanceToAngle(angle)
	
	--draw line from self to target
	self:DrawWireLine(posSelf, posTarget, ColorRGBA(0, 255, 0, 255))
 
 end