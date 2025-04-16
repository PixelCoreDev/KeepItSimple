extends HBoxContainer
class_name ToDo

enum State {IDLE, FINISHED, FAILED, WORKING}
var todoList : TodoList
var index : int
var state : State
var text : String

@export var textLabel : Label
@export var stateIcon : TextureRect


func setup(_text : String, _state : State, _todoList : TodoList, _index : int):
	text = _text
	state = _state
	textLabel.text = _text
	todoList = _todoList
	index = _index

func delete():
	todoList.delete(index)
	queue_free()

func setIndex(_index : int):
	index = _index
