import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/providers/mock_mode.dart';

class MockModeSwitch extends ConsumerWidget {
  const MockModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mockMode = ref.watch(mockModeProvider);

    return SwitchListTile(
      value: mockMode,
      title: const Text('Mock Mode'),
      onChanged: (mockMode) =>
          ref.read(mockModeProvider.notifier).setMockMode(mockMode),
    );
  }
}
