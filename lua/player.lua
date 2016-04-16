player = {}

function player.load()
	player.lives = 1
	player.x_pos = 0
	player.y_pos = 0
	player.vel = 1000 -- velocidad del player
end


function player.draw()
	-- Dibujar el player
	love.graphics.setColor(192, 57, 43)
	love.graphics.rectangle("fill", player.x_pos, player.y_pos, 100, 100)
end


function player.update(dt)

end


function player.move(dt)
	if love.keyboard.isDown('right') then
		player.x_pos = player.x_pos + player.vel * dt
	end

	if love.keyboard.isDown('left') then
		player.x_pos = player.x_pos - player.vel * dt
	end

	if love.keyboard.isDown('up') then
		player.y_pos = player.y_pos - player.vel * dt
	end

	if love.keyboard.isDown('down') then
		player.y_pos = player.y_pos + player.vel * dt
	end
end


function UPDATE_PLAYER(dt)
	player.update(dt)
	player.move(dt)
end


function DRAW_PLAYER()
	player.draw()
end
