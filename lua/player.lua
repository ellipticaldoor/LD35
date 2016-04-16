player = {}

function player.load()

end


function player.draw()

end


function player.math(dt)

end


function player.move(dt)
	if love.keyboard.isDown('right') then

	end

	if love.keyboard.isDown('left') then

	end
end


function UPDATE_PLAYER(dt)
	player.move(dt)
end


function DRAW_PLAYER()
	player.draw()
end
