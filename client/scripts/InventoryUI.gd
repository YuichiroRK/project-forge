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
			label.text = data.name + " x" + str(item.amount)
			grid_container.add_child(label)
