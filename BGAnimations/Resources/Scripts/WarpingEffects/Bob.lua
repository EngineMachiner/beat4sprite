
local params = ...

local t = BGA_G.Frame()

BGA_G.BGSet(params):Load(t)

local num = params.Num or 18
local tween = params.HurryTweenBy
params.Type = params.Type or 1

local cmds = {
	"Type1",	"Type2",
	"Type3"
}

local fade = 0.0625 * 0.25

for i = 1,num do
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			BGA_G.ObjFuncs(self)
			if i == 1 then
				local d = self:GetDelay(2)
				tween = tween * d
			end
			self:PlayCmds(params)
		end,

		RainbowCommand=function(self)
			self:rainbow()
			self:effectperiod( 16 * self:GetDelay(2) )
		end,

		Def.Sprite{	
			
			OnCommand=function(self)
				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:Load(params.File):Center()
				BGA_G.ObjFuncs(self)
				self:SetStates(params)
				self:queuecommand(cmds[params.Type])
			end,

			Type1Command=function(self)

				self:blend("BlendMode_Normal")

				self:fadeleft(fade)
				self:faderight(fade)
				self:fadetop(fade)
				self:fadebottom(fade)

				local amp = 1.25
				local c = i * amp * 0.0125
				local r = SCREEN_WIDTH / SCREEN_HEIGHT
				self:croptop(c / r)
				self:cropbottom(c / r)
				self:cropleft(c)
				self:cropright(c)

				self:bob()
				self:effectperiod( 2 * tween )

				local i = 8 + 4 * ( i - 4 ) / ( amp * 1.25 )
				local j = 4 + 2 * ( i - 4 ) / ( amp * 1.25 )
				self:effectmagnitude( i, j, 0 )

			end,

			Type2Command=function(self)

				self:diffusealpha(0.75)

				local mag = 2
				local val = ( i % 2 ) * mag * 2 - mag
				self:bob():effectperiod(tween)
				self:effectmagnitude(val,0,0)

				self:fadetop( fade )
				self:fadebottom( fade )

				self:croptop( i / num )
				self:cropbottom( 1 - ( i + 1.2 ) / num )

			end,

			Type3Command=function(self)

				local mag = 4
				local val = ( i % 2 ) * mag * 2 - mag
				self:bob():effectperiod(tween)
				self:effectmagnitude(0,val,0)

				self:fadeleft( fade )
				self:faderight( fade )

				self:cropleft( i / num )
				self:cropright( 1 - ( i + 1.2 ) / num )

			end

		}
		
	}
end

return Def.ActorFrame{ t }