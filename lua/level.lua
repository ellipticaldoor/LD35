level = {}

function level.load()
	images = {
		levelbg = love.graphics.newImage('images/bg.jpg'),
		platform = love.graphics.newImage('images/platform.png'),
	}

	-- Physics stuff
	world = love.physics.newWorld(0, (9.81*32), true)

	-- Level bodys
	ground = love.physics.newBody(world, 1280/2, 646, 'static')
	ground_shape = love.physics.newRectangleShape(1280, 10)
	ground_fixture = love.physics.newFixture( ground, ground_shape)

	player_skin = love.graphics.newImage('images/player.png')
	player_body = love.physics.newBody(world, 200, 300, 'dynamic')
	player_shape = love.physics.newRectangleShape( 0, 0, 300, 300)
	player_fixture = love.physics.newFixture(player_body, player_shape)
	player_body:setMassData(player_shape:computeMass( 1 ))

	-- Platforms
	platforms = {}
	platforms_defs = {
		{ i = images.levelbg, w = 200, h = 40, ox = 0, oy = 0},
	}

	addPlatform(platforms_defs, 400, 200, 1)

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

	-- Draws the platforms
	for i, v in ipairs(platforms) do
		if v.b:isActive() then
			love.graphics.draw(images.platform, v.b:getX(), v.b:getY(), v.b:getAngle(), 1, 1, v.ox, v.oy)
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

function level.update(dt)
	world:update(dt)
end

function UPDATE_LEVEL(dt)
	level.update(dt)
end

function DRAW_LEVEL()
	level.draw()
end
