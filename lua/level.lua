level = {}

function level.load()
	level.bg = love.graphics.newImage("images/bg.jpg")
	level.bg_posx = 0

	level.ground_level = 640
end

function level.draw()
	-- Dibujar el fondo
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(level.bg, level.bg_posx, 0)

	-- Dibujar el suelo
	love.graphics.setColor(41, 128, 185)
	love.graphics.rectangle("fill", 0, level.ground_level, 1280, 200)
end

function level.update(dt)

end

function UPDATE_LEVEL(dt)
	level.update(dt)
end

function DRAW_LEVEL()
	level.draw()
end
