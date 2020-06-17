# PSX BGAnimations Project



-- IMPORTANT --

	This branch only has the libraries for the BGA's to work in the game. 
	If you want the graphics and DDR Nth BGAnimations go to the Nth branch.


-- Installation --

  1. Clone or download this branch and drop it at your SM root folder.
  2. Choose the DDR version you want in the branches and clone/download it, copy the BGAnimations folder in your SM root folder then drop the contents of the Original or Double Scaled version in the "/BGAnimations".
  
  
  Must check:
  
  * That the Resources folder has the Nth game folder with the Sprites, Backgrounds, Rainbow folders and the libraries.
  	(Example: "/BGAnimations/Resources/Nth")
  * That the NthXXX folders are at "/BGAnimations/" and that PSX-BGA-Scripts.lua is at "/Scripts" (root directory folder) so it loads 		the file when starting the game.
  * When you start SM, press Ctrl + F2 to load the PSX-BGA-Scripts.lua in case it didn't.
  

  Yes, I'm thinking if PSX-BGA-Scripts.lua should be put in the _fallback to not press Ctrl + F2.


-- For helpers --

If anyone needs help on how the scripts are called:

  "/BGAnimations/FolderName/(default.lua)" loads an ActorFrame from the libraries at "BGAnimations/Resources/Scripts" with parameters put in a table, the keys and values define the data of the sprite.

  Example: The file at "BGAnimations/5th001A", the default.lua calls another script in "BGAnimations/Resources/Scripts/TileTool.lua" and uses some functions from the "/Scripts/PSX-BGA-Scripts.lua". The script takes parameters from the table and passes them to the script called TileTool.
  
I tried to comment in the code. Still if you have any doubt please tell me.


Credits:

-Engine_Machiner
-RenTheHumanCat
-MadkaT
