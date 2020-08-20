import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/state/how_provider_use/ChangeNotifierProviderRoute.dart';

/// 一种特殊的可监听对象的Provider
/// ListenableProvider将侦听对象，并要求依赖于该对象的小部件在调用侦听器时重新构建。
/// 可观察的数据必须实现Listenable
class ListenableProviderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<Counter>(
      create: (_) => Counter(),
      child: ListenableTest(),
    );
  }
}

class ListenableTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' ListenableProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('the click number is:'),
            Test(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('${context.watch<Counter>().count}');
  }
}
