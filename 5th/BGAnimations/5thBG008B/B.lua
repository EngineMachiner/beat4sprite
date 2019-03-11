
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

tbl.mag = 30

for i = 1,18 do
	t[#t+1] = LoadActor( tbl.file )..{
		OnCommand=function(self)

			self:Center()
			:zoom(ScaleVar)
			:SetSize(640,480)
			:effectclock('beat')
			:diffusealpha(1)
			:blend("BlendMode_Normal")

			self:fadetop( 1 / 8 )
			self:fadebottom( 1 / 8 )

			if tbl.mag == 10 then
				tbl["Reversed"] = true
			elseif tbl.mag == 40 then
				tbl["Reversed"] = false
			end

			if tbl["Reversed"] then
				tbl.mag = tbl.mag + 10
			else
				tbl.mag = tbl.mag - 10
			end

			self:bob():effectperiod(1):effectmagnitude(tbl.mag,0,0)

			if i > 2 then
				local crop_val = 0.0625 * i
				self:croptop(crop_val)
			end

		end
	}
end

return t