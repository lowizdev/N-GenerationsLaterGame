extends Area2D

func _physics_process(delta):
	#Kills player on contact
	
	var bodies = get_overlapping_bodies()
	#print(bodies)
	for body in bodies:
		#Might need to change later
		
		if "Player" in body.name:
			
			#print(body)
			body.die()
	
	