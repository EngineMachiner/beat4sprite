
local astro = Astro.Type                local isOdd = Astro.Math.isOdd

local isTable = astro.isTable           local isString = astro.isString


local astro = Astro.Table

local Vector = Astro.Vector             local isVector = Vector.isVector

local isZero = Vector.isZero            local planeAxes = Vector.planeAxes


local maxComponent = Vector.maxComponent

local componentVector = Vector.componentVector


local Actor = tapLua.Actor              local screenSize = tapLua.screenSize()


-- It's an advanced tiling script using the tapLua Tile.lua script.

local builder = ... or beat4sprite.Arguments

local Commands = { "Mirror", "Quad" }           builder:setCommands( Commands )


builder.Scroll = builder.Scroll or {}       local Scroll = builder.Scroll

if isVector(Scroll) then builder.Scroll = { Direction = Scroll } end

Scroll = builder.Scroll


local Direction = Scroll.Direction

if Direction then Scroll.Direction = Vector.unit( Direction ) end


local Texture = builder.Texture         local States = builder.States

local TextureScale = builder.TextureScale or 1

local isComposed = isTable(Texture)


local Display = builder.Display         local Spiral = builder.Spiral


local Rotation = builder.Rotation or Vector()

local Blend = builder.Blend             local Colors = builder.Colors


local Mirror = builder.Mirror           local Zoom = builder:zoom()

if Mirror == true then Mirror = { x = true, y = true } end


local isScreenScale = builder.ScreenScale

local Matrix = builder.Matrix               local Dynamic = builder.Dynamic


local function tileUtil( path, ... )
    
    local args = ... or builder

    return beat4sprite.Load( "Tile/" .. path )(args)

end


local quadActor, onQuad = tileUtil("Quad")

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

Commands = { "Visible", "States" }

