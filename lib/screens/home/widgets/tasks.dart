import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../modals/task.dart';

class Tasks extends StatelessWidget {
  final tasksList = Task.generateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: tasksList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => tasksList[index].isLast
              ? _buildAddTask()
              : _buildTask(context, tasksList[index])),
    );
  }

  Widget _buildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(20),
      dashPattern: [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: Center(
        child: Text(
          '+ Add',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTask(BuildContext context, Task tasksList) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: tasksList.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            tasksList.iconData,
            color: tasksList.iconColor,
            size: 35,
          ),
          SizedBox(height: 30),
          Text(
            tasksList.title!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              _buildTaskStatus(tasksList.btnColor!, tasksList.iconColor!,
                  '${tasksList.left} left'),
              SizedBox(width: 15),
              _buildTaskStatus(
                  Colors.white, tasksList.iconColor!, '${tasksList.done} done'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskStatus(Color bgColor, Color txColor, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Text(
        text,
        style: TextStyle(color: txColor),
      ),
    );
  }
}
