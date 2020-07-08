import 'package:flutter/material.dart';

import 'package:app03/pages/home/HomePage.dart';
import 'package:app03/pages/category/CategoryPage.dart';
import 'package:app03/pages/settings/SettingsPage.dart';

class TabsPage extends StatefulWidget {
  final int index;
  TabsPage({Key key, this.index = 0}) : super(key: key);
  @override
  _TabsPageState createState() => _TabsPageState(this.index);
}

class _TabsPageState extends State<TabsPage> {
  int currentIndex = 0;

  _TabsPageState(index) {
    this.currentIndex = index;
  }

  List listTabs = [
    HomePage(),
    CategoryPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 标题'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   onPressed: () {
        //     print('menu');
        //   },
        // ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print('settings');
            },
          )
        ],
      ),
      floatingActionButton: Container(
        height: 68,
        width: 68,
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          color: Colors.white,
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 36, color: Colors.white),
          backgroundColor:
              this.currentIndex == 1 ? Colors.green : Colors.orange,
          onPressed: () {
            setState(() {
              this.currentIndex = 1;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this.listTabs[this.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.currentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('分类'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('设置'),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('姓名'),
              accountEmail: Text('666553434@qq.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  "images/a.jpeg",
                ),
                // NetworkImage("https://www.itying.com/images/flutter/3.png"),
              ),
              // currentAccountPicture: Image.asset(
              //   'images/a.jpeg',
              //   fit: BoxFit.cover,
              //   height: 40,
              //   width: 40,
              // ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.itying.com/images/flutter/2.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('CircleAvatar 内容，跳转到 from 页面。。。'),
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              onTap: () {
                Navigator.of(context).pop(); // 抽屉框消失
                Navigator.pushNamed(context, "/form");
              },
            ),
            Divider(),
            ListTile(
              title: Text('Image 内容。。。'),
              leading: Image.asset(
                'images/a.jpeg',
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
            Divider(),
            ListTile(
              title: Text('decoration 圆形图片内容。。。'),
              leading: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    // "http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg",
                    // image: NetworkImage(
                    //   "https://www.itying.com/images/202004/thumb_img/1067_thumb_G_1587531602352.jpg",
                    // ),
                    image: AssetImage(
                      "images/a.jpeg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(' ClipOval 内容。。。'),
              leading: ClipOval(
                child: Image.asset(
                  "images/a.jpeg",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}
