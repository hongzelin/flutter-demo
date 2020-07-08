import 'package:app03/store/appState.dart';
import 'package:app03/store/models/user.dart';
import 'package:app03/store/reducer/userReducer.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

final Function updateUser = (int id, String name) {
  print('第一步：进来了----${id}, ${name}');
  return new UpdateUserAction(
      new User(id: 11, name: 'xxx')); // 触发 UpdateUserAction，从而调用 reducer
};

final Function testaction = (context) {
  print('进来 testaction');

  Store<GSYState> store = StoreProvider.of(context);

  store.dispatch(new UpdateUserAction(new User(id: 11221, name: 'xxx')));
};
