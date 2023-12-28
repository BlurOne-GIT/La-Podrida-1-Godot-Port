extends Node

const CONFIG_FILE_PATH := "user://lp1gp.json"

@onready var bgm_h_slider = %"Bgm HSlider"
@onready var sfx_h_slider = %"Sfx HSlider"
@onready var fullscreen_check_box = %"Fullscreen CheckBox"
@onready var languaje_option_button = %"Languaje OptionButton"

# Called when the node enters the scene tree for the first time.
func _ready():
	if not FileAccess.file_exists(CONFIG_FILE_PATH):
		_save()
		return
	
	var file := FileAccess.open(CONFIG_FILE_PATH, FileAccess.READ)
	var text := file.get_as_text()
	file.close()
	var mr_json = JSON.new()
	if mr_json.parse(text) != OK:
		_save()
		return
	
	var data : Dictionary = mr_json.data as Dictionary
	bgm_h_slider.do_sound = false
	bgm_h_slider.value = data.get("bgm")
	sfx_h_slider.do_sound = false
	sfx_h_slider.value = data.get("sfx")
	bgm_h_slider.do_sound = true
	sfx_h_slider.do_sound = true	
	fullscreen_check_box.toggle_mode = data.get("fs")
	languaje_option_button.selected = data.get("useless")


func _save():
	var data := {
		"bgm": bgm_h_slider.value,
		"sfx": sfx_h_slider.value,
		"fs": fullscreen_check_box.toggle_mode,
		"useless": languaje_option_button.selected
	}
	
	var file = FileAccess.open(CONFIG_FILE_PATH, FileAccess.WRITE_READ)
	file.store_string(JSON.stringify(data))
	file.close()
