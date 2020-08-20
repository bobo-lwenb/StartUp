import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/state/how_provider_use/ChangeNotifierProviderRoute.dart';

class ChangeNotifierSecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChangeNotifierSecond'),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, value, child) {
            return Text('${value.count}');
          },
        ),
      ),
    );
  }
}
