import 'package:flutter/material.dart';

import '../../../modals/task.dart';

class Tasks extends StatelessWidget {
  final tasksList = Task.generateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
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
    return Text('Add Task');
  }

  Widget _buildTask(BuildContext context, Task tasksList) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: tasksList.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
