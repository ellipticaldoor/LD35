thoughts = {}

function thoughts.load()
	thoughts.current = 1

	thoughts.phrases = {
		"a - Qué dura la vida de estudiante...",
			"aa - ¡Aunque no tenga la beca voy a seguir adelante!",
				"aaa -Nadie dijo que estudiar fuera fácil.",
					"aab - Estoy decidido a acabar mis estudios, por mi porvenir.",
					"ab - Esto es muy difícil, me doy por vencido.",
				"aba - Pero es que sin la beca no puedo asistir mucho a clase...",
					"abb - Puedo estudiar en casa y aprobar los exámenes, ¡Yo Puedo!",
					"b - Mejor buscar otra cosa para seguir adelante.",
			"ba - Me quitan la beca; sin eso no puedo hacer nada...",
				"baa - Quizás me puedan ayudar en casa, ¿no?",
					"bab - ¡Con la ayuda de casa puedo seguir estudiando!",
					"No me han podido ayudar en casa, tengo que dejar los estudios.",
				"bb - Seguramente no me puedan ayudar en casa...",
					"bba -  En casa quieren ayudarme, pero no es suficiente.",
					"bbb - No tengo ninguna motivación para seguir adelante con los estudios.",
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
