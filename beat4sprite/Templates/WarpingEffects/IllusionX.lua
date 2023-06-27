
local parameters = ...							local p = parameters

local textureFrame = Def.ActorFrame{}		local t = textureFrame

local zoomX = p.ZoomXYZ and p.ZoomXYZ.x or SCREEN_HEIGHT * 0.05

-- Scrolling texture
local scrolling = p:copy {
	Columns = 1,		Scroll = { -1, 0 },				Reversed = true,
	Mirror = true,		ZoomXYZ = { zoomX, 1, 1 },		Illusion = 'X',
	Script = "Tile"
}

scrolling:Load(t)

-- Mask
t[#t+1] = beat4sprite.Sprite.colorQuad() .. {

	OnCommand=function(self)
		self:x( - SCREEN_WIDTH * 0.5 ):MaskSource(true)
		self:queuecommand("Repeat")
	end,

	RepeatCommand=function(self)
		local x = SCREEN_WIDTH * 0.5
		local t = self:getTweenRate() * 16
		self:linear(t):x(x):linear(t):x(-x)
		self:queuecommand("Repeat")
	end
	
}

t[#t+1] = beat4sprite.Sprite.bgTemplate(p):Load() .. { 
	OnCommand=function(self) self:MaskDest() end
}

return beat4sprite.ActorFrame() .. {

	Def.ActorFrameTexture{

		InitCommand=function(self)
			self:EnableDepthBuffer(true):setsize( SCREEN_WIDTH, SCREEN_HEIGHT )
			self:Create()			self:GetParent().Texture = self:GetTexture()
		end

	},

	beat4sprite.Actor() .. {
		OnCommand=function(self) self:SetTexture( self:GetParent().Texture ):Center() end
	},

	textureFrame,
	
}