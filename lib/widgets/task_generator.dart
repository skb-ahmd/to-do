import 'package:flutter/material.dart';
import 'package:to_do/misc/colors.dart';
import 'package:to_do/widgets/app_large_text.dart';
import 'package:to_do/widgets/app_text.dart';
import '../models/task.dart';

class TaskGenarator extends StatelessWidget {
  final Task ts;
  const TaskGenarator({Key? key, required this.ts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          width: 10,
        ),
        title: Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: AppLargeText(
            text: ts.title,
            color: AppColor.dark,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(
            bottom: 10,
          ),
          child: AppText(
            text: ts.description,
            color: AppColor.normal,
          ),
        ),
        
      ),
    );
  }
}
