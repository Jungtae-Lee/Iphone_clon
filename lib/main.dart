import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/todo_bloc.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoBloc(),
      child: MaterialApp(
        title: 'Iphone Clon',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
