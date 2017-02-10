return Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren(function(child) child:visible(false):finishtweening() end, {})
	end,

	LoadActor("2")..{
		OnCommand=cmd(diffuse,color("#FFF000"))
	};
	LoadActor("2")..{
		OnCommand=cmd(addy,160;diffuse,color("#FFF000"))
	};
	LoadActor("2")..{
		OnCommand=cmd(addy,320;diffuse,color("#FFF000"))
	};
	LoadActor("2")..{
		OnCommand=cmd(addx,640;diffuse,color("#FFF000"))
	};
	LoadActor("2")..{
		OnCommand=cmd(addx,640;addy,160;diffuse,color("#FFF000"))
	};
	LoadActor("2")..{
		OnCommand=cmd(addx,640;addy,320;diffuse,color("#FFF000"))
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(diffuse,color("#FF0000");blend,"BlendMode_Add")
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,160;diffuse,color("#FF0000");blend,"BlendMode_Add")
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addy,320;diffuse,color("#FF0000");blend,"BlendMode_Add")
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;diffuse,color("#FF0000");blend,"BlendMode_Add")
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,160;diffuse,color("#FF0000");blend,"BlendMode_Add")
	};
	LoadActor("default - copia.lua")..{
		OnCommand=cmd(addx,640;addy,320;diffuse,color("#FF0000");blend,"BlendMode_Add")
	};
}