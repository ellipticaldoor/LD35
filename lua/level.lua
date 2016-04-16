level = {}

function level.load()
	-- Physics stuff
	world = love.physics.newWorld(0, (9.81*3200), true)

	-- Level bodys
	ground = love.physics.newBody(world, 0, 0, 'static')
	ground_shape = love.physics.newRectangleShape(1280/2, 650, 1280, 10)
	ground_fixture = love.physics.newFixture( ground, ground_shape)

	player_skin = love.graphics.newImage('images/player.png')
	player_body = love.physics.newBody(world,100,0, 'dynamic')
	player_shape = love.physics.newRectangleShape( 0,0,300,300)
	player_fixture = love.physics.newFixture(player_body, player_shape)
	player_body:setMassData(player_shape:computeMass( 80 ))

	level.bg = love.graphics.newImage('images/bg.jpg')
	level.bg_posx = 0

	level.ground_level = 640
end

function level.draw()
	-- Dibujar el fondo
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(level.bg, level.bg_posx, 0)

	-- Dibujar el suelo
	love.graphics.setColor(41, 128, 185)
	love.graphics.rectangle('fill', 0, level.ground_level, 1280, 200)

	love.graphics.setColor(255, 255, 255)
	-- Draws the ground.
	love.graphics.polygon('line', ground:getWorldPoints(ground_shape:getPoints()))
end

function level.update(dt)
	world:update(dt)
end

function UPDATE_LEVEL(dt)
	level.update(dt)
end

function DRAW_LEVEL()
	level.draw()
end
