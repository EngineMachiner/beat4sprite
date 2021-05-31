

local args = ...

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
		self:playcommand("G")
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

	{	
		Index = 2,
		File = "/BGAnimations/Resources/4th/Sprites/ABCD 5x4.png",
		Frames = { 7, 10 },
		Zoom = 1.0635,
		Commands = "TwoSprites"
	},

	{
		Index = 3,
		File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
		Frames = { 2, 15 },
		X_num = { 0, 4 },
		Y_num = { -2, 1 },
		Spacing = { 1.0635, 1 },
		Color = "Rainbow",
		Commands = { "StairsStates", "Fade" }
	},

	{
		Index = 4,
		File = { 
			THEME:GetPathG("","_blank"),
			"/BGAnimations/Resources/4th/Backgrounds/C.png" 
		},
		Dir = true
	}

}
 
	BGA_G.ParTweak( params, args )

	local s = "/BGAnimations/Resources/Scripts/"
	t[#t+1] = Def.ActorFrame{
		loadfile( s .. "TileTool.lua" )( params[1] ),
		GCommand=function(self)
			self:stoptweening()
			self:diffusealpha(1)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			self:queuecommand("Hide")
		end,
		HideCommand=function(self)
			local d = BGA_G.GetDelay(self)[2]
			self:sleep(8*d):linear(4):diffusealpha(0)
		end
	}

	t[#t+1] = Def.ActorFrame{
		Def.Quad{
			OnCommand=function(self)
				self:FullScreen()
				self:diffuse(Color.Black)
			end
		},
		Def.ActorFrame{
			loadfile( s .. "TileTool.lua" )( params[3] ),
			GCommand=function(self)
				local p = self:GetParent()
				p:stoptweening()
				p:diffusealpha(1)
				p:effectclock("beat")
				p:set_tween_uses_effect_delta(true)
				self:queuecommand("Hide")
			end,
			HideCommand=function(self)
				local d = BGA_G.GetDelay(self)[2]
				self:GetParent():sleep(4*d):diffusealpha(0)
			end
		}
	}

	t[#t+1] = Def.ActorFrame{
		loadfile( s .. "SpiralStaticTrace.lua" )( params[2] ),
		GCommand=function(self)
			self:stoptweening()
			self:y(23)
			self:diffusealpha(1)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			self:queuecommand("Hide")
		end,
		HideCommand=function(self)
			local d = BGA_G.GetDelay(self)[2]
			self:sleep(8*d):diffusealpha(0)
		end
	}

	t[#t+1] = Def.ActorFrame{
		loadfile( s .. "SplitScreen.lua" )( params[4] ),
		GCommand=function(self)
			self:stoptweening()
			self:diffusealpha(0)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			self:queuecommand("Hide")
		end,
		HideCommand=function(self)
			local d = BGA_G.GetDelay(self)[2]
			self:sleep(8*d):diffusealpha(1)
			self:sleep(4*d):diffusealpha(0)
		end
	}

	local p = {}
	DeepCopy( params[4], p )
	p.Dir = nil
	p.File = p.File[2]
	t[#t+1] = Def.ActorFrame{

		Def.ActorFrame{
			loadfile( s .. "WarpingEffects/Bob.lua" )( p ),
			GCommand=function(self)
				local p = self:GetParent()
				p:stoptweening()
				p:effectclock("beat")
				p:set_tween_uses_effect_delta(true)
				self:queuecommand("Hide")
			end,
			HideCommand=function(self)
				local d = BGA_G.GetDelay(self)[2]
				self:GetParent():diffusealpha(0)
				self:GetParent():sleep(12*d):diffusealpha(1)
				self:GetParent():sleep(4*d):diffusealpha(0)
			end
		},

		loadfile( s .. "Explode.lua" )( {
			Index = 3,
			File = "/BGAnimations/Resources/4th/Sprites/AB 5x4.png",
			Frames = { 2, 15 },
			Blend = "BlendMode_Add",
			Spin = true,
			Even = true
		} )

	}

	local p = {}
	DeepCopy( params[1], p )
	p.Commands = "Cross"
	BGA_G.Tile( t, p )

	t[#t+1] = Def.ActorFrame{

		Def.Quad{
			OnCommand=function(self)
				self:FullScreen()
				self:diffuse(Color.Black)
			end
		},

		Def.ActorFrame{
			loadfile("/BGAnimations/Resources/default.lua")(),
			GCommand=function(self)
				local p = self:GetParent()
				p:stoptweening()
				p:diffusealpha(0)
				p:effectclock("beat")
				p:set_tween_uses_effect_delta(true)
				self:queuecommand("Hide")
			end,
			HideCommand=function(self)
				local d = BGA_G.GetDelay(self)[2]
				self:GetParent():sleep(16*d):diffusealpha(1)
			end
		}

	}

return Def.ActorFrame{ t }