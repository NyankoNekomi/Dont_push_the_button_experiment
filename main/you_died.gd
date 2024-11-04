extends Control

@export var reloadscene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_replay_pressed():
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()
	



func _on_quit_pressed():
	get_tree().quit()
