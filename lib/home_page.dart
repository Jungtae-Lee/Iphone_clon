import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: '검색', prefixIcon: Icon(Icons.search), border: InputBorder.none),
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
                    },
                    icon: Icon(Icons.add),
                    label: Text('새로운 미리 알림')),
                Spacer(),
                TextButton(onPressed: () {}, child: Text('목록 추가')),
              ]))),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8.0)),
              Row(
                children: <Widget>[
                  _todayWidget(),
                  _nextWidget()
                ],
              ),
              Row(
                children: <Widget>[
                  _totalWidget(),
                  _flagWidget()
                ],
              ),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  '나의 목록',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                ),
              ),
              _listsWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _todayWidget() {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
                width: 230,
                height: 100,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                      child: Icon(
                        Icons.today,
                        size: 25.0,
                      )),
                )),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '오늘',
                  style: TextStyle(fontSize: 17.0, color: Colors.white54),
                ),
              ),
            ),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _nextWidget() {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
                width: 230,
                height: 100,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      child: Icon(
                        Icons.date_range,
                        size: 25.0,
                      )),
                )),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '예정',
                  style: TextStyle(fontSize: 17.0, color: Colors.white54),
                ),
              ),
            ),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _totalWidget() {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
                width: 230,
                height: 100,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
                      child: Icon(
                        Icons.all_inbox,
                        size: 25.0,
                      )),
                )),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '전체',
                  style: TextStyle(fontSize: 17.0, color: Colors.white54),
                ),
              ),
            ),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _flagWidget() {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
                width: 230,
                height: 100,
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
                      child: Icon(
                        Icons.flag,
                        size: 25.0,
                      )),
                )),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '깃발 표시',
                  style: TextStyle(fontSize: 17.0, color: Colors.white54),
                ),
              ),
            ),
            Container(
              width: 230,
              height: 100,
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '0',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _listsWidget() {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
              width: 470,
              height: 50,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
                      child: Icon(
                        Icons.list,
                        size: 25.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text('미리 알림')
                  ],
                ),
              ),
            ),
            Container(
              width: 470,
              height: 50,
              alignment: Alignment.centerRight,
              child: Padding(padding: const EdgeInsets.all(10.0), child: Text('0')),
            ),
          ],
        ),
      ),
    );
  }
}
