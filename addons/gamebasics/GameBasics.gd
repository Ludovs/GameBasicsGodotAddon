@tool
extends EditorPlugin


func _enter_tree():
	add_autoload_singleton("SoundManager", "res://addons/gamebasics/singletons/sound_manager.tscn")
	AudioServer.add_bus()

func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
