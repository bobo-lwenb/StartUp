import 'package:flutter/material.dart';

class StateLifecycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateLifecycle'),
      ),
      body: Center(
        child: StateLifecycleWidget(),
      ),
    );
  }
}

class StateLifecycleWidget extends StatefulWidget {
  final int initValue;

  const StateLifecycleWidget({Key key, this.initValue = 0});

  @override
  _LifeCycleState createState() => _LifeCycleState();
}

class _LifeCycleState extends State<StateLifecycleWidget> {
  final String temp = 'lifecycleState';
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print('$temp initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('$temp didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('$temp build');
    return FlatButton(
      child: Text('$_counter'),
      //点击后计数器自增
      onPressed: () => setState(
        () => ++_counter,
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    print('$temp reassemble');
  }

  @override
  void didUpdateWidget(StateLifecycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('$temp didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('$temp deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('$temp dispose');
  }
}
