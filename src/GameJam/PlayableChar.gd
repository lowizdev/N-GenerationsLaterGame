extends KinematicBody2D

#BASE MOVEMENT FOR ALL PLAYERS

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

const UP = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 150
var JUMP_HEIGHT = -350


var motion = Vector2() 

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$Sprite.flip_h = false  #Acess to sprite
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run") #CHANGE LATER: JUST MOVE LEGS
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		#else:
		#	$Sprite.play("Run") #CHANGE LATER #Maybe not...
	
	move_and_slide(motion, UP)
	pass