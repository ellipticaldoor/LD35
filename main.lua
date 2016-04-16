sodapop = require '/lua/lib/sodapop'

require '/lua/level'
require '/lua/player/player'
require '/lua/player/player_animation'
require '/lua/gui'

math.randomseed( os.time() )

function love.load()
	level.load()
	player.load()
	player_animation.load()
	gui.load()
end

function love.update(dt)
	UPDATE_LEVEL(dt)
	UPDATE_PLAYER(dt)
	UPDATE_GUI(dt)
	UPDATE_PLAYER_ANIMATION(dt)
end

function love.draw()
	DRAW_LEVEL()
	DRAW_PLAYER()
	DRAW_GUI()
	DRAW_PLAYER_ANIMATION()
end

function love.keypressed(key)
	if key == 'escape' then love.event.quit() end
end
