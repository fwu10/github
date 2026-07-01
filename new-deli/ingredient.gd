extends Node2D
var current_instance: Node = null
@export var ingredient_type: String
@export var ingredient_icon: Texture2D 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _spawn_ingredient() -> void:
	var ingredients = load("res://ingredients.tscn")
	current_instance = ingredients.instantiate()
	current_instance.dragging = true
	get_parent().call_deferred("add_child", current_instance)
	
	

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not is_instance_valid(current_instance):
			_spawn_ingredient()
			
func _on_ingredient_placed() -> void:
	match ingredient_type:
		"tomato":
			print("tomato sucessfully placed on the sandwich")
#when switching script to main node of host it breaks the code
