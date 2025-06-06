
local Vector = Astro.Vector

local astro = Astro.Table           local resolvePath = tapLua.resolvePath

local merge = tapLua.Actor.merge


local Actor = {}        beat4sprite.Actor = Actor


local function setMeta( f, tbl )

    local meta = { __call = f }         setmetatable( tbl, meta )

end


local function lib(keys)

    if not keys then return Actor end

    local function isValid( k, v ) return astro.contains( Actor, k ) end

    return astro.filter( Actor, isValid )

end

local function extend( actor, keys )

    local lib = lib(keys)       astro.merge( actor, lib )       return actor

end

Actor.extend = extend

local function actor( beat4sprite, input )

    local class = input.Class           local Actor = tapLua[class] or tapLua.Actor

    local base = {

        InitCommand=function(self)

            for k,v in pairs( beat4sprite ) do self[k] = v end

            self.extend, self.Commands = nil -- It's not logical.

        end,

        UpdateFunctionCommand=function(self) self:runTimers() end

    }

    input = merge( base, input )            return Actor(input)

end

setMeta( actor, Actor )


local Sprite = {}        beat4sprite.Sprite = Sprite

local function sprite( beat4sprite, input )

    input.Class = "Sprite"        input.Texture = resolvePath( input.Texture )

    local base = {
        
        InitCommand=function(self)
            
            for k,v in pairs( beat4sprite ) do self[k] = v end

        end,

        UpdateFunctionCommand=function(self)
            
            if not self.beat4sprite then return end         self:updateRainbow():updateStateDelay()
        
        end
    
    }

    input = merge( base, input )            return Actor(input)

end

setMeta( sprite, Sprite )


local function Quad( input ) input.Class = "Quad"       return Actor(input) end

local function ActorFrame( input ) input.Class = "ActorFrame"       return Actor(input) end

local function ActorProxy( input ) input.Class = "ActorProxy"       return Actor(input) end

--local function ActorFrameTexture( input ) input.Class = "ActorFrameTexture"       return Actor(input) end

local function Text( input )
    
    input.Class = "BitmapText"          input.Font = resolvePath( input.Font )          return Actor(input) 

end


-- Additional actors.

local function BaseFrame( input )
    
    local base = {

        GainFocusCommand=function(self)	self:visible(true) end,
		LoseFocusCommand=function(self) self:visible(false) end

    }

    input = merge( base, input )            return ActorFrame(input)

end

local function Square(path)

	return beat4sprite.Sprite {

		InitCommand=function(self) self:Load( path, "stretch" ):queuecommand("Post") end,

        PostCommand=function(self) local h = self:GetHeight()       self:SetWidth(h) end

	}

end

local function ScreenQuad(color)

	return tapLua.ScreenQuad(color) .. { InitCommand=function(self) extend(self) end }
	
end

local function ScreenBlend(blend)

    blend = blend or Blend.Add

	return ScreenQuad() .. { InitCommand=function(self) self:blend(blend) end }
	
end


astro.merge( beat4sprite, {
    
    BaseFrame = BaseFrame,      ActorFrame = ActorFrame,        ActorProxy = ActorProxy,
    
    Text = Text,        Quad = Quad,        Square = Square,        ScreenQuad = ScreenQuad,
    
    ScreenBlend = ScreenBlend,          extend = extend

} )