extends Node

const SAVE_PATH = "user://savegame.json"

var ItemDB = {
	"stone": {
		"id": "stone",
		"name": "Piedra",
		"type": "resource",
		"stackable": true,
		"max_stack": 99
	},
	"iron": {
		"id": "iron",
		"name": "Hierro",
		"type": "resource",
		"stackable": true,
		"max_stack": 99
	}
}

func get_item(id: String) -> Dictionary:
	if ItemDB.has(id):
		return ItemDB[id]
	return {}
