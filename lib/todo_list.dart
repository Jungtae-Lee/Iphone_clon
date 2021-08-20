import 'package:flutter/material.dart';

class TagPage extends StatefulWidget {
  @override
  _TagPageState createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.pending))
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Text(
          '미리 알림',
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
        ),
      ],
    )));
  }
}
