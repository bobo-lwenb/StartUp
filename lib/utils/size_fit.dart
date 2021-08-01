import 'dart:ui';

/// 尺寸适配
class SizeFit {
  static SizeFit? _instance;

  factory SizeFit.instance() => _getInstance();

  SizeFit._internal();

  static SizeFit _getInstance() {
    if (_instance == null) {
      _instance = SizeFit._internal();
    }
    return _instance!;
  }

  late double ratio;
  late double ratiopx;

  /// design: 设计稿的物理宽度
  void init({double design = 750}) {
    double physicalWidth = window.physicalSize.width;

    ratio = window.devicePixelRatio;

    double ratioWidth = physicalWidth / ratio;

    ratiopx = ratioWidth / design;
  }

  double getRatiopx(double px) => ratiopx * px;

  double getPx(double ratioPX) => ratio * ratioPX;
}

extension DoubleFit on double {
  double get px => SizeFit.instance().getRatiopx(this);

  double get rpx => SizeFit.instance().getPx(this);
}

extension IntFit on int {
  double get px => SizeFit.instance().getRatiopx(this.toDouble());

  double get rpx => SizeFit.instance().getPx(this.toDouble());
}
