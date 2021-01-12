import 'package:flutter/material.dart';
import 'package:sapient_todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:sapient_todo/models/task_data.dart';

import '../screens/add_task_screen.dart';

class TasksList extends StatefulWidget {

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  ColorTween color = ColorTween(begin: Colors.red, end: Colors.orangeAccent);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return SliverList(
            delegate: SliverChildBuilderDelegate( (context, index) {

            final task = taskData.tasks[index];
            return Dismissible(
              background: slideRightBackground(),
              secondaryBackground: slideLeftBackground(),
              key: Key(task.name),
              confirmDismiss: (direction) {
                if(direction==DismissDirection.endToStart) {
                  setState(() {
                    taskData.deleteTask(task);
                  });
                }
                else if(direction==DismissDirection.startToEnd) {
                  setState(() {
                    taskData.updateTask(task);
                  });
                }
              },
              child: Container(
                color: color.lerp(index/(taskData.taskCount-1)),
                child: TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                ),
              ),
            );
          },
          childCount: taskData.taskCount,
        ),
        );
      },
    );
  }

  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.check,
              color: Colors.white,
            ),

          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
