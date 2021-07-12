import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'HeroAnimationRouteB.dart';

/// 标准Hero路由动画
class HeroAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<HeroAnimationRoute> {
  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroAnimation'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: 'avatar',
            child: ClipOval(
              child: Image.asset('./images/avatar.png'),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation animation,
                    Animation secondaryAnimation) {
              return FadeTransition(
                opacity: animation.value,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('??'),
                  ),
                  body: HeroAnimationRouteB(),
                ),
              );
            }));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    timeDilation = 1.0;
    super.dispose();
  }
}
