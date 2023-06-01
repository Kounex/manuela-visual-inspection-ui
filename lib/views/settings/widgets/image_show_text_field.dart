import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/services/image_show.dart';

import '../../../providers/image_show_animation.dart';

class ImageShowTextField extends ConsumerStatefulWidget {
  const ImageShowTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImageShowDurationTextFieldState();
}

class _ImageShowDurationTextFieldState
    extends ConsumerState<ImageShowTextField> {
  late TextEditingController _controller;
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
      text: ImageShowService.currentAnimationDurationMS(ref).toString(),
    );

    _focus.addListener(() {
      if (!_focus.hasFocus) {
        int? newValue = int.tryParse(_controller.text);
        if (newValue != null &&
            newValue != ref.read(imageShowAnimationProvider) &&
            newValue >= 2000) {
          ref.read(imageShowAnimationProvider.notifier).setDurationMS(newValue);
        } else {
          _controller.text =
              ImageShowService.currentAnimationDurationMS(ref).toString();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Image Show Animation Duration'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 192,
            child: TextField(
              controller: _controller,
              focusNode: _focus,
              maxLength: 5,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                isDense: true,
                filled: true,
                counterText: '',
                suffixText: 'milliseconds',
              ),
            ),
          ),
          // SizedBox(width: DesignSystem.spacing.x12),
          // const Text('milliseconds'),
        ],
      ),
    );
  }
}
