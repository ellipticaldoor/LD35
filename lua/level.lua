level = {}
spheres1 = {}
spheres2 = {}
toRemove = {}

function level.load()
	collected_spheres = 0

	images = {
		levelbg = love.graphics.newImage('images/bg.jpg'),
		platform = love.graphics.newImage('images/platform.png'),
		sphere1 = love.graphics.newImage("/images/sphere1.png"),
		sphere2 = love.graphics.newImage("/images/sphere2.png"),
	}

	-- Physics stuff
	world = love.physics.newWorld(0, (9.81*32*10), true)
	world:setCallbacks(beginContact,endContact)

	-- Create the ground body at (0, 0) static
	ground = love.physics.newBody(world, 0, 0, "static")

	-- Create the ground shape at (400,500) with size (600,10).
	ground_shape = love.physics.newRectangleShape( 740, 630, 2080, 10)
	ground_shape2 = love.physics.newRectangleShape( 740, -120, 2080, 10)
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
	player_fixture:setUserData("Player")
	player_body:setMassData(player_shape:computeMass( 1 ))

	-- Platforms
	platforms = {}
	platforms_defs = {
		{ i = images.levelbg, w = 200, h = 40, ox = 0, oy = 0},
	}

	-- First level platforms
	addPlatform(platforms_defs, 450+1280+320, 450, 1)
	addPlatform(platforms_defs, 725+1280+320, 355, 2)
	addPlatform(platforms_defs, 950+1280+320, 250, 3)

	-- Second level platforms
	addPlatform(platforms_defs, 300+1280*2+320*2, 200, 4)
	addPlatform(platforms_defs, 500+1280*2+320*2, 200, 5)
	addPlatform(platforms_defs, 675+1280*2+320*2, 200, 6)
	addPlatform(platforms_defs, 950+1280*2+320*2, 350, 7)
	addPlatform(platforms_defs, 650+1280*2+320*2, 450, 8)

	-- Third level platforms
	addPlatform(platforms_defs, 500+1280*3+320*3, 230, 9)
	addPlatform(platforms_defs, 1000+1280*3+320*3, 230, 10)
	addPlatform(platforms_defs, 650+1280*3+320*3, 450, 11)
	addPlatform(platforms_defs, 850+1280*3+320*3, 450, 12)

	ground_fixture1:setUserData("Ground")
	ground_fixture2:setUserData("Ground")
	ground_fixture3:setUserData("Ground")
	ground_fixture4:setUserData("Ground")


	-- Spheres
	balldefs = {
		{ i = images.sphere1, r = 20 , ox = 20, oy = 20},
		{ i = images.sphere2, r = 20 , ox = 20, oy = 20},
	}

	addSpheres1(balldefs[1], 950+1280+320, 200, 1)
	addSpheres1(balldefs[1], 280+1280*2+320*2, 150, 2)
	addSpheres1(balldefs[1], 1000+1280*3+320*3, 180, 3)

	level.bg_posx = 0

	level.ground_level = 620
end

function addSpheres1(def, x, y, i)
	local t = {}
	t.b = love.physics.newBody(world, x, y, "static")
	t.s = love.physics.newCircleShape(def.r)
	t.f = love.physics.newFixture(t.b, t.s)
	t.f:setUserData(i)
	t.i = def.i
	t.ox = def.ox
	t.oy = def.oy
	t.b:setMassData(t.s:computeMass( 1 ))
	table.insert(spheres1, t)
end


function remove_sphere(sphere_number)
	for i, v in ipairs(spheres1) do
		if i == sphere_number then
			v.b:setActive(false)
			v = nil
		end
	end
end

-- This is called every time a collision begin.
function beginContact(a, b, c)
	local aa=a:getUserData()
	local bb=b:getUserData()
	text = "Collided: " .. aa .. " and " .. bb

	print(text)

	if aa == "Player" and bb ~= "Ground" then
		table.insert(toRemove,tonumber(bb))
		yesChoice()
	end
end

-- This is called every time a collision end.
function endContact(a, b, c)
	local aa=a:getUserData()
	local bb=b:getUserData()
	text = "Collision ended: " .. aa .. " and " .. bb
end

function level.draw()
	-- Dibujar el fondo
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(images.levelbg, level.bg_posx, 0)

	-- Dibujar el suelo
	love.graphics.setColor(41, 128, 185)
	love.graphics.rectangle('fill', 0, level.ground_level, 1280, 200)

	-- -- Draws the ground
	-- love.graphics.setColor(255, 255, 255)
	-- love.graphics.polygon('line', ground:getWorldPoints(ground_shape:getPoints()))
	-- love.graphics.polygon('line', ground:getWorldPoints(ground_shape2:getPoints()))
	-- love.graphics.polygon('line', ground:getWorldPoints(ground_shape3:getPoints()))
	-- love.graphics.polygon('line', ground:getWorldPoints(ground_shape4:getPoints()))

	-- Draws the platforms
	for i, v in ipairs(platforms) do
		if v.b:isActive() then
			love.graphics.draw(images.platform, v.b:getX() - 100, v.b:getY() - 10, v.b:getAngle(), 1, 1, v.ox, v.oy)
		end
	end

	love.graphics.setColor(255, 255, 255)
	for i, v in ipairs(spheres1) do
		if v.b:isActive() then
			love.graphics.draw(v.i, v.b:getX()-30, v.b:getY()-30, v.b:getAngle(), 1, 1, v.ox, v.oy)
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
		level.bg_posx = level.bg_posx + player.vel/200 * dt
		for i, v in ipairs(platforms) do
			v.b:setX( v.b:getX() + vel )
		end
		for i, v in ipairs(spheres1) do
			v.b:setX( v.b:getX() + vel )
		end
	else
		level.bg_posx = level.bg_posx - player.vel/200 * dt
		for i, v in ipairs(platforms) do
			v.b:setX( v.b:getX() - vel )
		end
		for i, v in ipairs(spheres1) do
			v.b:setX( v.b:getX() - vel )
		end
	end
end

function level.update(dt)
	world:update(dt)

	for i, v in ipairs(toRemove) do
		remove_sphere(v)
	end
end

function UPDATE_LEVEL(dt)
	level.update(dt)
end

function DRAW_LEVEL()
	level.draw()
end
