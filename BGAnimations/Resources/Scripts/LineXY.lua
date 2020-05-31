local params  =  ...

local sprite = params.File

BGA_NoParams( params )

local ScaleVar = _screen.h/480
local zw = self:GetZoomedWidth()*ScaleVar
local zh = self:GetZoomedHeight()*ScaleVar

local function I_Pos(self, i)

	local tbl_Xpos_i = {

		SCREEN_LEFT-zw,
		SCREEN_RIGHT+zw,
		SCREEN_LEFT-zw,
		SCREEN_RIGHT+zw,
		SCREEN_LEFT-zw,
		SCREEN_LEFT+zw*0,
		SCREEN_LEFT+zw*1,
		SCREEN_LEFT+zw*2,
		SCREEN_LEFT+zw*3,
		SCREEN_LEFT+zw*4

	}

	local tbl_Ypos_i = {

		SCREEN_TOP,
		SCREEN_TOP+zh,
		SCREEN_TOP+zh*2,
		SCREEN_TOP+zh*3,
		SCREEN_TOP+zh*4,
		SCREEN_TOP-zh,
		SCREEN_BOTTOM+zh,
		SCREEN_TOP-zh,
		SCREEN_BOTTOM+zh,
		SCREEN_TOP-zh

	}

	return { tbl_Xpos_i[i], tbl_Ypos_i[i] } 

end

local function E_Pos(self, i)

	local tbl_Xpos_e = {

		SCREEN_RIGHT+zw,
		SCREEN_LEFT-zw,
		SCREEN_RIGHT+zw,
		SCREEN_LEFT-zw,
		SCREEN_RIGHT+zw,

	}

	local tbl_Ypos_e = {

		SCREEN_BOTTOM+zh,
		SCREEN_TOP-zw,
		SCREEN_BOTTOM+zw,
		SCREEN_TOP-zw,
		SCREEN_BOTTOM+zw

	}

	return { tbl_Xpos_e[i], tbl_Ypos_e[i] } 

end

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end
}

local count, count_2 = 1

for i=1,10 do 

	t[#t+1] = Def.Sprite{
		GainFocusCommand=function(self)

			self:Load(sprite)
			self:set_tween_uses_effect_delta(true)
			self:effectclock("beat")
			self:queuecommand("Repeat")
			BGA_FrameSelector(self, params)
			BGA_PlayAllCommands(self, params)

		end,
		TwoSpritesCommand=function(self)
			self:animate(false)
			self:setstate(i % self:GetNumStates())
		end,
		RepeatCommand=function(self)

			count_2 = i

			if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end

			if i <= 5 then
				self:x(I_Pos(self, i)[1]):sleep((count_2-1)*0.5)
					:y(I_Pos(self, i)[2])
			else
				self:y(I_Pos(self, i)[2]):sleep((count_2-1-4)*0.5)
					:x(I_Pos(self, i)[1])				
			end

			if self:GetY() > SCREEN_BOTTOM then 
				self:visible(false)
			end

			if i <= 5 then
				self:linear(5)
					:x(E_Pos(self, i)[1])
			else
				self:linear(4)
					:y(E_Pos(self, i-5)[2])
			end

			self:queuecommand("Repeat")

		end	
	}

end

return t
