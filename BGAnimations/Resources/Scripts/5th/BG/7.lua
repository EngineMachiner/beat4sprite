
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

local angle = 0
for i = 12,0,-1 do
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
				self:Load(params.File)
				self:Center()
				PSX_BGA_Globals["BGA_FrameSelector"](self, params)

				self:diffusealpha(0.875)
				self:fadeleft( 0.0125 * 2 )
				self:faderight( 0.0125 * 2 )
				self:cropleft( i * 0.087 )
				self:cropright( 1 - ( i + 1.6 ) * 0.087 )
				self:x(SCREEN_CENTER_X - math.round( 30 * math.cos(math.rad(angle))))
				self:y(SCREEN_CENTER_Y - math.round( 30 * math.sin(math.rad(angle))))
				self:sleep((-i+12)*params.Beat/8)
				self:queuecommand("Repeat")

			end,
			RepeatCommand=function(self)

				if angle > 360 then
					angle = angle - 360
				end

				self:smooth(params.Beat)
					:x(SCREEN_CENTER_X - math.round( 30 * math.cos(math.rad(angle))))
					:y(SCREEN_CENTER_Y - math.round( 30 * math.sin(math.rad(angle))))
					:queuecommand("Repeat")
				angle = angle + 4 + i * 1.5

			end
		},

		RainbowCommand=function(self)
			self:rainbow():effectperiod(8)
		end

	}
end

return t