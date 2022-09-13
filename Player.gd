extends KinematicBody2D

var motion = Vector2()
var vel_desp = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("move_Up")):
		motion.y = -vel_desp
		$AnimationPlayer.play("walk_up")
	elif(event.is_action_pressed("move_Down")):
		motion.y = vel_desp
		$AnimationPlayer.play("walk_down")
	elif(event.is_action_pressed("move_Left")):
		motion.x = -vel_desp
		$AnimationPlayer.play("walk_sides")
		$Sprite.flip_h = false
	elif(event.is_action_pressed("move_Right")):
		motion.x = vel_desp
		$AnimationPlayer.play("walk_sides")
		$Sprite.flip_h = true
	else:
		motion = Vector2(0,0)
	
	motion = move_and_slide(motion)	

func _physics_process(delta):
	
	if(Input.is_action_pressed("move_Up")):
		motion.y = -vel_desp
		$AnimationPlayer.play("walk_up")
		Input.start_joy_vibration(0,0.5,0,0.0001)
	elif(Input.is_action_pressed("move_Down")):
		motion.y = vel_desp
		$AnimationPlayer.play("walk_down")
		Input.start_joy_vibration(0,0,0.5,0.00001)
	elif(Input.is_action_pressed("move_Left")):
		motion.x = -vel_desp
		$AnimationPlayer.play("walk_sides")
		$Sprite.flip_h = false
		Input.start_joy_vibration(0,0.5,0.5,0.1)
	elif(Input.is_action_pressed("move_Right")):
		motion.x = vel_desp
		$AnimationPlayer.play("walk_sides")
		$Sprite.flip_h = true
		Input.start_joy_vibration(0,0.5,0.5,0.0000001)
	else:
		motion = Vector2(0,0)
		
		
	motion = move_and_slide(motion)	

