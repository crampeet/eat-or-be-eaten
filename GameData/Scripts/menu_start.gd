extends Control

func _ready():
	$AudioTitleMusic.play()

func _on_Play_Button_pressed():
	$AudioClick.play()
	# Stop the script until the sound has completed playing.
	yield($AudioClick, "finished")
	get_tree().change_scene("res://Scenes/main.tscn") 


func _on_How_to_Play_Button_pressed():
	$AudioClick.play()
	# Stop the script until the sound has completed playing.
	yield($AudioClick, "finished")
	$InstructionsDialog.popup_centered()


func _on_Quit_Button_pressed():
	$AudioQuit.play()
	# Stop the script until the sound has completed playing.
	yield($AudioQuit, "finished")
	get_tree().quit()
