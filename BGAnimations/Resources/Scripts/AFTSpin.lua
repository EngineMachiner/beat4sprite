local params = ...

params.Zoom = params.Zoom or 1
params.Static = true

local t = Def.ActorFrame{

    GainFocusCommand=function(self)
        BGA_G.Stop( self, true )
    end,
    LoseFocusCommand=function(self)
        BGA_G.Stop( self )
    end

}

    --Sample Texture
    t[#t+1] = Def.ActorFrameTexture{

        Def.Sprite{
            InitCommand=function(self)
                self:Load(params.File)
                BGA_G.SetStates(self, params)
                self:GetParent():SetWidth( self:GetZoomedWidth() * 4.25 )
                self:GetParent():SetHeight( self:GetZoomedHeight() * 4.25 )
            end,
            OnCommand=function(self)

                self:effectclock("beat")
                self:set_tween_uses_effect_delta(true)

                BGA_G.SetStates(self, params)

                self:animate(false)
                self:xy( self:GetParent():GetWidth() * 0.5, self:GetParent():GetHeight() * 0.5 )
                self:zoom( self:GetZoom() * 6.5 )

                self:spin()
                if params.SpinMag then 
                    local r = params.SpinMag
                    self:effectmagnitude(r[1],r[2],r[3])
                end

            end
        },

        InitCommand=function(self)
            self:EnableAlphaBuffer(true)
            self:Create()
            params.Texture = self:GetTexture()
        end

    }

    params.Zoom = params.Zoom * 0.179
    local s = "/BGAnimations/Resources/Scripts/TileTool.lua"
    t[#t+1] = loadfile( s )( params )

return Def.ActorFrame{ t }