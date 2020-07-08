import 'package:flutter/material.dart';

import 'package:app03/tabs/Tabs.dart';
import 'package:app03/pages/home/Detail.dart';
import 'package:app03/pages/home/FormPage.dart';
import 'package:app03/pages/user/RegisterFirst.dart';
import 'package:app03/pages/user/RegisterSecond.dart';
import 'package:app03/pages/user/RegisterThree.dart';
import 'package:app03/pages/home/Test.dart';

final Map<String, Function> routes = {
  '/': (context) => TabsPage(),
  '/detail': (context) => Detail(), // 2 根据组件构造函数参数，传递路由参数
  '/form': (context, {arguments}) => FormPage(arguments: arguments),
  '/registerFirst': (context) => RegisterFirstPage(),
  '/registerSecond': (context) => RegisterSecondPage(),
  '/registerThree': (context) => RegisterThreePage(),
  '/test': (context) => FormDemoPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  // print('-------${settings.arguments}');
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
