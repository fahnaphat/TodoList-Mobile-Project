import 'package:flutter/material.dart';
import 'package:frontend_todolist_project/services/task_service.dart';
import 'package:frontend_todolist_project/utils/snackbar_helper.dart';

class CreateTaskPage extends StatefulWidget {
  final Map? todo;
  const CreateTaskPage({
    super.key,
    this.todo,
  });

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController decsController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      decsController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit ? "Edit Task" : "Create New Task",
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: decsController,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: isEdit ? updateData : submitData,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(isEdit ? "Update" : "Submit"),
              ))
        ],
      ),
    );
  }

  Future<void> updateData() async {
    final todo = widget.todo;
    if (todo == null) {
      print("You can't call update without todo data");
      return;
    }

    final id = todo['_id'];
    final isSuccess = await TaskService.updateTask(id, body);

    if (isSuccess) {
      showSuccessMessage(context, message: "Creation Success");
    } else {
      showErrorMessage(context, message: "Creation Failed");
    }
  }

  Future<void> submitData() async {
    // Submit data to the server
    final isSuccess = await TaskService.createTask(body);

    // show success or fail message based on status
    if (isSuccess) {
      titleController.text = '';
      decsController.text = '';
      showSuccessMessage(context, message: "Creation Success");
    } else {
      showErrorMessage(context, message: "Creation Failed");
    }
  }

  Map get body {
    // Get the data from form
    final title = titleController.text;
    final description = decsController.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false
    };
  }
}
