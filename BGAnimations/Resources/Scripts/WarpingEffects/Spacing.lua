
local params = ...

local t = BGA_G.Frame()

BGA_G.BGSet(params):Load(t)

local num = params.Num or 20
local mag = params.Mag or 35
local dir = params.Dir or { 1, 1 }

local tween = params.HurryTweenBy
local fade = 0.0625 * 0.5
params.Type = params.Type or 1

for i = 1,num do

	local size = 2.125 / num
	local val = i / num - 1 / num
	local val2 = 1 - val - size
	if val2 < 0 then val2 = 0 end

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			BGA_G.ObjFuncs(self)
			if i == 1 then
				local d = self:GetFullDelay(params)
				tween = tween * d
			end
			self:PlayCmds(params)
		end,

		RainbowCommand=function(self)
			self:rainbow()
			self:effectperiod( 16 * self:GetFullDelay(params) )
		end,

		Def.Sprite{

			Texture = params.File,
			OnCommand=function(self)

				self.pos = { SCREEN_CENTER_X, SCREEN_CENTER_Y }

				BGA_G.ObjFuncs(self)
				self:SetStates(params)
				self:Center()
				
				self:fadebottom(fade)
				self:fadetop(fade)
				self:croptop(val)
				self:cropbottom(val2)

				local sleep = ( num - i ) * tween
				self:sleep( sleep / num )
				self:queuecommand("Move")

			end,

			MoveCommand=function(self)
				local pos = self.pos
				self:smooth(tween):x( pos[1] + dir[1] * mag )
				self:y( pos[2] + dir[2] * mag )
				self:smooth(tween):x( pos[1] - dir[1] * mag )
				self:y( pos[2] - dir[2] * mag )
				self:queuecommand("Move")
			end

		}

	}
end

return Def.ActorFrame{ t }