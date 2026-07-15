extends Node

const SAVE_PATH = "user://savegame.json"

var ItemDB = {
	"stone": {
		"id": "stone",
		"name": "Piedra",
		"type": "resource",
		"stackable": true,
		"max_stack": 99,
		"required_tool": "pickaxe"
	},
	"iron": {
		"id": "iron",
		"name": "Mena de Hierro",
		"type": "resource",
		"stackable": true,
		"max_stack": 99,
		"required_tool": "pickaxe",
		"smelt_result": "iron_ingot"
	},
	"coal": {
		"id": "coal",
		"name": "Carbón",
		"type": "resource",
		"stackable": true,
		"max_stack": 99,
		"required_tool": "pickaxe",
		"fuel_value": 10
	},
	"log": {
		"id": "log",
		"name": "Madera",
		"type": "resource",
		"stackable": true,
		"max_stack": 99,
		"required_tool": "axe",
		"fuel_value": 5
	},
	"iron_ingot": {
		"id": "iron_ingot",
		"name": "Lingote de Hierro",
		"type": "resource",
		"stackable": true,
		"max_stack": 99
	},
	"pickaxe": {
		"id": "pickaxe",
		"name": "Pico de Hierro",
		"type": "tool",
		"stackable": false,
		"max_durability": 50
	},
	"axe": {
		"id": "axe",
		"name": "Hacha de Hierro",
		"type": "tool",
		"stackable": false,
		"max_durability": 50
	}
}

func get_item(id: String) -> Dictionary:
	if ItemDB.has(id):
		return ItemDB[id]
	return {}
