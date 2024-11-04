extends Node2D

@onready var button_scene = $button_scene
@onready var button_check = $"button check"
@onready var player = $Player
@onready var player_cam = $Player/Camera2D
@onready var spawn_spider = $Spawn_spider
@onready var you_died = $CanvasLayer/YOU_Died
@onready var game_end = $game_end

@export var spider_scene:PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	player_cam.make_current()
	button_scene.visible = false
	you_died.visible = false
	


func _on_button_check_body_entered(body):
	button_scene.visible = true
	AutoloadSound.play_sfx("timetick.mp3")
	await get_tree().create_timer(10).timeout
	spawn_spider.start()
	game_end.start()
	


func _on_button_check_body_exited(body):
	button_scene.visible = false


func _on_spawn_spider_timeout():
	var spider_fall = spider_scene.instantiate()
	add_child(spider_fall)
	spider_fall.global_position = player.global_position + Vector2(randi_range(-50,+50),randi_range(-300,-200))
	AutoloadSound.play_sfx("enemyspawn.mp3")
	#AutoloadSound.play_sfx("bloodsplash.mp3")
	
	
func died():
	spawn_spider.stop()
	player.active = false
	AutoloadSound.play_sfx("bloodsplash.mp3")
	you_died.visible = true
	



func _on_game_end_timeout():
	died()
