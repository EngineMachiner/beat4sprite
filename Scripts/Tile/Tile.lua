
-- TODO: Write a function that converts the command name and removes it.

local astro = Astro.Type

local isTable = astro.isTable          local isString = astro.isString


local astro = Astro.Table               local Meta = astro.Meta

local Vector = Astro.Vector             local isVector = Vector.isVector

local isZero = Vector.isZero          local planeAxes = Vector.planeAxes

local maxCoordinate = Vector.maxCoordinate


local Actor = tapLua.Actor


-- It's an advanced tiling script using the tapLua Tile.lua script.

local builder = ... or beat4sprite.Arguments

local Commands = { "Mirror", "Quad" }           builder:setCommands( Commands )


builder.Scroll = builder.Scroll or {}       local Scroll = builder.Scroll

if isVector(Scroll) then builder.Scroll = { Direction = Scroll } end

Scroll = builder.Scroll


local Direction = Scroll.Direction

if Direction then Scroll.Direction = Vector.unit( Direction ) end


local MatrixOffset = builder.MatrixOffset


local Texture = builder.Texture             local States = builder.States


local Display = builder.Display

if Scroll then Display = Display or Scroll.Direction end


local Rotation = builder.Rotation or Vector()


local Blend = builder.Blend             local Effect = builder.Effect

local Colors = builder.Colors


local Mirror = builder.Mirror           local Zoom = builder:zoom()

if Mirror == true then Mirror = { x = true, y = true } end


local function tileUtil( path, ... )
    
    local args = ... or builder

    return beat4sprite.Load( "Tile/" .. path )(args)

end


local quadActor, onQuad, isQuad = tileUtil("Quad")

local positionState, scrollStates = tileUtil("States")

local scrollVelocity, onReverseScroll, onScrollSkipping = tileUtil("Scroll")


-- 1. Setup the behaviour for the tiled sprites.

local function setRandomState(self)

    local states = self.beat4sprite.States

    if not self:hasAnimationType("Random") then return end

    states = self:GetNumStates()        local state = math.random(states) - 1
    
    self:setstate(state)        local rate = math.random( 500, 1500 ) * 0.001

    self.statesDelay = self.statesDelay * rate * 2

end

local function initStates(self)

    if self:GetNumStates() < 2 then return end          setRandomState(self)


    local properties = self:statesProperties()
        
    if States.Scroll then properties = scrollStates(self) end


    self:SetStateProperties(properties)             positionState(self)

end

Commands = { "Visible", "States", "On" }

local Sprite = beat4sprite.Sprite {

    InitCommand=function(self)

        self:init(builder):initSprite()           initStates(self)          self:queueCommands(Commands)

    end,

    VisibleCommand=function(self)

        local pos = self.TilePos            local visibility = builder.Visibility

        if not visibility then return end


        local i, j = pos:unpack()           local visible = visibility( i, j )
    
        self:visible(visible)

    end,

    StatesCommand=function(self)

        local offset = States.Offset            if not offset then return end

        self:setstate(offset)
        
    end,

    RotationCommand=function(self)

        local rotation = Rotation


        local a = Vector()             local pos = self.TilePos

        for i,v in ipairs(planeAxes) do
        
            if not Mirror then break end            local mirror = Mirror[v] == true
            
            local value = pos[v] + 1        value = value % 2
    
            if mirror then a[v] = value * 180 end
        
        end

        local mirror = Vector( a.y, a.x )

    
        rotation = rotation + mirror            self:setRotation(rotation)

    end,

    ColorsCommand=function(self)

        if #Colors ~= 1 then return end          local color = Colors[1]
        
        self:diffuse(color)

    end,

    QuadCommand=function(self)
        
        if isComposed then return end        onQuad(self)
    
    end

}


-- Merging...

local Sprite1 = builder.Sprite or {}

Sprite = Actor.commands( Sprite )           Actor.merge( Sprite, Sprite1 )


local Sprite2 = builder.Composition or {}

if builder.Composition and isString(Texture) then Texture = { Texture } end

Sprite2.ComposeCommand = Sprite2.InitCommand            Sprite2.InitCommand = nil

local isComposed = isTable(Texture)


local Sprite3 = builder.Output or {}


local input = { Texture = Texture,          Sprite = Sprite,    Zoom = Zoom,        MatrixOffset = MatrixOffset }


local Renderer = tapLua.Sprite.Renderer             local isScreenScale = builder.ScreenScale

local function setScreenScale()

    local w, h = Renderer:GetSize(true)             Renderer:zoom( SCREEN_HEIGHT / h )

end

local function onPreload()

    -- Check if should scale to screen height.

    if isScreenScale then setScreenScale() end


    -- Check mirror when the texture is oversized.

    if MatrixOffset or not Display then return end               local w, h = Renderer:GetZoomedSize(true)

    local displayX = w >= SCREEN_WIDTH and Display.x ~= 0             local displayY = h >= SCREEN_HEIGHT and Display.y ~= 0

    local offset = displayX and Vector(1) or Vector()                if displayY then offset.y = 1 end

    input.MatrixOffset = offset

