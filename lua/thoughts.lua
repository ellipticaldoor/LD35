thoughts = {}

function thoughts.load()
	thoughts.current = 1

	thoughts.phrases = {
		"Que dura la vida de estudiante...",
			"¡Aunque no tenga la beca voy a seguir adelante!",
				"Nadie dijo que estudiar fuera fácil.",
					"Estoy decidido a acabar mis estudios, por mi porvenir.",
					"Esto es muy difícil, me doy por vencido.",
				"Pero es que sin la beca no puedo asistir mucho a clase...",
					"Puedo estudiar en casa y aprobar los exámenes, ¡Yo Puedo!",
					"Mejor buscar otra cosa para seguir adelante.",
			"Me quitan la beca; sin eso no puedo hacer nada...",
				"Quizás me puedan ayudar en casa, ¿no?",
					"¡Con la ayuda de casa puedo seguir estudiando!",
					"No me han podido ayudar en casa, tengo que dejar los estudios.",
				"Seguramente no me puedan ayudar en casa...",
					"En casa quieren ayudarme, pero no es suficiente.",
					"No tengo ninguna motivación para seguir adelante con los estudios.",
	}
end


function thoughts.draw()
	love.graphics.setColor(236, 240, 241)
	love.graphics.setFont(f)
	sizetext = f:getWidth(thoughts.phrases[thoughts.current])
	love.graphics.print(thoughts.phrases[thoughts.current], (1280-sizetext)/2, 648)
end


function thoughts.update(dt)
	function raiseHappy()
		music.track2Volume=music.track2Volume+0.33
		if(music.track2Volume > 1) then music.track2Volume = 1 end
		TEsound.volume("happy_music", music.track2Volume)


		music.track3Volume=music.track3Volume-0.33
		if(music.track3Volume < 0) then music.track3Volume = 0 end
		TEsound.volume("tragic_music", music.track3Volume)
	end

	function raiseTragic()
		music.track3Volume=music.track3Volume+0.33
		if(music.track3Volume > 1) then music.track3Volume = 1 end
		TEsound.volume("tragic_music", music.track3Volume)

		music.track2Volume=music.track2Volume-0.33
		if(music.track2Volume < 0) then music.track2Volume = 0 end
		TEsound.volume("happy_music", music.track2Volume)
	end
end

function yesChoice()
	if(music.track3Volume == 0)then
		music.track2Volume=music.track2Volume+0.33
		if(music.track2Volume > 1) then music.track2Volume = 1 end
		TEsound.volume("happy_music", music.track2Volume)
	else
		music.track3Volume=music.track3Volume-0.33
		if(music.track3Volume < 0.2) then music.track3Volume = 0 end
		TEsound.volume("tragic_music", music.track3Volume)
	end

	if thoughts.current == 13 then thoughts.current = 14 end
	if thoughts.current == 10 then thoughts.current = 11 end
	if thoughts.current == 9 then thoughts.current = 10 end
	if thoughts.current == 6 then thoughts.current = 7 end
	if thoughts.current == 3 then thoughts.current = 4 end --
	if thoughts.current == 2 then thoughts.current = 3 end
	if thoughts.current == 1 then thoughts.current = 2 end
end

function noChoice()
	if(music.track2Volume < 0.2)then
		music.track3Volume=music.track3Volume+0.33
		if(music.track3Volume > 1) then music.track3Volume = 1 end
		TEsound.volume("tragic_music", music.trac32Volume)
	else
		music.track2Volume=music.track2Volume-0.33
		if(music.track2Volume < 0) then music.track2Volume = 0 end
		TEsound.volume("happy_music", music.track2Volume)
	end

	if thoughts.current == 13 then thoughts.current = 15 end
	if thoughts.current == 10 then thoughts.current = 12 end
	if thoughts.current == 9 then thoughts.current = 13 end
	if thoughts.current == 6 then thoughts.current = 8 end
	if thoughts.current == 3 then thoughts.current = 5 end
	if thoughts.current == 2 then thoughts.current = 6 end
	if thoughts.current == 1 then thoughts.current = 9 end
end

function thoughts.key(key)
	if key == 'o' then -- sí
		yesChoice()
	end

	if key == 'p' then -- no
		noChoice()
	end
end


function UPDATE_THOUGHTS(dt, key)
	thoughts.update(dt)
end


function DRAW_THOUGHTS()
	thoughts.draw()
end
