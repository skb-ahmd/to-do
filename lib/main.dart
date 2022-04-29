import 'package:flutter/material.dart';
import 'package:to_do/misc/colors.dart';
import 'package:to_do/widgets/form.dart';
import 'package:to_do/widgets/task_generator.dart';
import 'package:to_do/widgets/task_list_genarate.dart';

import 'models/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: AppColor.dark),
      // home: const Scaffold(body: TaskGenarator()),
      home: const Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> tasks = [];

  void showNewTaskForm(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return MyForm(addTask);
      },
    );
  }

  void addTask(
    String title,
    String description,
    DateTime date,
  ) {
    print(title);
    print(description);
    print(date);
    setState(() {
      tasks.add(Task(
        title: title,
        description: description,
        date: date,
      ));
    });
    // List<Task> hello = tasks;
    // print(tasks[0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TaskListGenarate(tasks),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNewTaskForm(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
