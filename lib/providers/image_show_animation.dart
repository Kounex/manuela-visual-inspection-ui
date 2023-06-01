import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_show_animation.g.dart';

const int kImageShowAnimationBaseDurationMS = 10000;

@Riverpod(keepAlive: true)
class ImageShowAnimation extends _$ImageShowAnimation {
  @override
  int? build() => null;

  void setDurationMS(int durationMS) {
    state = durationMS;
  }
}
