Camera = {
    x = 0,
    y = 0,
    scaleX = 1,
    scaleY = 1,
    rotation = 0,
    layers = {},
    Name = "Undefined",
    
    set = function(self)
        love.graphics.push()
        love.graphics.rotate(-self.rotation)
        love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
        love.graphics.translate(-self.x, -self.y)
    end,
    
    unset = function(self)
        love.graphics.pop()
    end,
    
    move = function(self, dx, dy)
        self.x = self.x + (dx or 0)
        self.y = self.y + (dy or 0)
    end,
    
    rotate = function(self, dr)
        self.rotation = self.rotation + dr
    end,
    
    scale = function(self, sx, sy)
        sx = sx or 1
        self.scaleX = self.scaleX * sx
        self.scaleY = self.scaleY * (sy or sx)
    end,
    
    setPosition = function(self, x, y)
        self.x = x or self.x
        self.y = y or self.y
    end,
    
    setScale = function(self, sx, sy)
        self.scaleX = sx or self.scaleX
        self.scaleY = sy or self.scaleY
    end,
    
    getMousePosition = function(self)
        return love.mouse.getX() * self.scaleX + self.x, love.mouse.getY() * self.scaleY + self.y
    end,
    
    newLayer = function(self, scale, func)
        table.insert(self.layers, { draw = func, scale = scale })
        table.sort(self.layers, function(a, b) return a.scale < b.scale end)
    end,
    
    draw = function(self)
        local bx, by = self.x, self.y
        for _, v in ipairs(self.layers) do
            self.x = bx * v.scale
            self.y = by * v.scale
            camera:set()
            v.draw()
            camera:unset()
        end
    end,
    
    new = function (self, o)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        return o
    end
}

Cameras = {Camera:new({Name = "default"})}