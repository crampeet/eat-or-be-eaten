# persistent_state.gd

extends KinematicBody2D

class_name PlayerStatePersistent

var state
var state_factory

var velocity = Vector2()

var devolved = false

func _ready():
	state_factory = PlayerStateFactory.new()
	change_state("idle")

# Input code was placed here for tutorial purposes.
func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		move_left()
	elif Input.is_action_pressed("ui_right"):
		move_right()
	if Input.is_action_pressed("jump"):
		move_jump()

func move_left():
	state.move_left()

func move_right():
	state.move_right()

func move_jump():
	if is_on_floor():
		change_state("jump")

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(funcref(self, "change_state"), $AnimatedSprite, self)
	state.name = "current_state"
	add_child(state)

func _on_DevolveArea1_body_entered(body):
	if body.name == "player":
		print("Form of Raptor!")
		# change player sprites, animations, sounds, and movement abilities to raptor form
		devolved = true
		$CollisionShape2D.scale.x = 2
		$CollisionShape2D.scale.y = 2
