
local params = ...

local HT = params.HurryTweenBy or 1
local Y = params.ZoomY or SCREEN_HEIGHT * 0.05
HT = HT / Y

local t = Def.ActorFrame{}

-- Texture 

local params_2 = params:Copy( {
	X_num = { -1, 1 },
	TCV = { 0, -1 },	Reversed = true,
	HurryTweenBy = HT,	Mirror = true,
	ZoomXYZ = { 1, Y, 1 },	Script = "TileTool.lua"
} ):Load(t)

-- Mask
local t2 = t[#t]
t2[#t2+1] = Def.Quad{
	OnCommand=function(self)
		BGA_G.ObjFuncs(self)
		self:FullScreen()
		self:y( - SCREEN_HEIGHT * 0.5 )
		self:clearzbuffer(true)
		self:zwrite(true)
		self:blend("BlendMode_NoEffect")
		self:queuecommand("Repeat")
	end,
	GainFocusCommand=function(self)
		self:set_tween_uses_effect_delta(false)
		self:finishtweening()
		self:queuecommand("On")
	end,
	RepeatCommand=function(self)
		local d = self:GetFullDelay(params)
		d = d * HT * Y * 7.5
		self:linear( d )
		self:y( SCREEN_HEIGHT * 0.5 )
		self:linear( d )
		self:y( - SCREEN_HEIGHT * 0.5 )
		self:queuecommand("Repeat")
	end
}

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:ztest(true)
	end
}

-- Background
local t2 = t[#t]
BGA_G.Create( { 
	File = params.File, 
	X_num = 1, 	Mirror = true
} ):Load(t2)

return BGA_G.Frame() .. {

	Def.ActorFrameTexture{
		InitCommand=function(self)
			self:EnableDepthBuffer(true)
			self:SetSize( SCREEN_WIDTH, SCREEN_HEIGHT )
			self:Create()
			self:GetParent().Texture = self:GetTexture()
		end,	t
	},

	Def.Sprite{
		OnCommand=function(self)
			local tex = self:GetParent().Texture
			self:SetTexture(tex):Center()
			self:SetTextureFiltering(false)
			BGA_G.bitEyeFix(self, function(self)
				bitEye.AFT = true		self:xy(0,0)
			end)
		end
	}
	
}