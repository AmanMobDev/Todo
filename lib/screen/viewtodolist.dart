import 'package:flutter/material.dart';
import 'package:todos/database/database_helper.dart';

class ToDoList extends StatefulWidget {
  ToDoList({Key key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final databasehelper = DataBaseHelper.instance;
  Map<String, dynamic> todolist;

  @override
  void initState() {
    _query();
    super.initState();
  }

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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 10.0,
              ),
            ),
            listtodo(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget listtodo() {
    return Expanded(
      child: SizedBox(
        height: 100.0,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Text(todolist[index].toString());
          },
        ),
      ),
    );
  }

  void _query() async {
    final allRows = await databasehelper.queryAllRows();
    setState(() {
      todolist = allRows;
    });
  }
}
