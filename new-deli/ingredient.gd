extends Node2D
@export var ingredients_scene: PackedScene
var current_instance: Node = null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("spawning first time")
	_spawn_ingredient()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(current_instance):
		print("ingreidnet is on host")
	else:
		print("ingreidnet not on host")
		_spawn_ingredient() #THIS CONSTANTLY SPAWNS EVERYSECOND

func _spawn_ingredient() -> void:
	var ingredients = load("res://ingredients.tscn")
	var mov_ingredients = ingredients.instantiate()
	get_parent().add_child(mov_ingredients)
	mov_ingredients.global_position = $Area2D/CollisionShape2D.global_position
	

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not is_instance_valid(current_instance):
			_spawn_ingredient()
			
			
