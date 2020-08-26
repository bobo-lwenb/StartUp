import 'package:flutter/material.dart';

class ValueListenableBuilderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget _goodJob = const Text('Good Job.');

  @override
  Widget build(BuildContext context) {
    ValueListenableBuilder builder = ValueListenableBuilder(
      valueListenable: _counter,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            child,
            Text('$value'),
            child,
          ],
        );
      },
      child: _goodJob,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableBuilder'),
      ),
      body: Center(
        child: builder,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
