local params = ...

local t = BGA_G.Frame()

BGA_G.BGSet(params):Load(t)

local tween = params.HurryTweenBy
local num = params.Num or 20
local fade = 0.0625 * 0.125

for i = 1,num do
	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			BGA_G.ObjFuncs(self)
			if i == 3 then
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

				self:Load(params.File)

				self:Center()
				BGA_G.ObjFuncs(self)
				self:SetStates(params)

				self:fadeleft(fade)
				self:fadetop(fade)
				self:fadebottom(fade)
				self:faderight(fade)

				local amp = 2
				local c = i * amp * 0.0125
				local r = SCREEN_WIDTH / SCREEN_HEIGHT
				self:croptop(c / r)
				self:cropbottom(c / r)
				self:cropleft(c)
				self:cropright(c)

				self:diffusealpha(0.75)
				self:blend("BlendMode_Normal")

				local tween = tween * 2
				self:pulse():effectoffset(0.125)
				self:effectperiod(tween)
				self:effectmagnitude( 1, 1 + i * 0.25 / ( num * 0.5 ), 0 )

			end
		}
		
	}
end

return Def.ActorFrame{ t }