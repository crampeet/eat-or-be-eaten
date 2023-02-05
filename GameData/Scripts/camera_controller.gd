extends Node

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioMusic.play()
	player = get_node("../player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y = 0
	self.position.x = clamp(player.position.x, 0, 5500)
