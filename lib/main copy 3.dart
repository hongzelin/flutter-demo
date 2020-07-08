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
    return Container(
      height: 300.0,
      width: 300.0,
      // color: Colors.grey, // 不能和 decoration color 同时存在，会报错
      padding: EdgeInsets.fromLTRB(20, 10, 30, 0),
      margin: EdgeInsets.fromLTRB(10, 20, 30, 0),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.red,
        // image: DecorationImage(
        //   image: NetworkImage('https:///flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        //   fit: BoxFit.cover,
        // ),
        // border: Border(
        //   bottom: BorderSide(
        //     color: Colors.black,
        //     width: 5.0,
        //     style: BorderStyle.solid
        //   ),
        //   top: BorderSide(
        //     color: Colors.black,
        //     width: 15.0,
        //     style: BorderStyle.solid
        //   ),
        //   right: BorderSide(
        //     color: Colors.black,
        //     width: 5.0,
        //     style: BorderStyle.solid
        //   ),
        //   left: BorderSide(
        //     color: Colors.black,
        //     width: 5.0,
        //     style: BorderStyle.solid
        //   ),
        // ),
        border: Border.all(
          color: Colors.black,
          width: 8,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xffff0000),
            blurRadius: 5.0,
            // spreadRadius: 5.0,
            offset: Offset(3.0, 3.0),
          ),
        ],
        // borderRadius: BorderRadius.vertical(
        //   top: Radius.circular(20),
        //   bottom: Radius.circular(5),
        // ),
        borderRadius: BorderRadius.circular(12.0), // 指定 border: Border.all，不能单独使用 Border()
        
      ),
      child: Text(
        "我是你吧我是你吧我是你吧我是你吧我是你吧我是你吧我是你吧我是你吧",
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: 1.6,
        maxLines: 2,
        style: TextStyle(
          // color: Colors.yellow
          color: Color.fromRGBO(212, 123, 23, 0.8),
          decoration: TextDecoration.lineThrough,
          decorationColor: Color.fromRGBO(11, 22, 33, 1),
          decorationStyle: TextDecorationStyle.dotted,
          letterSpacing: 2.0,
          fontSize: 12.0,
          fontStyle: FontStyle.italic,

          
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}