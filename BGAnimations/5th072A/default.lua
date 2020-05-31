
local params = {

	File = { 
		"/BGAnimations/Resources/5th/Backgrounds/CABCD.png",
		"/BGAnimations/Resources/5th/Backgrounds/C.png",
   		"/BGAnimations/Resources/5th/Backgrounds/CA.png"
   	},
   	Sleep = 2, -- Beat
   	Alphas = { 1, 2 } --[[ The backgrounds that are not 
   							complelety filled (alpha) and a filled background (from the File table) ]]

}

return Def.ActorFrame{
	LoadActor("../Resources/Scripts/Split.lua", params )..{}
}