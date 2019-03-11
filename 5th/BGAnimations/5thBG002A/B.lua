
local tbl = {}

if GAMESTATE:GetCurrentSong():HasBackground() then 
	tbl.file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
else 
	tbl.file = "/BGAnimations/Backgrounds/fallback.png"
end

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

}

for i = 0,8 do
	t[#t+1] = LoadActor( tbl.file )..{
		OnCommand=function(self)

			self:Center()
			:zoom(ScaleVar)
			:SetSize(640,480)
			:effectclock('beat')
			:diffusealpha(1)
			:blend("BlendMode_Normal")

			if i == 0 then
				self:pulse():effectperiod(2):effectmagnitude(1.0625,1,0)
			else
				self:pulse():effectperiod(2):effectmagnitude(1.0325 + i * 0.01 ,1,0)
				if i <= 4 then
					self:cropbottom( 0.5 )
					self:fadebottom( 1 / 16 )
					if i % 2 == 1 then
						self:cropright( 0.5 )
						self:faderight( 1 / 16 )
					else
						self:cropleft( 0.5 )
						self:effectoffset(0.5)
						self:fadeleft( 1 / 16 )
					end
				else
					self:croptop( 0.5 )
					self:fadetop( 1 / 16 )
					if i % 2 == 1 then
						self:cropright( 0.5 )
						self:faderight( 1 / 16 )
						self:effectoffset(0.5)
					else
						self:cropleft( 0.5 )
						self:fadeleft( 1 / 16 )
					end
				end
			end

		end
	}
end

return t