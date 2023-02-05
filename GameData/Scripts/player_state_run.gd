# run_state.gd

extends PlayerState

class_name PlayerStateRun

func _ready():
	if persistent_state.devolved:
		animated_sprite.play("raptor_run")
	else:
		animated_sprite.play("run")

	if animated_sprite.flip_h:
		move_speed.x *= -1
		raptor_move_speed.x *= -1

	if persistent_state.devolved:
		persistent_state.velocity += raptor_move_speed
	else:
		persistent_state.velocity += move_speed

func _physics_process(_delta):
	if abs(persistent_state.velocity.x) < min_move_speed:
		 change_state.call_func("idle")
	persistent_state.velocity.x *= friction

func move_left():
	if animated_sprite.flip_h:
		if persistent_state.devolved:
			persistent_state.velocity += raptor_move_speed
		else:
			persistent_state.velocity += move_speed
	else:
		change_state.call_func("idle")

func move_right():
	if not animated_sprite.flip_h:
		if persistent_state.devolved:
			persistent_state.velocity += raptor_move_speed
		else:
			persistent_state.velocity += move_speed
	else:
		change_state.call_func("idle")
