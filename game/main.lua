require "/lua/level"
require "/lua/player"

math.randomseed( os.time() )

function love.load()
	DRAW_LEVEL()
	DRAW_PLAYER()
end

function love.update(dt)

end

function love.draw()

end

function love.keypressed(key)
	if key == 'escape' then love.event.quit() end
end
