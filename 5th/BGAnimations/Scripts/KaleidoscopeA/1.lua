local ScaleVar, file, Reversed, i = ...

local tbl = {}
tbl._rev = -1

if Reversed == true then 
   	tbl._rev = 1 
end

    if i == 0 then tbl.mirror = -1 tbl.textcoordsense = -1 end
    if i == 1 then tbl.mirror = 2 tbl.textcoordsense = 1 end
    if i == 2 then tbl.mirror = -4 tbl.textcoordsense = -1 end
    if i == 3 then tbl.mirror = 8 tbl.textcoordsense = 1 end

function Petal(sprite, _rev, rotationx_val, rotationz_val, mirror_val, spin_sense)

					local relative_posy = (sprite:GetHeight()/2)/sprite:GetHeight()
					local texcoordvelocity_y = relative_posy/4
					local width = sprite:GetWidth()

        			sprite:Center()
					:SetCustomPosCoords(0,SCREEN_HEIGHT*0.5,0,-SCREEN_HEIGHT/4.5,-640*ScaleVar*0.5,-SCREEN_HEIGHT*0.5,0,SCREEN_HEIGHT*0.5) --This one is special because it's the center. The rest have the shape of a ring.
					:SetSize(640*ScaleVar,480*ScaleVar)
					:customtexturerect(0,0,mirror_val/(4*width/320),mirror_val/(4*width/320))
					:texcoordvelocity(0,texcoordvelocity_y*_rev*0.25):effectclock('beat'):set_use_effect_clock_for_texcoords(true)
					:rotationx(rotationx_val) 
					:rotationz(rotationz_val)
					:addimagecoords(width*0.5,0)

					if mirror_val == 2 then
						sprite:customtexturerect(0,0,mirror_val/(8*width/320),-mirror_val/(8*width/320))
						:zoom(0.5)
						:addimagecoords(width*0.1*width/320,0)
						:SetCustomPosCoords(0,SCREEN_HEIGHT*0.5,0,-SCREEN_HEIGHT/4.475,-640*ScaleVar/1.3375,-SCREEN_HEIGHT*0.3625,-640*ScaleVar/1.3375,SCREEN_HEIGHT*0.5)
					elseif mirror_val == -4 then
						sprite:customtexturerect(0,0,mirror_val/(16*width/320),mirror_val/(16*width/320))
						:zoom(1)
						:addimagecoords(width*0.5,0)
						:SetCustomPosCoords(0,SCREEN_HEIGHT*0.5,0,-SCREEN_HEIGHT/4.475,-640*ScaleVar/1.3375,-SCREEN_HEIGHT*0.3625,-640*ScaleVar/1.3375,SCREEN_HEIGHT*0.5)
					elseif mirror_val == 8 then 
						sprite:customtexturerect(0,0,mirror_val/(32*width/320),-mirror_val/(32*width/320))
						:zoom(2)
						:addimagecoords(width*0.1*width/320,0)
						:SetCustomPosCoords(0,SCREEN_HEIGHT*0.5,0,-SCREEN_HEIGHT/4.475,-640*ScaleVar/1.3375,-SCREEN_HEIGHT*0.3625,-640*ScaleVar/1.3375,SCREEN_HEIGHT*0.5)
					else
						sprite:zoom(0.25)
					end

end

local t = Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
    end,

}

for a = 0,1 do

	t[#t+1] = Def.ActorFrame{

		Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 180, 0, tbl.mirror, s_sense)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
			end
    	},

    	Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = - 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 0, 0, tbl.mirror, -1)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)				
			end
		},

	}

	t[#t+1] = Def.ActorFrame{
		Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 180, 45, tbl.mirror, 1)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
			end
		},
    	Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = - 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 0, 45, tbl.mirror, -1)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
			end
		}
	}	
	
	t[#t+1] = Def.ActorFrame{
		Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 180, 45*2, tbl.mirror, 1)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
			end
		},
     	Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = - 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 0, 45*2, tbl.mirror, -1)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
			end
		}
	}

	t[#t+1] = Def.ActorFrame{
		Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 180, 45*3, tbl.mirror, 1)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
			end
		},
	
     	Def.Sprite{
        	OnCommand=function(self)
        		local s_sense = - 1
        		self:Load(file, "stretch")
				Petal(self, tbl._rev, 0, 45*3, tbl.mirror, -1)
				self:rotationz( self:GetRotationZ() + a * 180 )
				self:linear(42/2):rotationz(self:GetRotationZ()+720*0.875*tbl._rev*s_sense):queuecommand("On"):set_tween_uses_effect_delta(true)
			end
		}
	}

end

return t