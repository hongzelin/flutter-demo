import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

// 自定义组件
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // MaterialApp 作为顶层组件
    return MaterialApp(
      // Scaffold 定义导航头部和页面主要内容
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter 标题'),
        ),
        body: HomePage(),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
        "nihao ffff",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          // color: Colors.yellow
          color: Color.fromRGBO(212, 123, 23, 0.8),
        ),
      ),
    );
  }
}