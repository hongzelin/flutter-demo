/*
 * Author: lin.zehong 
 * Date: 2020-07-08 15:48:49 
 * Desc: 测试 redux（把 state、Action、reducer 都写在一起了）
 */
import 'package:meta/meta.dart';

/// State 中所有属性都应该是只读的
@immutable
class CountState {
  final int _count;
  get count => _count;

  CountState(this._count);

  CountState.initState() : _count = 10;
}

/*
 * 定义操作该 State 的全部 Action
 * 这里只有增加 count 一个动作(实际业务可能会请求数据)
 */
enum Action {
  increment,
  reduce,
}

/*
 * reducer 会根据传进来的action生成新的CountState
 */
CountState reducer(CountState state, action) {
  // 匹配 Action
  if (action == Action.increment) {
    return CountState(state.count + 1);
  }
  // 匹配 Action
  if (action == Action.reduce) {
    return CountState(state.count - 1);
  }
  return state;
}
