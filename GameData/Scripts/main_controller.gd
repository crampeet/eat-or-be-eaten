extends Node2D

var wincount = 0

#func _ready():
#	$AudioMusic.play()

func _on_WinArea_body_entered(body):
	wincount += 1
	if wincount > 1:
		print("You Win!")
		get_node("EggFriends/Egg1").hatch()
		get_node("EggFriends/Egg2").hatch()
		get_node("EggFriends/Egg3").hatch()
		get_node("EggFriends/Egg4").hatch()
		get_node("EggFriends/Egg5").hatch()
		$AudioWin.play()
		# Stop the script until the sound has completed playing.
		yield($AudioWin, "finished")
		get_tree().change_scene("res://Scenes/win.tscn") 
