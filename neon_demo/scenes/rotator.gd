extends Node2D

var root: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	root = get_parent()
	print(root)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	root.rotate(delta)
