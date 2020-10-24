local params = ...

local t = Def.ActorFrame{

	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end

}

	PSX_BGA_Globals["BGA_NoParams"]( params )

	if not params.Beat then params.Beat = 1 end

	t[#t+1] = LoadActor( "../../TileTool.lua", params )..{}


for i = 0,9 do

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)
		end,

		RainbowCommand=function(self)
			self:rainbow():effectperiod(8)
		end,

		Def.Sprite{
			OnCommand=function(self)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:Center()
				self:Load( params.File )
				self:diffusealpha(0.75)
				PSX_BGA_Globals["BGA_FrameSelector"](self, params)

				local mag = 5
				local val = ( i % 2 ) * mag * 2 - mag
				self:bob():effectperiod(1*params.Beat):effectmagnitude(val,0,0)

				self:fadetop( 0.0125 )
				self:fadebottom( 0.0125 )

				self:croptop( i * 0.1 )
				self:cropbottom( 1 - ( i + 1.2 ) * 0.1 )

			end

		}

	}

end

return Def.ActorFrame{ t }