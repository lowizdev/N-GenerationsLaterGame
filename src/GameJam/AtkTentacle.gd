extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const ATKSPEED = 100

var velocityAtk = Vector2()
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_atk_direction(newdir):
	direction = newdir
	if newdir == -1:
		$Sprite.flip_h = true
		

func _physics_process(delta):
	velocityAtk.x = ATKSPEED * delta * direction #Uses setted direction for moving on correct direction
	translate(velocityAtk)
	#if playable anim do here

func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #Destroys offscreen


func _on_AtkTentacle_body_entered(body):
	if "Enemy" in body.name:
		body.die()
	queue_free() # Destroyed when colides with walls & etc.
