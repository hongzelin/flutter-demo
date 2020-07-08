import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Row(
            // 由于外部还有一个 Scaffold，所以 TabBar 不能放在 bottom，会出现一个空白的 title
            children: <Widget>[
              Expanded(
                child: TabBar(
                  // isScrollable: true,
                  // indicatorColor: Colors.blue,
                  // labelColor: Colors.blue,
                  // unselectedLabelColor: Colors.white,
                  // indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(text: '推荐'),
                    Tab(text: '最新'),
                  ],
                ),
              ),
            ],
          ),
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(text: '推荐'),
          //     Tab(text: '最新'),
          //   ],
          // ),
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
