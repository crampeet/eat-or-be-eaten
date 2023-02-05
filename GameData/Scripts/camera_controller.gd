extends Camera2D

var speed : int = 80
var wincount = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta

func _on_WinArea_body_entered(body):
	wincount += 1
	if wincount > 1:
		print("You Win!")
		# TODO: show win screen
