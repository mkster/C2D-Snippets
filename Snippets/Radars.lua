
function Blueprint:Build()
  
  local radarPos = self:GetApproxPos()
  local length = 5
  
  --setup the radar
  self.radar = self:GetRadars():AddRadar("Name")
  self.radar:SetUpCone(radarPos, 0, math.twopi, length)

  --setup the collisons of the radar: assemblies, MOs, terrain, resources
	self.radar:SetUpCheck(true, true, true, true)

end


function Blueprint:Update()
  
  --draw the radar for debugging
  self:DrawWiresAllRadars()
  
  --update the radar positon every frame
  local radarPos = self:GetApproxPos()
  self.radar:SetConePoint(radarPos)
  
  --check for signals
  for i=0 ,self.radar:GetSignalsCount() do
    local signal = self.radar:GetSignal(i)
    if signal then
      local to = signal:GetTO()
      local mo = signal:GetMO()
      if to then
        --to foung
        print("TO found", to)      
      elseif mo then
        --mo found (do something with the mo here)
        print("MO found", mo)
      end
    end
  end
  
end
