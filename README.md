# PSX BGAnimations Project

-- IMPORTANT --

	This branch only has the scripts for the BGA's to work in the game. 
	If you want the graphics go to the Resources branch.

-- Installation --

  1. Clone or download this branch and choose the version (of the PSX game) you want.
  2. Unzip / Copy the contents of the version you selected into your Stepmania root folder.
  3. Do the same but with the Resources branch.
  
  Must check:
  
  * That the folders "Backgrounds", "Sprites" from the Graphics branch are in the BGAnimations folder.
  * That the folders, "BGAnimations", "BackgroundEffects", "Scripts" are in your Stepmania root folder.

  The BGAnimations folder must have in it Sprites, Scripts and Backgrounds folder for the scripts to work.
  Mixing BGA's from other games hasn't been tested yet.

-- For helpers --

If anyone needs help with the structure on how the scripts are called, it goes like this:

  FolderName/(default.lua) loads an Actor in the ActorFrame that can be a resource file or a custom (Tool.lua, loading an actual image with functions), it's structure has arguments that can be useful to call the sprite that we're going to use.
  
  Example: LoadActor("../FolderName/default.lua", "/BGAnimations/folder_with_images/image.png", custom_arg_for_an_effect, custom_arg_for_scaling)..{}
  
  In order to check what are the custom arguments I suggest to read the code and check the variables on how they affect the sprite or image using the effects. 
  
  Examples - (ScaleVar = Resolution Scaling, round_move = Affects the rotation of the sprite,  textcoordsense = Changes the direction of the scrolling just by using 1 or -1)
  
  If you need to add a background that has animated frames, you can use /BGAnimations/Scripts/TileTool/ (it's a bit similar to customtexcoords)
  
  I'm currently developing Scripts so the rest of things to do it's just adding folders and changing resources (graphics).

Credits:

-Engine_Machiner
-RenTheHumanCat
-MadkaT
