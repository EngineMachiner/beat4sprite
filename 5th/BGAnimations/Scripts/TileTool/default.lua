
local tool_sprite, x, y, RandomState, StairsDir = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{ 

	OnCommand=function(self)
		if RandomState == true then
			self:RunCommandsOnChildren( function(child)
				if child:GetNumStates() > 1 then
					child:setstate(math.random(0,child:GetNumStates()-1))
				end 
			end )
		end
	end,

}

for i=-x,x do
	for k=-y,y do
		t[#t+1] = Def.Sprite{
			Name="template",
			Texture = tool_sprite, 
			OnCommand=function(self)
			 	self:zoom(ScaleVar)
			 	:xy(SCREEN_CENTER_X+self:GetWidth()*i*ScaleVar,SCREEN_CENTER_Y+self:GetHeight()*k*ScaleVar)
			 	:SetAllStateDelays(2*self:GetNumStates()^-1)
			 	:effectclock("beat")
			 	:set_tween_uses_effect_delta(true)
			 	ToolPreview(self)
			end,
			SpinYCommand=function(self)
			 	self:rotationx(0):linear(2):rotationx(90):linear(2):rotationx(0)
			 	:queuecommand( "SpinY" )
			end,
			SpinXCommand=function(self)
			 	self:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0)
			 	:queuecommand( "SpinX" )	
			end,
			OneTwoStatesCommand=function(self)
				self:setstate(i % 2)
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