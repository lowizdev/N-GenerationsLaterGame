extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	var bodies = get_overlapping_bodies()

	for body in bodies:
		#Might need to change later
		if body.name == "Player2": # Name comes from kinematicbody. CHANGE LATER!!!
			
			#Saves data of next world!
			savesystem.save_data("Save", "Player", "Player4") #Next player
			savesystem.save_data("Save", "Levelname", "World3") #Next world
			
			#Sets player type and changes scene (EvolPort)
			global.currentPlayer = "res://Player4.tscn"
			get_tree().change_scene("World3.tscn")
		elif body.name == "Player3": # Name comes from kinematicbody. CHANGE LATER!!!
			
			#Saves data of next world!
			savesystem.save_data("Save", "Player", "Player6") #Next player
			savesystem.save_data("Save", "Levelname", "World3") #Next world
			
			#Sets player type and changes scene (EvolPort)
			global.currentPlayer = "res://Player6.tscn"
			get_tree().change_scene("World3.tscn")