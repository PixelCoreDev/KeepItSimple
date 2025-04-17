extends TextureRect
class_name CustomButton

var hover : bool = false

@export var tNormal : Texture
@export var tHover : Texture

signal pressed
signal released

func _ready() -> void:
	mouse_entered.connect(onHover)
	mouse_exited.connect(onHoverEnd)

func onHover():
	texture = tHover
	hover = true

func onHoverEnd():
	texture = tNormal
	hover = false

func _process(delta: float) -> void:
	if hover:
		if Input.is_action_just_pressed("LeftClick") or Input.is_action_just_pressed("RightClick"):
			pressed.emit()
		elif Input.is_action_just_released("LeftClick") or Input.is_action_just_released("RightClick"):
			released.emit()
