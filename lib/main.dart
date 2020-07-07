import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:startup_namer/funwiget/localizations/custom/DemoLocalizationsDelegate.dart';
import 'package:startup_namer/tabmain/MainTab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // 本地化的代理
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // 注册我们的代理类
        DemoLocalizationsDelegate(),
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('zh', "CN"),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 当push一个不存在的路由时会执行此操作
      onUnknownRoute: (RouteSettings settings) {
        return null;
      },
      home: MainTab(),
    );
  }
}
