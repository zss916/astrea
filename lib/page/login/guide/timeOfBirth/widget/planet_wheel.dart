import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:astrea/generated/assets.dart';

class PlanetWheel extends StatefulWidget {
  const PlanetWheel({super.key});

  @override
  State<PlanetWheel> createState() => _TestState();
}

class _TestState extends State<PlanetWheel> {
  final List<ui.Image?> _planetImages = List.filled(12, null);
  bool _imagesLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final planetAssets = [
      ///月亮
      Assets.imageMoon,

      ///太阳
      Assets.imageSun,

      ///水星
      Assets.imageMercury,

      ///金星
      Assets.imageVenus,

      ///冥王星
      Assets.imagePluto,

      ///木星
      Assets.imageJupiter,

      ///土星
      Assets.imageSaturn,

      ///天王星
      Assets.imageUranus,

      ///海王星
      Assets.imageNeptune,

      ///火星
      Assets.imageMars,

      ///金星
      Assets.imageVenus,

      ///水星
      Assets.imageMercury,
    ];

    for (int i = 0; i < planetAssets.length; i++) {
      final image = await _loadImage(planetAssets[i]);
      if (mounted) {
        setState(() {
          _planetImages[i] = image;
        });
      }
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
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: _imagesLoaded
            ? CustomPaint(
                painter: PlanetWheelPainter(planetImages: _planetImages),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class PlanetWheelPainter extends CustomPainter {
  final List<ui.Image?> planetImages;

  PlanetWheelPainter({required this.planetImages});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final innerRadius = radius * 0.7;

    // 绘制外圆和内圆
    final paint = Paint()
      ..color = const Color(0x4C585FC4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, innerRadius, paint);

    // 绘制分割线和行星图标
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

      canvas.drawLine(startPoint, endPoint, paint);

      // 绘制行星图标
      if (i < planetImages.length && planetImages[i] != null) {
        final symbolAngle = angle + (pi / 12); // 将图标放在扇形中间
        final symbolRadius = (radius + innerRadius) / 2;
        final symbolCenter = Offset(
          center.dx + symbolRadius * cos(symbolAngle),
          center.dy + symbolRadius * sin(symbolAngle),
        );

        final image = planetImages[i]!;
        final imageSize = 16.0;

        final srcRect = Rect.fromLTWH(
          0,
          0,
          image.width.toDouble(),
          image.height.toDouble(),
        );

        final dstRect = Rect.fromCenter(
          center: symbolCenter,
          width: imageSize,
          height: imageSize,
        );

        canvas.drawImageRect(image, srcRect, dstRect, Paint());
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
