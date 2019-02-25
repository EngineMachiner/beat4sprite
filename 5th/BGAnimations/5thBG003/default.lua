local IsThereBG if GAMESTATE:GetCurrentSong():HasBackground() == true then 
	file = GAMESTATE:GetCurrentSong():GetBackgroundPath() 
		else file = "../Backgrounds/fallback.png"
		end;

BGA_SongLimit_Corners = math.floor(GAMESTATE:GetCurrentSong():GetLastSecond()*0.7)

local ScaleVar = _screen.h/480

local t = Def.ActorFrame{
	
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

}

    t[#t+1]  = LoadActor("../Backgrounds/27 (stretch).png")..{
			    OnCommand=function(self)
				self:Center():SetSize(640*ScaleVar,480*ScaleVar)
			    end
			}

    local the_dirs = {

    file,
    "../Backgrounds/27 (stretch).png",
    "../Backgrounds/8 (stretch).png",

    }

for m=1,BGA_SongLimit_Corners do
local limit = (BGA_SongLimit_Corners+1) - m

    path = the_dirs[(m%3)+1]

    t[#t+1]  = LoadActor(path)..{
			    OnCommand=function(self)
				self:Center():SetSize(640*ScaleVar,480*ScaleVar)
				:diffusealpha(0):cropright(0.5):cropbottom(0.5)
				:sleep(2*limit):diffusealpha(1):sleep(2):linear(2):xy(self:GetX()-640*ScaleVar/2, self:GetY()-self:GetHeight()/2):sleep(0.1):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock('beat')

			    end
			}

    t[#t+1]  = LoadActor(path)..{
			    OnCommand=function(self)
				self:Center():SetSize(640*ScaleVar,480*ScaleVar)
				:diffusealpha(0):cropleft(0.5):cropbottom(0.5)
				:sleep(2*limit):diffusealpha(1):sleep(2):linear(2):xy(self:GetX()+640*ScaleVar/2, self:GetY()-self:GetHeight()/2):sleep(0.1):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock('beat')

			    end
			}

    t[#t+1]  = LoadActor(path)..{
			    OnCommand=function(self)
				self:Center():SetSize(640*ScaleVar,480*ScaleVar)
				:diffusealpha(0):cropright(0.5):croptop(0.5)
				:sleep(2*limit):diffusealpha(1):sleep(2):linear(2):xy(self:GetX()-640*ScaleVar/2, self:GetY()+self:GetHeight()/2):sleep(0.1):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock('beat')

			    end
			}

    t[#t+1]  = LoadActor(path)..{
			    OnCommand=function(self)
				self:Center():SetSize(640*ScaleVar,480*ScaleVar)
				:diffusealpha(0):cropleft(0.5):croptop(0.5)
				:sleep(2*limit):diffusealpha(1):sleep(2):linear(2):xy(self:GetX()+640*ScaleVar/2, self:GetY()+self:GetHeight()/2):sleep(0.1):diffusealpha(0):set_tween_uses_effect_delta(true):effectclock('beat')

			    end
			}

end

    t[#t+1]  = LoadActor("../Backgrounds/27 (stretch).png")..{
			    OnCommand=function(self)
				self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()+640*ScaleVar):zoomx(-1)
			    end
			}

    t[#t+1]  =  LoadActor("../Backgrounds/27 (stretch).png")..{
			    OnCommand=function(self)
				self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()-640*ScaleVar):zoomx(-1)
			    end
			}

return t