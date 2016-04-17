player = {}

function player.load()
	-- player.posx = 100 -- posición eje x
	-- player.posy = 540 -- posición eje y
	--player.vel = 350 -- velocidad del player
	player.vel = 2000 -- velocidad del player
	player.height = 100
	player.can_move = true
	player.current_animation = 'quieto'
	player.walking = false
end


function player.draw()
	-- Dibujar el player
	-- love.graphics.setColor(255,255,255)
	-- love.graphics.draw(player_skin, player_body:getX(), player_body:getY(), player_body:getAngle(),0.5,0.5,0,0)
end


function player.update(dt)

end


function player.move(dt)
	if love.keyboard.isDown( 'right', 'left', 'space' ) == false then
		player.walking = false

		if player.current_animation ~= 'quieto' then
			player.current_animation = 'quieto'
			player.animation:switch 'quieto'
		end
	end

	if love.keyboard.isDown('right') then
		player.walking = true

		if player.current_animation ~= 'walk_right' then
			player.current_animation = 'walk_right'
			player.animation:switch(player.current_animation)
		end

		if player_body:getX() > 400 then
			player.can_move = false
		else
			player.can_move = true
			player_body:setX(player_body:getX() + player.vel * dt)
		end

		if player.can_move == false then
			level.syncPos("right", dt)
			level.bg_posx = level.bg_posx - player.vel * dt
		end
	end

	if love.keyboard.isDown('left') then
		player.walking = true

		if player.current_animation ~= 'walk_left' then
			player.current_animation = 'walk_left'
			player.animation:switch(player.current_animation)
		end

		if level.bg_posx < 0 then
			level.syncPos("left", dt)
			level.bg_posx = level.bg_posx + player.vel * dt
		else
			player_body:setX(player_body:getX() - player.vel * dt)
		end
	end

	if love.keyboard.isDown('space') or love.keyboard.isDown('up') then
		player_body:applyLinearImpulse(0,-2000)
	end

	player_body:applyLinearImpulse(0,1)
end


function UPDATE_PLAYER(dt)
	player.move(dt)
	player.update(dt)
end


function DRAW_PLAYER()
	player.draw()
end
