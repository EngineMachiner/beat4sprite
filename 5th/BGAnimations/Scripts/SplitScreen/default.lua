local ScaleVar = _screen.h/480
local Backgrounds, Reversed, sleep_num = ...

local t = Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end
}

for k,v in pairs(Backgrounds) do
	if v == "/BGAnimations/Backgrounds/5th/64 (stretch).png" then
		if k+1 < #Backgrounds then
			Backgrounds.SpecialBG = Backgrounds[k+1]
		else
			Backgrounds.SpecialBG = Backgrounds[1]
		end
	end
end

    t[#t+1] = LoadActor( Backgrounds.SpecialBG )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar)
		end
	}

if not Reversed then
	
	local num = 1
	local num_2 = 2

    	t[#t+1] = Def.ActorFrame{

			Def.Sprite{
				OnCommand=function(self)
					self:Load(Backgrounds[ num_2 ])
					self:Center():SetSize(640*ScaleVar,480*ScaleVar)
					:sleep( ( 2 + 2 ) * sleep_num )
					self:set_tween_uses_effect_delta(true):effectclock('beat')
					ToolPreview(self)
				end,
				RepeatCommand=function(self)
					if num_2 >= #Backgrounds then
						num_2 = 0
					end
					num_2 = num_2 + 1
					self:Load(Backgrounds[ num_2 ]):SetSize(640*ScaleVar,480*ScaleVar)
					:sleep( 4 )
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					if i == #Backgrounds then
						self:diffusealpha(0)
					else
						self:Load(Backgrounds[ num ])
						self:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:cropright(0.5):cropbottom(0.5)
						:sleep( 4 ):linear( 2 )
						:xy(self:GetX()-self:GetWidth()/2, self:GetY()-self:GetHeight()/2)
						self:set_tween_uses_effect_delta(true):effectclock('beat')
						ToolPreview(self)
					end 	
				end,
				RepeatCommand=function(self)
					if num >= #Backgrounds then
						num = 0
					end
						num = num + 1 
					self:Load(Backgrounds[ num ])
						:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:xy(self:GetX()-self:GetWidth()/2, self:GetY()-self:GetHeight()/2)
						
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					if i == #Backgrounds then
						self:diffusealpha(0)
					else
						self:Load(Backgrounds[ num ])
						self:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:cropleft(0.5):cropbottom(0.5)
						:sleep( 4 ):linear( 2 )
						:xy(self:GetX()+self:GetWidth()/2, self:GetY()-self:GetHeight()/2)
						self:set_tween_uses_effect_delta(true):effectclock('beat')
						ToolPreview(self)
					end 	
				end,
				RepeatCommand=function(self) 
					self:Load(Backgrounds[ num ])
						:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:xy(self:GetX()+self:GetWidth()/2, self:GetY()-self:GetHeight()/2)
						
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					if i == #Backgrounds then
						self:diffusealpha(0)
					else
						self:Load(Backgrounds[ num ])
						self:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:cropright(0.5):croptop(0.5)
						:sleep( 4 ):linear( 2 )
						:xy(self:GetX()-self:GetWidth()/2, self:GetY()+self:GetHeight()/2)
						self:set_tween_uses_effect_delta(true):effectclock('beat')
						ToolPreview(self)
					end 	
				end,
				RepeatCommand=function(self) 
					self:Load(Backgrounds[ num ])
						:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:xy(self:GetX()-self:GetWidth()/2, self:GetY()+self:GetHeight()/2)
						
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					if i == #Backgrounds then
						self:diffusealpha(0)
					else
						self:Load(Backgrounds[ num ])
						self:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:cropleft(0.5):croptop(0.5)
						:sleep( 4 ):linear( 2 )
						:xy(self:GetX()+self:GetWidth()/2, self:GetY()+self:GetHeight()/2)
						self:set_tween_uses_effect_delta(true):effectclock('beat')
						ToolPreview(self)
					end 	
				end,
				RepeatCommand=function(self)
					self:Load(Backgrounds[ num ])
						:Center():SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:xy(self:GetX()+self:GetWidth()/2, self:GetY()+self:GetHeight()/2)
				end
			},

			OnCommand=function(self)
				self:queuecommand("Repeat"):queuecommand("RepeatFrame")
			end,
			RepeatFrameCommand=function(self)
				self:set_tween_uses_effect_delta(true):effectclock('beat')
				ToolPreview(self)
				self:sleep( 4 * sleep_num )
				:RunCommandsOnChildren( function(child) child:finishtweening():playcommand("Repeat") end )
				:queuecommand("RepeatFrame")
			end
		}

