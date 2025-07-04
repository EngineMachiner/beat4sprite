[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/W7W32691S)

# beat4sprite
beat4sprite is a **library** to create scripted animations in the **[StepMania 5](https://github.com/stepmania/stepmania)** engine. It's inspired by the retro gameplay animations of the Playstation 1.

beat4sprite is tested mainly on **[OutFox](https://github.com/TeamRizu/OutFox)**.

[Youtube Video](https://youtu.be/NKW4aDbaQvM)

## Installation

  1. Install [tapLua](https://github.com/EngineMachiner/tapLua).

### Linux

  2. Run the next commands in the game directory:
  ```console

  curl -o OutFox.sh https://raw.githubusercontent.com/EngineMachiner/beat4sprite-OutFox/refs/heads/soundwaves/setup.sh
  curl -o beat4sprite.sh https://raw.githubusercontent.com/EngineMachiner/beat4sprite/refs/heads/master/beat4sprite.sh
  ./beat4sprite.sh; rm beat4sprite.sh OutFox.sh

  ```

---

Or it can be installed manually:

  2. Clone the repository in the modules folder.
  3. Load it after tapLua.
  ```lua
    LoadModule("beat4sprite/beat4sprite.lua") -- After loading tapLua...
  ```

---

If you want create your own animations you can check the [wiki](https://github.com/EngineMachiner/beat4sprite/wiki).

You can also check out examples in:
- [beat4sprite-OutFox](https://github.com/EngineMachiner/beat4sprite-OutFox)
- [beat4sprite-Collections](https://github.com/EngineMachiner/beat4sprite-Collections)

## Credits

- [TeamRizu](https://github.com/TeamRizu)
- [leadbman](https://github.com/leadbman)
- [MadkaT](https://github.com/MadkaT182)
- [RenTheHumanCat](https://zenius-i-vanisher.com/v5.2/user?userid=18775)
- [Retrozaid](https://zenius-i-vanisher.com/v5.2/user?userid=21434)

Thank you to everyone who contributed to the development of this project!
