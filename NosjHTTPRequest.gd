extends HTTPRequest

const NOSJ_URL := "https://raw.githubusercontent.com/BlurOne-GIT/La-Podrida-2/main/LaPodrida2/Logical%20Code/nosj.json"
@export var rarrey: Array


func _ready():
	var request = request(NOSJ_URL)


func _on_request_completed(result, _response_code, _headers, _body):
	if result != OK and !FileAccess.file_exists(download_file):
		return
	
	var file := FileAccess.open(download_file, FileAccess.READ)
	var text := file.get_as_text()
	file.close()
	var mr_json = JSON.new()
	if mr_json.parse(text) != OK:
		return
	
	rarrey = mr_json.data as Array