
local params = ...

local t = BGA_G.Frame()

BGA_G.BGSet(params):Load(t)

local num = params.Num or 20
local tween = params.HurryTweenBy
local fade = 0.0625 * 0.25

for i = 1,num do

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			BGA_G.ObjFuncs(self)
			if i == 1 then
				local d = self:GetDelay()
				tween = tween * d
			end
			self:PlayCmds(params)
		end,

		RainbowCommand=function(self)
			self:rainbow()
			self:effectperiod( 16 * self:GetDelay() )
		end,

		Def.Sprite{	
			
			OnCommand=function(self)

				self:Load( params.File )
				self:Center()
				BGA_G.ObjFuncs(self)
				self:SetStates(params)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)

				self:blend("BlendMode_Normal")

				self:fadeleft( fade )
				self:faderight( fade )
				self:fadetop( fade )
				self:fadebottom( fade )

				local mag = { 
					4 + 2 * ( i - 1 ), 
					2 + 1 * ( i - 1 ), 
					2 + 1 * ( i - 1 )
				}

				self:wag()
				self:effectperiod( 2 * tween )
				self:effectmagnitude( mag[1], mag[2], mag[3] )

				local c = 0.0125 * i * 1.5
				local r = SCREEN_WIDTH / SCREEN_HEIGHT
				self:croptop(c / r)
				self:cropbottom(c / r)
				self:cropleft(c)
				self:cropright(c)

			end
		}

	}
end

return t