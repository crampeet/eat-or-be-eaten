# state_factory.gd

class_name PlayerStateFactory

var states

func _init():
	states = {
		"idle": PlayerStateIdle,
		"run": PlayerStateRun,
		"jump": PlayerStateJump
}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
	else:
		printerr("No state ", state_name, " in state factory!")
