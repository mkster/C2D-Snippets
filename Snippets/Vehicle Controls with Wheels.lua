
--Make sure to set up your joint as wheel joint in the editor

function Blueprint:Build()
	self.pedal_timer = self:CreateTimer()
	self.pedal_timer:SetTimer(0, 1)
 
	function self.ControlLeftPress()
		self.left = true
	end
 
	function self.ControlLeftRelease()
		self.left = false
	end
 
	function self.ControlRightPress()
		self.right = true
	end
 
	function self.ControlRightRelease()
		self.right = false
	end
end
 
 
function Blueprint:Update()
	if not self.right and not self.left then
		self.pedal_timer:Reset()
	end
 
	if self.right then
		self:JointSet("Wheel Joint Name Here"):DoMotorForce(-15 -1 * self.pedal_timer:GetMorphTime(), false)
	end
 
	if self.left then
		self:JointSet("Wheel Joint Name Here"):DoMotorForce(15 + 1 * self.pedal_timer:GetMorphTime(), false)
	end
end