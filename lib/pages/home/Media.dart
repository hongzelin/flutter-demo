/*
 * Author: lin.zehong 
 * Date: 2020-07-17 23:08:24 
 * Desc: 直播（视频播放）flutter_ijkplayer
 */
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class MediaPage extends StatefulWidget {
  MediaPage({Key key}) : super(key: key);

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  IjkMediaController controller = IjkMediaController();

  @override
  void initState() {
    super.initState();
    this.initMedia();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //初始化视频
  initMedia() async {
    await controller.setNetworkDataSource(
        // 'rtmp://202.69.69.180:443/webcast/bshdlive-pc', // rtmp 香港财经
        // 'http://playertest.longtailvideo.com/adaptive/bipbop/gear4/prog_index.m3u8', // hls
        // "https://media.w3.org/2010/05/sintel/trailer.mp4", // mp4
        // 'rtmp://172.16.100.245/live1',
        'http://img.ksbbs.com/asset/Mon_1704/15868902d399b87.flv', // flv
        autoPlay: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("流媒体直播/播放视频"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 200, //指定视频的高度
              child: IjkPlayer(
                mediaController: controller,
              ),
            ),
            SizedBox(height: 40),
            Text('直播演示')
          ],
        ));
  }
}