end

input.onPreload = onPreload


-- 2. Composition of textures.

local function ActorFrameTexture( input )

    return tapLua.ActorFrameTexture {

        CreateTextureCommand=function(self)
        
            self:EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()
        
        end
    
    } .. input

end

local function queueTile(self) self:GetParent():queuecommand("Tile") end

local function Composition()

    local Actor = Def.Actor { ComposeCommand = queueTile }


    -- Returns an ActorFrameTexture that composes static textures together from different files.

    if not isComposed then return Actor end


    -- Could be added to Astro.Vector along with maxCoordinate.

    local function componentVector( vector, component )
        
        for i,v in ipairs(planeAxes) do   if v ~= component then vector[v] = nil end   end

        return vector

    end


    local function direction(coordinate)

        local direction = Display[coordinate]            if direction ~= 0 then return 1 end

        if not isZero(Display) then return 0 end


        local screenSize = tapLua.screenSize()          local max = maxCoordinate(screenSize)

        if max.key == coordinate then return 1 end
        

        return 0

    end


    local function Sprite(input) return beat4sprite.Sprite(input) .. { ComposeCommand = onQuad } end


    -- First texture.

    local function firstInit(self)

        self.beat4sprite = builder        initStates(self)

        local filter = beat4sprite.Filter or false          self:SetTextureFiltering(filter)
                
        self:onGameplay():initSprite():setupEffect()

    end

    local t = tapLua.ActorFrame {

        Sprite {

            Texture = Texture[1],

            ComposeCommand=function(self)

                local p = self:GetParent()          local AFT = p:GetParent()

                local size = self:GetSize()         p:setPos( size * 0.5 )

                AFT:setSizeVector(size)             firstInit(self)

            end

        } .. Sprite2

    }


    -- Add the following textures in the display direction.

    for i,v in ipairs(Texture) do      for a, coordinate in ipairs(planeAxes) do

        
        if #Texture == 1 then break end

        local direction = direction(coordinate)              local condition = direction ~= 0 and i > 1


        local a = tapLua.ActorFrame {}         t[#t+1] = a

        a[#a+1] = Sprite {

            Texture = v,        Condition = condition,

            ComposeCommand=function(self)

                local p = self:GetParent()              local AFT = p:GetParent():GetParent()

                local size = self:GetSize()             size = componentVector( size, coordinate )


                local newSize = AFT:GetSize() + size         AFT:setSizeVector(newSize)


                newSize = componentVector( newSize, coordinate )

                local pos = newSize - size           p:setPos(pos)

            end

        }
        

        -- Add the textures in the missing spots followed by their sequence.

        condition = condition and not isZero(Display) and coordinate == 'y'

        for j = 1, #Texture - 1 do

            local i = i + j - 1         i = i % #Texture + 1

            a[#a+1] = Sprite {
            
                Texture = Texture[i],        Condition = condition,

                ComposeCommand=function(self)

                    local w = self:GetWidth()        self:x( w * j )

                end
            
            }

        end


    end end


    local Composition = t

    return ActorFrameTexture {
        
        Composition,            ComposeCommand=function(self) self:queuecommand("Finish") end,

        FinishCommand=function(self)

            self:playcommand("CreateTexture")           input.Texture = self:GetTexture()
            
            queueTile(self)

        end

    }

end


-- 3. Return the actors involved.

local Width, AFT            local Renderer = tapLua.Sprite.Renderer

local childPath= beat4sprite.Path .. "Scripts/Tile/Child.lua"

return beat4sprite.ActorFrame {

    OnCommand=function(self) self:queuecommand("Compose") end,              Composition(),

    ActorFrameTexture {

        InitCommand=function(self) AFT = self end,
        
        TileCommand=function(self)

            beat4sprite.Arguments = input     self:AddChildFromPath(childPath)       beat4sprite.Arguments = nil
        
            Width = Renderer:GetZoomedWidth()

        end,

        LoadSpriteCommand=function(self) self:playcommand("CreateTexture") end

    },

    beat4sprite.Sprite {

        OnCommand=function(self) self:Center():init(builder):initSprite() end,

        LoadSpriteCommand=function(self)

            if Blend then self:blend(Blend) end


            local texture = AFT:GetTexture()            self:SetTexture(texture)

            local zoom = 1 / AFT:GetZoom()              self:zoom(zoom):playcommand("Scroll")


            -- Fit backgrounds easily. Maybe should offset on the y axis too.

            if Width >= SCREEN_WIDTH or not isScreenScale then return end

            local x = Width * 0.5           x = - x / zoom          self:addimagecoords( x, 0 )

        end,

        ScrollCommand=function(self)

            if not Scroll.Direction then return end           if onScrollSkipping(self) then return end
    
            local velocity = scrollVelocity(self)       self:scrollTexture(velocity)        onReverseScroll(self)
    
        end
    
    } .. Sprite3,

    quadActor()
    
}