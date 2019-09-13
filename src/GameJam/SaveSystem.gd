extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

const save_path = "res://savefile.cfg"
var config = ConfigFile.new()
var load_response = config.load(save_path) 

func save_data(section, key, data):
	config.set_value(section, key, data)
	config.save(save_path)

func load_data(section, key):
	return config.get_value(section, key)
