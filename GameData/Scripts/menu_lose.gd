extends Control


func _on_Replay_Button_pressed():
	$AudioClick.play()
	# Stop the script until the sound has completed playing.
	yield($AudioClick, "finished")
	get_tree().change_scene("res://Scenes/main.tscn") 


func _on_Back_to_Menu_Button_pressed():
	$AudioClick.play()
	# Stop the script until the sound has completed playing.
	yield($AudioClick, "finished")
	get_tree().change_scene("res://Scenes/start.tscn") 


func _on_Quit_Button_pressed():
	$AudioQuit.play()
	# Stop the script until the sound has completed playing.
	yield($AudioQuit, "finished")
	get_tree().quit()
