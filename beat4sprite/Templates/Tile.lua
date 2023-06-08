
local t = Def.ActorFrame{}		local params = ...		local p = params

local mirror = p.Mirror
local rangeX, rangeY = p.Columns, p.Rows		local numberOf = p.numberOf

if p.hasTexture then for k, range in pairs { rangeX, rangeY } do
	range[1] = range[1] - 1			range[2] = range[2] + 1
end end

-- Mostly frame animation stuff.
local function onSprite( self, range )

	if p.Class ~= "Sprite" then return end

	local matrix = self.posMatrix		local i, j = matrix.x, matrix.y

	local n = self:GetNumStates()		local type = p.States.Types
	
	for k,v in ipairs(type) do

		if v == "Stairs" then

			local states = { i + range.x[2], j + range.y[2] }

			if b then states = { 1, ( j + 1 ) * p.Sheet.x } end

			n = self:getStairsState( states )
			self:setstate( n )

		end

		if v == "Line" then self:setstate( i % self:GetNumStates() ) end

	end

end

-- Create template for quads.
if p.Class == "Quad" then

	t[#t+1] = Def.ActorFrame { beat4sprite.Actor() .. {

		InitCommand=function(self) p.Sample = self end,
		
		OnCommand=function(self)
			self:Load(p.File):init():visible(false):animate(false)
			self:GetParent():GetParent():playcommand("Quad")
		end

	} }

end

-- Cross cases

local crossHide = {}
local cross = p.Cross

if cross then

	local by, type = cross.By or numberOf.x, cross.Type
	local offset = cross.Off or 0

	if type == 3 or type == 4 then

		local index, add = 0, true
		if type == 4 then add = false end

		for i = 1 + offset, numberOf.items + offset do
			index = index + 1
			if index > by then add = not add		index = 1 end
			if add then crossHide[i] = true end
		end

	end

end

local function setEffectColors(self)

	local colors = p.EffectColors
	if colors then self:effectcolor1( colors[1] ):effectcolor2( colors[2] ) end

end

local scrollTypes = { "Stairs", "Line", "XY-Skip" }

-- Check for animations that scroll by the number of states.
local function isAnimationScrollType()

	for k,v in ipairs(scrollTypes) do if p:hasAnimationType(v) then return true end end

	return false

end

