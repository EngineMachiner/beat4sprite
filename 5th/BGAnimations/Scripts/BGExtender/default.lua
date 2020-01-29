local file, texcoord, texcoord_2, customtex  = ...

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end

}

for i = -1,1 do
	t[#t+1] = LoadActor(file)..{
		OnCommand=function(self)

			if string.match( file, ".mpg" ) then 
				local data = GAMESTATE:GetCurrentSong():GetTimingData()
				local beat = GAMESTATE:GetSongBeat()
				self:rate( data:GetBPMAtBeat(beat) * 0.001 )
			end

			AnimationDelay(self)
			self:effectclock('beat')
			ToolPreview(self)
			self:Center()
				:zoom(ScaleVar)
				:SetSize(640,480)
				:x(self:GetX()+self:GetWidth()*ScaleVar*i)
				
			if i == 0 then
				self:zoomx(ScaleVar)
			else
				self:zoomx(-ScaleVar)
			end

			if not texcoord and not texcoord_2 and not customtex then
				if i == 1 then 
					self:cropleft(0.5)
				elseif i == -1 then
					self:cropright(0.5)
				end
			else
				if i == 1 then 
					self:cropright(0.5)
				elseif i == -1 then
					self:cropleft(0.5)
				end				
			end

			if texcoord or texcoord_2 then
				if i == 0 then
					BGA_TCV_OrL(self, texcoord, texcoord_2)
				else
					self:zoom(ScaleVar)
					BGA_TCV_OrL(self, texcoord, texcoord_2)
				end
			end

			if customtex then 
				self:zoom(customtex*0.5*ScaleVar)
				self:customtexturerect(0,0,customtex,customtex)
			end

		end,
		StopCommand=function(self)
			self:rate(0):position(0)
		end
	}
end

return t