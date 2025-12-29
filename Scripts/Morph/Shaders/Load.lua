
local builder = ...

return beat4sprite.Sprite {

    Texture = builder.Texture,          Frag = builder.Frag,

    OnCommand=function(self)

        self:init(builder):fitInScreen()


        local shader = self:GetShader()

        local magnitude = self.Effect.Magnitude

        shader:uniform1f( "period", self.Effect.Period )

        shader:uniform2f( "magnitude", magnitude:unpack() )

        --[[
        
            IMPORTANT: Set texture wrapping to false if you don't want the texture 
            to repeat at the edges when it distorts.

            If you see streaks at the edges, try changing it.
            self:texturewrapping(true)

        ]]

    end

}