else

	local num = #Backgrounds - 1
	local num_2 = #Backgrounds

    	t[#t+1] = Def.ActorFrame{

			Def.Sprite{
				OnCommand=function(self)
					self:Load(Backgrounds[ num_2 ])
					self:Center():SetSize(640*ScaleVar,480*ScaleVar)
					:sleep( ( 2 + 2 ) * sleep_num )
					self:set_tween_uses_effect_delta(true):effectclock('beat')
					ToolPreview(self)
				end,
				RepeatCommand=function(self)
					num_2 = num_2 - 1
					if num_2 < 1 then
						num_2 = #Backgrounds
					end
					self:Load(Backgrounds[ num_2 ]):SetSize(640*ScaleVar,480*ScaleVar)
					:sleep( 4 )
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					self:Load(Backgrounds[ num ])
					self:SetSize(640*ScaleVar,480*ScaleVar):xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2)
					:cropright(0.5):cropbottom(0.5)
					:sleep( 4 ):linear( 2 )
					:Center()
					self:set_tween_uses_effect_delta(true):effectclock('beat')
					ToolPreview(self) 	
				end,
				RepeatCommand=function(self)
					num = num - 1
					if num < 1 then
						num = #Backgrounds
					end
					self:Load(Backgrounds[ num ]):SetSize(640*ScaleVar,480*ScaleVar)
						:xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:Center()
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					self:Load(Backgrounds[ num ])
					self:SetSize(640*ScaleVar,480*ScaleVar):xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2)
						:cropleft(0.5):cropbottom(0.5)
						:sleep( 4 ):linear( 2 )
						:Center()
						self:set_tween_uses_effect_delta(true):effectclock('beat')
						ToolPreview(self)
				end,
				RepeatCommand=function(self) 
					self:Load(Backgrounds[ num ]):SetSize(640*ScaleVar,480*ScaleVar)
						:xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y-self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:Center()
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					self:Load(Backgrounds[ num ])
					self:SetSize(640*ScaleVar,480*ScaleVar)
						:xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar)
						:cropright(0.5):croptop(0.5)
						:sleep( 4 ):linear( 2 )
						:Center()
						self:set_tween_uses_effect_delta(true):effectclock('beat')
						ToolPreview(self)
				end,
				RepeatCommand=function(self) 
					self:Load(Backgrounds[ num ]):SetSize(640*ScaleVar,480*ScaleVar)
						:xy(SCREEN_CENTER_X-self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar):SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:Center()
				end
			},

    		Def.Sprite{
				OnCommand=function(self)
					self:Load(Backgrounds[ num ])
					self:SetSize(640*ScaleVar,480*ScaleVar):xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar):SetSize(640*ScaleVar,480*ScaleVar)
						:cropleft(0.5):croptop(0.5)
						:sleep( 4 ):linear( 2 )
						:Center()
						self:set_tween_uses_effect_delta(true):effectclock('beat')
						ToolPreview(self)
				end,
				RepeatCommand=function(self)
					self:Load(Backgrounds[ num ]):SetSize(640*ScaleVar,480*ScaleVar)
						:xy(SCREEN_CENTER_X+self:GetWidth()/2, SCREEN_CENTER_Y+self:GetHeight()/2):SetSize(640*ScaleVar,480*ScaleVar):SetSize(640*ScaleVar,480*ScaleVar):SetSize(640*ScaleVar,480*ScaleVar)
						:linear( 2 )
						:Center()
				end
			},

			OnCommand=function(self)
				self:queuecommand("Repeat"):queuecommand("RepeatFrame")
			end,
			RepeatFrameCommand=function(self)
				self:set_tween_uses_effect_delta(true):effectclock('beat')
				ToolPreview(self)
				self:sleep( 4 * sleep_num )
				:RunCommandsOnChildren( function(child) child:finishtweening():playcommand("Repeat") end )
				:queuecommand("RepeatFrame")
			end
		}	

end

    t[#t+1] = LoadActor( Backgrounds[#Backgrounds-1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()+self:GetWidth()):zoomx(-1)
		end
	}

   t[#t+1] = LoadActor( Backgrounds[#Backgrounds-1] )..{
		OnCommand=function(self)
			self:Center():SetSize(640*ScaleVar,480*ScaleVar):x(self:GetX()-self:GetWidth()):zoomx(-1)
		end
	}

return t