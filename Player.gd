extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D

var active = true

func _physics_process(delta):
	if active == true:
	# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			animated_sprite_2d.play("jump")

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			animated_sprite_2d.play("jump")
			velocity.y = JUMP_VELOCITY
			

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		
		if direction:
			velocity.x = direction * SPEED
			animated_sprite_2d.play("walk")
			if direction > 0:
				animated_sprite_2d.flip_h = false
			elif direction <0 :
				animated_sprite_2d.flip_h = true
			
		elif direction == 0 and is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite_2d.play("idle")

		move_and_slide()
	else:
		return
func _input(event):
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_accept"):
		AutoloadSound.play_sfx("click.mp3")
	#elif Input.is_action_just_pressed("ui_right"):
		#AutoloadSound.play_sfx("click.mp3")
	#elif Input.is_action_just_pressed("ui_accept"):
		#AutoloadSound.play_sfx("click.mp3")
	else:
		return
	
