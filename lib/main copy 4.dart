import 'package:flutter/material.dart';

import 'res/listData.dart';

void main() {
  runApp(new MyApp());
}

// 自定义组件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 400,
      color: Colors.pink,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  color: Colors.blue,
                  child: Text('11'),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 200,
                  color: Colors.green,
                  child: Text('222'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Column(children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 95,
                        color: Colors.orange,
                        child: Text('333'),
                      ),
                    ),
                  ]),
                  SizedBox(height: 10),
                  Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 95,
                        color: Colors.orange,
                        child: Text('444'),
                      ),
                    ),
                  ]),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IconContext extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  IconContext(this.icon, {this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: this.color ?? Colors.green,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size ?? 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
