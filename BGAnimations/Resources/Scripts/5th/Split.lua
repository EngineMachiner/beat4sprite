local params = ...

local t = Def.ActorFrame{
	GainFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self, true )
	end,
	LoseFocusCommand=function(self)
		PSX_BGA_Globals["BGA_ChildrenStop"]( self )
	end
}

if not params.Sleep then params.Sleep = 4 end

local crops = {
	{ 0, 0.5, 0, 0.5, -1, -1 },
	{ 0, 0.5, 0.5, 0, 1, -1 },
	{ 0.5, 0, 0, 0.5, -1, 1 },
	{ 0.5, 0, 0.5, 0, 1, 1 }
}


	--Static Background with alphas

local tbl

for _,v in ipairs( params.Alphas ) do
	tbl = {}
	tbl.BGMirror = true
	tbl.Commands = "Mirror"
	tbl.File = params.File[v]
	t[#t+1] = LoadActor( "../TileTool.lua", tbl )..{}
end
	
	local function AddNSub(val)

		local new_val

		if not params.Dir then
			new_val = val + 1
		else
			new_val = val - 1
		end

		if new_val > #params.File then 
			new_val = 1
		end

		if new_val <= 0 then 
			new_val = #params.File
		end

		return new_val

	end
	
	local c, c2 = 1, #params.File

	if not params.Dir then
		c = c + 1
	else
		c2 = c2 + 1
	end

	--Background that changes

	t[#t+1] = Def.Sprite{
		OnCommand=function(self)

			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)

			self:Load(params.File[c])
			PSX_BGA_Globals["BGA_Details"]( self, params )

			self:Center()

			self:sleep( params.Sleep )
				c = AddNSub(c)
			self:queuecommand("On")

		end
	}

	--Split

for i=1,4 do

	t[#t+1] = Def.ActorFrame{

		OnCommand=function(self)

			self:effectclock("beat")
			self:set_tween_uses_effect_delta(true)
			PSX_BGA_Globals["BGA_ToolPreview"](self)

			self:sleep( params.Sleep )
				if i == 1 then
					c2 = AddNSub(c2)
				end				
			self:queuecommand("On")

		end,

		Def.Sprite{
			OnCommand=function(self)

				self:stoptweening()
				self:stopeffect()

			 	self:effectclock("beat")
			 	self:set_tween_uses_effect_delta(true)
				self:Load(params.File[c2])
				PSX_BGA_Globals["BGA_Details"]( self, params )

				self:Center()
				self:croptop(crops[i][1])
				self:cropbottom(crops[i][2])
				self:cropleft(crops[i][3])
				self:cropright(crops[i][4])

				self:queuecommand("Split")

			end,
			SplitCommand=function(self)
				self:finishtweening()
				if not params.Dir then
					self:Center():linear(4)
						:x( self:GetX() + self:GetZoomedWidth() * 0.5 * crops[i][5] )
						:y( self:GetY() + self:GetZoomedHeight() * 0.5 * crops[i][6] )
				else
					self:x( self:GetX() + self:GetZoomedWidth() * 0.5 * crops[i][5] )
						:y( self:GetY() + self:GetZoomedHeight() * 0.5 * crops[i][6] )
						:linear(4):Center()						
				end
			end
		}

	}

end

for i =-1,1 do
	if i ~= 0 then
		tbl.X_num = { i, i }
		t[#t+1] = LoadActor( "../TileTool.lua", tbl )..{}
	end
end

return Def.ActorFrame{ t }