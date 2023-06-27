
local parameters = ...                              local p = parameters

local step = p.Step or 1                        if p.Backwards then step = -1 end

local index = p.FileIndex or 0

local set = p.Set

local cycleOffset = p.Cycle.Offset

local wasDirect = p.Script:match("Cyclic/Sprite")

local Actor = beat4sprite.Actor(p) .. {

    InitCommand=function(self) self.fileIndex = index       self.Step = step end,

    OnCommand=function(self) 
        self:sleep( cycleOffset * self:getTweenRate() ):queuecommand("Repeat") 
    end,
    
    RepeatCommand=function(self)

        self.fileIndex = self.fileIndex + step

        -- Keep the indexes within range.
        self.fileIndex = ( self.fileIndex - 1 ) % #set + 1

        local sub = set[ self.fileIndex ]       sub = sub:getInternals()
        local file, cycle = sub.File, sub.CycleTime * self:getTweenRate()

        self.Parameters.States = sub.States     self.Spin = sub.Spin

        self:stoptweening()
        self:Center():Load(file):init():playCommands()

        local w, h = self:GetZoomedWidth(), self:GetZoomedHeight()

        self:GetParent():sleep(cycle):queuecommand("Repeat")

    end

}

if wasDirect then

    return beat4sprite.ActorFrame() .. {
        beat4sprite.Sprite.bgTemplate( { File = p.File[1] } ):Load(),    Actor
    }

else return Actor end