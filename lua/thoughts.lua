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


function UPDATE_THOUGHTS(dt)
	thoughts.update(dt)
end


function DRAW_THOUGHTS()
	thoughts.draw()
end
