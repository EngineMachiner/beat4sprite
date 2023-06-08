
local params = ...          local p = params            local file = p.File

local t = beat4sprite.ActorFrame() .. { OnCommand=function(self) 
    self:zbuffer(true):SortByDrawOrder():fov(170) 
end }

local start, finish = 0, 590        -- Z coord positions values.

local paths = { "/5th/", "/1st/" }              local default = { Direction = { x = 1, y = 0 } }

local isLine = p.Type == "Line" or p:hasCommand("Line")       p.Type = nil

local settingsIndex = p.Setting or 3
for k,v in ipairs(paths) do if file:match(v) then settingsIndex = k break end end

local settings = {

    -- 5th
    function()  default.Lines = 2       p.tweenRate = p.tweenRate * 0.666 end,

    -- 1st
    function() default.Lines = 24 end

}

settings[3] = function() settings[1]()       default.Lines = 5           finish = finish - 75 end

settings[ settingsIndex ]()

if not isLine then default.Direction = { x = 1, y = 1 } end

local move = p.Move
local lines = p.Lines or default.Lines          
local direction = p.Direction or default.Direction

local numberOf = 5
if type( p.numberOf ) == "number" then numberOf = p.numberOf end

local zoomXYZ = p.ZoomXYZ or { x = 1, y = 1, z = 0 }
local alpha = p.Alpha or 1
local shade = p.Shade

if p.Flat then
    
    start = start + 200         finish = finish + 200

    -- zoomXYZ z coord is for rotationx(), below. 
    if zoomXYZ then zoomXYZ = { x = 0.125, y = zoomXYZ.y, z = 45 * 1.75 } end

end

-- Default sleepTimeection towards the screen.
local pos = { start, - finish }
if move == "Out" then pos = { pos[2], pos[1] } end

local function wait2(self) return self:getTweenRate() * 12 end

for k = 1, lines do

    t[#t+1] = beat4sprite.ActorFrame() .. {

        OnCommand=function(self)

            self.Parameters = p

            local t = self:getTweenRate()      t = ( k - 1 ) * t * 12 / lines

            self:diffusealpha(0):sleep(t):queuecommand("Broadcast")

        end,

        BroadcastCommand=function(self)
            if p:hasCommand("Shade") then self:queuecommand("Shade") end
            self:queuecommand("Fade"):queuecommand("Move")
        end,

        MoveCommand=function(self)

            if not isLine then self:playcommand("Spread") end

            self:diffusealpha(1)
            self:z( pos[1] ):linear( wait2(self) ):z( pos[2] )
            self:queuecommand("Move")
            
        end,

        SpreadCommand=function(self)

            local w, h = SCREEN_WIDTH, SCREEN_HEIGHT
            
            self.Random = math.random( 1, numberOf )

            w = math.random( - w * 1.5, w * 1.5 )
            h = math.random( - h * 1.5, h * 1.5 )

            w = SCREEN_CENTER_X + w         h = SCREEN_CENTER_Y + h

            self:xy( w, h )

        end

    }

    for i = 1, numberOf do

        local a = t[#t]

        a[#a+1] = beat4sprite.ActorFrame() .. {

            ShadeCommand=function(self)
                local time =  wait2( self:GetParent() )
                self:diffuse( shade[1] ):linear(time):diffuse( shade[2] )
                self:queuecommand("Shade")
            end

        }

        a = a[#a]

        a[#a+1] = beat4sprite.ActorFrame() .. {
    
            InitCommand=function(self) self.Parameters = p end,
            FadeCommand=function(self)

                local fadeTime = self:getTweenRate() * 0.25
                local totalTime = wait2(self)

                local tweenIn, tweenOut = 0, 0

                if not isLine then
                    tweenIn = ( i - 1 ) * fadeTime
                    tweenOut = ( numberOf - i ) * fadeTime
                end

                totalTime = totalTime - fadeTime * 2 - tweenIn - tweenOut

                local sleepTime = { tweenOut, tweenIn }
                if move == "Out" then sleepTime = { tweenIn, tweenOut } end

                self:diffusealpha(0)
                self:sleep( sleepTime[1] ):linear(fadeTime):diffusealpha(alpha)
                self:sleep( totalTime ):linear(fadeTime):diffusealpha(0)
                self:sleep( sleepTime[2] )
                self:queuecommand("Fade")
    
            end
    
        }

        a = a[#a]

        a[#a+1] = beat4sprite.Actor(p) .. {

            OnCommand=function(self)

                self.Index = i

                if p.Color then self:diffuse( p.Color[1] ) end
                if p.Blend then self:blend( p.Blend ) end
                if p.Spin then self:spin():effectperiod( self:getTweenRate() * 8 ) end

                self:init()

                self:zoomx( self:GetZoomX() * zoomXYZ.x )
                self:zoomy( self:GetZoomY() * zoomXYZ.y )

                -- This could be misinterpreted.
                self:rotationx( zoomXYZ.z )
                if zoomXYZ.z > 0 then self:zoomy( self:GetZoomY() * 0.5 ) end

                self:playCommands():queuecommand("Line")

            end,

            LineCommand=function(self)
                
                if not isLine then return end

                local a = ( numberOf - 1 ) * 0.5

                local w = self:GetZoomedWidth() * 1.5
                w = w * ( self.Index - 1 - a )

                self:xy( SCREEN_CENTER_X + w, SCREEN_BOTTOM )

            end,

            SpreadCommand=function(self)

                local p = self:GetParent()      for i=1,2 do p = p:GetParent() end

                local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()

                self:visible(true)
                
                if i > p.Random then

                    local w2 = math.random(-1, 1) * 1.5 * w
                    local h2 = math.random(-1, 1) * 1.5 * h

                    p:xy( p:GetX() + w2, p:GetY() + h2 )
                    self:visible(false)

                end
                    
                local i = self.Index - 1

                w = w * i * direction.x      h = h * i * direction.y

                self:xy( w, h ):z( - 10 * i )

            end,

            StatePerSpriteCommand=function(self) self:setstate( self:roundState( i + k - 1 ) ) end

        }
            
    end

end

return t