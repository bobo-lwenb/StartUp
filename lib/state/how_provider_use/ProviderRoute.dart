import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 最基本的Provider。它接受一个值并公开它，不管这个值是什么。
class ProviderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Provider<String>.value(
//      value: 'provider',
//      child: ProviderTest(),
//    );
    return Provider<String>(
      create: (_) => 'provider',
      child: ProviderTest(),
    );
  }
}

class ProviderTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${Provider.of<String>(context)}"),
            Text("${context.watch<String>()}"),
            FlatButton(onPressed: null, child: null),
          ],
        ),
      ),
    );
  }
}
