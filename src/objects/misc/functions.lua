function loadImg(Img)
    if Variables.Main.LoadedImg[Img] == nil then
        Variables.Main.LoadedImg[Img] = love.graphics.newImage("resources/textures/"..Img)
    end
    return Variables.Main.LoadedImg[Img]
end

function loadFont(Font, Size)
	local size = Size or 12
    if Variables.Main.LoadedFonts[Font..size] == nil then
        Variables.Main.LoadedFonts[Font..size] = love.graphics.newFont("resources/fonts/"..Font, size)
    end
    return Variables.Main.LoadedFonts[Font..size]
end

function loadSound(Sound, static)
    local stream = static or "stream"
    if Variables.Main.LoadedSounds[Sound] == nil then
        Variables.Main.LoadedSounds[Sound] = love.audio.newSource("resources/sounds/"..Sound, stream)
    end
    return Variables.Main.LoadedSounds[Sound]
end

function getCamIdByName(name)
    for k,v in pairs(Cameras) do
        if v.Name == name then
            return k
        end
    end
    return -1
end

table.contains = function(tab, elem)
    for _,v in pairs(tab) do
        if v == elem then
            return true
        end
    end
    return false
end

function text(text)
	love.graphics.printf(text, 30, 550, 1220,"left")
end

local oldType = type
function type(obj)
	if getmetatable(obj) then
		return getmetatable(obj).__type or oldType(obj)
	else
		return oldType(obj)
	end
end

function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function string.ends(String,End)
   return End=='' or string.sub(String,-string.len(End))==End
end

function string:split(pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = self:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = self:find(fpat, last_end)
   end
   if last_end <= #self then
      cap = self:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end