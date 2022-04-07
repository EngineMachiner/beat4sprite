
local params = ...

local t = BGA_G.Frame()

BGA_G.BGSet(params):Load(t)

params.Type = params.Type or 1

local cmds = {
	"Type1",	"Type2"
}

local tween = params.HurryTweenBy
local num = params.Num or 20
local slices = 360 / num
local fade = 0.0625 * 0.25

local function GetPos(self, i)

	if self.Angle > 360 then
		self.Angle = self.Angle - 360
	end

	local x = 30 * math.cos( math.rad(self.Angle) )
	x = math.ceil( x )

	local y = 30 * math.sin( math.rad(self.Angle) )
	y = math.ceil( y )

	return ( { x, y } )[i]

end

for i = num, 1, -1 do

	local size = 1.6 / num
	local val = i / num - 1 / num
	local val2 = 1 - val - size
	if val2 < 0 then val2 = 0 end

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)
			BGA_G.ObjFuncs(self)
			if i == num then
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

			Type1Command=function(self)
				self:croptop( val )
				self:cropbottom( val2 )
				self:fadebottom(fade)
				self:fadetop(fade)
			end,

			Type2Command=function(self)
				self:cropleft( val )
				self:cropright( val2 )
				self:fadeleft(fade)
				self:faderight(fade)
			end,

			OnCommand=function(self)

				self:effectclock('beat')
				self:set_tween_uses_effect_delta(true)
				self:Center()
				BGA_G.ObjFuncs(self)
				self.GetPos = GetPos
				self:SetStates(params)
				
				self:queuecommand(cmds[params.Type])

				self.Angle = 0
				if params.Skipping then
					self.Angle = num * ( i - 1 ) * 0.5
				end

				self:x( SCREEN_CENTER_X - self:GetPos(1) )
				self:y( SCREEN_CENTER_Y - self:GetPos(2) )

				if not params.Skipping then
					local sleep = ( num - i ) * tween
					self:sleep( sleep / num )
					self:queuecommand("Repeat")
				else
					self:queuecommand("Skipping")
				end

			end,
			SkippingCommand=function(self)

				self.Angle = self.Angle + 90
				self:x( SCREEN_CENTER_X - self:GetPos(1) )
				self:y( SCREEN_CENTER_Y - self:GetPos(2) )
				self:linear( self:GetFullDelay(params) * 0.25 )
				self:sleep( self:GetFullDelay(params) * 0.75 )
				self:queuecommand("Skipping")

			end,
			RepeatCommand=function(self)

				self.Angle = self.Angle + slices
				self:linear(tween * 2 / num)
				self:x( SCREEN_CENTER_X - self:GetPos(1) )
				self:y( SCREEN_CENTER_Y - self:GetPos(2) )
				self:queuecommand("Repeat")
					
			end
			
		}

	}
end

return Def.ActorFrame{ t }