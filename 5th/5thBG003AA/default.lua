
local replace = ...

local params = {

    Index = 1,
    File = {
        GAMESTATE:GetCurrentSong():GetBackgroundPath(),
        "/BGAnimations/Resources/5th/Backgrounds/CABCD.png",
        "/BGAnimations/Resources/5th/Backgrounds/C.png",
        "/BGAnimations/Resources/5th/Backgrounds/CA.png"
    },
    Sleep = 4,
    Alphas = { 2, 3 }

}

    BGA_G.ParTweak( params, replace )

return Def.ActorFrame{
    loadfile("/BGAnimations/Resources/Scripts/SplitScreen.lua" )( params )
}