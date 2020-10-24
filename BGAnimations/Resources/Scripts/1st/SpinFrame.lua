local params = ...
local ScaleVar = _screen.h/480

local t = Def.ActorFrame{

    GainFocusCommand=function(self)
        PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
    end,
    LoseFocusCommand=function(self)
        PSX_BGA_Globals["BGA_ChildrenStop"]( self )
    end

}
    
    --Sample Texture
    t[#t+1] = Def.ActorFrameTexture{

        Def.Sprite{
            InitCommand=function(self)
                self:Load(params.File)
                PSX_BGA_Globals["BGA_FrameSelector"](self, params)
                self:GetParent():SetWidth( self:GetZoomedWidth() * 0.6875 )
                self:GetParent():SetHeight( self:GetZoomedHeight() * 0.6875 )
            end,
            OnCommand=function(self)
                PSX_BGA_Globals["BGA_FrameSelector"](self, params)
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