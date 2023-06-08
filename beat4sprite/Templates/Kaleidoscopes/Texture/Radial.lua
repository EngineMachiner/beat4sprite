
local p = ...

local texturePosition = p.TexturePosition

local t = beat4sprite.ActorFrame()

-- Create radial scrolling texture.

local frame = Def.ActorFrame { OnCommand=function(self) 
	self:xy( SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5 )
	self:GetParent():GetParent():queuecommand("Render")
end }

for i=-1,1 do

	frame[#frame+1] = beat4sprite.Sprite.colorQuad() .. { 
		OnCommand=function(self) self:xy( self:GetZoomedWidth() * i * 0.77, 0 ):MaskSource() end
	}

	if i == 0 then frame[#frame] = nil end
	
end

frame[#frame+1] = Def.Sprite {
	Texture = beat4sprite.Paths.Graphics .. "Global/Masks/Kaleidoscope.png",
	OnCommand=function(self) self:zoom( SCREEN_HEIGHT / self:GetZoomedHeight() ):MaskSource() end 
}

frame[#frame+1] = beat4sprite.Sprite.Square(p) .. { OnCommand=function(self)
    local x, y = 1, 1
    if p.Script:match("Comb.lua") then x, y = 0.25, 0.25 end
	self:zoom( self:GetZoom() * 1.5 ):customtexturerect( 0, 0, x, y )
    self:addimagecoords( texturePosition.x, texturePosition.y + self:GetHeight() * 0.5 )
    -- self:texcoordvelocity(0, 0) ?
	self:spin():effectmagnitude( 0, 0, p.Velocity.z ):MaskDest()
end }

t[#t+1] = Def.ActorFrameTexture {

    frame, InitCommand=function(self)
		self:EnableAlphaBuffer(true):EnableDepthBuffer(true)
		self:setsize( SCREEN_WIDTH, SCREEN_HEIGHT ):Create()
		p.Texture = self:GetTexture()
	end

}

local target = Def.ActorFrame{ OnCommand=function(self) p.Target = self end }

for i = 1, 2 do

	target[#target+1] = Def.Sprite{ RenderCommand=function(self) 
		self:SetTexture( p.Texture ):x(9):zoomx( self:GetZoomX() * 1.0625 )
        self:SetTextureFiltering(false):y(1.375)
		if i == 2 then self:rotationx(180):y(-1.375) end
	end }

end

t[#t+1] = target

return t