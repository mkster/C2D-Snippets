
-- add a sound set called "Loop Name" to your blueprint

function Blueprint:Build()
  
  --tool button functions
  function self.ToolLeftButtonPress()
    self.right = true
  end

  function self.ToolLeftButtonRelease()
    self.right = false
  end
  
end


function Blueprint:Update()

  if self.right then
    --right button pressed
    if not self.soundLoop then
      self.soundLoop = self:PlaySoundLoop("Loop Name")
    end
    
  else
    --right button released
    self:StopSoundLoop(self.soundLoop)
    self.soundLoop = nil
  end
  
end