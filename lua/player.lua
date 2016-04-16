player = {}

function player.load()
	player.live = 200
	player.x_pos = 100
	player.y_pos = 600
	player.vel = 1000 -- velocidad del player
end


function player.draw()
	-- Dibujar el player
	love.graphics.setColor(52, 73, 94)
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
	player.move(dt)
	player.update(dt)
end


function DRAW_PLAYER()
	player.draw()
end
