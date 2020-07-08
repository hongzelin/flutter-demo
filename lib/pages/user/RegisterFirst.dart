import 'package:flutter/material.dart';

class RegisterFirstPage extends StatefulWidget {
  RegisterFirstPage({Key key}) : super(key: key);

  @override
  _RegisterFirstPageState createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
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
            Text('注册步骤一'),
            RaisedButton(
              child: Text('下一步'),
              onPressed: () {
                Navigator.of(context).pushNamed("/registerSecond"); // 普通方式跳转
                // Navigator.of(context).pushReplacementNamed(
                //     "/registerSecond"); // 替换路由，Second 路由会替换该 First 路由，所以 Second 返回上一步，就是返回之前 First 路由的上一步。
              },
            )
          ],
        ),
      ),
    );
  }
}
