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
	print(" ")
	print("please enter a number");
	print("1 add item")
	print("2 view todo's list")
	print("3 edit item")
	print("4 delete item")
	print("5 view sorted list")
	print("6 create category")
	print("7 add todos to category")
	print("8 view category's todos")
	if let typed = readLine() {
		if let number = Int(typed) {
		print(" ")
			if(number==1){
				addItem()
			}else if(number==2){
				viewTodoList(todosArrayInput: todosArray)
			}else if(number==3){
				editItem()
			}else if(number==4){
				deleteItem()
			}else if(number==5){
				sortItem()
			}else if(number==6){
				createCategory()
			}else if(number==7){
				addItemToCategory()
			}else if(number==8){
				viewCategoryTodos()
			}else{
				print("not valid!")
				main()
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
	print("previous todo : id: \(todosArray[idForEdit].id) ,title: \(todosArray[idForEdit].title) ,content: \(todosArray[idForEdit].content) ,priority: \(todosArray[idForEdit].priority)")
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
	if(optionForSort==1){
		viewTodoList(todosArrayInput: todosArray)
	}else if(optionForSort==2){
		viewTodoList(todosArrayInput: todosArray.reversed())
	}else if(optionForSort==3){
		viewTodoList(todosArrayInput: todosArray.sorted(by: titleAsc))
	}else if(optionForSort==4){
		viewTodoList(todosArrayInput: todosArray.sorted(by: titleAsc).reversed())
	}else if(optionForSort==5){
		viewTodoList(todosArrayInput: todosArray.sorted(by: priorityAsc))
	}else if(optionForSort==6){
		viewTodoList(todosArrayInput: todosArray.sorted(by: priorityAsc).reversed())
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












print("Hello!")
main()
//print("I love Swift.")
//print("Please Enter your favorite programming language", terminator: ".")
//let name = readLine()
//print("Your favorite programming language is \(name!).")
