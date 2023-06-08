
local params = ...							local p = params

local textureFrame = Def.ActorFrame{}		local t = textureFrame

local zoomY = p.ZoomXYZ and p.ZoomXYZ.y or SCREEN_HEIGHT * 0.05

-- Scrolling texture
local scrolling = p:copy {
	Columns = 1,		Scroll = { 0, -1 },				Reversed = true,
	Mirror = true,		ZoomXYZ = { 1, zoomY, 1 },		Illusion = 'Y',
	Script = "Tile"
}

scrolling:Load(t)

-- Mask
t[#t+1] = beat4sprite.Sprite.colorQuad() .. {

	OnCommand=function(self)
		self:y( - SCREEN_HEIGHT * 0.5 ):MaskSource(true)
		self:queuecommand("Repeat")
	end,

	RepeatCommand=function(self)
		local y = SCREEN_HEIGHT * 0.5
		local t = self:getTweenRate() * 8
		self:linear(t):y(y):linear(t):y(-y)
		self:queuecommand("Repeat")
	end
	
}

t[#t+1] = beat4sprite.Sprite.bgTemplate(p):Load() .. { 
	OnCommand=function(self) self:MaskDest() end
}

return beat4sprite.ActorFrame() .. {

	Def.ActorFrameTexture{

		textureFrame,
		InitCommand=function(self)
			self:EnableDepthBuffer(true)
			self:SetSize( SCREEN_WIDTH, SCREEN_HEIGHT )
			self:Create()			self:GetParent().Texture = self:GetTexture()
		end

	},

	beat4sprite.Actor() .. {
		OnCommand=function(self) self:SetTexture( self:GetParent().Texture ):Center() end
	}
	
}