import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 最基本的Provider。它接受一个值并公开它，不管这个值是什么。
/// 如果只是想简单的暴露一个数据，使用 Provider 的方式最合适不过
/// 如果还需要监听值的变化，其它类型的 Provider 会更合适
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
            TextButton(
              onPressed: null,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
