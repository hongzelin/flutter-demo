import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final String title;
  // 4 定义对应的构造参数，注意类型要对应
  final Map routesArgs;
  Detail({Key key, this.title, this.routesArgs}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    // 5 组件内，获取路由参数
    // var args = ModalRoute.of(context).settings.arguments;
    // var _args = args as Map; // 如果参数不是为 String 类型，例如 Map 类型等其他类型，需要做强制转换
    // print(_args['id']);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: () {
          // Navigator.pop(context);
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text("详情"),
        // title: Text("详情${_args['id']}"),
        // title: Text("详情${(args as Map)['id']}"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('xxxxx'),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
