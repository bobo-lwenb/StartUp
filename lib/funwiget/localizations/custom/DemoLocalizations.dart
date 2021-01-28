import 'package:flutter/widgets.dart';

//Locale资源类
class DemoLocalizations {
  DemoLocalizations(this.isZh);
  //是否为中文
  bool isZh = false;

  //为了使用方便，我们定义一个静态方法
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  //Locale相关值，title为应用标题
  String get titleDemo {
    return isZh ? "Flutter应用" : "Flutter App";
  }
}
