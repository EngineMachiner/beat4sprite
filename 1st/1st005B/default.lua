
--Never ResetParams twice in the same table using BGA_ParamsTweaks.

local t = Def.ActorFrame{}

local bg = {
	GAMESTATE:GetCurrentSong():GetBackgroundPath(),
	"/BGAnimations/Resources/1st/Backgrounds/F.png",
	"/BGAnimations/Resources/1st/Backgrounds/D2.png",
	"/BGAnimations/Resources/1st/Sprites/HSV/A 4x1.png"
}

local params = {

	Index = 1,
	File = "/BGAnimations/Resources/1st/Sprites/Clock2 6x5.png",
	X_num = 1,
	Commands = "ZWrite",
	Delay = 4/30,
	Frame_i = 1,
	Frame_l = 30,
	Zoom = 5,
	NoBPMDelay = true

}

	PSX_BGA_Globals["BGA_TileTool"]( t, {
		File = bg[1], 
		X_num = 1, 
		Commands = "Mirror", 
		BGMirror = true 
	} )

for k=-1,1 do

	t[#t+1] = Def.ActorFrame{
		GainFocusCommand=function(self)
			PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
		end,
		LoseFocusCommand=function(self)
			PSX_BGA_Globals["BGA_ChildrenStop"]( self )
		end
	}

	for i=1,2 do

		local t = t[#t]

		if i > 1 then
			local copy = {}
			DeepCopy( params, copy )
			PSX_BGA_Globals["BGA_TileTool"]( t, copy )
		end

		t[#t+1] = Def.Sprite{
			OnCommand=function(self)

				self.num = i - 1
				self:stoptweening()
				self:Center()
				self:Load(bg[1])
				self:set_tween_uses_effect_delta(true)
				self:effectclock("beat")
				self:x( self:GetX() + self:GetZoomedWidth() * k )

				if i > 1 then
					self:ztest(true)
				else
					self:sleep(2)
				end

				self:queuecommand("Repeat")

			end,
			RepeatCommand=function(self)

				self.num = self.num + 1

				self:Load(bg[self.num])
				self:animate(false)
				self:cropleft(0):cropright(0)
				if self.num == 3 then 
					self:cropleft(0.375)
					self:cropright(0.375)
				end

				local fake = {}
				if self.num == 4 then fake.Frame_i = 4 end
				PSX_BGA_Globals.BGA_NoParams(fake)
				PSX_BGA_Globals.BGA_FrameSelector(self, fake)

				self.num = self.num >= #bg and self.num - #bg or self.num

				self:sleep(4)
				self:queuecommand("Repeat")

			end
		}

	end

end

return Def.ActorFrame{ t }