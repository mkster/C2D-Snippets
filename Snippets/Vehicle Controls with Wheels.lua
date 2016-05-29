
--Make sure to set up your joint as wheel joint in the editor

function Blueprint:Build()
 
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
  
  if self.right then
    self:JointSet("Wheel Joint Name"):DoMotorForce(-15)
  end
 
  if self.left then
    self:JointSet("Wheel Joint Name"):DoMotorForce(15)
  end
  
end