local params = ...

local t = Def.ActorFrame{

    GainFocusCommand=function(self)
        self:zbuffer(true)
        self:SortByDrawOrder()
        self:fov(120)
    end,
    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren( 
            function(child)
                child:visible(false)
                child:stoptweening()
                child:stopeffect()
            end )
    end

}

BGA_NoParams( params )

for i=0,4 do
    for k=0,1 do
        t[#t+1] = Def.Sprite{
            GainFocusCommand=function(self)
                self:Load(params.File)
                BGA_FrameSelector(self, params)
                self:xy( SCREEN_LEFT+self:GetZoomedWidth()*i*1.5, SCREEN_BOTTOM )
                self:set_tween_uses_effect_delta(true):effectclock('beat')
                self:diffusealpha(0):sleep(k*2)
                self:queuecommand("Depth")
            end,
            DepthCommand=function(self)
                self:diffusealpha(1):z(0):linear(4):z(-1000):linear(0.25):diffusealpha(0):queuecommand("Depth")
            end
        }
    end
end

return Def.ActorFrame{ t }