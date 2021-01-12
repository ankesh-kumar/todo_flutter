import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sapient_todo/models/task_data.dart';
import 'package:sapient_todo/widgets/tasks_list.dart';
import 'package:sapient_todo/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> with TickerProviderStateMixin{
  bool isEntryTaskShow=false;

  String st_app_title='Pull to Create Item';

  AnimationController animationController;
  TextEditingController todoItemController=new TextEditingController();
  Animation animation;
  var todoItem;

  @override
  void initState(){
    animationController = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
    );
    //animation = Tween(begin: 1.0, end: 2.0).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: CustomScrollView(

          slivers:<Widget>[

            SliverAppBar(
              //title: Text('$st_app_title'),
              // Allows the user to reveal the app bar if they begin scrolling back
              // up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: todoItemController,
                  autofocus: true,
                  decoration: new InputDecoration(
                      hintText: 'enter new item',
                      suffixIcon: InkWell(
                          child: Icon(Icons.add, size: 20,color: Colors.black,),
                          onTap: () {

                            setState(() {
                              todoItemController.text="";
                            });
                            Provider.of<TaskData>(context).addTask(todoItem);

                          })),

                  textAlign: TextAlign.left,
                  onChanged: (newText) {
                    todoItem=newText;

                    //newTaskTitle = newText;
                  },
                ),
              ),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 40,
            ),

            TasksList(),
          ],
        ),
      ),


    );
  }


}
