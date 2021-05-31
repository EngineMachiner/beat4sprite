
local s = "/BGAnimations/Resources"
local params = {

	File = { 
		s .. "/5th/Backgrounds/CABCD.png",
		s .. "/5th/Backgrounds/C.png",
   		s .. "/5th/Backgrounds/CA.png"
   	},
   	Sleep = 1, -- Beat
   	Alphas = { 1, 2 } --[[ The backgrounds that are not 
   							complelety filled (alpha) and a filled background (from the File table) ]]

}

return Def.ActorFrame{
	loadfile( s .. "/Scripts/SplitScreen.lua" )( params )
}