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


for i = 0,12 do

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)
		end,

		Def.Sprite{
			OnCommand=function(self)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:Center()
				self:Load( params.File )
				self:diffusealpha(0.75)
				PSX_BGA_Globals["BGA_FrameSelector"](self, params)

				local mag = 2.5
				local val = ( i % 2 ) * mag * 2 - mag
				self:bob():effectperiod(params.Beat):effectmagnitude(0,val,0)

				self:fadeleft( 0.0125 * 2 )
				self:faderight( 0.0125 * 2 )

				self:cropleft( i * 0.087 )
				self:cropright( 1 - ( i + 1.2 ) * 0.087 )

			end

		}

	}

end

return Def.ActorFrame{ t }