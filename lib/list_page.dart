import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/todo_bloc.dart';
import 'package:flutter_application_1/item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listpage extends StatefulWidget {
  const Listpage({Key? key}) : super(key: key);

  @override
  _ListpageState createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '미리 알림',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.pending))
        ],
      ),
      body: BlocBuilder<TodoBloc, List<Item>>(
        bloc: _todoBloc,
        builder: (BuildContext context, List state) {
          return Center(
            child: ListView(
              children: _itemList.map((item) => _buildItem(item, state, _todoBloc)).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItem(Item item, List state, TodoBloc bloc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle: Text(item.memo),
        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.check)),
      ),
    );
  }
}
