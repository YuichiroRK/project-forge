extends Node
class_name Inventory

var items: Array = []

func _ready():
	load_inventory()

func add_item(id: String, amount: int = 1) -> bool:
	var item_data = Globals.get_item(id)
	if item_data.is_empty():
		return false
		
	if item_data.has("stackable") and not item_data.stackable:
		for i in range(amount):
			var new_tool = {"id": id, "amount": 1}
			if item_data.has("max_durability"):
				new_tool["durability"] = item_data.max_durability
			items.append(new_tool)
		save_inventory()
		return true
		
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

func remove_item(id: String, amount: int = 1) -> bool:
	var total_found = 0
	for item in items:
		if item.id == id:
			total_found += item.amount
	if total_found < amount:
		return false
		
	var amount_to_remove = amount
	for i in range(items.size() - 1, -1, -1):
		if items[i].id == id:
			if items[i].amount <= amount_to_remove:
				amount_to_remove -= items[i].amount
				items.remove_at(i)
			else:
				items[i].amount -= amount_to_remove
				amount_to_remove = 0
			if amount_to_remove <= 0:
				break
	save_inventory()
	return true

func get_tool_for(required_tool_id: String) -> int:
	for i in range(items.size()):
		if items[i].id == required_tool_id:
			return i
	return -1

func use_tool(index: int) -> bool:
	if index < 0 or index >= items.size(): return false
	var tool_item = items[index]
	if tool_item.has("durability"):
		tool_item.durability -= 1
		if tool_item.durability <= 0:
			items.remove_at(index)
		save_inventory()
		return true
	return false

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
