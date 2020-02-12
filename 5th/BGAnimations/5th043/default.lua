
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end
	
}

for i = -1,1 do
	t[#t+1] = Def.Sprite{
		OnCommand=function(self)
			self:Load( "/BGAnimations/Sprites/5th/clothes 5x4.png", "stretch" )
			self:Center()
			self:SetWidth(640)
			self:SetHeight(480)
			self:x(self:GetX()+self:GetWidth()*i)
			self:customtexturerect(0,0,1,1)
		end
	}
end

	t[#t+1] = Def.Quad{
		OnCommand=function(self)
			self:Center()
			self:zoomto( SCREEN_WIDTH, SCREEN_HEIGHT )
			self:blend("BlendMode_InvertDest")
			self:diffuse(Color.White)
		end
	}

for i=1,4 do
	t[#t+1] = LoadActor("../Scripts/StaticSprite","/BGAnimations/Sprites/5th/clothes 5x4.png", 1+2*(i-1), 5*(i-1), i%2 )..{
		OnCommand=function(self) 
			self:playcommand("Pulse")
				:playcommand("NoAnimation")
				:playcommand("Rainbow")
		end
	}
end 

return Def.ActorFrame{ t }