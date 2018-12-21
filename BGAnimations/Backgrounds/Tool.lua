local tool_sprite, tool_delay, ScaleVar, RState = ...

local t = Def.ActorFrame{ 

	OnCommand=function(self)
		local random_states if RState == true then
			self:RunCommandsOnChildren( function(child) child:setstate(math.random(0,child:GetNumStates()-1)) end )
		end
	end,

}

local sprt_bg for i=-3,3 do

local sprt2_bg for k=-3,2 do

t[#t+1] = Def.Sprite{
			 Name = "template",
			 Texture = tool_sprite, 
			 OnCommand=function(self)
			 	self:zoom(ScaleVar)
			 		:xy(SCREEN_CENTER_X+self:GetWidth()*i*ScaleVar,SCREEN_CENTER_Y+self:GetHeight()*k*ScaleVar)
			 		:SetAllStateDelays(tool_delay*5):effectclock("beat")
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
			 OneTwoStatesCommand=function(self)
			 	if i == -3 or i == -1 or i == 1 then selected_state = 0 end
			 	if i == -2 or i == 0 or i == 2 then selected_state = 1 end
			 	self:setstate(selected_state)
			 end,
			 StairsCommand=function(self)	
			 	local x_sprites = i+4
			 	local y_sprites = k+4
			 	local s_state = self:GetNumStates()-1
			 		if x_sprites + y_sprites == 8 then 
			 			self:setstate(0)
			 			self:diffusealpha(0.5)
			 		end
			 end
	}



end

end

return t