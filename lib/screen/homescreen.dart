import 'package:flutter/material.dart';
import 'package:todos/screen/addtodo.dart';
import 'package:todos/screen/viewtodolist.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.0),
            addTodoCard(),
            SizedBox(height: 20.0),
            viewTodoCard(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget addTodoCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddToDo(),
          ),
        );
      },
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add Todo',
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textScaleFactor: 1.2,
            ),
          ),
        ),
      ),
    );
  }

  Widget viewTodoCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ToDoList(),
          ),
        );
      },
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'View Todo',
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
              textScaleFactor: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
