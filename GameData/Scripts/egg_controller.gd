extends Node

onready var player = get_node("AnimatedSprite")

# Called when the node enters the scene tree for the first time.
func _ready():
	player.play("idle")

func hatch():
	player.play("hatch")
	yield(player, "animation_finished")
	player.play("celebrate")
