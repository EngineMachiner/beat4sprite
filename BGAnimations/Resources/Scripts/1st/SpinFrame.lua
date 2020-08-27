local params = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

    LoseFocusCommand=function(self)
        self:RunCommandsOnChildren( 
            function(child)
                child:visible(false)
                child:stoptweening()
            end )
    end

}
    
    --Sample Texture
    t[#t+1] = Def.ActorFrameTexture{

        Def.Sprite{
            InitCommand=function(self)
                self:Load(params.File)
                BGA_FrameSelector(self, params)
                self:GetParent():SetWidth( self:GetZoomedWidth() * 0.6875 )
                self:GetParent():SetHeight( self:GetZoomedHeight() * 0.6875 )
            end,
            GainFocusCommand=function(self)
                BGA_FrameSelector(self, params)
                self:xy( self:GetZoomedWidth() * 0.5 * 0.6875, self:GetZoomedHeight() * 0.5 * 0.6875 )
                self:spin()
                self:effectclock("beat")
                self:set_tween_uses_effect_delta(true)
            end
        },

        InitCommand=function(self)
            self:EnableAlphaBuffer(true)
            self:Create()
            params.Texture = self:GetTexture()
        end

    }

    params.Zoom = params.Zoom * 0.221
    t[#t+1] = LoadActor( "../TileTool.lua", params )..{}

return Def.ActorFrame{ t }