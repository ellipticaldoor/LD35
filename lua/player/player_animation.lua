player_animation = {}

function player_animation.load()
	player.animation = sodapop.newAnimatedSprite(player_body:getX(), player_body:getY())

	player.animation:addAnimation('walk', {
		image = love.graphics.newImage '/images/player_walk.png',
		frameWidth = 840/4,
		frameHeight = 298,
		frames = {{1, 1, 4, 1, .15}}
	})
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
