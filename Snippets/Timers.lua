
function Blueprint:Build()
  
  local timeLimit = 5
  self.timer = self:CreateTimer(0, timeLimit, false, false)
  
end


function Blueprint:Update()
  
  print(self.timer:GetTime())
  
  if self.timer:TimeIsUp() then
    self.timer:Reset()
    print("Time is up")
  end
  
end