local index = 0
for j = rangeY[1], rangeY[2] do			for i = rangeX[1], rangeX[2] do

	t[#t+1] = beat4sprite.ActorFrame()	.. { beat4sprite.Actor(p) .. {

		InitCommand=function(self)

			local parent = self:GetParent()
			if p.Reversed then parent.onReverse = false end

			index = index + 1		self.Index = index

			self:playcommand("AddSetActors")

		end,

		AddSetActorsCommand=function(self)

			if not p.FileData or self.Index > 1 then return end

			-- Sprite that are just for width and height reference!
			local data, set = p.FileData, p.Set
			set[data.index] = self

		end,

		AddSetActorsSizeCommand=function(self)

			if not p.FileData or self.Index > 1 then return end

			-- These are just for width and height reference!
			local data, set = p.FileData, p.Set

			-- Get sum of widths and heights.
			if data.index ~= data.numberOf then return end

			local w, h = 0, 0

			for _,sprite in ipairs(set) do 
				w = w + sprite:GetZoomedWidth()		h = h + sprite:GetZoomedHeight()
			end

			set.Size = { x = w, y = h }

		end,

		QuadCommand=function(self)
			local s = p.Sample
			self:setsize( s:GetZoomedWidth(), s:GetZoomedHeight() )
		end,

		OnCommand=function(self)

			local texture = p.Texture
			if texture then self:SetTexture(texture) end

			self.posMatrix = { x = i, y = j }

			if p.Class == "Sprite" then self:init() end

			onSprite( self, { x = rangeX, y = rangeY } )

			self:GetParent():Center()

			if p.Color then self:diffuse( p.Color[1] ) end
			if p.Blend then self:blend( p.Blend ) end
			--if p.Rainbow then self:rainbow():effectperiod( 16 * self:getEffectRate() ) end

			if p.Blink then
				self:diffuseramp():effectperiod( self:getEffectRate() ):effectoffset( p.EffectOffset )
			end

			if p.Rotation then
				local r = p.Rotation
				self:rotationx( r.x ):rotationy( r.y ):rotationz( r.z )
			end

			-- Texture.lua
			if p.Texture and p.Spin then
				if math.abs(i) % 2 == 0 then self:rotationy(180) end
				if math.abs(j) % 2 == 0 then self:rotationx(180) end
			end

			if p.ZoomXYZ then
				self:zoomx( self:GetZoomX() * p.ZoomXYZ.x )
				self:zoomy( self:GetZoomY() * p.ZoomXYZ.y )
				self:zoomz( self:GetZoomZ() * p.ZoomXYZ.z )
			end
				
			if p:hasCommand( "Kaleidoscope2x2" ) then p.Spacing = { x = 0.5, y = 0.5 } end
				
			self:playcommand("AddSetActorsSize"):queuecommand("PosFiles")
			self:queuecommand("Pos")

			self.InitPos = { x = self:GetX(), y = self:GetY() }
			self.Dimensions = { 
				w = self:GetZoomedWidth(), h = self:GetZoomedHeight(), Zoom = self:GetZoom()
			}

			self:queuecommand("Post")
			
		end,

		PostCommand=function(self)

			self:playCommands():queuecommand("StateOffset")

			-- For more custom stuff!
			if p.Run then p.Run(self) end

		end,

		StateOffsetCommand=function(self)

			local offset = p.States.Offset

			if offset then
				local newState = self:GetState() + offset
				self:setstate( self:roundState(newState) )
			end

		end,

		StatePerSpriteCommand=function(self)

			local s = i + 2 + j * p.Sheet.x
			s = s + p.Sheet.y + p.States[1] + 1
			s = p.Animate and p.States[1] + 1 or s
			s = self:roundState(s)		self:setstate(s)

		end,

		PosCommand=function(self)

			if p.FileData then return end

			local w, h = self:GetZoomedWidth(),		self:GetZoomedHeight()

			-- Adjust the position if the number is odd or even.

			local x = w * ( i - ( numberOf.x + 1 ) % 2 * 0.5 )		x = x * p.Spacing.x			
			x = x + w * p.Pos.x

			local y = h * ( j - ( numberOf.y + 1 ) % 2 * 0.5 )		y = y * p.Spacing.y			
			y = y + h * p.Pos.y

			self:xy( x, y )

		end,

		PosFilesCommand=function(self)

			if not p.FileData then return end

			local w, h = 0, 0
			local data, setIndex = p.FileData, self.Index
			local index, numberOf = data.index, data.numberOf
			local actors = p.Set		local size = actors.Size

			local scroll = p.Scroll
			if tapLua.Vector.isZero(scroll) then scroll = { x = 1, y = 0 } end -- Default.
			
			if index > 1 then

				for i = 1, index do

					local actor = actors[i]

					for k, v in pairs { actor:GetZoomedWidth(), actor:GetZoomedHeight() } do

						if i == 1 or i == index then v = v * 0.5 end
						
						if k == 1 then w = w + v else h = h + v end

					end
					
				end

			end

			-- Why would you do "Spacing" to this type of template?

			if mirror then

				if setIndex % 2 == 0 then

					for i = numberOf, 2, -1 do 
						w = w - actors[i]:GetZoomedWidth()
						h = h - actors[i]:GetZoomedHeight() 
					end

				else w = - w 		h = - h end

			end

			local numberOf = p.numberOf

			w = w + size.x * ( p.Pos.x - i + ( numberOf.x + 1 ) % 2 * 0.5 + 0.25 )
			h = h + size.y * ( p.Pos.y - j + ( numberOf.y + 1 ) % 2 * 0.5 + 0.125 )

			self:xy( w * math.abs( scroll.x ), h * math.abs( scroll.y ) )

			if scroll.y ~= 0 and scroll.x == 0 then
				self:x( self:GetX() + self:GetZoomedWidth() * i )
			end

		end,

		ScrollCommand=function(self)

			local scroll = { x = p.Scroll.x, y = p.Scroll.y }

			if tapLua.Vector.isZero(scroll) then return end

			local w, h = self:GetZoomedWidth(),	self:GetZoomedHeight()

			-- This is for a multiple files set.
			if p.FileData then 
				
				local size = p.Set.Size 	w = size.x		h = size.y
				if p.Reversed == "DoubleMirror" then w = w * 4	h = h * 4 end

			end

			local scales = { x = SCREEN_WIDTH / w , y = SCREEN_HEIGHT / h }
			local zoom = p.ZoomXYZ
			local parent, n = self:GetParent(),	self:GetNumStates()
			
			local tweenTime = self:getTweenRate()

			local sample = p.Sample			if sample then n = sample:GetNumStates() end

			local time = 8 / scales.y
			
			local offset = p.ScrollOffset
			if offset then 
				time = time + math.abs( scroll.x * ( j + offset ) ) 
				time = time + math.abs( scroll.y * ( i + offset ) )
			end

			for k,v in pairs( p.Scroll ) do scroll[k] = v == 0 and 0 or 1 / v end

			if beat4sprite.Config.syncBG then time = time * 0.9375 end

			local illusion = p.Illusion

			if p:hasCommand("Mirror") and not p.Reversed then
				w = w * 2		h = h * 2		time = time * 2
			elseif p.Reversed and not illusion then
				w = w * 0.5		h = h * 0.5		time = time * 0.5333
			end

			parent:Center()

			if illusion then

				local length = SCREEN_WIDTH - w / zoom.x		length = length * zoom.x
				parent:x( parent:GetX() + ( w - length * 0.5 ) * scroll.x )
				w = w + length - SCREEN_WIDTH

				h = h - SCREEN_HEIGHT		time = time * 1.0666 / zoom.y

				if illusion == 'X' then time = time * 2 end

			end

			local x, y = w * scroll.x, 	h * scroll.y

			-- Set the starting position "smartly".
			-- 1. Get the number of sprites that don't fit in the resolution.
			-- 2. Get half the number because it's centered.
			-- 3. Multiply it by the width or height and scrolling.

			local x2, y2 = self:GetZoomedWidth(), 	self:GetZoomedHeight()

			if p.FileData then
				local size = p.Set.Size 	x2 = size.x * 0.5		y2 = size.y * 0.5
			end

			x2 = x2 * scroll.x		y2 = y2 * scroll.y

			parent:x( parent:GetX() - x2 * ( numberOf.x - scales.x ) * 0.5 )
			parent:y( parent:GetY() - y2 * ( numberOf.y - scales.y ) * 0.5 )

			if ( isAnimationScrollType() and not sample ) or p:hasCommand("Cross") then

				local n = n		local cross = p.Cross

				if p:hasAnimationType("XY-Skip") then n = p:getSmallestInSheet().Value end
				if p:hasCommand("Cross") and cross.By then n = cross.By * 2 end

				x = x * n		y = y * n		time = time * n
				
			end

			local origin = { x = parent:GetX(), y = parent:GetY() }
			local nextPos = { x = parent:GetX() + x,		y = parent:GetY() + y }

			if p.Reversed and parent.onReverse then
				parent:xy( nextPos.x, nextPos.y )		nextPos = origin
			end

			if p.SkippyScroll then

				for i=1,n do
					parent:sleep( n * tweenTime )
					parent:x( parent:GetX() + x * i / n )
					parent:y( parent:GetY() + y * i / n )
				end
					
			else

				time = time * tweenTime
				parent:linear(time):xy( nextPos.x, nextPos.y )

			end

			-- Keep switching, moving on and back.
			if p.Reversed then parent.onReverse = not parent.onReverse end

			-- Sync the fading and scrolling each time.
			if p:hasCommand("Fade") then parent:queuecommand("Fade") end

			parent:queuecommand("Scroll")

		end,

		FadeCommand=function(self)

			if not self.FadeLoaded then 
			
				self.FadeOffset = 0		self.FadeLoaded = true

				if not self.Rainbow then

					if p.DiffuseRamp then self:diffuseramp() else self:diffuseshift() end
					setEffectColors(self)

				end

			else self.FadeOffset = self.FadeOffset + 1 end

			local lastOffset = self.FadeOffset
			local fade, scroll = p.Fade, p.Scroll

			local scrollOffset = { x = lastOffset * scroll.x, y = lastOffset * scroll.y }
			local offset = fade.x * ( i - scrollOffset.x ) + fade.y * ( j - scrollOffset.y )
			offset = - offset + p.EffectOffset

			local period = self:getTweenRate() * self:getEffectRate() * 2
			local amplitude = p.FadeAmplitude

			if self.Rainbow then amplitude = amplitude * 0.25		period = period * 4 end

			offset = offset * period * amplitude / numberOf.items

			self:effectperiod(period):effectoffset(offset)

			self:onRainbow( offset / amplitude )

		end,

		Kaleidoscope2x2Command=function(self)

			self:zoom( self:GetZoom() * 0.5 )		local w = self:GetZoomedWidth()

			self:x( self:GetX() + w * 0.25 )

			mirror = { x = 1, y = 1, { x = 0, y = 0 } }

			self:queuecommand("Mirror")

		end,

		MirrorCommand=function(self)

			local i = i
			if p.FileData then	i = self.Index	if i % 2 == 0 then return end	end

			local x, y = self:GetRotationX(),	self:GetRotationY()

			if i % 2 == 1 then self:rotationy( y + 180 * mirror.x ) end
			if j % 2 == 1 then self:rotationx( x + 180 * mirror.y ) end

			x, y = self:GetRotationX(),	self:GetRotationY()

			if i % 2 == 0 then self:rotationx( x + 180 * mirror[1].y ) end
			if j % 2 == 0 then self:rotationy( y + 180 * mirror[1].x ) end


		end,

		AlignCommand=function(self)

			local w, h = self:GetZoomedWidth(),		self:GetZoomedHeight()

			if i % 2 == 1 then self:visible(false) return end

			if math.abs(i) > 0 then self:x( self:GetX() - w * 0.75 * i / math.abs(i) ) end
			if math.abs(j) > 0 then self:y( self:GetY() + h * 0.25 * j / math.abs(j) ) end

		end,

		CrossCommand=function(self)
			
			local cross = p.Cross
			local by, type, offset = cross.By, cross.Type, cross.Off or 0
			local index = self.Index

			if type then

				local start = 1

				if type <= 2 then

					if type == 1 then start = 0 end

					for i = start + offset, numberOf.items + offset, by + 1 do 
						if i == index then self:visible(false) break end 
					end

				end

				if type == 3 or type == 4 then

					for k,v in pairs( crossHide ) do
						if crossHide[index] then self:visible(false) break end 
					end

				end

			end

		end,

		SpinXYCommand=function(self)

			local time = self:getTweenRate() /	p.States.Rate		local spin = { 0, 90 }

			if not beat4sprite.GAMESTATE.isOnGameplay() then time = time * 1.25 end

			if p.SpinStyle == 2 then spin = { spin[2], spin[1] } end

			self:rotationx(0):rotationy( spin[1] ):linear(time):rotationy( spin[2] )
			self:linear(time):rotationy( spin[1] ):sleep(0)

			self:rotationx( spin[1] ):rotationy(0):linear(time):rotationx( spin[2] )
			self:linear(time):rotationx( spin[1] ):sleep(0)

			self:queuecommand("SpinXY")

		end,

		SpinXCommand=function(self)

			local time = self:getTweenRate() * 2

			self:rotationy(0):linear(time):rotationy(90)
			self:linear(time):rotationy(0)
			self:queuecommand( "SpinX" )

		end,

		SpinYCommand=function(self)

			local time = self:getTweenRate() * 2

			self:rotationx(0):linear(time):rotationx(90)
			self:linear(time):rotationx(0)
			self:queuecommand( "SpinY" )

		end,

		SplitCommand=function(self)

			local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()

			self:xy( self.InitPos.x, self.InitPos.y )
			self:linear(4):xy( self:GetX() + w * i, self:GetY() + h * j )
			self:queuecommand("Split")

		end,

		PulseCommand=function(self)

			local type = p.Pulse

			local z, time = self:GetZoom(), self:getTweenRate() * 2

			if type == 1 then
				time = time * 0.5		self:smooth(time):zoom(0):smooth(time):zoom(z)
			end

			if i % 2 == 0 and type == 3 and not self.onPulse then 
				self:sleep(time)	self.onPulse = true 
			end

			if type == 2 or type == 3 then
				self:zoom(z):linear(time):zoom(z * 1.5):linear(time):zoom(z)
			end
			
			if type >= 1 and type <= 3 then self:queuecommand("Pulse") end

		end,

		AlphaCommand=function(self)

			local alpha = p.Alpha
			if type(alpha) == "number" then self:diffusealpha(alpha) return end

			local time = self:getTweenRate() * 2
			self:diffusealpha(0):linear(time):diffusealpha(1)
			self:linear(time):diffusealpha(0):queuecommand("Alpha")

		end,

		-- Source code -> MaskSource( clearzbuffer )
		MaskSourceCommand=function(self) self:MaskSource( i == rangeX[1] and j == rangeY[1] ) end,
		MaskDestinationCommand=function(self) self:MaskDest() end

	}	}

end			end

return t