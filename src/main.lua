--[[
	
	LÖVE Main File
	Basic game initiation and file loading
	
]]--

function initWindow()
    love.graphics.setBackgroundColor(0,0,0)
end

function requireFiles()
    require "objects.misc.varlist"
    require "objects.misc.functions"
    require "objects.classes.menu"
    require "objects.classes.camera"
    require "objects.classes.button"
    require "gui.menu.mainmenu"
    require "gui.menu.gamedraw"
    require "callbacks.draw"
	require "callbacks.update"
	require "callbacks.mouse"
end

function love.load()
    requireFiles()
    initWindow()
end