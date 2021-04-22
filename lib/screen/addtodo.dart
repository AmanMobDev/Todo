import 'package:flutter/material.dart';
import 'package:todos/database/database_helper.dart';

class AddToDo extends StatefulWidget {
  AddToDo({Key key}) : super(key: key);

  @override
  _AddToDoState createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final databasehelper = DataBaseHelper.instance;
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.0),
              title(),
              SizedBox(height: 30.0),
              description(),
              SizedBox(height: 30.0),
              addButton(),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: _title,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "Enter title",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: _description,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: "Enter description",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget addButton() {
    return InkWell(
      onTap: () {
        _insert();
      },
      child: Container(
        width: MediaQuery.maybeOf(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        alignment: Alignment.center,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "Add",
            style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _insert() async {
    Map<String, dynamic> row = {
      DataBaseHelper.title: _title.text.toString(),
      DataBaseHelper.description: _description.text.toString(),
    };

    final result = await databasehelper.insert(row);
    if (result != null) {
      print(row);
      _title.clear();
      _description.clear();
      final snackBar = SnackBar(
        content: Text("Add Todo"),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print("DATA INSERT : $result");
    }
  }
}
