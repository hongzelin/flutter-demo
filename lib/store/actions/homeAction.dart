import 'package:app03/store/models/home.dart';
import 'package:app03/store/reducer/homeReducer.dart';

final Function updateHomeData = (Map d) {
  print('第一步：进来了');
  return new HomeDataAction(new Home(data: d ?? {})); // 触发 action，从而调用 reducer
};
