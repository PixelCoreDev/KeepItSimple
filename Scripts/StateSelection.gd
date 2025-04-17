extends TextureRect

@export var anim : AnimationPlayer
@export var toDo : ToDo
@export var selection1 : CustomButton
@export var selection2 : CustomButton
@export var selection3 : CustomButton

@export_category("Selection Textures")
@export var idle : Texture
@export var idleHover : Texture
@export var finished : Texture
@export var finishedHover : Texture
@export var working : Texture
@export var workingHover : Texture
@export var failed : Texture
@export var failedHover : Texture

var showing : bool = false

func _process(delta: float) -> void:
	if showing and (Input.is_action_just_released("LeftClick") or Input.is_action_just_released("RightClick")):
		hideSelection()

func showSelection():
	if toDo.state == ToDo.State.IDLE:
		selection1.texture = finished
		selection1.tNormal = finished
		selection1.tHover = finishedHover
		
		selection2.texture = working
		selection2.tNormal = working
		selection2.tHover = workingHover
		
		selection3.texture = failed
		selection3.tNormal = failed
		selection3.tHover = failedHover
	elif toDo.state == ToDo.State.FINISHED:
		selection1.texture = idle
		selection1.tNormal = idle
		selection1.tHover = idleHover
		
		selection2.texture = working
		selection2.tNormal = working
		selection2.tHover = workingHover
		
		selection3.texture = failed
		selection3.tNormal = failed
		selection3.tHover = failedHover
	elif toDo.state == ToDo.State.FAILED:
		selection1.texture = finished
		selection1.tNormal = finished
		selection1.tHover = finishedHover
		
		selection2.texture = working
		selection2.tNormal = working
		selection2.tHover = workingHover
		
		selection3.texture = idle
		selection3.tNormal = idle
		selection3.tHover = idleHover
	elif toDo.state == ToDo.State.WORKING:
		selection1.texture = finished
		selection1.tNormal = finished
		selection1.tHover = finishedHover
		
		selection2.texture = idle
		selection2.tNormal = idle
		selection2.tHover = idleHover
		
		selection3.texture = failed
		selection3.tNormal = failed
		selection3.tHover = failedHover
	
	showing = true
	anim.play("ShowSelection")

func hideSelection():
	showing = false
	anim.play("HideSelection")

func setState(selection : int):
	if toDo.state == ToDo.State.IDLE:
		if selection == 1:
			toDo.setState(ToDo.State.FINISHED) 
		elif selection == 2:
			toDo.setState(ToDo.State.WORKING)
		elif selection == 3:
			toDo.setState(ToDo.State.FAILED)
	elif toDo.state == ToDo.State.FINISHED:
		if selection == 1:
			toDo.setState(ToDo.State.IDLE) 
		elif selection == 2:
			toDo.setState(ToDo.State.WORKING)
		elif selection == 3:
			toDo.setState(ToDo.State.FAILED)
	elif toDo.state == ToDo.State.FAILED:
		if selection == 1:
			toDo.setState(ToDo.State.FINISHED) 
		elif selection == 2:
			toDo.setState(ToDo.State.WORKING)
		elif selection == 3:
			toDo.setState(ToDo.State.IDLE)
	elif toDo.state == ToDo.State.WORKING:
		if selection == 1:
			toDo.setState(ToDo.State.FINISHED) 
		elif selection == 2:
			toDo.setState(ToDo.State.IDLE)
		elif selection == 3:
			toDo.setState(ToDo.State.FAILED)
	hideSelection()
