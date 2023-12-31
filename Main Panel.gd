extends Panel

@onready var config_panel = %"Settings Panel"
@onready var lobby_panel = %"Lobby Panel"
@onready var back_button = %"Back Button"
@onready var boton_sfx = %BotonSfx
@onready var error_sfx = %ErrorSfx
@onready var ohhmg_sfx = %OhhmgSfx
@onready var name_input = %"Name Input"
@onready var room_id_input = %"RoomID Input"
@onready var nosj = %NosjHTTPRequest
@onready var id_label = %"Id Label"
@onready var player_count_label = %"PlayerCount Label"
@onready var player_item_list = %"Player ItemList"

const ROOM_ID_CHARS := [
	'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
	]


func _on_exit_button_pressed():
	get_tree().quit()


func _on_config_button_pressed():
	boton_sfx.play()
	var panel_to_disable = self if not back_button.in_lobby else lobby_panel
	panel_to_disable.process_mode = Node.PROCESS_MODE_DISABLED
	panel_to_disable.visible = false
	config_panel.visible = true
	config_panel.process_mode = Node.PROCESS_MODE_INHERIT


func _on_join_button_pressed():
	var inputed_id: String = room_id_input.text.to_upper()
	var filtered_array: Array = nosj.rarrey.filter(func(entry: Dictionary): return entry["room"] == inputed_id)
	if inputed_id == "" or filtered_array.size() <= 0:
		error_sfx.play()
		return
	
	var entry: Dictionary = filtered_array[0] as Dictionary
	var players: Array = entry["players"] as Array
	player_count_label.text = "Players:%s/8" % (1 + players.size())
	for i in range (0, players.size()):
		player_item_list.set_item_text(1+i, players[i])
	
	ohhmg_sfx.play()
	join(inputed_id)


func join(room_id: String):
	if name_input.text == "":
		error_sfx.play()
		return
	id_label.text = room_id
	player_item_list.set_item_text(0, name_input.text)
	back_button.in_lobby = true
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	lobby_panel.visible = true
	lobby_panel.process_mode = Node.PROCESS_MODE_INHERIT

func _on_create_room_button_pressed():
	boton_sfx.play()
	player_count_label.text = "Players:1/8"
	for i in range(1, 8):
		player_item_list.set_item_text(i, str("Player ", i+1))
	join(generate_random_room())


func generate_random_room() -> String:
	var result := ""
	for i in range(0, 6):
		result += ROOM_ID_CHARS[randi() % ROOM_ID_CHARS.size()]
	return result
