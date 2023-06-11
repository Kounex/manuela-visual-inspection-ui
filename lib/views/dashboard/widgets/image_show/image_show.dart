import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manuela_visual_inspection_ui/views/dashboard/widgets/image_show/yolo_animated_overlay.dart';

import '../../../../types/classes/yolo_image.dart';
import '../../providers/yolo_images.dart';

class ImageShow extends ConsumerStatefulWidget {
  const ImageShow({super.key});

  @override
  ConsumerState<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends ConsumerState<ImageShow>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey _imageBoxKey = GlobalKey();
  final LayerLink _link = LayerLink();

  final List<OverlayEntry> _currentEntries = [];

  @override
  bool get wantKeepAlive => true;

  void _addImageOverlay(YOLOImage image) {
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => YOLOAnimatedOverlay(
        link: _link,
        image: image,
        onComplete: (_) {
          entry.remove();
          _currentEntries.remove(entry);
        },
      ),
    );
    Overlay.of(context).insert(entry);
    _currentEntries.add(entry);
  }

  @override
  void dispose() {
    for (var entry in _currentEntries) {
      entry.remove();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final yoloImage = ref.watch(yOLOImagesStreamProvider());

    ref.listen(yOLOImagesStreamProvider(), (previous, next) {
      next.whenData((image) {
        ref.read(yOLOImagesProvider.notifier).addImage(image);

        _addImageOverlay(image);
      });
    });

    return CompositedTransformTarget(
      link: _link,
      child: NotificationListener<SizeChangedLayoutNotification>(
        // onNotification: (notification) {
        //   if (_entry.mounted) {
        //     SchedulerBinding.instance.addPostFrameCallback((_) {
        //       _entry.markNeedsBuild();
        //     });
        //   }
        //   return true;
        // },
        child: SizeChangedLayoutNotifier(
          child: Container(
            key: _imageBoxKey,
            alignment: Alignment.center,
            height: min(500, MediaQuery.of(context).size.height / 3),
            width: double.infinity,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            child: yoloImage.when(
              data: (image) {
                return const SizedBox();
              },
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Text(
                '${error.toString()}\n\n${stackTrace.toString()}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
