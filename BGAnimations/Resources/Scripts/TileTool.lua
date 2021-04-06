
local params = ...
local p = params

local t = Def.ActorFrame{}

-- Set default values in case they are missing
BGA_G.DefPar( p )

local x, y = p.X_num, p.Y_num

-- Matrix description
local matrix = {
	math.abs(x[1]) + math.abs(x[2]) + 1,
	math.abs(y[1]) + math.abs(y[2]) + 1
}
p.Matrix = matrix

-- Total number of sprites
p.Total = matrix[1] + matrix[2]

-- Sample
if p.Class == "Quad" then
	t[#t+1] = Def.Sprite{
		Name="Sample",
		InitCommand=function(self)
			self:Load(p.File)
			BGA_G.SetStates(self, p)
		end,
		OnCommand=function(self)
			self:diffusealpha(0) 
			self:animate(false)
		end
	}
end

x[1] = - math.floor( ( matrix[1] - 1 ) * 0.5 )
x[2] = math.ceil( ( matrix[1] - 1 ) * 0.5 )

y[1] = - math.floor( ( matrix[2] - 1 ) * 0.5 )
y[2] = math.ceil( ( matrix[2] - 1 ) * 0.5 )

for i=x[1],x[2] do
	for j=y[1],y[2] do
		
		t[#t+1] = Def.ActorFrame{
			GainFocusCommand=function(self)
				BGA_G.Stop( self, true )
			end,
			LoseFocusCommand=function(self)
				BGA_G.Stop( self )
			end,
			OnCommand=function(self)
				self:effectclock("beat")
				self:set_tween_uses_effect_delta(true)
				local t = p.MultipleFiles
				if t and p.TCV[1] == 0 then
					if t[1] == t[2] * 2 + 1
					or t[1] == 1 then
						self:stoptweening()
						self:RemoveAllChildren()
						self = nil
					end
				end
			end
		}

		local a = t[#t]

		a[#a+1] = Def[p.Class]{

			InitCommand=function(self)
			
				local classes = {

					Quad = function(self)
						p.Sample = self:GetParent():GetParent():GetChild("Sample")
						local s = p.Sample
						self:SetSize( s:GetZoomedWidth(), s:GetZoomedHeight() )
					end,

					Sprite = function(self)
						if p.Texture then
							self:SetTexture(p.Texture)
						else
							self:Load(p.File)
						end
					end,

				}
				
				for k,v in pairs( classes ) do
					if p.Class == k then
						v(self)
					end
				end

			end,	

			OnCommand=function(self)

				self.UniqueEffect = true
				self:effectclock("beat")
				self:set_tween_uses_effect_delta(true)

				if BGA_G.IsCmd( p, "Rainbow" ) then
					self:rainbow()
					self:effectperiod( 16 * BGA_G.GetDelay(self)[2] )
				elseif BGA_G.IsCmd( p, "Color" ) then
					self:diffuse(p.Color)
				end

				if BGA_G.IsCmd( p, "Blend" ) then
					p.Blend = p.Blend or "BlendMode_Modulate"
					self:blend( p.Blend )
				end

				if BGA_G.IsCmd( p, "Blink" ) then
					self:diffuseramp():effectperiod(1)
				end

				if BGA_G.IsCmd( p, "Rotation" ) then
					self:rotationx(p.Rot[1])
					self:rotationy(p.Rot[2])
					self:rotationz(p.Rot[3])
				end

				if BGA_G.IsCmd( p, "SpinFrame" ) then
					if math.abs(i) % 2 == 0 then
						self:rotationy(180)
					end
					if math.abs(j) % 2 == 0 then
						self:rotationx(180)
					end
				end

				if p.Class == "Sprite" then
					
					if p.Frames["Type"] then
						self.matrix = { i, j }
					end
					BGA_G.SetStates(self, p)

					if BGA_G.IsCmd( p, "StairsStates" )
					and not p.StopAtFrame then
						local n = BGA_G.InitState( self, { i+x[2], j+y[2] } )
						if p.Frames["Type"] == 2 then 
							local x = p.Sheet[1]
							n = BGA_G.InitState( self, { 1, (j+1)*x } )
						end
						self:setstate( n )
					end

					if BGA_G.IsCmd( p, "LineStates" ) then
						local n = self:GetNumStates()
						n = i % n
						self:setstate( n )
					end

					if BGA_G.IsCmd( p, "RandomDelays" ) then
						local n = self:GetNumStates()
						if n > 1 then
							n = n * 100
							self.IDelay = math.random(15,100-15) * 0.01
							self.IDelay = self.IDelay + math.random( n, n * 2 ) * 0.001
							self.IDelay = self.IDelay * 0.75
						end
					end

					if p.Static then 
						self:animate(false)
					end

				end
				
				self:queuecommand("Pos")

			end,

			PosCommand=function(self)

				local w = self:GetZoomedWidth()
				local h = self:GetZoomedHeight()
				local pa = self:GetParent()

				pa:stoptweening()
				pa:Center()

				local offsets = { 0, 0 }

				-- If the number of sprites is odd

				local d = ( matrix[1] + 1 ) % 2 
				d = - d * 0.5
				offsets[1] = offsets[1] + d
				
				d = ( matrix[2] + 1 ) % 2 
				d = - d * 0.5
				offsets[2] = offsets[2] + d

				-- If Move cmd is active

				local dir = p.TCV[1] ~= 0 and p.TCV[1] / math.abs(p.TCV[1]) or 0
				d = matrix[1] - ( 640 / w ) - math.ceil( matrix[1] * 0.5 )
				d = d - math.ceil( matrix[1] * 0.5 ) % 2
				d = d * 0.5 * dir
				offsets[1] = offsets[1] - d

				dir = p.TCV[2] ~= 0 and p.TCV[2] / math.abs(p.TCV[2]) or 0
				d = matrix[2] - ( SCREEN_HEIGHT / h )
				d = d * 0.5 * dir
				offsets[2] = offsets[2] - d

				------------------------------

				local x = w * ( i + offsets[1] )
				x = x * p.Spacing[1]
				x = x + w * p.X_pos

				local y = h * ( j + offsets[2] )
				y = y * p.Spacing[2]
				y = y + h * p.Y_pos

			 	self:xy( x, y )
				self.InitPos = { self:GetX(), self:GetY() }
				BGA_G.PlayCmds(self, p)

			end,

			MoveCommand=function(self)
				
				local pa, c = self:GetParent()
				for i=1,#p.TCV do
					if p.TCV[i] ~= 0 then 
						c = true
					end
				end

				if c then 
					
					p.TCV[1] = p.TCV[1] ~= 0 and 1 / p.TCV[1] or 0
					p.TCV[2] = p.TCV[2] ~= 0 and 1 / p.TCV[2] or 0

					local w = self:GetZoomedWidth()
					local h = self:GetZoomedHeight()
					local n = p.Class == "Quad" and p.Sample:GetNumStates()
					n = n or self:GetNumStates()

					pa:Center()

					local scl = h / SCREEN_HEIGHT
					scl = BGA_G.NoteSync and scl * 7.5 or scl

					local endpos = { 
						pa:GetX() + w * p.TCV[1],
						pa:GetY() + h * p.TCV[2]
					}

					if BGA_G.IsCmd( params, "StairsStates" ) then
						scl = ( n + p.FrmDelay ) * 2
						n = p.StopAtFrame or n
						endpos = {
							pa:GetX() + w * n * p.TCV[1],
							pa:GetY() + h * n * p.TCV[2]
						}		
					end

					local a = p.MultipleFiles
					if a then

						local x = w * p.TCV[1]
						local y = h * p.TCV[2]

						local d = a[2] - a[1]

						pa:x( pa:GetX() + x * d )
						pa:y( pa:GetY() + y * d )

						endpos[1] = endpos[1] + x * d
						endpos[1] = endpos[1] + x * math.floor( a[2] * 0.5 )

						endpos[2] = endpos[2] + y * d
						endpos[2] = endpos[2] + y * math.floor( a[2] * 0.5 )

						scl = scl * a[2]

					end

					local d = BGA_G.GetDelay(self, p)[2]
					scl = scl * d
					
					if p.SleepMove then
						local x = w * p.TCV[1]
						local y = h * p.TCV[2]
						for i=1,n do
							pa:sleep( n * d )
							pa:x( pa:GetX() + x * i / n )
							pa:y( pa:GetY() + y * i / n )
						end
					else
						pa:linear(scl)
						pa:xy( endpos[1], endpos[2] )
						pa:hurrytweening( p.HurryTweenBy )
						pa:queuecommand("MoveEffect")
					end

					pa:queuecommand("Move")

				end

			end,

			MoveEffectCommand=function(self)
				if BGA_G.IsCmd( p, "Fade" ) then
					local p = p.EffectOffset or 1
					self.EffectOffset = self.EffectOffset + p
					self:effectoffset(self.EffectOffset)
				end
			end,

			FadeCommand=function(self)

				p.Fade = p.Fade or { 1, 1 }
				p.FadePeriodBy = p.FadePeriodBy or 1

				local n = p.Sample and p.Sample:GetNumStates()
				local d = BGA_G.GetDelay(self, p)[2]
				
				n = n or self:GetNumStates()
				n = p.StopAtFrame or n

				local beat = p.HurryTweenBy + d
				beat = beat * n * p.FadePeriodBy

				if type(p.Color) == "table" then
					if p.Ramp then
						self:diffuseramp()
						self:effectcolor1(p.Color)
						self:effectperiod(beat)
					else
						p.Color = p.Color or Color.Black
						p.Color2 = p.Color2 or Color.White
						self:diffuseshift()
						self:effectcolor1(p.Color)
						self:effectcolor2(p.Color2)
						self:effectperiod(beat)
					end
				end

				local o
				if p.Fade then
					if p.Color == "Rainbow" then
						self:rainbow()
						o = - p.Fade[1] * i - p.Fade[2] * j 
						o = o * beat / p.Total
					else
						beat = beat * 0.5
						o = - p.Fade[1] * i - p.Fade[2] * j
						o = o * beat * 2 / p.Total
					end
					self:effectperiod(beat)
					self:effectoffset(o)
					self.EffectOffset = o
				end

			end,

			FourScreensCommand=function(self)

				local d = BGA_G.GetDelay(self, p)[2]
				if j == 0 then

					-- Repeat twice
					for p=1,2 do
						self:diffusealpha(1)
						self:sleep(d)
						self:diffusealpha(0)
						self:sleep(d)
					end

				elseif math.abs(j) == 1 then

					self.w = self.w or self:GetZoomedWidth()
					self.h = self.h or self:GetZoomedHeight()
					self.Zoom = self.Zoom or self:GetZoom()

					local w = self.w
					local h = self.h

					local endpos = {}
					endpos[1] = self.InitPos[1] - w * i * 0.5 + w * 0.25
					endpos[1] = endpos[1]
					endpos[2] = self.InitPos[2] - h * j * 0.75
					endpos[2] = endpos[2]

					self:x( self.InitPos[1] )
					self:y( self.InitPos[2] - h * 0.75 * j )
					self:rotationx( ( j - 1 ) * 90 + 60 )
					self:zoom(self.Zoom)

					self:diffusealpha(0)
					self:sleep(d)
					self:diffusealpha(1)
					self:sleep(d)
					self:diffusealpha(0)
					self:sleep(d)
					self:diffusealpha(1)
					
					self:rotationx(0)
					self:zoom( self.Zoom * 0.5 )
					self:rotationx( 90 * ( j + 1 ) )
			 		self:xy( endpos[1], endpos[2] )

			 		self:sleep(d)

				end

				self:queuecommand("FourScreens")

			end,

			MirrorCommand=function(self)

				if p.BGMirror then

					if i ~= 0 then
						self:rotationy( 180 * i )
					end

					if p.MultipleFiles then

						if p.MultipleFiles[1] % 2 == 0
						and p.TCV[1] ~= 0 then
							self:rotationy( 180 )
						end

						if p.MultipleFiles[1] % 2 == 0
						and p.TCV[2] ~= 0 then
							self:rotationx( 180 )
						end

					end

				else

					if i % 2 == 0 and j % 2 == 1 then
						self:rotationx( 180 )
					elseif i % 2 == 1 and j % 2 == 0 then
						self:rotationy( 180 )
					elseif i % 2 == 1 and j % 2 == 1 then 
						self:rotationy( 180 )
						self:rotationx( 180 )
					end

				end
		
				if BGA_G.IsCmd( params, "MirrorY" )
				and j % 2 == 0 then
					self:rotationy(180)
				end				

			end,

			AlignCommand=function(self)

				local w = self:GetZoomedWidth()
				local h = self:GetZoomedHeight()

				if i % 2 == 1 then
					self:visible(false)
				end

				if math.abs(i) > 0 then
					local x = - w * 0.75 * i / math.abs(i)
					self:x( self:GetX() + x )
				end

				if math.abs(j) > 0 then
					local y = h * 0.5 * j / math.abs(j)
					self:y( self:GetY() + y )
				end

			end,

			CrossCommand=function(self)
				
				local val = p.Cross or x[2]
				val = p.CType == 2 and x[2] or val
				val = val + 1

				for o=-val,val,2 do

					if j == o + i then
						self:visible(false) 
					end

					if p.CType == 2 then
						if math.abs(j) > 1 
						or j == 0 then 
							self:visible(false)
						end
					end

				end

			end,

			FramePerSpriteCommand=function(self)

				p.State = p.State or 0
				local n = self:GetNumStates()
				local s = i + 3 + j * p.Sheet[1] + p.Sheet[2] + p.State
				s = p.Animate and p.State or s

				while s > n - 1 do
					s = s - n
				end

				while s < 0 do
					s = s + n
				end

				if not p.Animate then
					self:animate(false)
				end
				self:setstate(s)

			end,

			SpinXYCommand=function(self)

				local d = BGA_G.GetDelay(self)[2] * 0.25
				local val = p.SpinC and { 90, 0 } or { 0, 90 }
				SCREENMAN:SystemMessage(d)
				self:rotationx(0)
				self:rotationy(val[1]):linear(d)
				self:rotationy(val[2]):linear(d)
				self:rotationy(val[1]):sleep(0)

				self:rotationx(val[1])
				self:rotationy(0):linear(d)
				self:rotationx(val[2]):linear(d)
				self:rotationx(val[1]):sleep(0)

				self:queuecommand( "SpinXY" )

			end,

			SpinXCommand=function(self)
				self:rotationy(0):linear(2)
			   	self:rotationy(90):linear(2)
			   	self:rotationy(0)
				self:queuecommand( "SpinX" )
		   	end,

			SpinYCommand=function(self)
				self:rotationx(0):linear(2)
			  	self:rotationx(90):linear(2)
			  	self:rotationx(0)
				self:queuecommand( "SpinY" )
		   	end,

			SplitCommand=function(self)
				if i == 0 then self:diffuse(Color.Red) end
				self:xy( self.InitPos[1], self.InitPos[2] )
				self:linear(4)
				self:x( self:GetX() + self:GetZoomedWidth() * i )
				self:y( self:GetY() + self:GetZoomedHeight() * j )
				self:queuecommand("Split")
			end,

			ZWriteCommand=function(self)
				if i == x[1]
				and j == y[1] then 
					self:clearzbuffer(true)
				end
				self:zwrite(true)
				self:blend("BlendMode_NoEffect")
				-- This blend is necessary
			end,

			ZTestCommand=function(self)
				self:ztest(true)
			end,

			PulseCommand=function(self)
				local z = self:GetZoom()
				local d = BGA_G.GetDelay(self)[2]
				self:smooth(d):zoom(0)
				self:smooth(d):zoom(z)
				self:queuecommand("Pulse")
			end,

			ZoominCommand=function(self)
				if i % 2 == 0 then self:sleep(2) end
				self:queuecommand("Z2")
			end,

			Z2Command=function(self)
				local z = self:GetZoom()
				local d = BGA_G.GetDelay(self)[2] * 2
				self:zoom(z):linear(d)
				self:zoom( z * 1.5 ):linear(d)
				self:zoom(z)
				self:queuecommand("Z2")
			end,

			AlphaCommand=function(self)
				local d = BGA_G.GetDelay(self)[2] * 2
				self:diffusealpha(1):linear(d)
				self:diffusealpha(0):linear(d)
				self:diffusealpha(1)
				self:queuecommand("Alpha")
			end

		}

	end
end

return Def.ActorFrame{ t }