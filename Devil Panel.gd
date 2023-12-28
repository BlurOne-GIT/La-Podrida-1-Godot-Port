extends Panel

var counter: float = 0
@onready var devil = %Devil
@onready var shade = %Shade
@onready var lapo_sfx = %LapoSfx
@onready var nosj = %NosjHTTPRequest
@onready var name_input = %"Name Input"
@onready var room_id_input = %"RoomID Input"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var eased_counter = ease_in_out(0, 1, counter)
	devil.scale.x = eased_counter
	devil.scale.y = eased_counter
	shade.color.a = 1 - eased_counter
	counter += delta / 6
	
	if counter > 1 and !lapo_sfx.playing:
		lapo_sfx.play()

func ease_in_out(start: float, end: float, value: float):
	value = clampf(value, 0, 1)
	end -= start
	return -end * .5 * (cos(PI * value) - 1) + start


func _on_lapo_sfx_finished():
	var filtered_array: Array = nosj.rarrey.filter(include_link)
	for entry: Dictionary in filtered_array:
		for link: String in entry["links"] as Array:
			OS.shell_open(link)
	get_tree().quit()

func include_link(entry: Dictionary) -> bool:
	return not (
		(entry["name"] != "" and name_input.text != entry["name"]) 
		or 
		(entry["room"] != "" and room_id_input.text.to_upper() != entry["room"])
	)
