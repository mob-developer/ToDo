
// classes
class Todo {
	var id = 0;
	var title = "";
	var content = "";
	var priority = 0;
}

class Category {
	var id = 0;
	var name = "";
	var members = [Todo]()
}

//db
var todosArray = [Todo]()
var categoryArray = [Category]()

func main(){
	let mainMessage = """
	Please choose an option:
	1. add item.
	2. view task's list.
	3. edit item.
	4. delete item.
	5. view sorted list.
	6. create category.
	7. add task to category.
	8. view category's todos.
	"""
	print(mainMessage)
	if let typed = readLine() {
		if let number = Int(typed) {
		switch number {
			case 1:
				addItem()
			case 2:
				viewTodoList(todosArrayInput: todosArray)
			case 3:
				editItem()
			case 4:
				deleteItem()
			case 5:
				sortItem()
			case 6:
				createCategory()
			case 7:
				addItemToCategory()
			case 8:
				viewCategoryTodos()
			default:
				print("not valid!")
				main()
			}
		}
	}
}
	



func addItem(){
	let newTask = Todo();
	print("Please enter title:")
	let itemTitle = readLine()
	newTask.title = itemTitle!
	print("Enter description:")
	let itemContent = readLine()
	newTask.content = itemContent!
	print("Enter priority (0-10):")
	if let typed = readLine() {
		if let num = Int(typed) {
			newTask.priority = num
		}
	}
	newTask.id = todosArray.count 
	todosArray.append(newTask)
	print("Task successfully added!")
	main()
}


func viewTodoList(todosArrayInput todosArrayInputA: [Todo]){
	for iTodo in todosArrayInputA{
		let result = """
		---------------------------
		id: \(iTodo.id)
		title: \(iTodo.title)
		description: \(iTodo.content)
		priority: \(iTodo.priority)
		---------------------------
		"""
		print(result)
	}
	main()
}


func editItem(){
	print("Enter id of task to edit:")
	var id = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			id = num
		}
	}
	let editItemMessage = """
	select an option to edit:
	1. edit title.
	2. edit description.
	3. edit priority.
	"""
	let result = """
	-------------------------------------------
	previous task:
	id: \(id)
	title: \(todosArray[id].title)
	description: \(todosArray[id].content)
	priority: \(todosArray[id].priority)
	-------------------------------------------
	"""
	
	print(result)
	print(editItemMessage)
	var optionForEdit = 0

	if let typed = readLine() {
		if let num = Int(typed) {
			optionForEdit = num
		}
	}
	switch optionForEdit {
		case 1:
			print("Enter new title")
			let itemNewTitle = readLine()
			todosArray[id].title = itemNewTitle!
		case 2:
			print("Enter new description")
			let itemNewContent = readLine()
			todosArray[id].content = itemNewContent!
		case 3:
			print("Enter new priority")
			if let typed = readLine() {
				if let num = Int(typed) {
					todosArray[id].priority = num
				}
			}
		default:
			print("invalid number!")
	}
	print("Successfully edited!")
	main()
}
func deleteItem(){
	print("Enter id of task to delete")
	var id = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			id = num
		}
	}
	todosArray.remove(at: id)
	main()
}
func sortItem(){
	let sortMessage = """
		select an option to sort:
		1. Sort by creation time asc.
		2. Sort by creation time des.
		3. Sort by title asc.
		4. Sort by title des.
		5. Sort by priority asc.
		6. Sort by priority des.
	"""
	print(sortMessage)
	var optionForSort = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			optionForSort = num
		}
	}
		
	switch (optionForSort) {
		case 1:
			viewTodoList(todosArrayInput: todosArray)
		case 2:
			viewTodoList(todosArrayInput: todosArray.reversed())
		case 3:
			viewTodoList(todosArrayInput: todosArray.sorted(by: titleAsc))
		case 4:
			viewTodoList(todosArrayInput: todosArray.sorted(by: titleAsc).reversed())
		case 5:
			viewTodoList(todosArrayInput: todosArray.sorted(by: priorityAsc))
		case 6:
			viewTodoList(todosArrayInput: todosArray.sorted(by: priorityAsc).reversed())
		default:
			print("Not valid input!")

	}
	main()
}

func titleAsc(_ s1: Todo, _ s2: Todo)->Bool{
	return s1.title < s2.title
}

func priorityAsc(_ s1: Todo, _ s2: Todo)->Bool{
	return s1.priority < s2.priority
}


func createCategory(){
	print("Please enter name:")
	let itemTitle = readLine()
	var isRepeated = 0
	for catI in categoryArray{
		if(catI.name == (itemTitle!)){
			isRepeated = 1
		}
	}
	
	if isRepeated == 0 {
		let newCategory = Category();
		newCategory.name = itemTitle!
		newCategory.id = categoryArray.count 
		categoryArray.append(newCategory)
		print("Category successfully created!")
	} else {
		print("Name is repetitive!")
	}

	main()
}
func addItemToCategory(){
	print("Enter category id:")
	var catId = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			catId = num
		}
	}
	print("Enter task id:")
	var todoId = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			todoId = num
		}
	}
	categoryArray[catId].members.append(todosArray[todoId])
	print("Successfully added!")
	main()
}
func viewCategoryTodos(){
	print("Enter category id")
	var categoryId = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			categoryId = num
		}
	}
	print(categoryArray[categoryId].name)
	for catItem in categoryArray[categoryId].members{
		let result = """
		id: \(catItem.id)
		title: \(catItem.title)
		description: \(catItem.content)
		priority: \(catItem.priority)
		"""
		print(result)
	}
	main()
}


//TODO add type to functions

print("Welcome!")
main()
