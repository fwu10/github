extends Node2D
var current_instance: Node = null
@export var ingredient_type: String
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play(ingredient_type)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _spawn_ingredient() -> void:
	var ingredients = load("res://ingredients.tscn")
	current_instance = ingredients.instantiate()
	current_instance.dragging = true
	get_parent().call_deferred("add_child", current_instance)
	current_instance.ingredient_type = ingredient_type
	
func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not is_instance_valid(current_instance) or current_instance.is_in_group("on_sandwich"):
			_spawn_ingredient()
