require "/lua/level"
require "/lua/player"

math.randomseed( os.time() )

function love.load()
	level.load()
	player.load()
end

function love.update(dt)
	UPDATE_LEVEL(dt)
	UPDATE_PLAYER(dt)
end

function love.draw()
	love.graphics.setColor(82,237,199,255)
	love.graphics.rectangle("fill", 10, 720, 10, 1280)
	DRAW_LEVEL()
	DRAW_PLAYER()
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end
