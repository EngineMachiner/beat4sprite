# PSX BGAnimations Project

-- Installation --

  1. Clone or download this branch and choose the version you want.
  2. Unzip / Copy the contents of the version you selected into your Stepmania root folder.
  3. Do the same but with the Graphics branch.
  
  Must check:
  
  * That the folders "Backgrounds" and "Sprites" from the Graphics branch are in the BGAnimations folder.
  * That the folders "BGA's Guide" (if you need it), "BGAnimations", "BackgroundEffects" are in your Stepmania root folder.

  IF YOU HAVE OTHER FOLDERS IN THE BGANIMATIONS FOLDER. IT WON'T WORK.

-- For helpers --

If anyone needs help with the structure on how the scripts are called, it goes like this:

  FolderName(default.lua) loads an actor in the frame that can be a ParticleEffects lua file or a custom (Tool.lua, loading an actual image with functions), it's structure has arguments that can be useful to call the sprite that we're going to use.
  
  Example: LoadActor("../FolderName/default.lua", "/BGAnimations/folder_with_images/image.png", custom_arg_for_an_effect, custom_arg_for_scaling)..{}
  
  In order to check what are the custom arguments I suggest to read the code and check the variables on how they affect the sprite or image using the effects. 
  
  Examples - (ScaleVar = Resolution Scaling, round_move = Affects the rotation of the sprite,  textcoordsense = Change the direction of the scrolling just by using 1 or -1)
  
  For adding a background that has animated frames, you can use Tool.lua that's in the Backgrounds folder. (it's a bit similar to customtexcoords)
  
  I'm currently developing ParticleEffects so the rest of things to do it's just adding folders and changing resources.

Credits:

-Engine_Machiner
-RenTheHumanCat
-MadkaT
