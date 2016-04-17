sodapop = require '/lua/lib/sodapop'

require '/lua/level'
require '/lua/player/player'
require '/lua/player/player_animation'
require '/lua/thoughts'
require '/lua/gui'

math.randomseed( os.time() )

function love.load()
	level.load()
	player.load()
	player_animation.load()
	thoughts.load()
	gui.load()

	f = love.graphics.newFont( "fonts/Red_Alert_INET.ttf", 44 )
	f2 = love.graphics.newFont( "fonts/Red_Alert_INET.ttf", 18 )
end

function love.update(dt, key)
	UPDATE_LEVEL(dt)
	UPDATE_PLAYER(dt)
	UPDATE_PLAYER_ANIMATION(dt)
	UPDATE_GUI(dt)
	UPDATE_THOUGHTS(dt, key)

	local fps=love.timer.getFPS
	love.window.setTitle("Ludum Dare 30 - "..fps().." FPS")
end

function love.draw()
	DRAW_LEVEL()
	DRAW_PLAYER()
	DRAW_PLAYER_ANIMATION()
	DRAW_THOUGHTS()
	DRAW_GUI()
end

function love.keypressed(key)
	thoughts.key(key)

	if key == 'escape' then love.event.quit() end
end
