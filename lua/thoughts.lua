thoughts = {}

function thoughts.load()
	thoughts.current = 1

	thoughts.phrases = {
		"frase cero",
			"a - primera frase sí",
				"aa - segunda frase sí",
					"aaa - tercera frase sí",
					"aab - tercera frase no",
				"ab - segunda frase no",
					"aba - tercera frase sí",
					"abb - tercera frase no",
			"b - primera frase no",
				"ba - segunda frase sí",
					"baa - tercera frase sí",
					"bab - tercera frase no",
				"bb - segunda frase no",
					"bba - tercera frase sí",
					"bbb - tercera frase no",
	}
end


function thoughts.draw()
	love.graphics.setColor(236, 240, 241)
	love.graphics.setFont(f)
	sizetext = f:getWidth(thoughts.phrases[thoughts.current])
	love.graphics.print(thoughts.phrases[thoughts.current], (1280-sizetext)/2, 652)
end


function thoughts.update(dt)

end

function thoughts.key(key)
	if key == 'o' then -- sí
		if thoughts.current == 13 then thoughts.current = 14 end
		if thoughts.current == 10 then thoughts.current = 11 end
		if thoughts.current == 9 then thoughts.current = 10 end
		if thoughts.current == 6 then thoughts.current = 7 end
		if thoughts.current == 3 then thoughts.current = 4 end --
		if thoughts.current == 2 then thoughts.current = 3 end
		if thoughts.current == 1 then thoughts.current = 2 end
	end

	if key == 'p' then -- no
		if thoughts.current == 13 then thoughts.current = 15 end
		if thoughts.current == 10 then thoughts.current = 12 end
		if thoughts.current == 9 then thoughts.current = 13 end
		if thoughts.current == 6 then thoughts.current = 8 end
		if thoughts.current == 3 then thoughts.current = 5 end
		if thoughts.current == 2 then thoughts.current = 6 end
		if thoughts.current == 1 then thoughts.current = 9 end
	end
end


function UPDATE_THOUGHTS(dt, key)
	thoughts.update(dt)
end


function DRAW_THOUGHTS()
	thoughts.draw()
end
