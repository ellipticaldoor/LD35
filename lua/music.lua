music = {}
counter = 0

function music.load()
	TEsound.playLooping("/sound/basic_music.mp3", "basic_music", 500,0)
	TEsound.playLooping("/sound/happy_music.mp3", "happy_music", 500,0)
	TEsound.playLooping("/sound/happy_music.mp3", "tragic_music", 500,0)
	music.track1Volume=0
	music.track2Volume=0
	music.track3Volume=0
end

function music.update(dt)
	if love.keyboard.isDown('x') then
		music.track1Volume=music.track1Volume+0.1
		if music.track1Volume > 1 then music.track1Volume = 1 end
		TEsound.volume("basic_music", music.track1Volume)
	end

	if love.keyboard.isDown('c') then
		music.track1Volume=music.track1Volume-0.1
		if music.track1Volume < 0 then music.track1Volume = 0 end
		TEsound.volume("basic_music", music.track1Volume)
	end
end

function UPDATE_MUSIC(dt)
	counter=counter+1
	if counter < 20 then return end
	counter = 0

	if player.walking then
		TEsound.play("/sound/paso.wav", "walk")
		player.walking=false
	end

	music.update(dt)
end
