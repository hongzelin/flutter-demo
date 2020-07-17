/*
 * Author: lin.zehong 
 * Date: 2020-07-17 23:08:50 
 * Desc: 自动升级 package_info、path_provider、open_file、flutter_downloader
 */
import 'package:flutter/material.dart';

import 'package:package_info/package_info.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:open_file/open_file.dart';

import 'package:flutter_downloader/flutter_downloader.dart';

class AppVersionPage extends StatefulWidget {
  AppVersionPage({Key key}) : super(key: key);

  _AppVersionPageState createState() => _AppVersionPageState();
}

class _AppVersionPageState extends State<AppVersionPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    this._getPackageInfo();

    this._getAppPath();
  }

  /// 弹出 Dialog
  _showDialog() async {
    var alertRel = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("更新APP提示!"),
            content: Text("发现新的版本，新版本修复了如下bug 是否更新!"),
            actions: <Widget>[
              FlatButton(
                child: Text("否"),
                onPressed: () {
                  Navigator.pop(context, 'Cancle');
                },
              ),
              FlatButton(
                child: Text("是"),
                onPressed: () {
                  Navigator.pop(context, 'Ok');
                },
              )
            ],
          );
        });
  }

  /// 获取版本号
  _getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    print("appName:${appName}");

    print("packageName:${packageName}");

    print("version:${version}");

    print("buildNumber:${buildNumber}");
  }

  /// 获取路径
  _getAppPath() async {
    // 获取临时路径
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // 获取 app 安装的路径
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    // 获取 app 缓存的路径
    var directory = await getExternalStorageDirectory();
    String storageDirectory = directory.path;

    print("tempPath:${tempPath}");

    print("appDocDir:${appDocPath}");

    print("StorageDirectory:${storageDirectory}");
  }

  /// 下载打开文件
  _downLoad() async {
    await FlutterDownloader.initialize(
        debug: true // optional: set false to disable printing logs to console
        );

    // 注册下载回调函数
    FlutterDownloader.registerCallback(downloadCallback);

    final directory = await getExternalStorageDirectory();
    String _localPath = directory.path;

    final taskId = await FlutterDownloader.enqueue(
      url: "http://www.ionic.wang/jdshop.apk", // Android 高的版本，规定需要 https
      savedDir: _localPath, // ！！！这里是 app 缓存的路径
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );

    // 打开文件，根据路径拼接上名称
    print('--------------------------- ${_localPath}/jdshop.apk');
    OpenFile.open("${_localPath}/jdshop.apk");
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    // final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port');
    // send.send([id, status, progress]);
    print(status);
    // code to update your UI
    print('1111111111111111111');
    print(progress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward),
        onPressed: _downLoad,
      ),
      appBar: AppBar(
        title: Text("app升级演示"),
      ),
      body: Text("app升级演示"),
    );
  }
}
