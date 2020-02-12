
local BG_Or_Sprites, beat, X, Y = ...

local ScaleVar = _screen.h/480

local val = 0
local val_2 = 0

if type(beat) == "number" then
	val_2 = beat
else
	val_2 = 1
end


local t = Def.ActorFrame{}

for i=1,#BG_Or_Sprites do
	t[#t+1] = Def.Sprite{
		OnCommand=function(self)

			self:Load(BG_Or_Sprites[i])

			val = math.round( SCREEN_WIDTH * 1.25 * ( self:GetWidth() ^ - 1 ) )

			if val * self:GetHeight() < SCREEN_HEIGHT then 
				val = math.round( SCREEN_HEIGHT * 1.25 * ( self:GetHeight() ^ - 1 ) )

				local crop = math.round( SCREEN_WIDTH * 1.25 * ( self:GetWidth() ^ - 1 ) ) * 1.5
				self:cropleft( crop ^ - 1 )
				self:cropright( crop ^ - 1 )
			end

			self:set_use_effect_clock_for_texcoords(true)
			self:set_tween_uses_effect_delta(true)
			self:effectclock("beat")
			self:Center()
			self:zoom( val * ScaleVar )
			self:customtexturerect(0,0,val,val)

			if i > 1 then
				self:playcommand("Beat")
			end

			if X or Y then 
				self:playcommand("TexScroll")
			end

		end,
		TexScrollCommand=function(self)
			if not X then 
				BGA_TCV_OrL( self, 0, Y, false, "TexScroll" )
			elseif not Y then
				BGA_TCV_OrL( self, X, 0, false, "TexScroll" )
			else
				BGA_TCV_OrL( self, X, Y, false, "TexScroll" )
			end
		end,
		BeatCommand=function(self)
			self:diffusealpha(1):sleep( ( #BG_Or_Sprites + 1 - i ) * val_2 )
				:diffusealpha(0):sleep( ( i - 1 ) * val_2 )
				:queuecommand("Beat")
		end
	}
end

return Def.ActorFrame{ t }