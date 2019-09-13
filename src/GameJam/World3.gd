extends Node

onready var sprite = load(global.currentPlayer)
#Difference load and preload?
func _ready():
	#print(global.currentPlayer)
	
	
	#Save current data
	var s = sprite.instance()
	add_child(s) #Oh yeah....
	$AudioStreamPlayer2D.play()