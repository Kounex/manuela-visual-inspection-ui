import 'package:manuela_visual_inspection_ui/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mock_mode.g.dart';

const int kImageShowAnimationBaseDurationMS = 10000;

@Riverpod(keepAlive: true)
class MockMode extends _$MockMode {
  @override
  bool build() => env.mockMode ?? Uri.base.host.contains('localhost');

  void setMockMode(bool mockMode) {
    state = mockMode;
  }
}
