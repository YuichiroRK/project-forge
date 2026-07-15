extends Node
class_name Inventory

var items: Array = []

func _ready():
	load_inventory()

func add_item(id: String, amount: int = 1) -> bool:
	var item_data = Globals.get_item(id)
	if item_data.is_empty():
		return false
		
	if item_data.stackable:
		for item in items:
			if item.id == id and item.amount < item_data.max_stack:
				var space = item_data.max_stack - item.amount
				if amount <= space:
					item.amount += amount
					save_inventory()
					return true
				else:
					item.amount += space
					amount -= space
	
	items.append({"id": id, "amount": amount})
	save_inventory()
	return true

func save_inventory():
	var file = FileAccess.open(Globals.SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(items))

func load_inventory():
	if FileAccess.file_exists(Globals.SAVE_PATH):
		var file = FileAccess.open(Globals.SAVE_PATH, FileAccess.READ)
		var text = file.get_as_text()
		var parse_result = JSON.parse_string(text)
		if parse_result != null and parse_result is Array:
			items = parse_result
