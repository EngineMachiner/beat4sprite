
local params = ...
local ScaleVar = _screen.h/480
local texture = params.File

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

local x = { 0, 0 }
local y = { 0, 0 }

local s, Frames

if type(params.File) == "string" then
	s = string.match( params.File, " %dx%d" )
	if s then
		Frames = { string.match( s, "%dx"), string.match( s, "x%d") }
		Frames[1] = tonumber( string.match( Frames[1], "%d" ) )
		Frames[2] = tonumber( string.match( Frames[2], "%d" ) )
	end
end

if not params.ActorClass then 
	params.ActorClass = "Sprite"
end

if params.X_num then
	if type(params.X_num) == "table" then 
		for i=1,#params.X_num do
			x[i] = params.X_num[i]
		end
	elseif type(params.X_num) == "number" then
		x = { -math.abs(params.X_num), math.abs(params.X_num) }
	end
end

if params.Y_num then
	if type(params.Y_num) == "table" then 
		for i=1,#params.Y_num do
			y[i] = params.Y_num[i]
		end
	elseif type(params.Y_num) == "number" then
		y = { -math.abs(params.Y_num), math.abs(params.Y_num) }
	end
end

local X_pos = params.X_pos
local Y_pos = params.Y_pos

BGA_NoParams( params )

if not params.FadeX then params.FadeX = 0 end
if not params.FadeY then params.FadeY = 0 end
if not params.X_coord then params.X_coord = 0 end
if not params.Y_coord then params.Y_coord = 0 end

local function StateMath( x, y, self, state )

	state = state + x

	while state < self:GetNumStates() - 1 do 
		state = state + self:GetNumStates()
	end

	while state > self:GetNumStates() - 1 do 
		state = state - self:GetNumStates()
	end

	state = state + y

	while state < self:GetNumStates() - 1 do 
		state = state + self:GetNumStates()
	end

	while state > self:GetNumStates() - 1 do 
		state = state - self:GetNumStates()
	end

	return state

end

