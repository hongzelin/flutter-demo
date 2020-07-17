import 'package:app03/provider/MyChangeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/Cart.dart';
import 'CartNum.dart';

class CartItem extends StatefulWidget {
  CartItem({Key key}) : super(key: key);

  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    // 3 使用 Provider
    // var cartProvider = Provider.of<Cart>(context);

    return Column(children: <Widget>[
      Text("Item"),
      ChangeNotifierProvider(
        create: (_) => new MyChangeNotifier(),
        child: Consumer<MyChangeNotifier>(
          builder: (context, model, child) {
            return Column(
              children: <Widget>[
                Text("Provider ${model.count}"),
                RaisedButton(
                  child: Text('新增'),
                  onPressed: () {
                    model.incCount();
                  },
                ),
                CartNum(),
              ],
            );
          },
        ),
      ),
    ]);
  }
}
