# PSX BGAnimations Project

To contribute to this project, make a fork and merge your BGAs so I can check them and add them properly.
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

The sprites will be classified through 32bit (PSX pixelated style) or HD version (Retexture and Redesigned)
Now with guide included for BGScripts.

