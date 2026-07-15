extends StaticBody2D
class_name Furnace

var input_slot: Dictionary = {}
var fuel_slot: Dictionary = {}
var output_slot: Dictionary = {}

var is_smelting: bool = false
var current_fuel_time: float = 0.0
var max_fuel_time: float = 0.0
var smelt_progress: float = 0.0
const SMELT_TIME: float = 3.0

var interactor = null

func _process(delta):
	var can_smelt = check_can_smelt()
	
	if can_smelt and current_fuel_time <= 0 and not fuel_slot.is_empty() and fuel_slot.amount > 0:
		consume_fuel()
		
	if current_fuel_time > 0:
		current_fuel_time -= delta
		if can_smelt:
			is_smelting = true
			smelt_progress += delta
			if smelt_progress >= SMELT_TIME:
				finish_smelting()
		else:
			is_smelting = false
			smelt_progress = 0.0
	else:
		is_smelting = false
		smelt_progress = 0.0

func check_can_smelt() -> bool:
	if input_slot.is_empty() or input_slot.amount <= 0:
		return false
	var item_data = Globals.get_item(input_slot.id)
	if not item_data.has("smelt_result"):
		return false
	var result_id = item_data.smelt_result
	if not output_slot.is_empty() and output_slot.amount > 0:
		if output_slot.id != result_id:
			return false
		var result_data = Globals.get_item(result_id)
		if output_slot.amount >= result_data.max_stack:
			return false
	return true

func consume_fuel():
	var fuel_data = Globals.get_item(fuel_slot.id)
	if fuel_data.has("fuel_value"):
		max_fuel_time = fuel_data.fuel_value
		current_fuel_time = max_fuel_time
		fuel_slot.amount -= 1
		if fuel_slot.amount <= 0:
			fuel_slot = {}

func finish_smelting():
	smelt_progress = 0.0
	var item_data = Globals.get_item(input_slot.id)
	var result_id = item_data.smelt_result
	
	input_slot.amount -= 1
	if input_slot.amount <= 0:
		input_slot = {}
		
	if output_slot.is_empty() or output_slot.amount <= 0:
		output_slot = {"id": result_id, "amount": 1}
	else:
		output_slot.amount += 1

func on_interact(player):
	interactor = player
	var furnace_ui = player.get_node_or_null("FurnaceUI")
	if furnace_ui:
		furnace_ui.open_furnace(self)
