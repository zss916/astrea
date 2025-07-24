import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';

class ZodiacWheel extends StatefulWidget {
  final double size;
  // final Function(int)? onZodiacSelected;
  final int? selectedZodiac;

  const ZodiacWheel({
    Key? key,
    this.size = 300,
    //this.onZodiacSelected,
    this.selectedZodiac,
  }) : super(key: key);

  @override
  State<ZodiacWheel> createState() => _ZodiacWheelState();
}

class _ZodiacWheelState extends State<ZodiacWheel> {
  final List<ui.Image?> _zodiacImages = List.filled(12, null);
  bool _imagesLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final zodiacAssets = [
      Assets.imageAries, // 白羊座
      Assets.imageTaurus, // 金牛座
      Assets.imageGemini, // 双子座
      Assets.imageCancer, // 巨蟹座
      Assets.imageLeo, // 狮子座
      Assets.imageVirgo, // 处女座
      Assets.imageLibra, // 天秤座
      Assets.imageScorpio, // 天蝎座
      Assets.imageSagittarius, // 射手座
      Assets.imageCapricorn, // 摩羯座
      Assets.imageAquarius, // 水瓶座
      Assets.imagePisces, // 双鱼座
    ];

    for (int i = 0; i < zodiacAssets.length; i++) {
      final image = await _loadImage(zodiacAssets[i]);
      _zodiacImages[i] = image;
    }

    if (mounted) {
      setState(() {
        _imagesLoaded = true;
      });
    }
  }

  Future<ui.Image> _loadImage(String assetPath) async {
    final imageProvider = AssetImage(assetPath);
    final imageStream = imageProvider.resolve(ImageConfiguration());
    final completer = Completer<ui.Image>();

    final listener = ImageStreamListener(
      (info, _) {
        completer.complete(info.image);
      },
      onError: (exception, stackTrace) {
        completer.completeError(exception);
      },
    );

    imageStream.addListener(listener);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: _imagesLoaded
          ? SizedBox(
              width: widget.size,
              height: widget.size,
              child: CustomPaint(
                painter: ZodiacWheelPainter(
                  selectedZodiac: widget.selectedZodiac,
                  zodiacImages: _zodiacImages,
                ),
              ),
            )
          : SizedBox(width: widget.size, height: widget.size),
    );
  }
}

class ZodiacWheelPainter extends CustomPainter {
  final int? selectedZodiac;
  final List<ui.Image?> zodiacImages;

  ZodiacWheelPainter({this.selectedZodiac, required this.zodiacImages});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final innerRadius = radius * 0.7;

    // 绘制外圆
    final outerCirclePaint = Paint()
      ..color = Color(0x4C585FC4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(center, radius, outerCirclePaint);

    // 绘制内圆
    canvas.drawCircle(center, innerRadius, outerCirclePaint);

    for (int i = 0; i < 12; i++) {
      final angle = (i * 2 * pi / 12);

      // 绘制分割线
      final startPoint = Offset(
        center.dx + innerRadius * cos(angle),
        center.dy + innerRadius * sin(angle),
      );

      final endPoint = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      canvas.drawLine(startPoint, endPoint, outerCirclePaint);

      // 绘制星座图片
      final symbolAngle = (i * 2 * pi / 12) + (pi / 12);
      final symbolRadius = (radius + innerRadius) / 2;
      final symbolPoint = Offset(
        center.dx + symbolRadius * cos(symbolAngle),
        center.dy + symbolRadius * sin(symbolAngle),
      );

      final image = zodiacImages[i];
      if (image != null) {
        final imageSize = 24.0; // 图片大小

        // 保存当前画布状态
        canvas.save();

        // 将画布原点移动到图片应该放置的位置
        canvas.translate(symbolPoint.dx, symbolPoint.dy);

        // 旋转画布，使图片垂直于中心方向
        // 计算旋转角度：symbolAngle + pi/2 使图片垂直于半径方向
        canvas.rotate(symbolAngle + pi / 2);

        // 绘制图片，注意此时坐标系已经变换，所以图片绘制在原点(0,0)，并向左右平移一半宽度使其居中
        final srcRect = Rect.fromLTWH(
          0,
          0,
          image.width.toDouble(),
          image.height.toDouble(),
        );

        final dstRect = Rect.fromCenter(
          center: Offset.zero, // 因为已经平移了画布，所以这里使用原点
          width: imageSize,
          height: imageSize,
        );

        final paint = Paint();
        if (selectedZodiac == i) {
          paint.colorFilter = ColorFilter.mode(
            Color(0xFF6F4DFF),
            BlendMode.srcATop,
          );
        }

        canvas.drawImageRect(image, srcRect, dstRect, paint);

        // 恢复画布状态
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is ZodiacWheelPainter) {
      return oldDelegate.selectedZodiac != selectedZodiac;
    }
    return true;
  }
}
