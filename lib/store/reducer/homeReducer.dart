import 'package:app03/store/models/home.dart';
import 'package:redux/redux.dart';

/// redux 的 combineReducers, 通过 TypedReducer 将 HomeReducer 与 reducers 关联起来
final homeReducer = combineReducers<Home>([
  // 这里可以配置 combine 多个 reducer
  TypedReducer<Home, HomeDataAction>(_updateData),
]);

final countReducer = combineReducers<int>([
  // 这里可以配置 combine 多个 reducer
  TypedReducer<int, TestAction>(_updateTest),
]);

/// 如果有 HomeReducer 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 这里接受一个新的userInfo，并返回
Home _updateData(Home d, action) {
  print('第四步：_updateData reducer：${d}---${action}');
  d = action.data;
  return d;
}

/// 如果有 HomeReducer 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 这里接受一个新的userInfo，并返回
int _updateTest(int d, action) {
  print('第四步：_updateData reducer：${d}---${action}');
  d = action.counter;
  print('最终数据${action.counter}');
  return d;
}

///1:通过触发 HomeDataAction 构造函数，传入对应的数据，改变 Home data
///HomeDataAction 构造一旦被触发，就是调用上面配置的 _updateData 方法。
///定一个 HomeDataAction ，用于发起 data 数据的改变
///类名随你喜欢定义，只要通过上面TypedReducer绑定就好
class HomeDataAction {
  Home data;
  HomeDataAction(d) {
    print("第二步：HomeDataAction：${d}");
    this.data = d;
  }
}

class TestAction {
  int count;
  TestAction(i) {
    this.count = i;
  }
}
