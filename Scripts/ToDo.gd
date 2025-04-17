extends HBoxContainer
class_name ToDo

enum State {IDLE, FINISHED, FAILED, WORKING}
var todoList : TodoList
var index : int
var state : State
var text : String

@export var textLabel : Label
@export var stateIcon : CustomButton

@export_category("Icon Textures")
@export var idle : Texture
@export var idleHover : Texture
@export var finished : Texture
@export var finishedHover : Texture
@export var working : Texture
@export var workingHover : Texture
@export var failed : Texture
@export var failedHover : Texture

func setup(_text : String, _state : State, _todoList : TodoList, _index : int):
	text = _text
	textLabel.text = _text
	todoList = _todoList
	index = _index
	setState(_state)

func delete():
	todoList.delete(index)
	queue_free()

func setIndex(_index : int):
	index = _index

func setState(_state : State):
	state = _state
	
	if state == State.IDLE:
		stateIcon.texture = idle
		stateIcon.tNormal = idle
		stateIcon.tHover = idleHover
	elif state == State.FINISHED:
		stateIcon.texture = finished
		stateIcon.tNormal = finished
		stateIcon.tHover = finishedHover
	elif state == State.FAILED:
		stateIcon.texture = failed
		stateIcon.tNormal = failed
		stateIcon.tHover = failedHover
	elif state == State.WORKING:
		stateIcon.texture = working
		stateIcon.tNormal = working
		stateIcon.tHover = workingHover
	
	todoList.saveData()
