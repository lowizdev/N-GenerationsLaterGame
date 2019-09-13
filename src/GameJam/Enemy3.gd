extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const UP = Vector2(0, -1)
const GRAVITY = 0
const SPEED = 100

var direction = 1 # 1 is direction right

var motion = Vector2()

var player_to_follow = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func die():
	#Make some sort of hp here...
	queue_free()

func _physics_process(delta):
	#motion.x = SPEED * direction
	
	#if direction == 1:
	#	$AnimatedSprite.flip_h = false
	#else:
	#	$AnimatedSprite.flip_h = true
	#BEHAVIOR: FOLLOW PLAYER
	motion = Vector2.ZERO
	
	$AnimatedSprite.play("Run")
	
	if player_to_follow != null :
		motion = (player_to_follow.position - position).normalized() * SPEED
		if motion.x < 0:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
		
	motion = move_and_slide(motion)
	#motion.y += GRAVITY
	
	#motion = move_and_slide(motion, UP)
	
	#if is_on_wall(): # changes direction when hits wall	
	#	direction = direction * -1
	#	$RayCast2D.position.x *= -1 #changes raycast position
		#print("changed")
	#if $RayCast2D.is_colliding() == false: #changes direction when raycast no longer collides
	#	direction = direction * -1
	#	$RayCast2D.position.x *= -1 #changes raycast position
		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.take_damage(1)
	

func _on_DetectRadius_tree_entered():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		player_to_follow = body
		#print(body)


func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	#print("Exited")
	player_to_follow = null
	pass # Replace with function body.
