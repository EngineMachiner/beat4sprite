local ScaleVar = _screen.h/480
local Backgrounds = ...

local t = Def.ActorFrame{}

	t[#t+1] = LoadActor( Backgrounds[1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
		end
	}

    t[#t+1] = LoadActor( Backgrounds[1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()+self:GetWidth()*ScaleVar):zoomx(-ScaleVar)
		end
	}

   t[#t+1] = LoadActor( Backgrounds[1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()-self:GetWidth()*ScaleVar):zoomx(-ScaleVar)
		end
	}

local s_var = math.abs( #Backgrounds - 1 + ( #Backgrounds - 2 ) * 3 )

for i = #Backgrounds, 1, -1 do
	
    t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):cropbottom(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()*ScaleVar/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):cropbottom(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()*ScaleVar/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):cropbottom(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()*ScaleVar/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):cropbottom(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()*ScaleVar/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):croptop(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()*ScaleVar/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):croptop(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()*ScaleVar/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):croptop(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()*ScaleVar/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):croptop(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()*ScaleVar/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

end

return t