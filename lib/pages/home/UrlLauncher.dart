/*
 * Author: lin.zehong 
 * Date: 2020-07-17 23:13:42 
 * Desc: 打开外部浏览器、打开外部应用、拨打电话、发送短信 url_launcher
 */
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher extends StatefulWidget {
  UrlLauncher({Key key}) : super(key: key);

  _UrlLauncherState createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UrlLauncher'),
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            RaisedButton(
              child: Text('打开外部浏览器'),
              onPressed: () async {
                const url = 'https://www.baidu.com';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('拨打电话'),
              onPressed: () async {
                var tel = 'tel:10086';
                if (await canLaunch(tel)) {
                  await launch(tel);
                } else {
                  throw 'Could not launch $tel';
                }
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('发送短信'),
              onPressed: () async {
                var tel = 'sms:10086';
                if (await canLaunch(tel)) {
                  await launch(tel);
                } else {
                  throw 'Could not launch $tel';
                }
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('打开外部应用'),
              onPressed: () async {
                /*
                    weixin://
                    alipays://
                  */
                var url = 'alipays://';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            )
          ]),
        )));
  }
}
