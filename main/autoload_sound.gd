extends Node

var blodsplash = preload("res://sound/sfx/bloodsplash.mp3")
var enemyspawn = preload("res://sound/sfx/enemyspawn.mp3")
var timetick = preload("res://sound/sfx/timetick.mp3")
var click = preload("res://sound/sfx/click.mp3")
var click2 = preload("res://sound/sfx/click2.wav")

func play_sfx(sfx_name: String):
	
	
	var stream = null
	
	if sfx_name == "bloodsplash.mp3":
		stream = blodsplash
	elif sfx_name == "enemyspawn.mp3":
		stream =enemyspawn
	elif sfx_name == "timetick.mp3":
		stream = timetick
	elif sfx_name == "click.mp3":
		stream = click
	elif sfx_name == "click2.wav":
		stream = click2
		
	else:
		print("invalid")
		return
	
	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	add_child(asp)
	asp.play()
	
	await asp.finished
	asp.queue_free()
