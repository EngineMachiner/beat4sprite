local sprt = ...

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

}

for i = 1,18 do
	t[#t+1] = LoadActor( sprt )..{
		OnCommand=function(self)

			self:Center()
			:zoom(ScaleVar)
			:SetSize(640,480)
			:effectclock('beat')
			:diffusealpha(1)
			:blend("BlendMode_Normal")

			self:fadeleft( 1 / 40 )
			self:faderight( 1 / 40 )
			self:fadetop( 1 / 40 )
			self:fadebottom( 1 / 40 )

			self:wag():effectperiod(2):effectmagnitude( 8 + 4 * ( i - 1 ), 4 + 2 * ( i - 1 ), 2 + 2 * ( i - 1 ) )

			if i > 2 then
				local crop_val = 0.03125 * i
				self:croptop(crop_val)
				self:cropbottom(crop_val)
				self:cropleft(crop_val)
				self:cropright(crop_val)
			end

		end
	}
end

return t