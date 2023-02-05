extends Node2D

var wincount = 0

#func _ready():
#	$AudioMusic.play()

func _on_WinArea_body_entered(body):
	wincount += 1
	if wincount > 1:
		print("You Win!")
		$AudioWin.play()
		# Stop the script until the sound has completed playing.
		yield($AudioWin, "finished")
		get_tree().change_scene("res://Scenes/win.tscn") 
