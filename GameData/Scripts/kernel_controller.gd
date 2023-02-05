extends KinematicBody2D

const SPEED = 100
var target = null
var gotchaSound = null

func _on_ready():
	#gotchaSound = preload("res://Assets/sounds/Jump_Scare.wav")
	#target = get_tree().get_root().find_node("player")
	$AnimatedSprite.play("chase")

func _physics_process(delta):
	if target:
		var velocity = global_position.direction_to(target.global_position)
		move_and_collide(velocity * SPEED * delta)
		$AnimatedSprite.flip_h = (velocity.x < 0)

func _on_DetectionRange_body_entered(body):
	print(body.name)
	if body.name == "player":
		target = body

func _on_DetectionRange_body_exited(body):
	if body.name == "player":
		target = null

func _on_CollisionArea_body_entered(body):
	print(body.name)
	if body.name == "player":
		#$AudioStreamPlayer2D.stream = gotchaSound
		$AudioJumpScare.play()
		# change to lose screen after sound plays
		yield($AudioJumpScare, "finished")
		get_tree().change_scene("res://Scenes/lose.tscn") 

func _on_CollisionArea_body_exited(body):
	pass # Replace with function body.
