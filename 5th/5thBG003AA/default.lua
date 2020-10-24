
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

    PSX_BGA_Globals["BGA_ParamsTweaks"]( params, replace )

return Def.ActorFrame{
    LoadActor("../Resources/Scripts/5th/Split.lua", params )..{}
}