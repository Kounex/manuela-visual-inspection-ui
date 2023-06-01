import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../providers/image_show_animation.dart';

class ImageShowService {
  /// The baseline way of how to determine the current value of the image show
  /// animation duration by first checking the current provider value
  /// (which would be the most up to date once since it would only be
  /// populated manually by the user) and then checking the env value (if
  /// present) and otherwise fallback to the default value
  static int currentAnimationDurationMS(WidgetRef ref) =>
      ref.read(imageShowAnimationProvider) ??
      env.imageShowAnimationMS ??
      kImageShowAnimationBaseDurationMS;
}
