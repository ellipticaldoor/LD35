player_animation = {}

function player_animation.load()
	player.animation = sodapop.newAnimatedSprite(player_body:getX(), player_body:getY())

	player.animation:addAnimation('walk_right', {
		image = love.graphics.newImage '/images/player_walk_right.png',
		frameWidth = 840/4,
		frameHeight = 298,
		frames = {{1, 1, 4, 1, .15}}
	})

	player.animation:addAnimation('walk_left', {
		image = love.graphics.newImage '/images/player_walk_left.png',
		frameWidth = 840/4,
		frameHeight = 298,
		frames = {{1, 1, 4, 1, .15}}
	})

	player.animation:addAnimation('quieto', {
		image = love.graphics.newImage '/images/player_walk_right.png',
		frameWidth = 840/4,
		frameHeight = 298,
		frames = {{1, 1, 1, 1, .15}}
	})

	player.animation:switch(player.current_animation)
	player.animation:switch 'quieto'
end


function player_animation.draw()
	love.graphics.setColor(255,255,255)
	player.animation:draw()
end


function player_animation.update(dt)
	player.animation:setAnchor( function() return player_body:getX(), player_body:getY() end )
	player.animation:update(dt)
end


function UPDATE_PLAYER_ANIMATION(dt)
	player_animation.update(dt)
end


function DRAW_PLAYER_ANIMATION()
	player_animation.draw()
end
