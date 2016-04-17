music = {}
counter = 0

function music.load()
	music.track1Volume=1
	music.track2Volume=0
	music.track3Volume=0
	TEsound.playLooping("/sound/basic_music.mp3", "basic_music")
	TEsound.volume("basic_music", music.track1Volume)
	TEsound.playLooping("/sound/happy_music.mp3", "happy_music")
	TEsound.volume("happy_music", music.track2Volume)
	TEsound.playLooping("/sound/tragic_music.mp3", "tragic_music")
	TEsound.volume("tragic_music", music.track3Volume)
end

function music.update(dt)

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
