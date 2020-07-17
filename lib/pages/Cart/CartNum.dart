import 'package:app03/provider/Counter.dart';
import 'package:app03/provider/MyChangeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartNum extends StatefulWidget {
  CartNum({Key key}) : super(key: key);

  _CartNumState createState() => _CartNumState();
}

class _CartNumState extends State<CartNum> {
  @override
  Widget build(BuildContext context) {
    // 3 使用 Provider Provider.of 方式
    // var cartProvider = Provider.of<Cart>(context);

    return Consumer<MyChangeNotifier>(
      builder: (context, model, child) {
        return Column(
          children: <Widget>[Text("Provider ${model.count}")],
        );
      },
    );
    // return ChangeNotifierProvider(
    //   create: (_) => new MyChangeNotifier(),
    //   child: Consumer<MyChangeNotifier>(
    //     builder: (context, model, child) {
    //       return Column(
    //         children: <Widget>[Text("Provider ${model.count}")],
    //       );
    //     },
    //   ),
    // );
  }
}
