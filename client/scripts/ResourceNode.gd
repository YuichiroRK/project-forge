extends StaticBody2D

@export var resource_id: String = "stone"
@export var amount_to_give: int = 1
@export var gather_time: float = 1.0

@onready var progress_bar = $ProgressBar

var is_gathering = false
var gather_timer = 0.0
var interactor = null

func _ready():
	if progress_bar:
		progress_bar.hide()
		progress_bar.max_value = gather_time

func _process(delta):
	if is_gathering:
		gather_timer += delta
		if progress_bar:
			progress_bar.value = gather_timer
			
		if gather_timer >= gather_time:
			finish_gathering()

func on_interact(player):
	if is_gathering:
		return
		
	var item_data = Globals.get_item(resource_id)
	if item_data.has("required_tool"):
		var req_tool = item_data.required_tool
		if player.has_node("Inventory"):
			var inv = player.get_node("Inventory")
			var tool_idx = inv.get_tool_for(req_tool)
			if tool_idx == -1:
				print("Necesitas: " + req_tool)
				return
				
	is_gathering = true
	interactor = player
	if progress_bar:
		progress_bar.show()

func finish_gathering():
	is_gathering = false
	if interactor and interactor.has_node("Inventory"):
		var inv = interactor.get_node("Inventory")
		
		var item_data = Globals.get_item(resource_id)
		if item_data.has("required_tool"):
			var req_tool = item_data.required_tool
			var tool_idx = inv.get_tool_for(req_tool)
			if tool_idx != -1:
				inv.use_tool(tool_idx)
				
		inv.add_item(resource_id, amount_to_give)
	queue_free()
