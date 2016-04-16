level = {}

function level.load()

end

function level.draw()
	-- Dibujar el fondo
	love.graphics.setColor(52, 152, 219, 255)
	love.graphics.rectangle("fill", 0, 0, 1280, 720)
end


function level.update(dt)

end

function UPDATE_LEVEL(dt)
	player.update(dt)
end

function DRAW_LEVEL()
	level.draw()
end
