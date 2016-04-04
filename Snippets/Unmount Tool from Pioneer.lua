
function Blueprint:Build()
  
  function self.ToolRightButtonPress()
    --make pio drop tool
    local pio = self:GetMountedToAssemblyByAT("")
    local pioLua = GetAssemblyLuaObj(pio)
    pioLua.unmount_tool()
	end
  
end
