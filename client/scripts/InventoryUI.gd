extends CanvasLayer

@onready var grid_container = $Panel/GridContainer
@export var inventory_node_path: NodePath

var inventory: Inventory

func _ready():
	hide()
	if inventory_node_path:
		inventory = get_node(inventory_node_path)
		
	# Crear el label de herramienta equipada dinámicamente si no existe
	if not has_node("EquippedLabel"):
		var equipped_label = Label.new()
		equipped_label.name = "EquippedLabel"
		equipped_label.text = "Mano vacía"
		equipped_label.set_anchors_preset(Control.PRESET_TOP_WIDE)
		equipped_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		equipped_label.position.y = 20
		add_child(equipped_label)

func _input(event):
	if event.is_action_pressed("toggle_inventory") or (event.is_action_pressed("ui_cancel") and visible):
		if event.is_action_pressed("ui_cancel"):
			visible = false
		else:
			visible = !visible
			
		if visible:
			update_ui()
		# Al presionar botones se roban el foco, esto lo limpia para que no te quedes atorado
		var focus_owner = get_viewport().gui_get_focus_owner()
		if focus_owner:
			focus_owner.release_focus()

func update_ui():
	if not inventory:
		return
		
	for child in grid_container.get_children():
		child.queue_free()
		
	var best_tool = "Mano vacía"
		
	for item in inventory.items:
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
				if data.type == "tool":
					best_tool = "En mano: " + data.name
			else:
				label.text = data.name + " x" + str(item.amount)
				
			hbox.add_child(icon)
			hbox.add_child(label)
			grid_container.add_child(hbox)
			
	if has_node("EquippedLabel"):
		get_node("EquippedLabel").text = best_tool

func _on_give_pickaxe_pressed():
	if inventory:
		inventory.add_item("pickaxe")
		update_ui()

func _on_give_axe_pressed():
	if inventory:
		inventory.add_item("axe")
		update_ui()
