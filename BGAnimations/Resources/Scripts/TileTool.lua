
local params = ...
local p = params

local t = Def.ActorFrame{}

local x, y = p.X_num, p.Y_num

-- Matrix description
local matrix = {
	math.abs(x[1]) + math.abs(x[2]) + 1,
	math.abs(y[1]) + math.abs(y[2]) + 1
}

-- Case: One sprite / row / column spacing and position
if x[1] == x[2] then 
	matrix[1] = 1	p.X_pos = p.X_pos + x[1]
	p.X_pos = p.X_pos * p.Spacing[1]
end

if y[1] == y[2] then 
	matrix[2] = 1	p.Y_pos = p.Y_pos + y[1]
	p.Y_pos = p.Y_pos * p.Spacing[2]
end

p.Matrix = matrix

-- Total number of sprites
p.Total = matrix[1] + matrix[2]

x[1] = - math.floor( ( matrix[1] - 1 ) * 0.5 )
x[2] = math.ceil( ( matrix[1] - 1 ) * 0.5 )

y[1] = - math.floor( ( matrix[2] - 1 ) * 0.5 )
y[2] = math.ceil( ( matrix[2] - 1 ) * 0.5 )

-- Sample
if p.Class == "Quad" then
	t[#t+1] = Def.Sprite{
		Name="Sample",
		InitCommand=function(self)
			self.Name = "Sample"
			BGA_G.ObjFuncs(self)
			self:Load(p.File)
			self:SetStates(p)
		end,
		OnCommand=function(self)
			self:diffusealpha(0)
			self:animate(false)
		end
	}
end

