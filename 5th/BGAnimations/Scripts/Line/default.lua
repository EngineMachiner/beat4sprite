local sprite  =  ...
local ScaleVar = _screen.h/480

local function I_Pos(self, i)

	local tbl_Xpos_i = {

		SCREEN_LEFT-self:GetWidth()*ScaleVar,
		SCREEN_RIGHT+self:GetWidth()*ScaleVar,
		SCREEN_LEFT-self:GetWidth()*ScaleVar,
		SCREEN_RIGHT+self:GetWidth()*ScaleVar,
		SCREEN_LEFT-self:GetWidth()*ScaleVar,
		SCREEN_LEFT+self:GetWidth()*ScaleVar*0,
		SCREEN_LEFT+self:GetWidth()*ScaleVar*1,
		SCREEN_LEFT+self:GetWidth()*ScaleVar*2,
		SCREEN_LEFT+self:GetWidth()*ScaleVar*3,
		SCREEN_LEFT+self:GetWidth()*ScaleVar*4

	}

	local tbl_Ypos_i = {

		SCREEN_TOP,
		SCREEN_TOP+self:GetHeight()*ScaleVar,
		SCREEN_TOP+self:GetHeight()*ScaleVar*2,
		SCREEN_TOP+self:GetHeight()*ScaleVar*3,
		SCREEN_TOP+self:GetHeight()*ScaleVar*4,
		SCREEN_TOP-self:GetHeight()*ScaleVar,
		SCREEN_BOTTOM+self:GetWidth()*ScaleVar,
		SCREEN_TOP-self:GetWidth()*ScaleVar,
		SCREEN_BOTTOM+self:GetWidth()*ScaleVar,
		SCREEN_TOP-self:GetWidth()*ScaleVar

	}

	return { tbl_Xpos_i[i], tbl_Ypos_i[i] } 

end

local function E_Pos(self, i)

	local tbl_Xpos_e = {

		SCREEN_RIGHT+self:GetWidth()*ScaleVar,
		SCREEN_LEFT-self:GetWidth()*ScaleVar,
		SCREEN_RIGHT+self:GetWidth()*ScaleVar,
		SCREEN_LEFT-self:GetWidth()*ScaleVar,
		SCREEN_RIGHT+self:GetWidth()*ScaleVar,

	}

	local tbl_Ypos_e = {

		SCREEN_BOTTOM+self:GetHeight()*ScaleVar,
		SCREEN_TOP-self:GetWidth()*ScaleVar,
		SCREEN_BOTTOM+self:GetWidth()*ScaleVar,
		SCREEN_TOP-self:GetWidth()*ScaleVar,
		SCREEN_BOTTOM+self:GetWidth()*ScaleVar


	}

	return { tbl_Xpos_e[i], tbl_Ypos_e[i] } 

end

local t = Def.ActorFrame{}

local count = 1

for i=1,10 do 

	t[#t+1] = Def.Sprite{
		OnCommand=function(self)

			if type(sprite) == "table" then
				if count > #sprite then
					count = 1
				end
				self:Load(sprite[count])
				count = count + 1
			else
				self:Load(sprite)
			end

			t["s"] = i

			if self:GetNumStates() > 1 then 
				self:setstate(math.random(0,self:GetNumStates()-1))
			end

			self:zoom(ScaleVar)

			if i <= 5 then
				self:x(I_Pos(self, i)[1]):sleep((t["s"]-1)*0.5)
					:y(I_Pos(self, i)[2])
			else
				self:y(I_Pos(self, i)[2]):sleep((t["s"]-1-4)*0.5)
					:x(I_Pos(self, i)[1])				
			end

			if i <= 5 then
				self:linear(5)
					:x(E_Pos(self, i)[1])
			else
				self:linear(4)
					:y(E_Pos(self, i-5)[2])
			end

			self:set_tween_uses_effect_delta(true)
				:effectclock("beat")
				:queuecommand("On")	
				ToolPreview(self)
				AnimationDelay(self)

		end	
	}

end

return t