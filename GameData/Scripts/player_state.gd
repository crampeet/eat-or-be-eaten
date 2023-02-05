# state.gd

extends Node2D

class_name PlayerState

var change_state
var animated_sprite
var persistent_state
var velocity = 0
var gravity = 450
var jump_speed = -300
var raptor_jump_speed = -400
var move_speed = Vector2(150, 0)
var raptor_move_speed = Vector2(200, 0)
var min_move_speed = 0.005
var friction = 0.32

# Writing _delta instead of delta here prevents the unused variable warning.
func _physics_process(delta):
	# gravity
	if not persistent_state.is_on_floor():
		persistent_state.velocity.y += gravity * delta
	# apply player movements
	persistent_state.move_and_slide(persistent_state.velocity, Vector2.UP)

func setup(change_state, animated_sprite, persistent_state):
	self.change_state = change_state
	self.animated_sprite = animated_sprite
	self.persistent_state = persistent_state

func move_left():
	pass

func move_right():
	pass

func move_jump():
	pass
