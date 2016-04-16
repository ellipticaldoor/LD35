player = {}

function player.load()
	-- player.posx = 100 -- posición eje x
	-- player.posy = 540 -- posición eje y
	player.vel = 800 -- velocidad del player
	player.height = 100
	player.can_move = true
end


function player.draw()
	-- Dibujar el player
	love.graphics.setColor(255,255,255)
	love.graphics.draw(player_skin, player_body:getX(), player_body:getY(), player_body:getAngle(),0.5,0.5,0,0)
end


function player.update(dt)

end


function player.move(dt)
	if love.keyboard.isDown('right') then
		if player_body:getX() > 400 then
			player.can_move = false
		else
			player.can_move = true
			player_body:setX(player_body:getX() + player.vel * dt)
		end

		if player.can_move == false then
			level.bg_posx = level.bg_posx - player.vel * dt
		end
	end

	if love.keyboard.isDown('left') then
		if level.bg_posx < 0 then
			level.bg_posx = level.bg_posx + player.vel * dt
		else
			player_body:setX(player_body:getX() - player.vel * dt)
		end
	end

	if love.keyboard.isDown('space') or love.keyboard.isDown('up') then
		player_body:applyLinearImpulse(0,-1000)
	end
end


function UPDATE_PLAYER(dt)
	player.move(dt)
	player.update(dt)
end


function DRAW_PLAYER()
	player.draw()
end
