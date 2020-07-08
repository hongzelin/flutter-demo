import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Map arguments;
  // FormPage({this.arguments});
  FormPage({Key key, this.arguments}) : super(key: key);
  // print(arguments);
  @override
  _FormPageState createState() => _FormPageState(arguments: this.arguments);
}

class _FormPageState extends State<FormPage> {
  final Map arguments;
  _FormPageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('返回'),
          onPressed: () {
            // Navigator.pop(context);
            Navigator.of(context).pop();
          },
        ),
        appBar: AppBar(
          title: Text("Form 表单"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: '推荐'),
              Tab(text: '最新'),
            ],
          ),
          // title: Text("详情${(args as Map)['id']}"),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(
                  title: Text('diyigezuixin  推荐'),
                ),
                ListTile(
                  title: Text('diyigezuixin  推荐'),
                ),
              ],
            ),
            Container(
              child: Text('zuixidddd'),
            )
          ],
        ),
      ),
    );
  }
}
