import 'package:flutter/material.dart';

class RegisterSecondPage extends StatefulWidget {
  RegisterSecondPage({Key key}) : super(key: key);

  @override
  _RegisterSecondPageState createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
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
            Text('注册步骤二'),
            RaisedButton(
              child: Text('下一步'),
              onPressed: () {
                Navigator.of(context).pushNamed("/registerThree");
              },
            )
          ],
        ),
      ),
    );
  }
}
