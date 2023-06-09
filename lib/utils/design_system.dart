import 'package:flutter/material.dart';

class _Spacing {
  const _Spacing();

  double get x4 => 4;
  double get x6 => 6;
  double get x8 => 8;
  double get x12 => 12;
  double get x18 => 18;
  double get x24 => 24;
  double get x32 => 32;
  double get x42 => 42;
  double get x48 => 48;
  double get x64 => 64;
}

class _Border {
  const _Border();

  double get radius12 => 12;

  double get width05 => 0.5;
  double get width3 => 3;
  double get width8 => 8;
  double get width12 => 12;
}

class _Animation {
  const _Animation();

  Duration get defaultDurationMS250 => const Duration(milliseconds: 250);
}

enum Breakpoint {
  xsm,
  sm,
  md,
  lg,
  xl,
  xxl;

  double get width {
    return switch (this) {
      Breakpoint.xsm => 567,
      Breakpoint.sm => 768,
      Breakpoint.md => 992,
      Breakpoint.lg => 1200,
      Breakpoint.xl => 1400,
      Breakpoint.xxl => double.infinity,
    };
  }

  bool operator >(Breakpoint other) => index > other.index;
  bool operator >=(Breakpoint other) => index >= other.index;

  bool operator <(Breakpoint other) => index < other.index;
  bool operator <=(Breakpoint other) => index <= other.index;
}

sealed class DesignSystem {
  static const spacing = _Spacing();
  static const border = _Border();
  static const animation = _Animation();

  static const double opacityForBlur = 0.75;

  /// Taken from [CupertinoNavigationBar]
  static const double sigmaBlur = 10.0;

  static Breakpoint breakpoint({double? width, BuildContext? context}) {
    assert(width != null || context != null);
    final double size = width ?? MediaQuery.of(context!).size.width;
    return switch (true) {
      _ when size < Breakpoint.xsm.width => Breakpoint.xsm,
      _ when size < Breakpoint.sm.width => Breakpoint.sm,
      _ when size < Breakpoint.md.width => Breakpoint.md,
      _ when size < Breakpoint.lg.width => Breakpoint.lg,
      _ when size < Breakpoint.xl.width => Breakpoint.xl,
      _ => Breakpoint.xxl
    };
  }
}
