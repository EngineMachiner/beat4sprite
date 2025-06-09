[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/W7W32691S)

# beat4sprite
beat4sprite is a **library** to create animations in the StepMania engine
inspired by the classic DDR PSX background animations and sprites.

beat4sprite has been tested through from StepMania 5.0.12 to 5.3 / OutFox.

[beat4sprite on Youtube](https://youtu.be/NKW4aDbaQvM)

## How to install

  0. Make sure you have [tapLua](https://github.com/EngineMachiner/tapLua).

### OutFox

  1. Copy the beat4sprite folder into the Modules folder of fallback.
  2. Load the tapLua and beat4sprite module once in OutFox through fallback's first screen. <br>
  
For example the ScreenInit overlay script should look like this using LoadModule(): <br><br>
<img src="https://github.com/EngineMachiner/beat4sprite/assets/15896027/1673b41d-981c-462c-b33f-23442b308f5f" width=400>

### StepMania

  1. Copy the beat4sprite folder in your "Stepmania/Scripts" folder.
  2. Reload scripts once at first screen if something goes wrong.

## How to create
If you want to create your own animations you can check the [Wiki](https://github.com/EngineMachiner/beat4sprite/wiki).

## Origin
beat4sprite began as a personal project in 2013. <br>
I used to play with simple BGAnimations or RandomMovies ( Gameplay backgrounds ) on StepMania 3.9, mostly stuff from DDR or ITG. I was interested in the structure of the sprites and how the game read them.

I got inspired and I wanted to use the retro PSX animations so I tried making videos of them and that didn't blend that well with the song beat.

Then I considered video encoding, quality and file size not being the best so I moved to scripting and writing code (visually scripting) so I could draw 
my own animations.

Examples made with this library can be found through my repositories. <br>
For more information about the API check the Wiki.

## CREDITS
- Project Moondance developers
- RenTheHumanCat
- MadkaT
- leadbman
- Retrozaid
