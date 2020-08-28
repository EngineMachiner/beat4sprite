local count = 0
local tweaks = ...

local t = Def.ActorFrame{
	LoseFocusCommand=function(self)
		self:RunCommandsOnChildren( 
			function(child)
				child:visible(false)
				child:stoptweening()
				child:stopeffect()
			end )
	end
}

local params = {

	File = {
		"/BGAnimations/Resources/5th/Backgrounds/DA.png",
		"/BGAnimations/Resources/5th/Backgrounds/DA2.png"
	},
	Y_coord = 1,
	X_num = 1,
	Commands = "Move",
	ResetParams = true

}
	
 	count = count + 1
 	params.Index = count
 	params.ID = #t + 1
	BGA_ParamsTweaks( params, tweaks ) 
	BGA_ScrollTextures( t, params )
	BGA_PostSpawn( t, params, tweaks )

	if params.AddActors then
		for k,v in pairs(params.AddActors) do
			t[#t+1] = v
		end
	end

return Def.ActorFrame{ t }