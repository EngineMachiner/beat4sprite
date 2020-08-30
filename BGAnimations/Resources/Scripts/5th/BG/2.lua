local params = ...
local ScaleVar = _screen.h/480
local once = true


local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end

}

	BGA_NoParams( params )

	if not params.Beat then params.Beat = 1 end

	t[#t+1] = LoadActor( "../../TileTool.lua", params )..{}

local length = 35

for i = 0,9 do
	t[#t+1] = Def.ActorFrame{

		GainFocusCommand=function(self)
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_PlayAllCommands(self, params)
		end,

		Def.Sprite{

			GainFocusCommand=function(self)
				self:Load(params.File)
				BGA_FrameSelector(self, params)
				self:fadebottom(0.1)
				self:fadetop(0.1)
				self:croptop((i)*0.1)
				self:cropbottom((-i+8)*0.1)
				self:Center()
				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:playcommand("Alpha")
			end,
			AlphaCommand=function(self)
				if once then
					if i == 9 then 
						once = false
					end
					self:sleep((-i+9)*0.25*0.5*params.Beat)
						:smooth(params.Beat)
						:xy(SCREEN_CENTER_X-length,SCREEN_CENTER_Y-length)
						:smooth(params.Beat)
						:xy(SCREEN_CENTER_X+length,SCREEN_CENTER_Y+length)
						:queuecommand("Alpha")
				else
					self:smooth(params.Beat)
						:xy(SCREEN_CENTER_X-length,SCREEN_CENTER_Y-length)
						:smooth(params.Beat)
						:xy(SCREEN_CENTER_X+length,SCREEN_CENTER_Y+length)
						:queuecommand("Alpha")
				end
			end
		},

		RainbowCommand=function(self)
			self:rainbow():effectperiod(8)
		end

	}
end

return t