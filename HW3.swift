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
var todosArray = [Todo]()
var categoryArray = [Category]()
func main(){
	//TODO change it to one print
	let mainLog = """
	please enter a number
	1. add item
	2. view todo's list
	3. edit item
	4. delete item
	5. view sorted list
	6. create category
	7. add todos to category
	8. view category's todos
	"""
	print(mainLog)
	if let typed = readLine() {
		if let number = Int(typed) {
		print(" ")
		//TODO change it to switch case
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
	
}


func addItem(){
	
	let newTodo = Todo();
	
	print("please enter title:")
	let itemTitle = readLine()
	newTodo.title = itemTitle!
	print("enter content")
	let itemContent = readLine()
	newTodo.content = itemContent!
	print("enter priority")
	if let typed = readLine() {
		if let num = Int(typed) {
			newTodo.priority = num
		}
	}
	newTodo.id = todosArray.count 
	todosArray.append(newTodo)
	print("task added!")
	main()
}


func viewTodoList(todosArrayInput todosArrayInputA: [Todo]){
	for iTodo in todosArrayInputA{
		print( "id: \(iTodo.id) ,title: \(iTodo.title) ,content: \(iTodo.content) ,priority: \(iTodo.priority)")
	}
	main()
}


func editItem(){
	print("enter id of todo to edit")
	var idForEdit = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			idForEdit = num
		}
	}
	
	print("previous todo: id: \(todosArray[idForEdit].id) ,title: \(todosArray[idForEdit].title) ,content: \(todosArray[idForEdit].content) ,priority: \(todosArray[idForEdit].priority)")
	//TODO change it to one print call
	print("select an option to edit:")
	print("1 edit title")
	print("2 edit content")
	print("3 edit priority")
	var optionForEdit = 0

	if let typed = readLine() {
		if let num = Int(typed) {
			optionForEdit = num
		}
	}
	if(optionForEdit==1){
		print("input new title")
		let itemNewTitle = readLine()
		todosArray[idForEdit].title = itemNewTitle!
	}else if(optionForEdit==2){
		print("input new content")
		let itemNewContent = readLine()
		todosArray[idForEdit].content = itemNewContent!
	}else if(optionForEdit==3){
		print("input new priority")
		if let typed = readLine() {
			if let num = Int(typed) {
				todosArray[idForEdit].priority = num
			}
		}
	}
	print("edited")
	
	main()
}
func deleteItem(){
	print("enter id of todo to delete")
	var idForDelete = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			idForDelete = num
		}
	}
	todosArray.remove(at: idForDelete)
	
	main()
}
func sortItem(){
	print("select an option to sort:")
	print("1 sort by create time asc")
	print("2 sort by create time des")
	print("3 sort by title asc")
	print("4 sort by title des")
	print("5 sort by priority asc")
	print("6 sort by priority des")
	var optionForSort = 0

	if let typed = readLine() {
		if let num = Int(typed) {
			optionForSort = num
		}
	}
	//TODO change it to switch
	switch optionForEdit {
		
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
	}

	}


	main()
}
func titleAsc(_ s1: Todo, _ s2: Todo)->Bool{
	return s1.title<s2.title
}

func priorityAsc(_ s1: Todo, _ s2: Todo)->Bool{
	return s1.priority<s2.priority
}


func createCategory(){
	print("please enter name:")
	let itemTitle = readLine()
	var isRepeated = 0
	for catI in categoryArray{
		if(catI.name == (itemTitle!)){
			isRepeated = 1
		}
	}
	
	if(isRepeated == 0){
		let newCategory = Category();
		newCategory.name = itemTitle!
		newCategory.id = categoryArray.count 
		categoryArray.append(newCategory)
		print("category created!")
	}else{
		print("name is repeated!")
	}

	main()
}
func addItemToCategory(){
	print("enter category id")
	var catId = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			catId = num
		}
	}
	print("enter todo id")
	var todoId = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			todoId = num
		}
	}
	categoryArray[catId].members.append(todosArray[todoId])
	print("added!")
	
	
	main()
}
func viewCategoryTodos(){
	print("enter category id")
	var catIdA = 0
	if let typed = readLine() {
		if let num = Int(typed) {
			catIdA = num
		}
	}
	print(categoryArray[catIdA].name)
	for catItem in categoryArray[catIdA].members{
		print( "id: \(catItem.id) ,title: \(catItem.title) ,content: \(catItem.content) ,priority: \(catItem.priority)")
	}
	
	main()
}


//TODO add type to functions









print("Welcome!")
main()
