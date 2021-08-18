import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _memoController = new TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('새로운 미리 알림')),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
                ;
              },
              child: Text('추가', style: TextStyle(color: Colors.blue)))
        ],
      ),
      body: _bodyBuild(),
    );
  }

  Widget _bodyBuild() {
    return SafeArea(
        child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _titleController,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return '제목을 입력하세요.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '제목',
                        ),
                      ),
                      TextFormField(
                        controller: _memoController,
                        decoration: InputDecoration(border: OutlineInputBorder(), hintText: '메모'),
                      )
                    ],
                  ),
                ))));
  }
}
