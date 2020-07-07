import 'package:flutter/widgets.dart';

// Locale资源类
class DemoLocalizations {
  bool isZh = false; // 是否为中文

  DemoLocalizations(this.isZh);

  // 为了使用方便，我们定义一个静态方法
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  // Locale相关值，title为应用标题
  String get titleRoute {
    return isZh ? '登录页面' : 'Logging Page';
  }
}