local function Find(self, filter) -- filter is the texture path/dir

	local init_af, check = self

	while init_af:GetParent() and not check do
		init_af = init_af:GetParent()
		if init_af.Name then check = true end
	end

	local storage = {}
	local function Filter(tbl)

		for k,v in pairs(tbl) do
			if string.match(tostring(v),"table") then
				Filter(v)
			elseif string.match(tostring(v),"Frame") then
				Filter(v:GetChildren())
			elseif string.match(tostring(v),"Sprite") then
				if v:GetTexture() then

					--[[ v.GetTexture(v).GetPath(v.GetTexture(v))
					please remember self behaviour, this is why
					v:GetTexture():GetPath() returned an error  ]]

					local tex = v:GetTexture()
					if tex:GetPath() == filter then
						storage[#storage+1] = v
					end

				end
			end
		end

	end

	Filter(init_af:GetChildren())
	return storage

end

local k_0, k_1 = 0, 0
-- k is the 0.5 factor to move if the sprites don't fit in the res. 

for i=x[1],x[2] do
	for k=y[1],y[2] do

		local vec_start = {}
		local vec_end = {}
		local sprites = {}
		local search_sprt

		local state = 0
		local stairs, stairs2
		local file_num = 1

		t[#t+1] = Def[params.ActorClass]{
			GainFocusCommand=function(self)

				if params.ActorClass == "Quad" then
					search_sprt = Find(self, params.File)[1]
					self:SetSize( search_sprt:GetZoomedWidth(), search_sprt:GetZoomedHeight() )
					if params.FramingXY then
						stairs2 = true
					end
				elseif params.ActorClass == "Sprite" then
					self:Load(texture)
					if params.FramingXY then
						stairs2 = true
						BGA_FramingXY( self, params, i, k, Frames ) --5th033A that clothes effect
					else
						BGA_FrameSelector(self, params)
					end
					if string.match( params.File, ".mpg" ) then
						local val = 1
						if string.match( params.File, "B0%d%d.mpg" ) then
							val = 0.5
						end
						self:rate( 0.1 * val )
					end
				end

				if i == x[1] and k == y[1] then
					if params.X_coord == 0 then
						for p=x[1], x[2] do
							if SCREEN_CENTER_X + self:GetZoomedWidth() * p * ScaleVar == 0 then 
								k_0 = 0.5
							end
						end
					end
					if params.Y_coord == 0 then
						for p=y[1], y[2] do
							if SCREEN_CENTER_Y + self:GetZoomedHeight() * p * ScaleVar == 0 then 
								k_1 = 0.5
							end
						end
					end
				end
				-- Checks if the sprite fits corner to corner (sprite to res)
				
				vec_start[1] = SCREEN_CENTER_X+self:GetZoomedWidth()*(i+k_0)*ScaleVar
				vec_start[2] = SCREEN_CENTER_Y+self:GetZoomedHeight()*(k+k_1)*ScaleVar

			 	self:xy( vec_start[1], vec_start[2] )

			 	self:effectclock("beat")
			 	self:set_tween_uses_effect_delta(true)
				
			 	local Move
			 	if type(params.Commands) == "table" then
			 		for i = 1,#params.Commands do
			 			if params.Commands[i] ~= "Move" then
			 				self:playcommand(params.Commands[i])
			 			else
			 				Move = true
			 			end
			 		end
			 	elseif type(params.Commands) == "string" then
			 		if params.Commands ~= "Move" then
			 			self:playcommand(params.Commands)
			 		else
			 			Move = true
			 		end
			 	end

			 	if X_pos then
			 		self:x(self:GetX()+X_pos*self:GetZoomedWidth())
			 	end

			 	if Y_pos then
			 		self:y(self:GetY()+Y_pos*self:GetZoomedHeight())
			 	end

				vec_start[1] = self:GetX()
			 	vec_start[2] = self:GetY()

			 	vec_end[1] = vec_start[1]
				vec_end[2] = vec_start[2]

				if Move then 
					self:playcommand("Move")
				end
				
			end,
			MoveCommand=function(self)

				if not params.NumTextures then

					if vec_end[1] == vec_start[1]
					and vec_end[2] == vec_start[2] then

						if #sprites == 0 then
			 				for k,v in pairs(self:GetParent():GetChildren()) do
			 					for _,o in pairs(v) do
			 						sprites[#sprites+1] = o
			 						if #sprites > 1 then break end
			 					end
			 				end
			 			end

			 			if params.X_coord ~= 0 then

			 				local X_add = 0
			 				while SCREEN_CENTER_X + self:GetZoomedWidth() * ScaleVar * ( x[2] - 1.5 ) + X_add > SCREEN_WIDTH and params.X_coord > 0 do
								X_add = X_add - 1
							end

			 				while SCREEN_CENTER_X + self:GetZoomedWidth() * ScaleVar * ( x[1] + 1.5 ) + X_add < 0 and params.X_coord < 0 do
								X_add = X_add + 1
							end

							vec_start[1] = vec_start[1] + X_add 
			 				vec_end[1] = vec_start[1]

			 				params.X_coord = params.X_coord / math.abs(params.X_coord) -- versor
			 				if stairs then
			 					vec_end[1] = vec_end[1] + self:GetZoomedWidth() * self:GetNumStates() * params.X_coord
			 				elseif stairs2 then
			 					vec_end[1] = vec_end[1] + self:GetZoomedWidth() * Frames[2] * params.X_coord
			 				else
			 					vec_end[1] = vec_end[1] + self:GetZoomedWidth() * params.X_coord
			 				end

			 			end

				 		if params.Y_coord ~= 0 then

			 				local Y_add = 0
			 				while SCREEN_CENTER_Y + self:GetZoomedHeight() * ScaleVar * ( y[2] + 0.5 ) + Y_add > SCREEN_HEIGHT and params.Y_coord > 0 do
								Y_add = Y_add - 1
							end

			 				while SCREEN_CENTER_Y + self:GetZoomedHeight() * ScaleVar * ( y[1] - 0.5 ) + Y_add < 0 and params.Y_coord < 0 do
								Y_add = Y_add + 1
							end

							vec_start[2] = vec_start[2] + Y_add
							vec_end[2] = vec_start[2]
			 				
			 				params.Y_coord = params.Y_coord / math.abs(params.Y_coord) -- versor
			 				if stairs then
			 					vec_end[2] = vec_end[2] + self:GetZoomedHeight() * self:GetNumStates() * params.Y_coord
			 				elseif stairs2 then 
			 					vec_end[2] = vec_end[2] + self:GetZoomedHeight() * Frames[2] * params.Y_coord
			 				else
			 					vec_end[2] = vec_end[2] + self:GetZoomedHeight() * params.Y_coord			 					
			 				end

			 			end

					end

					if params.FlashMove then 

						while vec_end[1] <= vec_start[1] - self:GetZoomedWidth() do 
							vec_end[1] = vec_start[1]
						end

						while vec_end[2] <= vec_start[2] - self:GetZoomedHeight() do 
							vec_end[2] = vec_start[2]
						end

			 			vec_end[1] = vec_end[1] - self:GetZoomedWidth() * 0.25
						vec_end[2] = vec_end[2] - self:GetZoomedHeight() * 0.25

						self:xy( vec_end[1], vec_end[2] )
							:sleep(self:GetNumStates()*0.25)
							:queuecommand("Move")

			 		else

						self:xy( vec_start[1], vec_start[2] )
							:linear(2)
							:xy( vec_end[1], vec_end[2] )
							:queuecommand("Move")

					end

					if params.Delay then

						if params.ActorClass ~= "Quad" then
							if self:GetNumStates() > 1 then
								self:hurrytweening( params.Delay * ( self:GetNumStates() - 1 ) * 4 )
							else
								self:hurrytweening( params.Delay )
							end
						elseif params.ActorClass == "Quad" then
							if search_sprt:GetNumStates() > 1 then
								self:hurrytweening( params.Delay * ( search_sprt:GetNumStates() - 1 ) * 4 )
							else
								self:hurrytweening( params.Delay )
							end
						end

					end

				else

					if vec_end[1] == vec_start[1]
					and vec_end[2] == vec_start[2] then

						if params.X_coord ~= 0 then
			 				local dir = params.X_coord / math.abs(params.X_coord)
			 				vec_end[1] = vec_start[1] + self:GetZoomedWidth() * ( params.NumItemsX - params.NumTextures - 1 ) * dir * ScaleVar
			 			end

			 			if params.Y_coord ~= 0 then
			 				local dir = params.Y_coord / math.abs(params.Y_coord)
			 				vec_end[2] = vec_start[2] + self:GetZoomedHeight() * 2 * dir * ScaleVar
			 			end

			 		end

					self:xy( vec_start[1], vec_start[2] )
						:linear( 4 * ( params.NumTextures + 1 ) )
						:xy( vec_end[1], vec_end[2] )
						:queuecommand("Move")

					if params.Speed then
						self:hurrytweening( params.Speed )
					end					

				end

			end,
			ZWriteCommand=function(self)
				self:zwrite(true)
				self:blend("BlendMode_NoEffect")
			end,
			ZTestCommand=function(self)
				self:ztest(true)
			end,
			MirrorCommand=function(self)

				if params.BGMirror then

					if i ~= 0 then
						self:rotationy( 180 * ( i ) )
					end

					if params.X_pos and params.X_pos % 2 == 0 
					and params.NumTextures and params.X_coord ~= 0 then
						self:rotationy( 180 )
					end

					if params.Y_pos and params.Y_pos % 2 == 0 
					and params.NumTextures and params.Y_coord ~= 0 then
						self:rotationx( 180 )
					end

				else

					if i % 2 == 0 and k % 2 == 1 then
						self:rotationy( 180 )
					elseif i % 2 == 1 and k % 2 == 0 then
						self:rotationx( 180 )
					elseif i % 2 == 0 and k % 2 == 0 then
						self:rotationx( 180 )
						self:rotationy( 180 )
					end

				end
				
			end,
			SpinYCommand=function(self)
			 	self:rotationx(0):linear(2):rotationx(90):linear(2):rotationx(0)
			 	:queuecommand( "SpinY" )
				if params.Speed then
					self:hurrytweening(params.Speed)
				end
			end,
			SpinXCommand=function(self)
			 	self:rotationy(0):linear(2):rotationy(90):linear(2):rotationy(0)
			 	:queuecommand( "SpinX" )
				if params.Speed then
					self:hurrytweening(params.Speed)
				end	
			end,
			SpinXYCommand=function(self)
				self:rotationx(0):linear(1):rotationx(90):linear(1)
					:rotationx(0):linear(1):rotationy(90):linear(1):rotationy(0)
			 		:queuecommand( "SpinXY" )
				if params.Speed then
					self:hurrytweening(params.Speed)
				end	
			end,
			CrossCommand=function(self)
				for o = -(x[2]+1),x[2]+1,2 do
					if k == o + i then
						self:visible(false) 
					end
				end
			end,
			Cross2Command=function(self)
				for o = -(x[2]+1),x[2]+1,2 do
					if k == o + i or math.abs(k) > 1 or k == 0 then 
						self:visible(false)
					end
				end
			end,
			RandomStateCommand=function(self)
				if self:GetNumStates() > 1 then
					self:setstate(math.random(0,self:GetNumStates()-1))
				end 
			end,
			OneTwoStatesCommand=function(self)
				self:setstate(i % self:GetNumStates())
			end,
			StairsStatesCommand=function(self)	
				stairs = true 
				self:setstate(StateMath( i+x[2], k+y[2], self, state ))
			end,
			FramePerSpriteCommand=function(self)

				local s = i + 2 + k * Frames[1] - Frames[1] * 2

				while s > self:GetNumStates() - 1 do
					s = s - self:GetNumStates()
				end

				while s < 0 do
					s = s + self:GetNumStates()
				end

				self:animate(false):setstate(s)

			end,
			PulseCommand=function(self)
				local z = self:GetZoom()
				self:smooth(1):zoom(0):smooth(1):zoom(z):queuecommand("Pulse")
			end,
			RainbowCommand=function(self)
				self:rainbow():effectperiod(8)
			end,
			ColorCommand=function(self)
				self:diffuse(params.Color)
			end,
			BlendCommand=function(self)
				self:blend("BlendMode_Modulate")
			end,
			FadeCommand=function(self)

				local total = x[2]+math.abs(x[1])+1

				if type(params.Color) == "table" then
					if params.Ramp then
						self:diffuseramp():effectcolor1(params.Color):effectperiod(2)
					else
						self:diffuseshift():blend("BlendMode_Modulate"):effectcolor1(params.Color):effectperiod(2)
					end
				elseif params.Color == "Rainbow" then
					self:rainbow():blend("BlendMode_Modulate")
				end

				local beat

				if params.Fade then
					if params.Delay then 
						beat = params.Delay * ( search_sprt:GetNumStates() ) * 4
					else
						beat = 4 * ( search_sprt:GetNumStates() ) * 4
					end
					self:effectperiod(beat):effectoffset( beat * 0.5 * ( - params.Fade[1] * i - params.Fade[2] * k ) / total )
				end

			end,
			BlinkCommand=function(self)
				self:diffuseramp():effectperiod(1)
			end,
			SplitCommand=function(self)
				if i == 0 then self:diffuse(Color.Red) end
				self:xy( vec_start[1], vec_start[2] )
					:linear(4)
					:x( self:GetX() + self:GetZoomedWidth() * i )
					:y( self:GetY() + self:GetZoomedHeight() * k )
					:queuecommand("Split")
			end,
		}

	end
end

return Def.ActorFrame{ t }