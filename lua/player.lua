player = {}

function player.load()
	player.posx = 100 -- posición eje x
	player.posy = 540 -- posición eje y
	player.vel = 800 -- velocidad del player
	player.height = 100
	player.can_move = true
end


function player.draw()
	-- Dibujar el player
	love.graphics.setColor(236, 240, 241)
	love.graphics.rectangle("fill", player.posx, player.posy, player.height, 100)
end


function player.update(dt)

end


function player.move(dt)
	if love.keyboard.isDown('right') then
		if player.posx > 400 then
			player.can_move = false
		else
			player.can_move = true
			player.posx = player.posx + player.vel * dt
		end

		if player.can_move == false then
			level.bg_posx = level.bg_posx - player.vel * dt
		end
	end

	if love.keyboard.isDown('left') then
		if level.bg_posx < 0 then
			level.bg_posx = level.bg_posx + player.vel * dt
		else
			player.posx = player.posx - player.vel * dt
		end
	end
end


function UPDATE_PLAYER(dt)
	player.move(dt)
	player.update(dt)
end


function DRAW_PLAYER()
	player.draw()
end
