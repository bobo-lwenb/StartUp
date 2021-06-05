import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// RenderShiftedBox
/// 自定义用于对齐布局的渲染对象
class RenderMyAlign extends RenderShiftedBox {
  final AlignmentGeometry alignment;

  RenderMyAlign({
    this.alignment = Alignment.center,
    RenderBox child,
  }) : super(child);

  @override
  void performLayout() {
    /// 测量子级
    /// 父级向子级传递约束，子级必须服从给定的约束。
    /// parentUsesSize为true，表示父级依赖于子级的布局，子级布局改变，父级也要重新布局
    /// 反之，子级发生改变，不会通知父级。即父级不依赖子级
    child.layout(
      BoxConstraints(
        minWidth: 0,
        maxWidth: constraints.maxWidth,
        minHeight: 0,
        maxHeight: constraints.maxHeight,
      ),
      parentUsesSize: true,
    );

    /// 对子级进行布局
    /// 经过前测量后，可通过 child.size 拿到 child 测量后的大小
    /// 这里parentData即负责存储父节点所需要的子节点的布局信息
    final BoxParentData parentData = child.parentData;
    if (alignment == Alignment.center) {
      /// offset属性即用来设置子节点相对于父节点的位置
      parentData.offset = Offset(
        (constraints.maxWidth - child.size.width) / 2,
        (constraints.maxHeight - child.size.height) / 2,
      );
    } else {
      parentData.offset = Offset.zero;
    }

    /// 上面关于方位的计算，可以直接利用Alignment已经封装的功能
    // parentData.offset = (alignment as Alignment).alongOffset(
    //   Size(constraints.maxWidth, constraints.maxHeight) - child.size,
    // );

    /// 确定自己的尺寸
    size = Size(constraints.maxWidth, constraints.maxHeight);
  }
}

class MyAlign extends SingleChildRenderObjectWidget {
  final AlignmentGeometry alignment;

  MyAlign({
    Key key,
    this.alignment,
    Widget child,
  }) : super(key: key, child: child);

  @override
  SingleChildRenderObjectElement createElement() {
    // 使用默认实现即可
    return super.createElement();
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyAlign(alignment: alignment);
  }
}

/// RenderProxyBox
class RenderTouchHighlight extends RenderConstrainedBox {
  final Map<int, Offset> dots = <int, Offset>{};
  final Paint paints = Paint();

  RenderTouchHighlight()
      : super(additionalConstraints: const BoxConstraints.expand());

  /// 自身是否可进行命中检测
  @override
  bool hitTestSelf(Offset position) => true;

  /// 实现该方法用于处理事件
  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry entry) {
    if (entry is PointerDownEvent || entry is PointerMoveEvent) {
      dots[event.pointer] = event.position;
      markNeedsPaint();
    } else if (entry is PointerUpEvent || entry is PointerCancelEvent) {
      dots.remove(event.pointer);
      markNeedsPaint();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Canvas canvas = context.canvas;
    canvas.drawRect(offset & size, paints..color = Colors.grey);

    paints.color = Colors.redAccent[100];
    for (Offset dot in dots.values) {
      canvas.drawCircle(dot, 30, paints);
    }
  }
}

class TouchHighlight extends SingleChildRenderObjectWidget {
  TouchHighlight({
    Key key,
    Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) =>
      RenderTouchHighlight();
}
