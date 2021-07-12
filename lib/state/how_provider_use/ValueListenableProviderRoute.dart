import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueListenableProviderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bean = StringBean('value');
    return ValueListenableProvider<String>.value(
      value: bean,
      child: ValueListenableTest(bean: bean),
    );
  }
}

class ValueListenableTest extends StatelessWidget {
  final StringBean bean;

  ValueListenableTest({Key? key, required this.bean}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ValueListenableProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('the data is:'),
            ValueTest(),
            TextButton(
              onPressed: () {
                bean.data = '123456';
              },
              child: Text('change value'),
            ),
          ],
        ),
      ),
    );
  }
}

class ValueTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${Provider.of<String>(context)}'),
      ],
    );
  }
}

class StringBean extends ValueNotifier<String> {
  StringBean(String value) : super(value);

  String get data => value;

  set data(String temp) => value = temp;
}
