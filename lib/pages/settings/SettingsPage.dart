import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

// 1 实现 SingleTickerProviderStateMixin
class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  // 2 定义 TabController 变量
  TabController _tabController;

  // 3 覆盖重写 initState，实例化 _tabController
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabController'),
        bottom: TabBar(
          controller: _tabController, // 4 需要配置 controller！！！
          // isScrollable: true,
          tabs: <Widget>[
            Tab(text: '推荐'),
            Tab(text: '最新'),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController, // 4 需要配置 controller！！！
        children: <Widget>[
          ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'diyigezuixin  推荐',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
              ListTile(
                title: Text('diyigezuixin  推荐'),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 200,
                      margin: EdgeInsets.all(20),
                      child: RaisedButton(
                        child: Text('新增'),
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 20,
                        onPressed: () {
                          print('RaiseButton');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  OutlineButton(
                    child: Text('FlatButton'),
                    // color: Colors.blue,
                    textColor: Colors.blue,
                    borderSide: BorderSide(color: Colors.blue),
                    onPressed: () {
                      print('FlatButton');
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    children: <Widget>[
                      OutlineButton(
                        child: Text('FlatButton'),
                        // color: Colors.blue,
                        textColor: Colors.blue,
                        borderSide: BorderSide(color: Colors.blue),
                        onPressed: () {
                          print('FlatButton');
                        },
                      ),
                      OutlineButton(
                        child: Text('OutlineButton'),
                        // color: Colors.blue,
                        textColor: Colors.blue,
                        borderSide: BorderSide(color: Colors.blue),
                        onPressed: () {
                          print('FlatButton');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Text('zuixidddd'),
          ),
        ],
      ),
    );
  }
}
