
local Actor = tapLua.Actor              local merge = Actor.merge

local Meta = Actor.Meta                 local resolvePath = Meta.resolvePath

local setMeta = Meta.setMeta            local InitCommand = Meta.InitCommand

local texture = Meta.texture

astro = Astro.Table                     local copy = astro.Copy.deep


local Actor = {}                        beat4sprite.Actor = Actor
local Sprite = {}                       beat4sprite.Sprite = Sprite

tapLua.FILEMAN.LoadDirectory( beat4sprite.Path .. "Actor/" )

local metaActor = copy(Actor)           metaActor.Commands = nil


local function lib(keys)

    if not keys then return Actor end

    local function isValid( k, v ) return astro.contains( keys, k ) end

    return astro.filter( Actor, isValid )

end

local function extend( actor, keys )

    local lib = lib(keys)       astro.merge( actor, lib )       return actor

end

Actor.extend = extend


local function actor( beat4sprite, input )

    local base = {

        InitCommand = InitCommand( beat4sprite ),
        
        UpdateFunctionCommand=function(self)
            
            self:runTimers()    if not self.beat4sprite then return end     self:trackBPM()
        
        end

    }

    input = merge( base, input )
    

    local class = input.Class           input.Class = nil

    local actor = tapLua[class] or tapLua.Actor             return actor(input)

end

setMeta( actor, Actor )


local function shader(self)

    if not self.GetShader then return end
    
    local shader = self:GetShader()         if not shader then return end

    return shader

end

 -- bitEye shader support.

local function bitEyeShaderSupport(self)

    local shader = shader(self)         if not shader then return end

    local isPreview = self:isOnGameplay() and 0 or 1

    shader:uniform1f( "isPreview", isPreview )

end

local function updateTime(self)

    if self:isOnGameplay() then return end

    local shader = shader(self)         if not shader then return end

    shader:uniform1f( "previewTime", GetTimeSinceStart() )

end

local function sprite( beat4sprite, input )

    local base = {

        Class = "Sprite",           Texture = texture( input.Texture ),
        
        InitCommand = InitCommand( beat4sprite ),       OnCommand = bitEyeShaderSupport,

        UpdateFunctionCommand=function(self)
            
            updateTime(self)        if not self.beat4sprite then return end
            
            self:updateRainbow():updateStateDelay()
        
        end
        
    }

    input = merge( base, input )            return Actor(input)

end

setMeta( sprite, Sprite )


local function Quad( input ) input.Class = "Quad"       return Actor(input) end

local function Model( input )
    
    local base = {

        Class = "Model",        OnCommand=function(self) self:texturewrapping(true) end

        -- No idea why StepMania has texturewrapping set to false for models in this context.

    }
    
    input = merge( base, input )        return Actor(input)

end

local function ActorFrame( input ) input.Class = "ActorFrame"       return Actor(input) end

local function ActorProxy( input ) input.Class = "ActorProxy"       return Actor(input) end

local function Text( input )
    
    input.Class = "BitmapText"      input.Font = resolvePath( input.Font )      return Actor(input) 

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

		InitCommand=function(self) self:LoadBy( path, "stretch" ):queuecommand("Post") end,

        PostCommand=function(self) local h = self:GetHeight()       self:SetWidth(h) end

	}

end

local function ScreenQuad(color)

	local Quad = tapLua.ScreenQuad(color)

    Quad.OnCommand = Quad.InitCommand           Quad.InitCommand = nil

    return Quad .. { OnCommand=function(self) extend(self) end }
	
end

local function ScreenBlend(blend)

    blend = blend or Blend.Add

	return ScreenQuad() .. { OnCommand=function(self) self:blend(blend) end }
	
end


astro.merge( beat4sprite, {
    
    BaseFrame = BaseFrame,      ActorFrame = ActorFrame,        ActorProxy = ActorProxy,

    Text = Text,        Quad = Quad,        Square = Square,        ScreenQuad = ScreenQuad,
    
    ScreenBlend = ScreenBlend,          Model = Model,          extend = extend

} )