local tool_sprite, tool_delay, ScaleVar, RandomState, StairsDir = ...

local t = Def.ActorFrame{ 

	OnCommand=function(self)
		local random_states if RandomState == true then
			self:RunCommandsOnChildren( function(child) child:setstate(math.random(0,child:GetNumStates()-1)) end )
		end
	end,

}

for i=-3,3 do
	for k=-3,2 do
		t[#t+1] = Def.Sprite{
			 Name = "template",
			 Texture = tool_sprite, 
			 OnCommand=function(self)
			 	self:zoom(ScaleVar)
			 	:xy(SCREEN_CENTER_X+self:GetWidth()*i*ScaleVar,SCREEN_CENTER_Y+self:GetHeight()*k*ScaleVar)
			 	:SetAllStateDelays(tool_delay):effectclock("beat")
			 end,
			 SpinYCommand=function(self)
			 	self:rotationx(0):linear(2):rotationx(90):linear(2):rotationx(0)
			 	:queuecommand( "SpinY" )
				:effectclock('beat')
				:set_tween_uses_effect_delta(true)
			 end,
			 SpinXCommand=function(self)
			 	self:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0)
			 	:queuecommand( "SpinX" )
				:effectclock('beat')
				:set_tween_uses_effect_delta(true)
			 end,
			 StairsCommand=function(self)

			 	local x_sprites = i+4
			 	local y_sprites = k+4
			 	

			 	if StairsDir == "Left" then 
			 		for a=0,10,1 do	
		    			if x_sprites - y_sprites == a-5 then
		    				self:setstate(a % self:GetNumStates())
			    		end
		    		end
		    	elseif StairsDir == "Right" then
		    		local tbl = {}
		    		for a=0,10,1 do
		    			for _i=self:GetNumStates()-1,0,-1 do
		    				table.insert( tbl, _i )
		    			end
		    			if x_sprites - y_sprites == a-5 then
		    				self:setstate(tbl[a+1])
			    		end
		    		end
		    	else
		    		self:animate(false)
		    	end

			end
		}
	end
end

return t