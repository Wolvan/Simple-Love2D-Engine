local Buttons = {}

Button = {
	
	x1 = 0, y1 = 0, x2 = 1, y2 = 2, borderOverride = 30, visible = true, text = "",
	tablepos = -1, imgOverride = nil,
	
	callback = function(self)
		--stub
	end,
	
	draw = function (self)
		if self.visible then
			if self.imgOverride then
				love.graphics.draw(self.imgOverride,self.x1,self.y1)
				local width, height = self.imgOverride:getDimensions()
				love.graphics.printf(self.text, self.x1 + self.borderOverride, self.y1 + self.borderOverride, width - self.borderOverride, "center")
			else
				love.graphics.setColor( 84, 84, 84, 150 )
				love.graphics.rectangle("fill", self.x1, self.y1, self.x2-self.x1, self.y2-self.y1 )
				love.graphics.setColor( 0,0,0 )
				love.graphics.rectangle("line", self.x1, self.y1, self.x2-self.x1, self.y2-self.y1 )
				love.graphics.setColor(255,255,255)
				love.graphics.printf(self.text, self.x1 + self.borderOverride, self.y1 + self.borderOverride, self.x2 - self.x1 - self.borderOverride, "center")
			end
		end
	end,
	
	isClicked = function (self, x, y)
		if self.visible then
			if self.imgOverride then
				if x > self.x1 and x < self.imgOverride:getWidth() + self.x1 and y > self.y1 and y < self.imgOverride:getHeight() + self.y1 then
					return true
				end
			else
				if x > self.x1 and x < self.x2 and y > self.y1 and y < self.y2 then
					return true
				end
			end
		end
		return false
	end,
	
    new = function (self, o, y_1, x_2, y_2, cb)
        if type(o) == "table" then
			o = o
		elseif type(o) == "number" and type(y_1) == "number" and type(x_2) == "number" and type(y_2) == "number" and type(cb) == "function" then
			o = {
				x1 = o,
				y1 = y_1,
				x2 = x_2,
				y2 = y_2,
				callback = cb
			}
		else
			o = {}
		end
        setmetatable(o, self)
		self.__type = "Button"
        self.__index = self
		o.tablepos = #Buttons
		table.insert(Buttons, o)
        return o
    end,
	destroy = function(self)
		table.remove(Buttons, self.tablepos + 1)
	end
}

function drawButtons()
	table.foreach(Buttons, function(index)
		Buttons[index]:draw()
	end)
end

function runButtons(x,y)
	table.foreach(Buttons, function(index)
		if Buttons[index]:isClicked(x,y) then
			Buttons[index]:callback()
		end
	end)
end