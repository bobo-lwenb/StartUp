import 'package:flutter/material.dart';

class PhysicalModelDemo extends StatelessWidget {
  const PhysicalModelDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PhysicalModel"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            PhysicalModel(
              color: Colors.deepOrange,
              shadowColor: Colors.amber,
              elevation: 20,
              shape: BoxShape.circle,
              child: FlutterLogo(size: 200),
            ),
            SizedBox(height: 30),
            PhysicalShape(
              shadowColor: Colors.redAccent,
              color: Colors.red,
              clipper: TriangleClipper(),
              elevation: 20,
              child: FlutterLogo(size: 200),
            ),
            SizedBox(height: 30),
            TickerMode(
              enabled: true,
              child: AnimatedPhysicalModel(
                shape: BoxShape.rectangle,
                elevation: 20,
                color: Colors.yellow,
                shadowColor: Colors.yellowAccent,
                duration: const Duration(seconds: 2),
                child: FlutterLogo(size: 200),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0.0, size.height)
      ..lineTo(size.width / 2, 0.0)
      ..lineTo(size.width, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
