require "/lua/level"
require "/lua/player"
require "/lua/gui"

math.randomseed( os.time() )

function love.load()
	level.load()
	player.load()
	gui.load()
end

function love.update(dt)
	UPDATE_LEVEL(dt)
	UPDATE_PLAYER(dt)
	UPDATE_GUI(dt)
end

function love.draw()
	DRAW_LEVEL()
	DRAW_PLAYER()
	DRAW_GUI()
end

function love.keypressed(key)
	if key == 'escape' then love.event.quit() end
end
