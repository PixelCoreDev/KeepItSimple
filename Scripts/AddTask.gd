extends HBoxContainer
class_name AddTask

@export var anim : AnimationPlayer
@export var textEdit : TextEdit
@export var error : Label
@export var characters : Label
@export var todoList : TodoList

var adding : bool = false;
var inputValid : bool = false;
var text : String = "";

func addTask():
	if !adding:
		adding = true
		anim.play("AddTask")

func textEdited():
	text = textEdit.text
	characters.text = str(text.length())
	if text.length() <= 18 and text != "":
		inputValid = true
	else:
		inputValid = false
	error.visible = !inputValid

func taskAdded():
	if inputValid:
		anim.play("TaskAdded")
		todoList.addTask(text, ToDo.State.IDLE)
		reset()

func reset():
	error.visible = false
	textEdit.clear()
	adding = false
	inputValid = false
	characters.text = "0"
