local ScaleVar, file, Reversed, mirror, textcoordsense, img_coord = ...

return Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,

    OnCommand=function(self)
   		if Reversed == true then _rev = 1 elseif Reversed == nil then _rev = -1 end
    end,

	Def.ActorFrame{
		Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")

				function Petal(sprite, _rev, rotationx_val, rotationz_val, add_coord_x1, add_coord_x2, mirror_val, spin_sense)

					local relative_posy = (self:GetHeight()/2)/self:GetHeight()
					local texcoordvelocity_y = relative_posy/4

        			sprite:Center()
					:SetCustomPosCoords(0,SCREEN_HEIGHT/2.00001,0,-SCREEN_HEIGHT/4.5,-640*ScaleVar/2,-SCREEN_HEIGHT/2.00001,0,SCREEN_HEIGHT/2.00001) --This one is special because it's the center. The rest have the shape of a ring.
					:SetSize(640*ScaleVar,480*ScaleVar)
					:customtexturerect(0,0,mirror_val/4,mirror_val/4):addimagecoords(add_coord_x1,0)
					:texcoordvelocity(0,texcoordvelocity_y*_rev*textcoordsense):effectclock('beat'):set_use_effect_clock_for_texcoords(true)
					:rotationx(rotationx_val) 
					:rotationz(rotationz_val)
				    :linear(42/2):rotationz(sprite:GetRotationZ()+720*0.875*_rev*spin_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
					if mirror == 2 then 
						sprite:customtexturerect(0,0,mirror_val/8,-mirror_val/8)
						:addimagecoords(add_coord_x2,0)
						:texcoordvelocity(0,-texcoordvelocity_y*_rev*textcoordsense)
						:SetCustomPosCoords(0,240,0,-SCREEN_HEIGHT/4.5,-640*ScaleVar/1.3375,-240+240/3.625,-640*ScaleVar/1.3375,240)
					elseif mirror == -4 then 
						sprite:customtexturerect(0,0,mirror_val/16,mirror_val/16)
						:addimagecoords(add_coord_x1,0)
						:SetCustomPosCoords(0,240,0,-SCREEN_HEIGHT/4.5,-640*ScaleVar/1.3375,-240+240/3.625,-640*ScaleVar/1.3375,240)
						:texcoordvelocity(0,texcoordvelocity_y*_rev*textcoordsense)
					elseif mirror == 8 then sprite:customtexturerect(0,0,mirror_val/32,-mirror_val/32)
						:addimagecoords(add_coord_x2,0)
						:SetCustomPosCoords(0,240,0,-SCREEN_HEIGHT/4.5,-640*ScaleVar/1.3375,-240+240/3.625,-640*ScaleVar/1.3375,240)
						:texcoordvelocity(0,-texcoordvelocity_y*_rev*textcoordsense)
						:diffuse(Color.Red)
					end
		
				end

				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 180, 0, 0, -self:GetWidth()/2.5/2, mirror/2, 1)
				else
					Petal(self, _rev, 180, 0, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, 1)
				end

			end
    	};

    	Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")
				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 0, 0, 0, -self:GetWidth()/2.5/2, mirror/2, -1)
				else
					Petal(self, _rev, 0, 0, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, -1)
				end
			end
		};
	};

	Def.ActorFrame{
		Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")
				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 180, 45, 0, -self:GetWidth()/2.5/2, mirror/2, 1)
				else
					Petal(self, _rev, 180, 45, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, 1)
				end
			end
		};
    	Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")
				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 0, 45, 0, -self:GetWidth()/2.5/2, mirror/2, -1)
				else
					Petal(self, _rev, 0, 45, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, -1)
				end
			end
		};
	};	
	
	Def.ActorFrame{
		Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")
				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 180, 45*2, 0, -self:GetWidth()/2.5/2, mirror/2, 1)
				else
					Petal(self, _rev, 180, 45*2, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, 1)
				end
			end
		};
     	Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")
				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 0, 45*2, 0, -self:GetWidth()/2.5/2, mirror/2, -1)
				else
					Petal(self, _rev, 0, 45*2, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, -1)
				end
			end
		};
	};

	Def.ActorFrame{
		Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")
				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 180, 45*3, 0, -self:GetWidth()/2.5/2, mirror/2, 1)
				else
					Petal(self, _rev, 180, 45*3, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, 1)
				end
			end
		};
	
     	Def.Sprite{
        	OnCommand=function(self)
        		self:Load(file, "stretch")
				if self:GetWidth() == 1280 then 
					Petal(self, _rev, 0, 45*3, 0, -self:GetWidth()/2.5/2, mirror/2, -1)
				else
					Petal(self, _rev, 0, 45*3, 250/2+self:GetWidth()/3, self:GetWidth()/3, mirror, -1)
				end
			end
		};
	};
}