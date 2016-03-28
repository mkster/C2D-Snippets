
function Blueprint:Build()
	function function self.ControlUpPress()
		local ps = self:GetPSByName("Particle Name Here") 
		if ps then ps:SwitchONParticleEmitting() end
	end
 
	function self.ControlUpRelease()
		local ps = self:GetPSByName("Particle Name Here") 
		if ps then ps:SwitchOFFParticleEmitting() end
	end
 
 
	function self.ControlDownPress()
		local ps = self:GetPSByName("Particle Name Here")
		if ps then ps:SwitchONParticleEmitting() end
	end
 
	function self.ControlDownRelease()
		local ps = self:GetPSByName("Particle Name Here")
		if ps then ps:SwitchOFFParticleEmitting() end
	end
 
 
	function self.ControlLeftPress()
		local ps = self:GetPSByName("Particle Name Here") 
		if ps then ps:SwitchONParticleEmitting() end
	end
 
	function self.ControlLeftRelease()
		local ps = self:GetPSByName("Particle Name Here") 
		if ps then ps:SwitchOFFParticleEmitting() end
	end
 
 
	function self.ControlRightPress()
		local ps = self:GetPSByName("Particle Name Here") 
		if ps then ps:SwitchONParticleEmitting() end
		end
 
	function self.ControlRightRelease()
		local ps = self:GetPSByName("Particle Name Here") 
		if ps then ps:SwitchOFFParticleEmitting() end
	end
end