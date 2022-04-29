import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/helpers/toasts.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/misc/colors.dart';
import 'package:to_do/widgets/app_text.dart';
import '../models/task.dart';

class MyForm extends StatefulWidget {
  final Function addTx;
  const MyForm(this.addTx, {Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController titleCnt = TextEditingController();
  TextEditingController descCnt = TextEditingController();
  String selectedDate = '';
  DateTime dtselectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    List<Task> tasks;
    return Container(
      decoration: BoxDecoration(
          color: AppColor.normal.withOpacity(.1),
          borderRadius: BorderRadius.circular(30)),
      height: screenSize.height * .5,
      // width: screenSize.size.width * 0.9,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleCnt,
            decoration: const InputDecoration(
                hintText: "Type your Task Title here",
                labelText: "Task Title",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: descCnt,
            decoration: const InputDecoration(
                hintText: "Type your Task Description here",
                labelText: "Task Description",
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          // children: [
          selectedDate.isEmpty
              ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    side: BorderSide(width: 2, color: AppColor.orange),
                  ),
                  onPressed: () {
                    calender(context);
                  },
                  child: Text('Select a date'),
                )
              : Center(
                  child: AppText(text: selectedDate),
                ),
          // Spacer(),
          // DropdownButton(items: tasks, onChanged: onChanged)
          //   ],
          // ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: save,
            child: const Text('Add TASK'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(30)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void calender(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: dtselectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value != null) {
        setState(() {
          dtselectedDate = value;
          selectedDate = DateFormat('d-M-y').format(value);
        });
      }
    });
  }

  void save() {
    if (titleCnt.text == "") {
      Toastsaa.showError("Enter Title");
      return;
    }
    if (descCnt.text == "") {
      Toastsaa.showError("Enter Description");

      return;
    }
    if (selectedDate == "") {
      Toastsaa.showError("Select Date");

      return;
    }
    Toastsaa.showInfo("New Task added");
    widget.addTx(titleCnt.text, descCnt.text, dtselectedDate);
    Navigator.pop(context);
  }
}
