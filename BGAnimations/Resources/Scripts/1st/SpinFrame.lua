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
                self:GetParent():SetWidth( self:GetZoomedWidth() * 4 )
                self:GetParent():SetHeight( self:GetZoomedHeight() * 4 )
            end,
            OnCommand=function(self)
                PSX_BGA_Globals["BGA_FrameSelector"](self, params)
                self:xy( self:GetParent():GetWidth() * 0.5, self:GetParent():GetHeight() * 0.5 )
                self:zoom( self:GetZoom() * 6.5 )
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

    params.Zoom = params.Zoom * 0.2225
    t[#t+1] = LoadActor( "../TileTool.lua", params )..{}

return Def.ActorFrame{ t }