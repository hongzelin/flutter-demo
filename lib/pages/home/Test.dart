import 'package:app03/store/actions/homeAction.dart';
import 'package:app03/store/models/user.dart';
import 'package:app03/store/reducer/userReducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:app03/store/appState.dart';
import 'package:app03/store/actions/userAction.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试11"),
      ),
      body: Column(
        children: <Widget>[
          StoreConnector<GSYState, dynamic>(
            converter: (store) {
              return () => store.dispatch(updateUser(1, '小米'));
            },
            // converter: (store) {
            //   return () => store
            //       .dispatch(UpdateUserAction(new User(id: 11, name: 'xxx')));
            //   // return () => store.dispatch(updateUser(1, '小米'));
            // },
            builder: (context, callback) {
              return Row(
                children: <Widget>[
                  Divider(),
                  RaisedButton(
                    child: Text('User 测试'),
                    onPressed: () {
                      callback();
                    },
                  ),
                  RaisedButton(
                    child: Text('testaction 测试'),
                    onPressed: () {
                      testaction(context);
                      // print(a());
                    },
                  ),
                ],
              );
            },
          ),
          StoreConnector<GSYState, dynamic>(
            converter: (store) {
              return store.state;
            },
            builder: (context, stateData) {
              return Row(
                children: <Widget>[
                  Divider(),
                  Text('userInfo id： ${stateData.userInfo.id}'),
                  // Text('home data： ${stateData.homeData.data}'),
                ],
              );
            },
          ),
          Divider(),
          StoreConnector<GSYState, dynamic>(
            converter: (store) {
              return (d) => store.dispatch(updateHomeData(d));
            },
            builder: (context, callback) {
              return Row(
                children: <Widget>[
                  Divider(),
                  RaisedButton(
                    child: Text('Home 测试 222'),
                    onPressed: () {
                      callback({"id": 22223});
                    },
                  ),
                  RaisedButton(
                    child: Text('Home 测试 333'),
                    onPressed: () {
                      callback({"id": 33});
                    },
                  ),
                ],
              );
            },
          ),
          StoreConnector<GSYState, dynamic>(
            converter: (store) {
              return store.state;
            },
            builder: (context, stateData) {
              return Row(
                children: <Widget>[
                  Divider(),
                  Text('userInfo id： ${stateData.userInfo.id}'),
                  Text('home data： ${stateData.homeData.data}'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
