

local args = ...

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

local params = {

	{	
		Index = 1,
		File = GAMESTATE:GetCurrentSong():GetBackgroundPath(),
		BGMirror = true,
		X_num = 1
	},

}

	BGA_G.ParTweak( params, args )
	BGA_G.Tile(t, params[1])

local s = { 
			"/BGAnimations/Resources/Scripts/TileTool.lua", 
			"/BGAnimations/Resources/4th/Backgrounds/" 
		}

return Def.ActorFrame{

	t,

	Def.ActorFrame{
		OnCommand=function(af)
			af:effectclock("beat")
			af:set_tween_uses_effect_delta(true)
			af:diffusealpha(1)
			af:queuecommand("Sequence")
		end,
		SequenceCommand=function(af)
			af:sleep(1.5):diffusealpha(0)
			af:sleep(2.5):diffusealpha(1)
			af:queuecommand("Sequence")
		end,
		loadfile(s[1])( {
			File = s[2] .. "F.png",
			X_pos = -0.5
		} ),
		loadfile(s[1])( {
			File = s[2] .. "F2.png",
			X_pos = 0.5
		} )
	},

	Def.ActorFrame{
		loadfile( "/BGAnimations/4thK02A/default.lua" )( { Index = 2, Remove = true } ),
		OnCommand=function(af)
			af:effectclock("beat")
			af:set_tween_uses_effect_delta(true)
			af:diffusealpha(0)
			af:queuecommand("Sequence")
		end,
		SequenceCommand=function(af)
			af:sleep(1.5):diffusealpha(1)
			af:sleep(1.5):diffusealpha(0)
			af:sleep(1)
			af:queuecommand("Sequence")
		end		
	}
	
}