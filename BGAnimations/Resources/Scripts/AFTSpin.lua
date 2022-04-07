local params = ...

params.Zoom = params.Zoom or 1
params.Static = true

local savedZoom = params.Zoom
local t = BGA_G.Frame() .. {
    OnCommand=function(self)
        if params.AFT then return end
        self.bitEyeScale = savedZoom * 0.54
        BGA_G.bitEyeFix(self, function(self)
            bitEye.AFT = true
        end)
    end
}

--Sample Texture
t[#t+1] = Def.ActorFrameTexture{
        
    Def.Sprite{
        Texture = params.File,
        InitCommand=function(self)
            self.p = self:GetParent()
            BGA_G.ObjFuncs(self)
            self:SetStates(params)
            self.p:SetWidth( self:GetZoomedWidth() * 4.25 )
            self.p:SetHeight( self:GetZoomedHeight() * 4.25 )
        end,
        OnCommand=function(self)
            BGA_G.ObjFuncs(self)
            self:SetStates(params)

            self:animate(false)
            self:x( self.p:GetWidth() * 0.5 )
            self:y( self.p:GetHeight() * 0.5 )
            self:zoom( self:GetZoom() * 6.5 )

            self:spin()
            if params.SpinMag then 
                local r = params.SpinMag 
                for i=1,#r do r[i] = r[i] * self:GetFullDelay(params) end
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
t[#t+1] = loadfile( BGA_G.SPath .. "TileTool.lua" )( params )

t = not params.Remove and t

return Def.ActorFrame{ t }