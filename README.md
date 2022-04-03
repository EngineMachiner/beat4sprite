# beat4sprite
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/W7W32691S)

### DESCRIPTION

beat4sprite is a **library** to draw different things in the SM5 engine
inspired on the classic DDR PSX backgrounds and sprite animations.

This is a personal project I began back in 2013, back when 
I used to play with cheap and simple BGAnimations or 
RandomMovies (Gameplay backgrounds) on StepMania 3.9. 
Mostly stuff from DDR or ITG. So around that time 
I started to create my custom videos to use while on gameplay.

Then my idea changed because of video encoding, quality and 
size mostly. I moved to scripting and writing code so I could draw 
my own BGAnimations. So while I was learning Lua through SM and other games
this project evolved.

I tried to do a lot of code maintenance and debugging too, 
checking my code and performance testing in-game.

If you're interested you might want to check:
https://github.com/EngineMachiner/beat4sprite-Collections

### INSTALLATION

  Download one of the releases or do the following if you want the latest version:

  1. Clone/Download this branch and drop it somewhere.
  2. Clone/Download the "Resources" branch.
  * Choose the game version you want in the "Resources" branch, same for the Original or Double Scaled graphics. 
  3. Copy the contents of the folder you chose ("the ones that are XthXXX") in your BGAnimations folder.
  4. Copy either Original or Double Scaled contents in the "/BGAnimations".
  5. Copy the videos. Videos are sorted (by game) in the Resources folder.
  
  Must check:
  
  * That the Resources folder has the Nth game folder with the Sprites, Backgrounds, Videos folders and the libraries.
  	(Example: "/BGAnimations/Resources/Nth")
  * That the NthXXX folders are at "/BGAnimations/" and that PSX-BGA-Scripts.lua is at "/Scripts" (root directory folder) so it loads 		the file when starting the game.
  * When you start SM, press Ctrl + F2 to load the PSX-BGA-Scripts.lua in case it didn't.

### CREDITS

Engine_Machiner (code, resources)

RenTheHumanCat (resources)
MadkaT

leadbman
Retrozaid

Project Moondance dev team (general help and engine info)

Please tell me if I missed someone.
- Engine_Machiner