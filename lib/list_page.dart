import 'package:flutter/material.dart';

class ToDo {
  bool isDone = false;
  String title;

  ToDo(this.title);
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _items = <ToDo>[];

  var _titleController = new TextEditingController();

  void _addTodo(ToDo todo) {
    setState(() {
      _items.add(todo);
      _titleController.text = '';
    });
  }

  void _deleteTodo(ToDo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleTodo(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '미리 알림',
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                    ),
                  ),
                  TextButton(
                      onPressed: () => _addTodo(ToDo(_titleController.text)),
                      child: Text(
                        '추가하기',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              Expanded(
                child: ListView(
                  children: _items.map((todo) => _buildItemWidget(todo)).toList(),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildItemWidget(ToDo todo) {
    return ListTile(
      onTap: () => _toggleTodo(todo),
      trailing: IconButton(
        onPressed: () => _deleteTodo(todo),
        icon: Icon(Icons.delete),
      ),
      title: Text(
        todo.title,
        style: todo.isDone
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                fontStyle: FontStyle.italic,
              )
            : null,
      ),
    );
  }
}
