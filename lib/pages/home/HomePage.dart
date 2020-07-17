import 'package:app03/pages/home/Scan.dart';
import 'package:app03/pages/home/UrlLauncher.dart';
import 'package:app03/store/models/couter.dart' as lib;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './Detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Store<lib.CountState>(lib.reducer,
      initialState: lib.CountState.initState());

  @override
  Widget build(BuildContext context) {
    return StoreProvider<lib.CountState>(
      store: store,
      child: Container(
        child: Column(
          children: <Widget>[
            StoreConnector<lib.CountState, dynamic>(
              converter: (store) => store.state,
              builder: (context, _countState) {
                return Text('count:--${_countState.count}');
              },
            ),
            StoreConnector<lib.CountState, dynamic>(
              converter: (store) {
                return () => store.dispatch(lib.Action.reduce);
              },
              builder: (context, callback) {
                return RaisedButton(
                  child: Text('-'),
                  textColor: Theme.of(context).accentColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {
                    callback();
                  },
                );
              },
            ),
            Divider(),
            SizedBox(height: 100),
            new ScanPage(),
            Divider(),
            SizedBox(height: 100),
            RaisedButton(
              child: Text('go to Detail'),
              textColor: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/detail"); // 如果不需要参数就不要写，不然有问题！！！
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Detail(title: '我是从home进入的参数'),
                //   ),
                // );
              },
            ),
            Divider(),
            SizedBox(height: 100),
            RaisedButton(
              child: Text('go to AppVersionPage'),
              textColor: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/appVersion"); // 如果不需要参数就不要写，不然有问题！！！
              },
            ),
            SizedBox(height: 40),
            RaisedButton(
              child: Text('go to Form'),
              textColor: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: () {
                Navigator.pushNamed(context, '/form', arguments: {"id": 20});
                // Navigator.of(context).pushNamed(
                //   "/form",
                //   arguments: {"id": 4445}, // 3 使用 arguments 传值，注意类型
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Detail(title: '我是从home进入的参数'),
                //   ),
                // );
              },
            ),
            SizedBox(height: 30),
            RaisedButton(
              child: Text('test'),
              textColor: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: () {
                Navigator.of(context).pushNamed("/test");
                // Navigator.of(context).pushNamed(
                //   "/form",
                //   arguments: {"id": 4445}, // 3 使用 arguments 传值，注意类型
                // );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Detail(title: '我是从home进入的参数'),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
