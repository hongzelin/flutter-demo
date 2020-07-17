import 'package:app03/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class NewDetailPage extends StatefulWidget {
  Map arguments;
  NewDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<NewDetailPage> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('在线视频播放'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('设置本地存储'),
            onPressed: () async {
              await ToolUtils.setStorage("username", "zhangsan");
            },
          ),
          Divider(),
          RaisedButton(
            child: Text('获取本地存储'),
            onPressed: () async {
              var name = await ToolUtils.getStorage("username");
              print(name);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
