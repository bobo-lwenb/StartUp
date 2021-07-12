import 'package:flutter/material.dart';

class BreatheWidget extends StatefulWidget {
  @override
  _BreatheWidgetState createState() => _BreatheWidgetState();
}

class _BreatheWidgetState extends State<BreatheWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation4;
  late Animation _animation7Opacity1;
  late Animation _animation7Opacity2;
  late Animation _animation8;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _animation4 = Tween<double>(begin: 0, end: 1)
        .chain(CurveTween(curve: Interval(0.0, 0.2)))
        .animate(_controller);
    _animation7Opacity1 = Tween<double>(begin: 1, end: 0.4)
        .chain(CurveTween(curve: Interval(0.2, 0.375)))
        .animate(_controller);
    _animation7Opacity2 = Tween<double>(begin: 0.4, end: 1)
        .chain(CurveTween(curve: Interval(0.375, 0.55)))
        .animate(_controller);
    _animation8 = Tween<double>(begin: 1, end: 0)
        .chain(CurveTween(curve: Interval(0.55, 0.95)))
        .animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("4-7-8呼吸法"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: _controller.value <= 0.375
                  ? _animation7Opacity1.value
                  : _animation7Opacity2.value,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  gradient: RadialGradient(
                    colors: [Colors.green[500]!, Colors.green[100]!],
                    stops: _controller.value <= 0.2
                        ? [_animation4.value, _animation4.value + 0.1]
                        : [_animation8.value, _animation8.value + 0.1],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.repeat();
        },
        tooltip: "play/stop",
        child: Icon(Icons.play_arrow_outlined),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
