extends Control
class_name TodoList

@export var parent : Control
@export var toDoScene : PackedScene

var tasks : Array[ToDo]
var save_path := "user://Data/taskData.tres"

func _ready() -> void:
	loadData()

func delete(index : int):
	tasks.remove_at(index)
	
	for i in range(tasks.size()):
		tasks[i].setIndex(i)
	
	saveData()

func addTask(text : String, state : ToDo.State):
	var task : ToDo = toDoScene.instantiate()
	task.setup(text, state, self, tasks.size())
	tasks.append(task)
	parent.add_child(task)
	
	saveData()

func saveData():
	var taskData : TaskData = TaskData.new()
	
	for task in tasks:
		taskData.text.append(task.text)
		taskData.state.append(task.state)
	
	ResourceSaver.save(taskData, OS.get_data_dir() + "/ToDoData.tres")

func loadData():
	var taskData : TaskData = ResourceLoader.load(OS.get_data_dir() + "/ToDoData.tres")
	if taskData:
		for i in range(taskData.text.size()):
			addTask(taskData.text[i], taskData.state[i])
