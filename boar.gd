extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree

const SPEED = 50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var timer : Timer = $Timer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

@export var move_direction : Vector2 #= Vector2.LEFT

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	velocity.x = move_direction.x * SPEED

	if state_machine.check_if_can_move():
		if(timer.get_time_left() > 3):
			move_direction = Vector2.RIGHT
		else:
			move_direction = Vector2.LEFT
	else:
		velocity.x = 0
		
	if move_direction.x > 0:
		sprite.flip_h = true
	elif move_direction.x <0:
		sprite.flip_h = false
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func random_walk():
	if(timer.is_stopped()):
		move_direction = Vector2.RIGHT
		timer.start()
	else:
		move_direction = Vector2.LEFT
