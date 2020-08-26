import 'package:flutter/material.dart';

class InheritedModelDemo extends InheritedModel<String> {
  final int num1;
  final int num2;

  InheritedModelDemo({
    this.num1,
    this.num2,
    Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedModelDemo oldWidget) {
    return num1 != oldWidget.num1 || num2 != oldWidget.num2;
  }

  @override
  bool updateShouldNotifyDependent(InheritedModelDemo oldWidget, Set<String> dependencies) {
    return (num1 != oldWidget.num1 && dependencies.contains('num1')) ||
        (num2 != oldWidget.num2 && dependencies.contains('num2'));
  }

  static InheritedModelDemo of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<InheritedModelDemo>(context, aspect: aspect);
  }
}
