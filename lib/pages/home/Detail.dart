import 'package:app03/pages/home/Auth.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class Detail extends StatefulWidget {
  Detail({Key key}) : super(key: key);

  _ChewieVideoDemoState createState() => _ChewieVideoDemoState();
}

class _ChewieVideoDemoState extends State<Detail> {
  var subscription;
  String _stateText;

  @override
  initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.wifi) {
        setState(() {
          _stateText = "处于wifi";
        });
      } else if (result == ConnectivityResult.mobile) {
        setState(() {
          _stateText = "处于手机网络";
        });
      } else {
        setState(() {
          _stateText = "没有网络";
        });
      }
    });
  }

  // Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生物识别'),
      ),
      body: new AuthPage(),
    );
  }
}
