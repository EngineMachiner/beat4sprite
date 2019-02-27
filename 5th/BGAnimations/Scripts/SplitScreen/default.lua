local ScaleVar = _screen.h/480
local Backgrounds, Reversed = ...

local t = Def.ActorFrame{}

	t[#t+1] = LoadActor( Backgrounds[1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
		end
	}

    t[#t+1] = LoadActor( Backgrounds[1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()+self:GetWidth()):zoomx(-1)
		end
	}

   t[#t+1] = LoadActor( Backgrounds[1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()-self:GetWidth()):zoomx(-1)
		end
	}

local s_var = math.abs( #Backgrounds - 1 + ( #Backgrounds - 2 ) * 3 )

if not Reversed then

for i = #Backgrounds, 1, -1 do
	
    t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):cropbottom(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):cropbottom(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):cropbottom(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):cropbottom(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()/2, self:GetY()-self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):croptop(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropright(0.5):croptop(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()-self:GetWidth()/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):croptop(0.5)
			:sleep( i * 4 ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():Center():SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(0):cropleft(0.5):croptop(0.5)
			:sleep( s_var ):linear(2):diffusealpha(1):sleep(2):linear(3):xy(self:GetX()+self:GetWidth()/2, self:GetY()+self:GetHeight()/2):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

end

else

for i = 1, #Backgrounds do
	
    t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropright(0.5):cropbottom(0.5)
			:sleep(2):linear(3):Center():linear(2):sleep( i * 4 ):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropright(0.5):cropbottom(0.5)
			:sleep(2):linear(3):Center():linear(2):diffusealpha(0):sleep( s_var ):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropleft(0.5):cropbottom(0.5)
			:sleep(2):linear(3):Center():linear(2):diffusealpha(0):sleep( i * 4 ):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropleft(0.5):cropbottom(0.5)
			:sleep(2):linear(3):Center():linear(2):diffusealpha(0):sleep( s_var ):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropright(0.5):croptop(0.5)
			:sleep(2):linear(3):Center():linear(2):diffusealpha(0):sleep( i * 4 ):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropright(0.5):croptop(0.5)
			:sleep(2):linear(3):Center():linear(2):diffusealpha(0):sleep( s_var ):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

   	t[#t+1] = LoadActor(Backgrounds[i])..{
		OnCommand=function(self)
			self:xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropleft(0.5):croptop(0.5)
			:sleep(2):linear(3):Center():linear(2):diffusealpha(0):sleep( i * 4 ):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end,
		RepeatCommand=function(self)
			self:finishtweening():xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
			:diffusealpha(1):cropleft(0.5):croptop(0.5)
			:sleep(2):linear(3):Center():linear(2):diffusealpha(0):sleep( s_var ):set_tween_uses_effect_delta(true):effectclock('beat')
			:queuecommand("Repeat")
		end
	}

end

end

return t