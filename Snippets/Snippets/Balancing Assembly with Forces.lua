
--Change “Hull” for the name of the balancing MO of your Blueprint

function Blueprint:Build()
  -- setup a balancer
  self:MOSet("Hull"):SetBalancer(true)
  self:MOSet("Hull"):SetBalancerPower(30) -- Put here the value you want
  self:MOSet("Hull"):SetBalanceToAngle(self:GetMasterMO():RotateAngleForGravity(0))
end
 
function Blueprint:Update()
  -- balance every frame 
  self:MOSet("Hull"):SetBalanceToAngle(self:GetMasterMO():RotateAngleForGravity(0))
end