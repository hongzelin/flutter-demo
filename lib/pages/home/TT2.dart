import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app03/components/PullToRefresh/PullToRefresh.dart';

class FormDemoPage extends StatefulWidget {
  FormDemoPage({Key key}) : super(key: key);

  _FormDemoPageState createState() => _FormDemoPageState();
}

class _FormDemoPageState extends State<FormDemoPage> {
  List list = [];
  int _page = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this._getData("refresh");
  }

  void _onRefresh() async {
    // await Future.delayed(Duration(milliseconds: 1000), () {
    //   print('_onRefresh --- 请求数据完成');
    //   this._getData("refresh");
    // });
    // _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // await Future.delayed(Duration(milliseconds: 1000), () {
    //   this._getData("load");
    // });
    // _refreshController.loadComplete();
  }

  void _getData(type) async {
    // try {
    //   Response response = await Dio().get(
    //     "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}",
    //   );
    //   var res = json.decode(response.data)['result'];
    //   print(res);

    //   // 没有更多数据
    //   if (type == 'load' && res.length == 0) {
    //     _refreshController.loadNoData();
    //   }
    //   this.setState(() {
    //     this.list.addAll(res); // 拼接
    //     this._page++;
    //   });
    // } catch (e) {
    //   if (type == "refresh") {
    //     // 更新失败
    //     _refreshController.refreshFailed();
    //   } else if (type == "load") {
    //     // 加载失败
    //     _refreshController.loadFailed();
    //   }
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试11"),
      ),
      body: PullToRefreshPage('xxxx'),
    );
  }
}
