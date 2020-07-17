import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'tabs/Tabs.dart';
import 'package:app03/routers/Routers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'res/listData.dart';

// 引入provider
import 'package:provider/provider.dart';
import 'provider/Counter.dart';
import 'provider/Cart.dart';

void main() {
  // it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

// 自定义组件
class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2：全局注入 providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => Cart())
      ],
      child: RefreshConfiguration(
        // 全局配置子树下的 SmartRefresher
        headerBuilder: () =>
            WaterDropHeader(), // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        footerBuilder: () => ClassicFooter(), // 配置默认底部指示器
        headerTriggerDistance: 80.0, // 头部触发刷新的越界距离
        springDescription: SpringDescription(
          stiffness: 170,
          damping: 16,
          mass: 1.9,
        ), // 自定义回弹动画,三个属性值意义请查询 flutter api
        maxOverScrollExtent: 100, // 头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        maxUnderScrollExtent: 0, // 底部最大可以拖动的范围
        enableScrollWhenRefreshCompleted:
            true, // 这个属性不兼容 PageView 和 TabBarView,如果你特别需要 TabBarView 左右滑动,你需要把它设置为 true
        enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: false, // Viewport 不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
        child: MaterialApp(
          localizationsDelegates: [
            // 国际化
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('zh', 'CH'),
            // const Locale('en', 'US'), // 如果引入 iOS 还是英文
          ],

          debugShowCheckedModeBanner: false, // 关闭调试模式
          // Scaffold 定义导航头部和页面主要内容
          // home: TabsPage(),
          initialRoute: '/test', // 抽离 tabs 到路由，需要配置 initialRoute
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
        ),
      ),
    );
  }
}
