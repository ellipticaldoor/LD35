gui = {}

function gui.load()
	gui.x_pos = 30
	gui.y_pos = 30
	gui.width = 400
	gui.height = 30
end


function gui.draw()
	-- barra de vida
	love.graphics.setColor(236, 240, 241)
	love.graphics.rectangle("fill", gui.x_pos, gui.y_pos, gui.width, gui.height)

	love.graphics.setColor(231, 76, 60)
	love.graphics.rectangle("fill", gui.x_pos, gui.y_pos, player.live, gui.height)
end


function gui.update(dt)
	if love.keyboard.isDown('r') then
		player.live = player.live - 100 * dt
	end
end


function UPDATE_GUI(dt)
	gui.update(dt)
end


function DRAW_GUI()
	gui.draw()
end
