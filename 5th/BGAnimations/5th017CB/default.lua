
local ScaleVar = _screen.h/480

return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,
	
	LoadActor("/BGAnimations/Backgrounds/5th/28 (stretch).png")..{
		OnCommand=cmd(Center;zoom,12;customtexturerect,0,0,12,12
			;cropbottom,0.2;croptop,0.2)
	},

	LoadActor("../Scripts/TileTool", "/BGAnimations/Sprites/5th/2 1x4.png", 0, 3, true )..{ 

		OnCommand=function(self)
				self:xy( 0 , 0 )
				BGA_TCV_OrL(self, 0, 1, true)
				self:hurrytweening( 2 )
		end

	}


}