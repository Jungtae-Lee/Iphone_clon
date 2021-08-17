import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(hintText: '검색', prefixIcon: Icon(Icons.search), border: InputBorder.none),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                TextButton.icon(onPressed: () {}, icon: Icon(Icons.add), label: Text('새로운 미리 알림')),
                Spacer(),
                TextButton(onPressed: () {}, child: Text('목록 추가')),
              ]))),
    );
  }
}
