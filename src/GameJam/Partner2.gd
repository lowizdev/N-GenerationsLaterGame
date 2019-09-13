extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	var bodies = get_overlapping_bodies()

	for body in bodies:
		#Might need to change later
		if body.name == "Player":
			
			#Saves data of next world!
			savesystem.save_data("Save", "Player", "Player3") #Next player
			savesystem.save_data("Save", "Levelname", "World22") #Next world
			
			#Sets player type and changes scene (EvolPort)
			global.currentPlayer = "res://Player3.tscn"
			get_tree().change_scene("World22.tscn")