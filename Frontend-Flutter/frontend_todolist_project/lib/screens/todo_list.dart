import 'package:flutter/material.dart';
import 'package:frontend_todolist_project/screens/create_page.dart';
import 'package:frontend_todolist_project/services/task_service.dart';
import 'package:frontend_todolist_project/utils/snackbar_helper.dart';
import 'package:frontend_todolist_project/widget/task_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList App"),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: fetchTask,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                "No Task",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                return TaskCard(
                  index: index, 
                  item: item, 
                  navigateEdit: navigateToEditPage, 
                  deleteById: deleteById
                );
            }),
          ),
        ),
        child: Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToCreatePage, 
        label: Text("Create New")),
    );
  }

  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => CreateTaskPage(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTask();
  }

  Future<void> navigateToCreatePage() async {
    final route = MaterialPageRoute(
      builder: (context) => CreateTaskPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTask();
  }

  Future<void> deleteById(int id) async {
    final isSuccess = await TaskService.deleteById(id);
    if (isSuccess) {
      // Remove item form the list
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      // show error
      showErrorMessage(context, message: "Deletion Failed");

    }

  }

  Future<void> fetchTask() async {
    final response = await TaskService.fetchTodo();

    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showErrorMessage(context, message: "Something went wrong!");
    }

    setState(() {
      isLoading = false;
    });
  }

}
