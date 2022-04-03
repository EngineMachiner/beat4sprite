
local params = ...
local p = params
p.Angle = p.Angle or 0

local t = BGA_G.Frame() .. {
    OnCommand=function(self)
        BGA_G.ObjFuncs(self)
        if p.AFT then self:Center3D(0.5) end
    end
}

t[#t+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:Center()
		self:rotationz( p.Angle )
	end
}
local a = t[#t]

a[#a+1] = Def.ActorFrame{
	OnCommand=function(self)
		self:x( - SCREEN_CENTER_X )
		self:y( - SCREEN_CENTER_Y )
	end
}
a = a[#a]

local n = p.Matrix or { 5, 4 }
local c = p.Even and 1 or 0

for i=1,n[1] do
    for j=1,n[2] do

        if ( i + j ) % 2 == c then

            a[#a+1] = Def.ActorFrame{

                Def.Sprite{
                    
                    OnCommand=function(self)

                        BGA_G.ObjFuncs(self)
                        self:diffusealpha(0)
                        self:Load(p.File)
                        self:SetStates(p)

                        self:PlayCmds(p)
                        if p.Sleep then 
                            self:sleep(p.Sleep)
                        end
                        self:diffusealpha(1)
                        self:queuecommand("Sequence")

                    end,
                    BlendCommand=function(self)
                        self:blend(params.Blend) 
                    end,
                    SequenceCommand=function(self)
            
                        local pa = self:GetParent():GetParent()
                        local w = self:GetZoomedWidth()
                        local h = self:GetZoomedHeight()
                        local r = p.Spin and 45 * ( i + j - 1 ) or 0

                        self:Center()
                        self:diffusealpha(1)
                        self:rotationz(r)
                        self:linear(4)
                        
                        local dir = { 
                            i - ( n[1] + 1 ) * 0.5, 
                            j - ( n[2] + 1 ) * 0.5 
                        }

                        local x = SCREEN_WIDTH * dir[1] * 1.5
                        local y = SCREEN_HEIGHT * dir[2] * 1.5

                        if p.AngleAmp or p.RandomAmp then
                            local ang = p.AngleAmp or math.random(0, 360) 
                            ang = math.rad( ang )
                            x = x - SCREEN_WIDTH * math.abs( math.sin( ang ) ) * dir[1]
                            y = y - SCREEN_HEIGHT * math.abs( math.cos( ang ) ) * dir[2]
                        end

                        x = self:GetX() + x     y = self:GetY() + y
                        
                        self:xy( x, y )

                        if p.Spin then
                            self:rotationz( self:GetRotationZ() + 360 * 2 )
                        end

                        self:sleep(0)
                        self:linear(0.25):diffusealpha(0)
                        self:sleep(8 - 0.25)

                        self:queuecommand("Sequence")

                    end

                }
            }

        end

    end
end

t = not p.Remove and t

return Def.ActorFrame{ t }