level = {}

function level.load()
	images = {
		levelbg = love.graphics.newImage('images/bg.jpg'),
		platform = love.graphics.newImage('images/platform.png'),
	}

	-- Physics stuff
	world = love.physics.newWorld(0, (9.81*32*10), true)

	-- Create the ground body at (0, 0) static
	ground = love.physics.newBody(world, 0, 0, "static")

	-- Create the ground shape at (400,500) with size (600,10).
	ground_shape = love.physics.newRectangleShape( 740, 630, 2080, 10)
	ground_shape2 = love.physics.newRectangleShape( 740, 20, 2080, 10)
	ground_shape3 = love.physics.newRectangleShape( 0, 365, 10, 800)
	ground_shape4 = love.physics.newRectangleShape( 1280, 400, 10, 800)

	-- Create fixture between body and shape
	ground_fixture1 = love.physics.newFixture( ground, ground_shape)
	ground_fixture2 = love.physics.newFixture( ground, ground_shape2)
	ground_fixture3 = love.physics.newFixture( ground, ground_shape3)
	ground_fixture4 = love.physics.newFixture( ground, ground_shape4)

	player_skin = love.graphics.newImage('images/player.png')
	player_body = love.physics.newBody(world, 100, 142, 'dynamic')
	player_shape = love.physics.newRectangleShape( 0, 0, 400/4, 142)
	player_fixture = love.physics.newFixture(player_body, player_shape)
	player_body:setMassData(player_shape:computeMass( 1 ))

	-- Platforms
	platforms = {}
	platforms_defs = {
		{ i = images.levelbg, w = 200, h = 40, ox = 0, oy = 0},
	}

	addPlatform(platforms_defs, 650, 400, 1)
	addPlatform(platforms_defs, 1000, 400, 2)
	addPlatform(platforms_defs, 2000, 400, 3)

	level.bg_posx = 0

	level.ground_level = 640
end

function level.draw()
	-- Dibujar el fondo
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(images.levelbg, level.bg_posx, 0)

	-- Dibujar el suelo
	love.graphics.setColor(41, 128, 185)
	love.graphics.rectangle('fill', 0, level.ground_level, 1280, 200)

	-- Draws the ground
	love.graphics.setColor(255, 255, 255)
	love.graphics.polygon('line', ground:getWorldPoints(ground_shape:getPoints()))
	love.graphics.polygon('line', ground:getWorldPoints(ground_shape2:getPoints()))
	love.graphics.polygon('line', ground:getWorldPoints(ground_shape3:getPoints()))
	love.graphics.polygon('line', ground:getWorldPoints(ground_shape4:getPoints()))

	-- Draws the platforms
	for i, v in ipairs(platforms) do
		if v.b:isActive() then
			love.graphics.draw(images.platform, v.b:getX() - 60, v.b:getY(), v.b:getAngle(), 1, 1, v.ox, v.oy)
		end
	end
end


function addPlatform(def, x, y, i)
	local t = {}
	t.b = love.physics.newBody(world, x, y, "static")
	t.s = love.physics.newRectangleShape(200, 30)
	t.f = love.physics.newFixture(t.b, t.s)
	t.f:setUserData("platforms" .. i)
	t.i = def.i
	t.ox = def.ox
	t.oy = def.oy
	t.b:setMassData(t.s:computeMass( 1 ))
	table.insert(platforms, t)
end

function level.syncPos(direction, dt)
	local vel = player.vel * dt

	if direction == "left" then
		level.bg_posx = level.bg_posx + vel
		for i, v in ipairs(platforms) do
			v.b:setX( v.b:getX() + vel )
		end
	else
		level.bg_posx = level.bg_posx - vel
		for i, v in ipairs(platforms) do
			v.b:setX( v.b:getX() - vel )
		end
	end
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