local Sprite = beat4sprite.Sprite {

    InitCommand=function(self) self:queuecommand("On") end,

    OnCommand=function(self)

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
            
            local value = pos[v] + 1                value = value % 2
    
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


local Sprite3 = builder.Output or {}


local input = {
    
    Texture = Texture,          Sprite = Sprite,    Zoom = Zoom,        Matrix = Matrix,        Spiral = Spiral

}


local Renderer = tapLua.Sprite.Renderer

local function setScreenScale()

    local h = Renderer:GetHeight()             Renderer:zoom( SCREEN_HEIGHT / h )

end

local function onPreload()

    if isScreenScale then setScreenScale() end
    

    local matrix = Dynamic and Renderer:screenMatrix() or Vector(1,1)
    
    Matrix = Matrix or matrix           input.Matrix = Matrix

    
    if not Mirror then return end

    for i,v in ipairs(planeAxes) do

        if isOdd( Matrix[v] ) and Matrix[v] then Matrix[v] = Matrix[v] + 1 end
    
    end

    input.Matrix = Matrix

end

input.onPreload = onPreload


-- 2. Composition of textures.

local function ActorFrameTexture( input )

    return tapLua.ActorFrameTexture {

        CreateTextureCommand=function(self)

            if self:GetTexture() then return end

            self:EnableAlphaBuffer(true):EnableDepthBuffer(true):Create()
        
        end
    
    } .. input

end

local function queueTile(self) self:GetParent():queuecommand("Tile") end

local function Composition()

    local Actor = Def.Actor { ComposeCommand = queueTile }

    -- Returns an ActorFrameTexture that composes static textures together from different files.

    if not isComposed then return Actor end

    local function direction(component)

        local direction = Display[component]            if direction ~= 0 then return 1 end

        if not isZero(Display) then return 0 end


        local max = maxComponent(screenSize)            return max.key == component and 1 or 0

    end


    local function Sprite(input) return beat4sprite.Sprite(input) .. { ComposeCommand = onQuad } end


    -- First texture.

    local function firstInit(self)

        self.beat4sprite = builder        initStates(self)

        local filter = beat4sprite.Filter or false          self:SetTextureFiltering(filter)
                
        self:onGameplay():initSprite():setupEffect()

    end

    local t = beat4sprite.ActorFrame {

        Sprite {

            Texture = Texture[1],

            OnCommand=function(self) self:init(builder) end,

            ComposeCommand=function(self)

                local p = self:GetParent()          local AFT = p:GetParent()

                local size = self:GetSize()         p:setPos( size * 0.5 )

                AFT:setSizeVector(size)             firstInit(self)

            end

        } .. Sprite2

    }


    -- Add the following textures in the display direction.

    for i,v in ipairs(Texture) do for _, component in ipairs(planeAxes) do

        
        if #Texture == 1 then break end

        local direction = direction(component)              local condition = direction ~= 0 and i > 1


        local a = beat4sprite.ActorFrame {}         t[#t+1] = a

        a[#a+1] = Sprite {

            Texture = v,        Condition = condition,

            ComposeCommand=function(self)

                local p = self:GetParent()              local AFT = p:GetParent():GetParent()

                local size = self:GetSize()             size = componentVector( size, component )


                local newSize = AFT:GetSize() + size         AFT:setSizeVector(newSize)


                newSize = componentVector( newSize, component )

                local pos = newSize - size           p:setPos(pos)

            end

        }
        

        -- Add the textures in the missing spots followed by their sequence.

        condition = condition and not isZero(Display) and component == 'y'

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

local AFT, Zoom, RenderedSize, OffsetSize

local childPath = beat4sprite.Path .. "Scripts/Tile/Child.lua"

return beat4sprite.ActorFrame {

    OnCommand=function(self) self:queuecommand("Compose") end,              Composition(),

    ActorFrameTexture {

        TileCommand=function(self)

            -- if AFT then self:queuecommand("Init") return end     -- It would be good if this worked? States don't work.
            
            self:RemoveAllChildren()        AFT = self

            beat4sprite.Arguments = input     self:AddChildFromPath(childPath)      beat4sprite.Arguments = nil

            RenderedSize = Renderer:GetZoomedSize()

        end,

        TextureCommand=function(self)

            self:playcommand("CreateTexture")
            
            Zoom = 1 / self:GetZoom()       OffsetSize = RenderedSize / Zoom

        end

    },

    ActorFrameTexture {

        -- Legacy workaround stretching to power of two size.

        Condition = tapLua.isLegacy(),

        tapLua.Sprite {
            
            TextureCommand=function(self)
                
                local formerSize = AFT:GetSize()
                
                local Texture = AFT:GetTexture()        local size = tapLua.Texture.size(Texture)

                self:SetTexture(Texture):setPos( size / 2 ):setSizeVector(size):SetTextureFiltering(false)


                OffsetSize = Vector.componentDivision( size, Matrix )

                AFT = self:GetParent()              AFT:setSizeVector(size)
                
                AFT.FormerSize = formerSize         AFT:playcommand("CreateTexture")

            end
        
        }

    },

    beat4sprite.Sprite {

        OnCommand=function(self)
            
            -- Use customtexturerect() to reset texture coords if using addimagecoords().

            self:Center()           self:init(builder):initSprite():setAlpha()
        
            if Blend then self:blend(Blend) end

        end,

        TextureCommand=function(self)

            local Texture = AFT:GetTexture()            self:SetTexture(Texture)
            
            local formerSize = AFT.FormerSize           if formerSize then self:setSizeVector(formerSize) end

            self:zoom(Zoom):playcommand("Rect"):playcommand("Scroll")

        end,

        RectCommand=function(self)

            local scale = 0.5 / TextureScale

            local size = self:GetZoomedSize()           self.ScrollSize = size

            if Dynamic then
            
                local x = scale * 2         self:customtexturerect( 0, 0, x, x )

            else
            
                -- Frame, center and offset the texture.
                
                local rect = Vector(screenSize)

                for i,v in ipairs(planeAxes) do rect[v] = rect[v] * scale / size[v] end

                local w, h = screenSize:unpack()        local x, y = rect:unpack()

                self:scaletoclipped( w, h ):customtexturerect( -x, -y, x, y ):moveTextureBy( OffsetSize / 2 )

            end

        end,

        ScrollCommand=function(self)

            if not Scroll.Direction then return end         if onScrollSkipping(self) then return end

            local velocity = scrollVelocity(self)           self:scrollTexture(velocity)        onReverseScroll(self)
    
        end
    
    } .. Sprite3,

    quadActor()
    
}