extends CheckBox

@onready var ksmash_sfx = %KsmashSfx

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_toggled(toggled_on):
	ksmash_sfx.play(0.1)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if toggled_on else DisplayServer.WINDOW_MODE_WINDOWED)
