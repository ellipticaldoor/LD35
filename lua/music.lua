music = {}
counter = 0

function music.load()
	TEsound.playLooping("/sound/basic_music.mp3", "basic_music", 500,1)
	TEsound.playLooping("/sound/happy_music.mp3", "happy_music", 500,1)
	TEsound.playLooping("/sound/happy_music.mp3", "tragic_music", 500,1)
	music.track1Volume=0
	music.track2Volume=0
	music.track3Volume=0
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
end
