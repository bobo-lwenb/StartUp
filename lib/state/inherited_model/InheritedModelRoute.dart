import 'package:flutter/material.dart';
import 'package:startup_namer/state/inherited_model/InheritedModelDemo.dart';

class InheritedModelRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedModel'),
      ),
      body: Inherited(),
    );
  }
}

class Inherited extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<Inherited> {
  int _num1 = 0;
  int _num2 = 0;

  @override
  Widget build(BuildContext context) {
    Widget one = Row(
      children: [
        Counter1(),
        RaisedButton(
          onPressed: () {
            setState(() {
              _num1++;
            });
          },
          child: Text('+'),
        ),
      ],
    );
    Widget two = Row(
      children: [
        Counter2(),
        RaisedButton(
          onPressed: () {
            setState(() {
              _num2++;
            });
          },
          child: Text('+'),
        ),
      ],
    );
    return InheritedModelDemo(
      num1: _num1,
      num2: _num2,
      child: Column(
        children: [
          one,
          two,
        ],
      ),
    );
  }
}

class Counter1 extends StatefulWidget {
  @override
  _State1 createState() => _State1();
}

class _State1 extends State<Counter1> {
  @override
  Widget build(BuildContext context) {
    InheritedModelDemo model = InheritedModelDemo.of(context, 'num1');
    return Text('${model.num1}');
  }

  @override
  void didChangeDependencies() {
    print('1111111');
    super.didChangeDependencies();
  }
}

class Counter2 extends StatefulWidget {
  @override
  _State2 createState() => _State2();
}

class _State2 extends State<Counter2> {
  @override
  Widget build(BuildContext context) {
    InheritedModelDemo model = InheritedModelDemo.of(context, 'num2');
    return Text('${model.num2}');
  }

  @override
  void didChangeDependencies() {
    print('2222222');
    super.didChangeDependencies();
  }
}
