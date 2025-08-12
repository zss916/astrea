import 'package:astrea/core/setting/global.dart';
import 'package:astrea/generated/assets.dart';
import 'package:astrea/page/login/guide/player/player_preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controller2;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    // 使用预加载的控制器或创建新的控制器
    final preloader = PlayerPreloader();
    if (preloader.isPreloaded &&
        preloader.controller1 != null &&
        preloader.controller2 != null) {
      _controller = preloader.controller1!;
      _controller2 = preloader.controller2!;
      _playVideos();
    } else {
      _controller =
          VideoPlayerController.asset(
              Assets.videoLoading1,
              videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
            )
            ..initialize().then((_) {
              _playVideos();
            });

      _controller2 =
          VideoPlayerController.asset(
              Assets.videoLoading2,
              videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
            )
            ..initialize().then((_) {
              setState(() {});
            });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(listener);
    // 不要在这里释放控制器，因为它们可能被预加载器持有
    // 只有在确定不是预加载的控制器时才释放
    if (!PlayerPreloader().isPreloaded) {
      _controller.dispose();
      _controller2.dispose();
    }
    super.dispose();
  }

  void _playVideos() {
    setState(() {});
    _controller.play();
    _controller.addListener(listener);
  }

  VoidCallback get listener => () {
    if (_controller.value.position >= _controller.value.duration) {
      _controller.pause();
      _controller2.play();
      _controller2.setLooping(true);
      setState(() {
        isVisible = true;
      });
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
        leading: const SizedBox.shrink(),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          if (_controller.value.isInitialized)
            Positioned.fill(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double w = constraints.maxWidth;
                  double h = constraints.maxHeight;
                  double scaleX = (designWidth >= w)
                      ? (designWidth / w)
                      : (w / designWidth);
                  double scaleY = (designHeight >= h)
                      ? (designHeight / h)
                      : (h / designHeight);
                  return Transform.scale(
                    scaleX: scaleX,
                    scaleY: scaleY,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  );
                },
              ),
            ),

          if (_controller2.value.isInitialized)
            Positioned.fill(
              child: Visibility(
                visible: isVisible,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double w = constraints.maxWidth;
                    double h = constraints.maxHeight;
                    double scaleX = (designWidth >= w)
                        ? (designWidth / w)
                        : (w / designWidth);
                    double scaleY = (designHeight >= h)
                        ? (designHeight / h)
                        : (h / designHeight);
                    return Transform.scale(
                      scaleX: scaleX,
                      scaleY: scaleY,
                      child: AspectRatio(
                        aspectRatio: _controller2.value.aspectRatio,
                        child: VideoPlayer(_controller2),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
