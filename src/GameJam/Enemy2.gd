extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const UP = Vector2(0, -1)
const GRAVITY = 10
const SPEED = 115

var direction = 1 # 1 is direction right

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func die():
	#Make some sort of hp here...
	queue_free()

func _physics_process(delta):
	motion.x = SPEED * direction
	
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	
	$AnimatedSprite.play("Run")
	motion.y += GRAVITY
	
	motion = move_and_slide(motion, UP)
	
	if is_on_wall(): # changes direction when hits wall
		#var playercollision = false # Doesnt stop if collides with player
		#for i in range(get_slide_count()):
		#	if "Player" in get_slide_collision(i).collider.name:
		#		playercollision = true
		#		break
		#if not playercollision:	
		direction = direction * -1
		$RayCast2D.position.x *= -1 #changes raycast position
		#print("changed")
	if $RayCast2D.is_colliding() == false: #changes direction when raycast no longer collides
		direction = direction * -1
		$RayCast2D.position.x *= -1 #changes raycast position
		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				get_slide_collision(i).collider.take_damage(0.5)
	