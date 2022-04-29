import 'package:flutter/material.dart';
import 'package:to_do/widgets/app_text.dart';
import 'package:to_do/widgets/task_generator.dart';
import '../models/task.dart';

class TaskListGenarate extends StatelessWidget {
  final List<Task> tasks;
  const TaskListGenarate(this.tasks, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Expanded(
      child: tasks.isEmpty
          ? Center(
              child: AppText(text: "No Tasks Found"),
            )
          : Center(
              child: Container(
                width: screenSize.width * .85,
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      child: TaskGenarator(
                        ts: tasks[i],
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
