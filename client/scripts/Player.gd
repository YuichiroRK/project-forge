extends CharacterBody2D

const SPEED = 200.0

@onready var animation_player = $AnimationPlayer
@onready var interact_raycast = $InteractRayCast2D # Se asume que tendras un RayCast2D llamado asi apuntando hacia donde mira el jugador

func _physics_process(delta: float) -> void:
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
	if event.is_action_pressed("interact"):
		interact()

func interact():
	if interact_raycast and interact_raycast.is_colliding():
		var target = interact_raycast.get_collider()
		if target and target.has_method("on_interact"):
			target.on_interact(self)
