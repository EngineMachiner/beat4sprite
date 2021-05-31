
local params = ...

local scl = _screen.h/480

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		BGA_G.Stop( self, true )
	end,
	LoseFocusCommand=function(self)
		BGA_G.Stop( self )
	end
}

	BGA_G.DefPar( params )

	if not params.Beat then params.Beat = 1 end

	t[#t+1] = loadfile( "/BGAnimations/Resources/Scripts/TileTool.lua" )( params )

local length = 35

for i = 0,9 do
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			if i == 0 then
				params.Beat = params.Beat * BGA_G.GetDelay(self, params)[2]
			end
			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			BGA_G.PlayCmds(self, params)
		end,

		Def.Sprite{

			OnCommand=function(self)
				self:Load(params.File)
				BGA_G.SetStates(self, params)
				self:fadebottom(0.1)
				self:fadetop(0.1)
				self:croptop((i)*0.1)
				self:cropbottom((-i+8)*0.1)
				self:Center()
				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:queuecommand("Alpha")
			end,
			AlphaCommand=function(self)
				self:sleep((-i+9)*0.25*0.5*params.Beat)
					:smooth(params.Beat)
					:xy(SCREEN_CENTER_X-length,SCREEN_CENTER_Y-length)
					:smooth(params.Beat)
					:xy(SCREEN_CENTER_X+length,SCREEN_CENTER_Y+length)
					:queuecommand("Move")
			end,
			MoveCommand=function(self)
				self:smooth(params.Beat)
					:xy(SCREEN_CENTER_X-length,SCREEN_CENTER_Y-length)
					:smooth(params.Beat)
					:xy(SCREEN_CENTER_X+length,SCREEN_CENTER_Y+length)
					:queuecommand("Move")
			end
		},

		RainbowCommand=function(self)
			self:rainbow()
			self:effectperiod( 16 * BGA_G.GetDelay(self)[2] )
		end

	}
end

return t