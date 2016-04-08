
function Blueprint:Build()
  
  local radarPos = self:GetApproxPos()
  local length = 5
  
  --setup the radar
  self.radar = self:GetRadars():AddRadar("Name")
  --arguments: position, direction, ray rotation arc (math.twopi is full circle), ray length
  self.radar:SetUpCone(radarPos, 0, math.twopi, length)

  --setup the collisons of the radar: assemblies, MOs, terrain, resources
  self.radar:SetUpCheck(true, true, true, true)

end


function Blueprint:Update()
  
  --draw the radar for debugging 
  --tick show debug wires in game mode in the bottom of the edior in BP edit mode
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
      local pos = signal:GetPoint()
      if to then
        --to foung
        print("TO found", pos, to)      
      elseif mo then
        --mo found (do something with the mo here)
        print("MO found", pos, mo)
      end
    end
  end
  
end
