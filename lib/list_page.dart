import 'package:flutter/material.dart';

class ToDo {
  bool isDone = false;
  String title;
  String description;

  ToDo(this.title, this.description);
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _items = <ToDo>[];

  final _titleController = new TextEditingController();
  final _descController = new TextEditingController();

  void _addTodo(ToDo todo) {
    setState(() {
      _items.add(todo);
      _titleController.text = '';
      _descController.text = ' ';
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
    _descController.dispose();
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
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(color: Colors.black45, borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          TextField(
                            controller: _titleController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: '제목',
                            ),
                          ),
                          TextField(
                            controller: _descController,
                            decoration: InputDecoration(
                              hintText: '메모',
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () => _addTodo(ToDo(_titleController.text, _descController.text)),
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: todo.isDone ? TextStyle(decoration: TextDecoration.lineThrough, fontStyle: FontStyle.italic, fontSize: 20.0, fontWeight: FontWeight.bold) : TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            todo.description,
            style: todo.isDone
                ? TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontStyle: FontStyle.italic,
                    fontSize: 12.0,
                  )
                : TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
