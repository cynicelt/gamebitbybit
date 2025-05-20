extends Node
@onready var gamemanager = %gamemanager

func play(sound: AudioStream):
	if sound == null:
		return
	var player = AudioStreamPlayer.new()
	Engine.get_main_loop().current_scene.add_child(player)
	player.set_stream(sound)
	player.play()
	
	var timer = LifetimeTimer.new(player)
	timer.wait_time = sound.get_length()
	Engine.get_main_loop().current_scene.add_child(timer)
	timer.start()
	
