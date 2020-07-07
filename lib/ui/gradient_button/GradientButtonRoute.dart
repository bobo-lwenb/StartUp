import 'package:flutter/material.dart';
import 'package:startup_namer/ui/gradient_button/GradientButton.dart';

class GradientButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GradientButton'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          child: Column(
            children: <Widget>[
              GradientButton(
                colors: [Colors.orange, Colors.red],
                height: 50.0,
                child: Text('test'),
                onTap: onTap(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTap() {
    print('button click');
  }
}
