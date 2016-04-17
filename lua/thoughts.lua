thoughts = {}

function thoughts.load()
	thoughts.current = 1

	thoughts.phrases = {
		"a - Qué dura la vida de estudiante...",
			"aa - ¡Aunque no tenga la beca voy a seguir adelante!",
				"aaa - Aún puedo seguir estudiando sin trabajar.",
				"aab - Trabajaré y después seguiré mis estudios.",
			"ab - ¿Tendré que trabajar para seguir estudiando?",
				"aba - Puedo trabajar y aprobar los exámenes, ¡Yo Puedo!",
				"abb - Mejor trabajar para seguir adelante.",
		"b - Me quitan la beca, sin eso no puedo hacer nada...",
			"ba - No me importaría trabajar mientras estudio.",
				"baa - Trabajaré mientras estudio, espero aprobar.",
				"bab - Bueno, pues me toca trabajar...",
			"bb - Seguramente tenga que empezar a trabajar...",
				"bba -  Sí, tengo que empezar a trabajar.",
				"bbb -Definitivamente tengo que dejar de estudiar para trabajar.",
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
