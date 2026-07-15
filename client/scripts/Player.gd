extends CharacterBody2D

const SPEED = 200.0

@onready var animation_player = $AnimationPlayer
@onready var interact_raycast = $InteractRayCast2D # Se asume que tendras un RayCast2D llamado asi apuntando hacia donde mira el jugador

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	
	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * SPEED
		if animation_player:
			animation_player.play("Walk")
		# Rotar el raycast hacia la direccion del movimiento
		if interact_raycast:
			interact_raycast.target_position = direction * 50
	else:
		velocity = Vector2.ZERO
		if animation_player:
			animation_player.play("Idle")
			
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") or (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed):
		interact()

func interact():
	var space_state = get_world_2d().direct_space_state
	var shape = CircleShape2D.new()
	shape.radius = 60.0 # Radio de interaccion amplio para que no importe el angulo
	
	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = shape
	query.transform = global_transform
	# Excluir al propio jugador para que no colisione consigo mismo
	query.exclude = [self.get_rid()]
	
	var result = space_state.intersect_shape(query)
	var closest_target = null
	var min_dist = 9999.0
	
	for hit in result:
		var collider = hit.collider
		if collider and collider.has_method("on_interact"):
			var dist = global_position.distance_to(collider.global_position)
			if dist < min_dist:
				min_dist = dist
				closest_target = collider
				
	if closest_target:
		closest_target.on_interact(self)
