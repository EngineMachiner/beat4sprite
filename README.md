# PSX BGAnimations Project

-- Installation --

  1. Clone/Download this branch and drop it somewhere.
  2. Clone/Download the "Resources" branch.
  2. Choose the game version you want in the "Resources" branch, same for the Original or Double Scaled graphics. 
  3. Copy the contents of the folder you chose ("the ones that are XthXXX") in your BGAnimations folder.
  4. Copy either Original or Double Scaled contents in the "/BGAnimations".
  5. Copy the videos. Videos are sorted (by game) in the Resources folder.
  
  
  Must check:
  
  * That the Resources folder has the Nth game folder with the Sprites, Backgrounds, Videos folders and the libraries.
  	(Example: "/BGAnimations/Resources/Nth")
  * That the NthXXX folders are at "/BGAnimations/" and that PSX-BGA-Scripts.lua is at "/Scripts" (root directory folder) so it loads 		the file when starting the game.
  * When you start SM, press Ctrl + F2 to load the PSX-BGA-Scripts.lua in case it didn't.
  
  
-- For helpers --

If anyone needs help on how the scripts are called:

  "/BGAnimations/FolderName/(default.lua)" loads an ActorFrame from the libraries at "BGAnimations/Resources/Scripts" with parameters put in a table, the keys and values define the data of the sprite.

  Example: The file at "BGAnimations/5th001A", the default.lua calls another script in "BGAnimations/Resources/Scripts/TileTool.lua" and uses some functions from the "/Scripts/PSX-BGA-Scripts.lua". The script takes parameters from the table and passes them to the script called TileTool.


Credits:

-Engine_Machiner
-RenTheHumanCat
-MadkaT
