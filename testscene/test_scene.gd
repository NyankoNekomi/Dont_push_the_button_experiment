extends Node2D

@onready var icon = $Icon
@onready var showspidertimer = $Showspidertimer
@onready var marker_2d = $Marker2D


@export var spider_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	icon.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_body_entered(body):
	if body.name =="Player":
		icon.visible = true
		showspidertimer.start()
	


func _on_showspidertimer_timeout():
	var spider_fall = spider_scene.instantiate()
	add_child(spider_fall)
	spider_fall.global_position = marker_2d.global_position
	


func _on_button_body_exited(body):
	if body.name =="Player":
		icon.visible = false
