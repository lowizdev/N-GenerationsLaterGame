extends Node

func _ready():
	#load game
	$MarginContainer/VBoxContainer/VBoxContainer/Button.grab_focus()

func _physics_process(delta):
	pass

func _on_Button_pressed(): #Load game to continue

	#SAVE USAGE
	#savesystem.save_data("Save", "Player", "Player2")
	#savesystem.save_data("Save", "Levelname", "World22")
	
	#print(savesystem.load_data("Save", "Player"))
	#print(savesystem.load_data("Save", "Levelname"))
	var current_level = savesystem.load_data("Save", "Levelname")
	#print(current_level)
	if(current_level != null): #check for case not played yet
		
		var current_player = savesystem.load_data("Save", "Player")
		global.currentPlayer = current_player + ".tscn"
		
		get_tree().change_scene(current_level + ".tscn") 
		


func _on_Button2_pressed():
	
	#Reset saved data
	savesystem.save_data("Save", "Player", "Player1")
	savesystem.save_data("Save", "Levelname", "World")
	
	get_tree().change_scene("World.tscn")
	pass # Replace with function body.


func _on_Button3_pressed():
	get_tree().quit()


func _on_Button4_pressed():
	get_tree().change_scene("res://Tutorial.tscn")
	pass # Replace with function body.
