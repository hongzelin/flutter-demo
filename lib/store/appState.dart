import 'package:app03/store/models/home.dart';
import 'package:app03/store/reducer/userReducer.dart';

import 'models/user.dart';
import 'reducer/homeReducer.dart';
// import 'package:flutter/material.dart';
// import 'package:redux/redux.dart';

///全局 Redux store 的对象，保存 State 数据
class GSYState {
  ///用户信息
  User userInfo;

  ///主页数据
  Home homeData;

  ///构造方法
  GSYState({this.userInfo, this.homeData});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
GSYState appReducer(GSYState state, action) {
  print('第三步：appReducer-----${state}---${action}');

  return GSYState(
    ///通过 userReducer 将 GSYState 内的 userInfo 和 action 关联在一起
    userInfo: userReducer(state.userInfo, action),

    ///通过 homeReducer 将 GSYState 内的 homeData 和 action 关联在一起
    homeData: homeReducer(state.homeData, action),
  );
}
