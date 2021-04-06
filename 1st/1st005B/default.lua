
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
	Commands = "ZWrite",
	Frame_i = 1,
	Frame_l = 30,
	Zoom = 5,
	Delay = 1,
	NoDelayTweaking = true

}

local bpm = GAMESTATE:GetSongBPS() * 60
if bpm > 200 then
	params.Delay = params.Delay * math.floor( bpm * 0.01 )
end

	BGA_G.Tile( t, {
		File = bg[1], 
		X_num = 1, 
		Commands = "Mirror", 
		BGMirror = true 
	} )

for i=1,2 do

	t[#t+1] = Def.ActorFrame{
		GainFocusCommand=function(self)
			BGA_G.Stop( self, true )
		end,
		LoseFocusCommand=function(self)
			BGA_G.Stop( self )
		end
	}
	
	local t = t[#t]

	if i > 1 then
		local copy = {}
		DeepCopy( params, copy )
		BGA_G.Tile( t, copy )
	end

	t[#t+1] = Def.Sprite{
		OnCommand=function(self)

			self.num = i

			self:stoptweening()
			self:set_tween_uses_effect_delta(true)
			self:effectclock("beat")
			self:Center()
			self:Load(bg[self.num])
			BGA_G.SetStates( self, { Frames = {0,0}, Zoom = 1 } )
			self:animate(false)

			if i > 1 then
				self.s = 0
				self:ztest(true)
			else
				self.s = params.Delay
			end

			self:queuecommand("Repeat")

		end,
		RepeatCommand=function(self)
			
			while self.num > #bg do
				self.num = self.num - #bg
			end

			self:Load(bg[self.num])

			if self.num == 3 then 
				self:cropleft(0.375)
				self:cropright(0.375)
			else
				self:cropleft(0):cropright(0)
			end

			local fake = { Frames = {0,0}, Zoom = 1 }
			fake.Frames = self.num == 4 and {3,3} or fake.Frames
			BGA_G.SetStates(self, fake)

			self.num = self.num + 2

			self:sleep( ( params.Delay * 2 - self.s ) )
			self.s = 0

			self:queuecommand("Repeat")

		end
	}

end

return Def.ActorFrame{ t }