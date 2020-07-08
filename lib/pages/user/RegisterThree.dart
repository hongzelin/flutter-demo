import 'package:flutter/material.dart';

import 'package:app03/tabs/Tabs.dart';

class RegisterThreePage extends StatefulWidget {
  RegisterThreePage({Key key}) : super(key: key);

  @override
  _RegisterThreePageState createState() => _RegisterThreePageState();
}

class _RegisterThreePageState extends State<RegisterThreePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('注册'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 100, width: 50),
            Text('注册步骤三'),
            RaisedButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    // 返回到指定到根路由
                    new MaterialPageRoute(
                        builder: (context) => new TabsPage(index: 1)),
                    (route) => route == null);
              },
            )
          ],
        ),
      ),
    );
  }
}
