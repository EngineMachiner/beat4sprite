local sprt = ...
local ScaleVar = _screen.h/480
		
local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

for i = 3,9 do
	t[#t+1] = LoadActor( sprt )..{
		OnCommand=function(self)

			self:Center()
			:zoom(ScaleVar)
			:SetSize(640,480)
			:effectclock('beat')
			:fadeleft(0.025)
			:fadetop(0.025)
			:fadebottom(0.025)
			:faderight(0.025)
			:diffusealpha(0.5)
			:blend("BlendMode_Normal")

			if i < 2 then
				self:pulse():effectperiod(2)
				:effectmagnitude( 1, 1.015625, 0 )
			else
				self:pulse():effectperiod(2)
				:effectmagnitude( 1, 1.03125 + ( 1/32 ) * ( i - 2 ), 0 )

				self:croptop( (1/32) * i )
				:cropbottom( (1/32) * i )
				:cropleft( (1/32) * i )
				:cropright( (1/32) * i )

			end

		end
	}
end

return t