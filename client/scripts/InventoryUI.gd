extends CanvasLayer

@onready var grid_container = $Panel/GridContainer
@export var inventory_node_path: NodePath

var inventory: Inventory

func _ready():
	hide()
	if inventory_node_path:
		inventory = get_node(inventory_node_path)

func _unhandled_input(event):
	if event.is_action_pressed("toggle_inventory"):
		visible = !visible
		if visible:
			update_ui()

func update_ui():
	if not inventory:
		return
		
	for child in grid_container.get_children():
		child.queue_free()
		
	for item in inventory.items:
		var label = Label.new()
		var data = Globals.get_item(item.id)
		if data:
			var hbox = HBoxContainer.new()
			
			var icon = TextureRect.new()
			var tex_path = "res://assets/" + item.id + ".png"
			if ResourceLoader.exists(tex_path):
				icon.texture = load(tex_path)
			icon.custom_minimum_size = Vector2(32, 32)
			icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			
			var label = Label.new()
			if item.has("durability"):
				label.text = data.name + " (" + str(item.durability) + "/" + str(data.max_durability) + ")"
			else:
				label.text = data.name + " x" + str(item.amount)
				
			hbox.add_child(icon)
			hbox.add_child(label)
			grid_container.add_child(hbox)

func _on_give_pickaxe_pressed():
	if inventory:
		inventory.add_item("pickaxe")
		update_ui()

func _on_give_axe_pressed():
	if inventory:
		inventory.add_item("axe")
		update_ui()
