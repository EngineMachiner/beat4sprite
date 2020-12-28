local BGA_dirs = FILEMAN:GetDirListing( "//BGAnimations/", true, true )

return Def.ActorFrame{	
	LoadActor( BGA_dirs[ math.random( 1, #BGA_dirs ) ] )..{}
}