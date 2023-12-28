# Thanks to The Shaggy Dev
extends HSlider

@onready
var bus_index: int = AudioServer.get_bus_index("bgm")

@onready var barra_sfx = %BarraSfx
@export var do_sound = false

func _ready():
	_on_value_changed(value)
	do_sound = true

func _on_value_changed(value):
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
	if do_sound:
		barra_sfx.play()
