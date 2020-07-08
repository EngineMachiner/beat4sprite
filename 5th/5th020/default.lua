
local params = {
	File = "/BGAnimations/Resources/5th/Backgrounds/BA.png",
	X_num = 1,
	Commands = "Mirror",
	BGMirror = true
} 

return Def.ActorFrame{

	LoadActor( "../Resources/Scripts/5th/BG/3.lua", params )..{}

}