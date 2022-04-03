
local params = ...

params.Type = params.Type or "CustomDir"

if params.Type == "CustomDir" then
    params.Lines = params.Lines or 6
    params.Vec = params.Vec or { 1, 1 }
end

local t = BGA_G.Frame() .. {

    OnCommand=function(self)
        BGA_G.ObjFuncs(self)
        self:Center3D()
        self:zbuffer(true)
        self:SortByDrawOrder()
        self:fov(170)
    end

}


local val1, val2 = 590, 10

params.ZoomXYZ = params.ZoomXYZ or { 1, 1, 0 }
if params.Flat then
    val1 = val1 + 200   val2 = val2 + 200
    if params.ZoomXYZ then 
        params.ZoomXYZ[1] = 0.125
        params.ZoomXYZ[3] = 90
    end
end

local zpos = params.Dir == "Out" and { -val1, val2 }
zpos = zpos or { val2, -val1 }

params.Num = params.Num or 5
local p = params.Num

local tween = params.HurryTweenBy

if string.match(params.File, "%/5th%/") then
    tween = tween * 0.666
    params.Lines = params.Lines or 2
    if params.Type == "CustomDir" then
        params.Lines = params.Lines - 1
    end
else
    -- Default 1st MIX
    params.Lines = params.Lines or 12 * 2
    params.Lines = math.ceil(params.Lines)
end

local amp = 6
for k = 1, params.Lines do

    t[#t+1] = Def.ActorFrame{

        OnCommand=function(self)

            BGA_G.ObjFuncs(self)
            self:set_tween_uses_effect_delta(true)
            self:effectclock('beat')

            local p = self:GetDelay()
            self.Tween = p * tween * amp * 2

            local amp2 = self.Tween / params.Lines
            self:diffusealpha(0):sleep( (k - 1) * amp2 )

            self:PlayCmds(params)
            self:queuecommand("Depth")

        end,

        DepthCommand=function(self)
            self:playcommand(params.Type)
            self:playcommand("Fade")
            if params:IsCmd( "Shade" ) then
                self:playcommand("Shade")
            end
            self:diffusealpha(1)
            self:z(zpos[1]):linear(self.Tween):z(zpos[2])
            self:queuecommand("Depth")
        end,

        CustomDirCommand=function(self)

            local w = SCREEN_WIDTH
            local h = SCREEN_HEIGHT
            self.Random = math.random(1, p)

            w = math.random(- w * 1.5, w * 1.5)
            h = math.random(- h * 1.5, h * 1.5)
            w = SCREEN_CENTER_X + w
            h = SCREEN_CENTER_Y + h

            self:xy( w, h )

        end

    }

    for i=1,p do

        local a = t[#t]

        a[#a+1] = Def.ActorFrame{ 

            OnCommand=function(self) BGA_G.ObjFuncs(self) end,

            ShadeCommand=function(self)

                local P = self:GetParent()
                local shadowColors = { Color.White, Color.Black }

                if type(params.Shade) == "table" then
                    shadowColors = params.Shade
                end

                if params.Dir == "Out" then 
                    shadowColors = { shadowColors[2], shadowColors[1] }
                end

                self:diffuse(shadowColors[1])
                self:linear(P.Tween):diffuse(shadowColors[2])
                
            end

        }
        a = a[#a]

        a[#a+1] = Def.ActorFrame{

            OnCommand=function(self) BGA_G.ObjFuncs(self) end,
    
            FadeCommand=function(self)

                local tweenL = 0.5 * tween

                local tweenAll = self:GetParent():GetParent()
                tweenAll = tweenAll.Tween

                local tweenIn, tweenOut = 0, 0
                if params.Type == "CustomDir" then
                    tweenIn = i * 0.5 * tween
                    tweenOut = ( p - i ) * 0.5 * tween
                end
                local dir = { In = tweenOut, Out = tweenIn }

                tweenAll = tweenAll - tweenL - tweenIn - tweenOut
    
                dir = params.Dir and dir[params.Dir] or tweenOut

                self:diffusealpha(0)
                self:sleep(dir):linear(tweenL * 0.5):diffusealpha(1)
                self:sleep(tweenAll):linear(tweenL * 0.5):diffusealpha(0)
    
            end
    
        }
        a = a[#a]

        a[#a+1] = Def.Sprite{

            OnCommand=function(self)

                self.Index = i
                BGA_G.ObjFuncs(self)
                self:set_tween_uses_effect_delta(true)
                self:effectclock('beat')
                if params.Spin then self:spin() end

                self:Load(params.File)
                self:SetStates(params)
                self.states = self:GetNumStates()

                self:zoomx( self:GetZoomX() * params.ZoomXYZ[1] )
                self:zoomy( self:GetZoomY() * params.ZoomXYZ[2] )
                self:rotationx( params.ZoomXYZ[3] )

                if params.ZoomXYZ[3] > 0 then
                    self:zoomy( self:GetZoomY() * 0.5 )
                end

            end,

            LineCommand=function(self)
                if not self.Once then
                    local w = self:GetZoomedWidth() * 1.5
                    local w2 = ( p - 1 ) * 0.5
                    w = w * ( self.Index - 1 - w2 )
                    self:x( SCREEN_CENTER_X + w )
                    self:y( SCREEN_BOTTOM )
                    self:queuecommand("FramePerSprite")
                    self.Once = true
                end
            end,

            CustomDirCommand=function(self)

                local p = self:GetParent()
                for i=1,2 do p = p:GetParent() end

                local w = self:GetZoomedWidth()
                local h = self:GetZoomedHeight()

                self:diffusealpha(1)
                if i > p.Random then
                    local w2 = math.random(-1,1) * 1.5 * w
                    local h2 = math.random(-1,1) * 1.5 * h
                    p:xy( p:GetX() + w2, p:GetY() + h2 )
                    self:diffusealpha(0)
                end
                    
                local i = self.Index - 1

                w = w * i * params.Vec[1]
                h = h * i * params.Vec[2]
                self:xy( w, h )     self:z( - 10 * i )

            end,

            TwoSpritesCommand=function(self)
                self:animate(false)
                self:setstate(i % self.states)
            end,
            FramePerSpriteCommand=function(self)

                self:animate(false)

                local state = i + k - 1

                while state > self.states - 1 do
                    state = state - self.states
                end
                self:setstate(state)

            end

        }
            
    end

end

t = not params.Remove and t

return Def.ActorFrame{ t }