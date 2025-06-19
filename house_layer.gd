extends TileMapLayer

@export var defualt := false

func _ready() -> void:
	set_active(defualt)

func set_active(boolean:bool) -> void:
	enabled = boolean
	
	for child: TileMapLayer in get_children():
		child.enabled = boolean
