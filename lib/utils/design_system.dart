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

  static Breakpoint breakpoint(double width) {
    return switch (width) {
      _ when width < Breakpoint.xsm.width => Breakpoint.xsm,
      _ when width < Breakpoint.sm.width => Breakpoint.sm,
      _ when width < Breakpoint.md.width => Breakpoint.md,
      _ when width < Breakpoint.lg.width => Breakpoint.lg,
      _ when width < Breakpoint.xl.width => Breakpoint.xl,
      _ => Breakpoint.xxl
    };
  }
}
