extends CanvasLayer

@onready var panel = $Panel
@onready var input_label = $Panel/VBoxContainer/InputLabel
@onready var fuel_label = $Panel/VBoxContainer/FuelLabel
@onready var output_label = $Panel/VBoxContainer/OutputLabel
@onready var progress_bar = $Panel/VBoxContainer/ProgressBar

var current_furnace = null
var player_inventory = null

func _ready():
	panel.hide()

func _process(_delta):
	if panel.visible and current_furnace:
		update_ui()

func open_furnace(furnace):
	current_furnace = furnace
	player_inventory = current_furnace.interactor.get_node("Inventory")
	panel.show()
	update_ui()

func close_furnace():
	panel.hide()
	current_furnace = null

func update_ui():
	if current_furnace.input_slot.is_empty():
		input_label.text = "Input: Vacío"
	else:
		input_label.text = "Input: " + current_furnace.input_slot.id + " x" + str(current_furnace.input_slot.amount)
		
	if current_furnace.fuel_slot.is_empty():
		fuel_label.text = "Fuel: Vacío"
	else:
		fuel_label.text = "Fuel: " + current_furnace.fuel_slot.id + " x" + str(current_furnace.fuel_slot.amount)
		
	if current_furnace.output_slot.is_empty():
		output_label.text = "Output: Vacío"
	else:
		output_label.text = "Output: " + current_furnace.output_slot.id + " x" + str(current_furnace.output_slot.amount)
		
	progress_bar.max_value = current_furnace.SMELT_TIME
	progress_bar.value = current_furnace.smelt_progress

func _input(event):
	if event.is_action_pressed("ui_cancel") and panel.visible: # Escape para cerrar
		close_furnace()

# Botones que el usuario conectará en Godot a través de señales pressed()

func _on_add_ore_pressed():
	if not current_furnace or not player_inventory: return
	# Buscar un mineral fundible en el inventario del jugador
	for item in player_inventory.items:
		var item_data = Globals.get_item(item.id)
		if item_data.has("smelt_result"):
			# Transferir 1
			if player_inventory.remove_item(item.id, 1):
				if current_furnace.input_slot.is_empty():
					current_furnace.input_slot = {"id": item.id, "amount": 1}
				elif current_furnace.input_slot.id == item.id:
					current_furnace.input_slot.amount += 1
			break

func _on_add_fuel_pressed():
	if not current_furnace or not player_inventory: return
	for item in player_inventory.items:
		var item_data = Globals.get_item(item.id)
		if item_data.has("fuel_value"):
			if player_inventory.remove_item(item.id, 1):
				if current_furnace.fuel_slot.is_empty():
					current_furnace.fuel_slot = {"id": item.id, "amount": 1}
				elif current_furnace.fuel_slot.id == item.id:
					current_furnace.fuel_slot.amount += 1
			break

func _on_take_output_pressed():
	if not current_furnace or not player_inventory: return
	if not current_furnace.output_slot.is_empty() and current_furnace.output_slot.amount > 0:
		if player_inventory.add_item(current_furnace.output_slot.id, current_furnace.output_slot.amount):
			current_furnace.output_slot = {}

func _on_close_button_pressed():
	close_furnace()
