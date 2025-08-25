import 'package:flutter/cupertino.dart';

//https://img0.baidu.com/it/u=344304595,187162526&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1280
class FrameImage extends StatelessWidget {
  final String url;
  const FrameImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      frameBuilder: (ctx, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child; // 同步加载（如缓存命中）
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1, // 渐显效果
          duration: const Duration(milliseconds: 300),
          child: child,
        );
      },
    );
  }
}
