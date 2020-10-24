local params = ...

local count = 0

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

for i = 1,18 do
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			PSX_BGA_Globals["BGA_PlayAllCommands"](self, params)
		end,

		LoadActor( params.File )..{
			OnCommand=function(self)

				PSX_BGA_Globals["BGA_FrameSelector"](self, params)

				self:Center()
					:effectclock('beat')
					:set_tween_uses_effect_delta(true)
					:blend("BlendMode_Normal")

				self:fadeleft( 0.025 )
				self:faderight( 0.025 )
				self:fadetop( 0.025 )
				self:fadebottom( 0.025 )

				self:bob():effectperiod(2*params.Beat):effectmagnitude( 8 + 4 * ( i - 1 ), 4 + 2 * ( i - 1 ), 0 )

				if i > 2 then
					local crop_val = 0.03125 * i
					self:croptop(crop_val)
					self:cropbottom(crop_val)
					self:cropleft(crop_val)
					self:cropright(crop_val)
				end

			end
		},

		RainbowCommand=function(self)
			self:rainbow():effectperiod(8)
		end
		
	}
end

return Def.ActorFrame{ t }