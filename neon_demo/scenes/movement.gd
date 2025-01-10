extends Node

var root: Node2D = null
var direction: Vector2i = Vector2i(0, 0)

@export var velocity: Vector2i = Vector2i(90, 90)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	root = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	direction = Vector2i(0, 0)

	if Input.is_action_pressed("ui_right"):
		direction.x = 1

	if Input.is_action_pressed("ui_left"):
		direction.x = -1

	if Input.is_action_pressed("ui_down"):
		direction.y = 1

	if Input.is_action_pressed("ui_up"):
		direction.y = -1

	root.position += direction * velocity * delta
