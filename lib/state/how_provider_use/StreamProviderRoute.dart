import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>(
      create: (_) => initStream(),
      initialData: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('StreamProvider'),
        ),
        body: Center(
          child: StreamTest(),
        ),
      ),
    );
  }

  Stream<int> initStream() {
    return Stream<int>.periodic(const Duration(seconds: 2), (int count) => count++);
  }
}

class StreamTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('${Provider.of<int>(context)}');
  }
}
