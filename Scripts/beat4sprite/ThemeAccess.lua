
--[[
	Used to make / load custom content from themes (and for other themes) 
 	to make BGAs (OutFox)
]]

local function ChangeThemePath(path, s)
	-- Escape chars
	local name = THEME:GetCurThemeName()
	name = name:gsub( "(%p)", "%%%1" )
	return path:gsub( name, s )
end

local function GetThemesPath()
	local dir = THEME:GetCurrentThemeDirectory()
	dir = dir:sub(1, #dir - 1)
	return ChangeThemePath(dir , "")
end

local function LoadThemeModule(theme, ModuleName, ...)
	
	local Path = "Appearance/Themes/" .. theme
	Path = Path .. "/Modules/" .. ModuleName
	
	if ... then
		return loadfile(Path)(...)
	end
	return loadfile(Path)()

end

local function ConvertToGamePlay(self)

	-- Lock it so it doesn't overflow
	if self.Init then return end
	self:playcommand("Init")	self.Init = true

	BGA_G.ObjFuncs(self)
	
end

local funcs = {
	ChangeThemePath = ChangeThemePath,
	GetThemesPath = GetThemesPath,
	LoadThemeModule = LoadThemeModule,
	ConvertToGamePlay = ConvertToGamePlay
}
for k,v in pairs(funcs) do BGA_G[k] = v end