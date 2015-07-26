Menu = {
    new = function (self, o) --Create Instance function. Override this in your custom menu instance only if necessary.
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end,
	
	draw = function (self) --Default draw function. Override this in your custom menu instance.
		love.graphics.print("This is default menu text. Please change me", 10, 10)
    end,
	
	update = function (self, dt) --Default update function. Override this in your custom menu instance.
		if love.keyboard.isDown("return", "enter") then
			print("This update function is a stub. You should override this in your current menu class.")
		end
	end
}

Menus = {}