# idle_state.gd

extends PlayerState

class_name PlayerStateIdle

func _ready():
	if persistent_state.devolved:
		animated_sprite.play("raptor_idle")
	else:
		animated_sprite.play("idle")

func _flip_direction():
	animated_sprite.flip_h = not animated_sprite.flip_h

func move_left():
	if animated_sprite.flip_h:
		change_state.call_func("run")
	else:
		_flip_direction()

func move_right():
	if not animated_sprite.flip_h:
		change_state.call_func("run")
	else:
		_flip_direction()
