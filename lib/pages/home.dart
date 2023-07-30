import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userTodo = '';
  List _todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _todoList.addAll(['Buy Milk', 'Wash Dishes', 'Buy Potatoes']);
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Todo list'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(_todoList[index]),
            onDismissed: (direction) {
              _removeTodoItem(index);
            },
            child: Card(
              child: ListTile(
                title: Text(_todoList[index]),
                trailing: IconButton(
                  onPressed: () {
                    _removeTodoItem(index);
                  },
                  icon: const Icon(
                    Icons.delete_sweep,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Add element'),
              content: TextField(
                onChanged: (String value) {
                  setState(() {
                    _userTodo = value;
                  });
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _todoList.add(_userTodo);
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Add')
                )
              ],
            );
          });
        },
        child: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
