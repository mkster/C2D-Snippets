function Blueprint:Build()
  --Do this once when the object is created
 
  --Setup joints (they need spring power to hold poses)
  self:JointSet(""):SetAngularSpringPower(2000)
  self:JointSet(""):SetAngularFriction(50)
 
  --Setup a variable to check the state of the right button
  self.right = false
 
  --Register input for vehicle
  self.ControlRightPress = function()
    self.right = true
  end
 
  self.ControlRightRelease = function()
    self.right = false
  end
 
  --Put all the information about the pose in a table
  self.poseanim = {}
  self.poseanim.walkRight = {
    name = "Walk Right",
    joints = "Leg", --starting characters for affected joints
    state = 1,
    count = 4,
    interval = 0.4
  }
 
  --Advance pose to the next pose
  function self:advancePose(anim)
    --Get any joint of this group and make sure it exists and finished its pose fade
    local joint = self:GetAnyJointByName(anim.joints)
    if joint and not joint:GetAngularSpringAngleFadingNow() then
      
      --Advance state counter
      anim.state = anim.state + 1
      if anim.state > anim.count then
        anim.state = 1
      end
      
      --Advance to next pose
      local pose = anim.name.." "..anim.state
      self:FadeAngularSpringAnglesByPose(anim.joints, pose, anim.interval)
      
    end
  end
 
end
 
 
function Blueprint:Update()
  --Do this every frame (many times a second)
 
  --Walk right if the right button is held down
  if self.right then
    self:advancePose(self.poseanim.walkRight)
  else
    self:FadeAngularSpringAnglesByPose("", "Idle 1", 0.04)
  end
 
end