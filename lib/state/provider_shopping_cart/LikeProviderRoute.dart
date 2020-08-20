import 'package:flutter/material.dart';

import 'CartModel.dart';
import 'InheritedProvider.dart';
import 'Item.dart';

class LikeProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<LikeProviderRoute> {
  @override
  Widget build(BuildContext context) {
    print('_ProviderRouteState');
    return Scaffold(
      appBar: AppBar(
        title: Text('跨组件状态共享（Provider）'),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              print(' builder: (context)');
              return Column(
                children: <Widget>[
                  Consumer<CartModel>(
                    builder: (context, cart) {
                      print('Consumer<CartModel>');
                      return Text("总价: ${cart.totalPrice}");
                    },
                  ),
                  Builder(builder: (context) {
                    print("RaisedButton build"); //在后面优化部分会用到
                    return RaisedButton(
                      child: Text("添加商品"),
                      onPressed: () {
                        //给购物车中添加商品，添加后总价会更新
                        ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(20.0, 1));
                      },
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
