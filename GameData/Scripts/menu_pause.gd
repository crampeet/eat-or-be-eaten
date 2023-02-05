extends Control


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	# Enable pausing game to view in-game menu
	# TODO: figure out how to unpause (this _process seems to stop being called when paused)
	#if Input.is_action_pressed("ui_cancel"):
	#	get_tree().paused = true
	#	self.visible = true

func _on_How_to_Play_Button_pressed():
	get_tree().paused = false
	self.visible = false
	$AudioClick.play()
	# Stop the script until the sound has completed playing.
	yield($AudioClick, "finished")
	$InstructionsDialog.popup_centered()


func _on_Exit_Button_pressed():
	get_tree().paused = false
	self.visible = false
	$AudioQuit.play()
	# Stop the script until the sound has completed playing.
	yield($AudioQuit, "finished")
	get_tree().change_scene("res://Scenes/start.tscn") 
