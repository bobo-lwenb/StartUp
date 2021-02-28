import 'package:flutter/material.dart';

class ConstraintDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局约束样例"),
      ),
      body: SizedBox.expand(
        child: LayoutBuilder(
          builder: (context, constraints) {
            print(constraints);
            return Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildOverflowBox() {
    return OverflowBox(
      minWidth: 0.0,
      minHeight: 0.0,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
      child: Container(color: Colors.red, width: 4000, height: 50),
    );
  }

  Widget _buildUnconstrainedBox() {
    return UnconstrainedBox(
      child: Container(color: Colors.red, width: 20, height: 50),
    );
  }

  Widget _buildConstrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          // minHeight: 100,
          // minWidth: 100,
          ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            color: Colors.orange,
            width: 100,
            height: 100,
          );
        },
      ),
    );
  }
}