for i=x[1],x[2] do
	for j=y[1],y[2] do

		t[#t+1] = BGA_G.Frame() .. {
			OnCommand=function(self)
				BGA_G.ObjFuncs(self)
				local t2 = t
				local t = p.MultipleFiles
				if t and p.TCV[1] == 0 then
					if t[1] == t[2] * 2 + 1
					or t[1] == 1 then
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
						local parent = self:GetParent():GetParent()
						p.Sample = parent:GetChild("Sample")
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
				
				for k,f in pairs( classes ) do
					if p.Class == k then f(self) end
				end

			end,	

			OnCommand=function(self)

				BGA_G.ObjFuncs(self)
				
				self.UniqueEffect = true

				if p.Color ~= "RainbowFlash" then

					if p:IsCmd( "Rainbow" ) then
						self:rainbow()
						self:effectperiod( 16 * self:GetDelay() )
					elseif p:IsCmd( "Color" )
					and type(p.Color) == "table" then
						self:diffuse(p.Color[1])
					end

				else
					if p.Class == "Quad" then
						self.UpdateData = {}
						self:GetParent():SetUpdateFunction( function()
							BGA_G.Update(self, p)
						end )
					end
				end

				if p:IsCmd( "Blend" ) then
					self:blend( p.Blend )
				end

				if p:IsCmd( "Blink" ) then
					self:diffuseramp()
				end

				if p:IsCmd( "Rotation" ) then
					self:rotationx(p.Rot[1])
					self:rotationy(p.Rot[2])
					self:rotationz(p.Rot[3])
				end

				if p:IsCmd( "SpinFrame" ) then
					if math.abs(i) % 2 == 0 then
						self:rotationy(180)
					end
					if math.abs(j) % 2 == 0 then
						self:rotationx(180)
					end
				end

				if p.Class == "Sprite" then

					if p.Frames.Type then
						self.matrix = { i, j }
					end
					self:SetStates(p)

					if p:IsCmd( "StairsStates" )
					and not p.StopAtFrame then
						local n = self:InitState( { i+x[2], j+y[2] } )
						if p.Frames.Type == "RowSkip" then 
							local x = p.Sheet[1]
							n = self:InitState( { 1, (j+1)*x } )
						end
						self:setstate( n )
					end

					if p:IsCmd( "LineStates" ) then
						local n = self:GetNumStates()
						n = i % n
						self:setstate( n )
					end

					if p:IsCmd( "RandomDelays" ) then
						local n = self:GetNumStates()
						if n > 1 then
							local o = 100
							n = n * o
							self.IDelay = math.random(15,o-15) * 0.01
							self.IDelay = self.IDelay + math.random( n, n * 2 ) * 0.001
							self.IDelay = self.IDelay * 0.75
						end
					end

					if p.Static then 
						self:animate(false)
					end

				end

				if p.ZoomXYZ then
					self:zoomx( self:GetZoomX() * p.ZoomXYZ[1] )
					self:zoomy( self:GetZoomY() * p.ZoomXYZ[2] )
					self:zoomz( self:GetZoomZ() * p.ZoomXYZ[3] )
				end
				
				if p:IsCmd( "K2x2" ) then
					p.Spacing = { 0.5, 0.5 }
				end

				if p.Offset then
					self:effectoffset(p.Offset)
				end

				if p.Period then
					self:effectperiod(p.Period)
				end

				self:queuecommand("Pos")

			end,

			PosCommand=function(self)

				local w = self:GetZoomedWidth()
				local h = self:GetZoomedHeight()
				local pa = self:GetParent()

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

				local base_w = 640
				if p.ZoomXYZ then
					base_w = p.ZoomXYZ[1] >= 2 and SCREEN_WIDTH or base_w
				end

				local dir = {
					p.TCV[1] ~= 0 and p.TCV[1] / math.abs(p.TCV[1]) or 0,
					p.TCV[2] ~= 0 and p.TCV[2] / math.abs(p.TCV[2]) or 0
				}

				d = matrix[1] - ( base_w / w ) - math.ceil( matrix[1] * 0.5 )
				d = d - math.ceil( matrix[1] * 0.5 ) % 2
				d = d * 0.5 * dir[1]
				offsets[1] = offsets[1] - d

				d = matrix[2] - ( SCREEN_HEIGHT / h )
				d = d * 0.5 * dir[2]
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
				self:PlayCmds(p)

			end,

			MoveCommand=function(self)
				
				local TCV = {
					p.TCV[1] ~= 0 and 1 / p.TCV[1] or 0,
					p.TCV[2] ~= 0 and 1 / p.TCV[2] or 0
				}
			
				local pa = self:GetParent()
				local w = self:GetZoomedWidth()
				local h = self:GetZoomedHeight()

				local scl = h / SCREEN_HEIGHT
				local a = p.MultipleFiles

				if p:IsCmd("Mirror")
				and not p.Reversed then
					w = w * 2	h = h * 2
					scl = scl * 2
				end

				pa:Center()
				
				if p.ZoomXYZ then

					if p.ZoomXYZ[1] >= 2 then
						w = w - w * 0.25 * 1.25 * TCV[1]
						scl = scl * p.ZoomXYZ[1]
					end

					if p.ZoomXYZ[2] >= 2 then
						h = h + SCREEN_HEIGHT * TCV[2]
					end
						
				end
					
				local n = p.Class == "Quad" and p.Sample:GetNumStates()
				n = n or self:GetNumStates()

				scl = BGA_G.NoteSync and scl * 7.5 or scl

				local endpos = { 
					pa:GetX() + w * TCV[1],		pa:GetY() + h * TCV[2]
				}

				if params:IsCmd( "StairsStates" ) then
					scl = ( n + p.FrmDelay ) * 2
					n = p.StopAtFrame or n
					n = p.SkipFrame or n
					endpos = {
						pa:GetX() + w * n * TCV[1],
						pa:GetY() + h * n * TCV[2]
					}		
				end

				if a then

					local x = w * TCV[1]
					local y = h * TCV[2]

					local d = a[2] - a[1]

					local r = { 0, 0 }
					if p.Reversed then
						r = { - x * 1.167, - y * 1.167 }
					end

					local b = {
						pa:GetX() + x * ( d - 1 ) - r[1],
						pa:GetY() + y * d - r[2]
					}

					pa:xy( b[1],	b[2] )
						
					endpos[1] = endpos[1] + x * ( d - 1 ) - r[1] * 0.1425
					endpos[1] = endpos[1] + x * math.floor( a[2] * 0.5 )

					endpos[2] = endpos[2] + y * d - r[2] * 0.1425
					endpos[2] = endpos[2] + y * math.floor( a[2] * 0.5 )

					if p.Reversed and pa.R then
						pa:xy( endpos[1], endpos[2] )
						endpos = b
					end

					local v = p.Reversed and 0.5 or 1
					scl = scl * a[2] * v

				end

				-- Single File reverse case
				if not a and p.Reversed then

					local x = w * TCV[1]
					local y = h * TCV[2]

					local b = { pa:GetX(), pa:GetY() }

					if p.Reversed and pa.R then
						pa:xy( endpos[1], endpos[2] )
						endpos = b
					end

				end

				local d = self:GetDelay()
				scl = scl * d
					
				if p.SleepMove then
					local x = w * TCV[1]
					local y = h * TCV[2]
					for i=1,n do
						pa:sleep( n * d )
						pa:x( pa:GetX() + x * i / n )
						pa:y( pa:GetY() + y * i / n )
					end
				else
					local tween = p.HurryTweenBy
					tween = p.SkipFrame and tween * 2 / n or tween
					scl = scl * tween		pa:linear(scl)
					pa:xy( endpos[1], endpos[2] )
				end

				if p.Reversed then
					pa.R = pa.R or false		pa.R = not pa.R
				end

				pa:queuecommand("MoveEffect")
				pa:queuecommand("Move")

			end,

			MoveEffectCommand=function(self)
				local eo = self.EffectOffset
				if p:IsCmd( "Fade" ) and eo then
					local p = p.EffectOffset or 0
					eo = eo + p
					self:effectoffset(eo)
					self.EffectOffset = eo
				end
			end,

			FadeCommand=function(self)

				local n, d = 1, self:GetDelay()
				
				if p.TCV and ( p.TCV[1] ~= 0 or p.TCV[2] ~= 0 ) then
					n = p.Sample and p.Sample:GetNumStates()
					n = n or self:GetNumStates()
					n = p.StopAtFrame or n
				end

				local beat = p.HurryTweenBy + d
				beat = beat * n * p.FadePeriodBy * 2
				
				if p.Color  ~= "Rainbow" then
					p.Color = p.Color or {}
					p.Color[1] = p.Color[1] or Color.Black
					p.Color[2] = p.Color[2] or Color.White
					if p.Ramp then
						self:diffuseramp()
						self:effectcolor1(p.Color[1])
						self:effectperiod(beat)
					else
						self:diffuseshift()
						self:effectcolor1(p.Color[1])
						self:effectcolor2(p.Color[2])
						self:effectperiod(beat)
					end
				end

				local o = - p.Fade[1] * i - p.Fade[2] * j
				if p.Color == "Rainbow" then
					o = - p.Fade[1] * i - p.Fade[2] * j 
					o = o * beat / p.Total
				else
					beat = beat * 0.5
					o = o * beat * 2 / p.Total
				end
				self:effectperiod(beat)
				self:effectoffset(o)
				self.EffectOffset = o

			end,

			FourScreensCommand=function(self)

				local d = self:GetDelay()
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

			K2x2Command=function(self)

				self:zoom( self:GetZoom() * 0.5 )

				local w = self:GetZoomedWidth()
				self:x( self:GetX() - w * 0.5 )
				
				p.Mirror = { 1, 1 }
				self:queuecommand("Mirror")

			end,

			MirrorCommand=function(self)

				local x = self:GetRotationX()
				local y = self:GetRotationY()

				if i % 2 == 1 then
					self:rotationy( y + 180 * p.Mirror[1] )
				end

				if j % 2 == 1 then
					self:rotationx( x + 180 * p.Mirror[2] )
				end
		
				y = self:GetRotationY()

				if params:IsCmd( "MirrorY" )
				and j % 2 == 0 then
					self:rotationy( y + 180 * p.Mirror[1] )
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
				val = p.CrossType == 2 and x[2] or val

				if type(val) == "number" then
					val = val + 1
					for o = - val, val, 2 do

						if j == o + i then
							self:visible(false)
						end

						if p.CrossType == 2 then
							if math.abs(j) > 1 
							or j == 0 then 
								self:visible(false)
							end
						end

					end
				end

				if p.CrossType == "Y" then
					local x = p.Cross
					for i2=1,#x do
						if i == x[i2] then
							self:visible(false)
						end
					end
				end

			end,

			FramePerSpriteCommand=function(self)

				p.State = p.State or 0
				local n = self:GetNumStates()
				local s = i + 3 + j * p.Sheet[1]
				s = s + p.Sheet[2] + p.State
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

				local d = self:GetDelay()
				d = d * p.HurryTweenBy

				local val = p.SpinC and { 90, 0 } or { 0, 90 }

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
				local d = self:GetDelay()
				d = d * 2 * p.HurryTweenBy
				self:rotationy(0):linear(d)
			   	self:rotationy(90):linear(d)
			   	self:rotationy(0)
				self:queuecommand( "SpinX" )
		   	end,

			SpinYCommand=function(self)
				local d = self:GetDelay()
				d = d * 2 * p.HurryTweenBy
				self:rotationx(0):linear(d)
			  	self:rotationx(90):linear(d)
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
				local d = self:GetDelay()
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
				local d = self:GetDelay() * 2
				self:zoom(z):linear(d)
				self:zoom( z * 1.5 ):linear(d)
				self:zoom(z)
				self:queuecommand("Z2")
			end,

			AlphaCommand=function(self)

				if type(p.Alpha) == "number" then
					self:diffusealpha(p.Alpha)
					return
				end

				local d = self:GetDelay() * 2
				d = p.HurryTweenBy and p.HurryTweenBy * d or d
				self:diffusealpha(1):linear(d)
				self:diffusealpha(0):linear(d)
				self:diffusealpha(1)
				self:queuecommand("Alpha")

			end

		}

	end
end

t = not params.Remove and t

return Def.ActorFrame{ t }