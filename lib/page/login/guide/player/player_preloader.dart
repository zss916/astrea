import 'package:astrea/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPreloader {
  static final PlayerPreloader _instance = PlayerPreloader._internal();
  factory PlayerPreloader() => _instance;
  PlayerPreloader._internal();

  VideoPlayerController? _controller1;
  VideoPlayerController? _controller2;
  bool _isPreloaded = false;

  bool get isPreloaded => _isPreloaded;
  VideoPlayerController? get controller1 => _controller1;
  VideoPlayerController? get controller2 => _controller2;

  Future<void> preloadVideos() async {
    if (_isPreloaded) return;
    
    try {
      _controller1 = VideoPlayerController.asset(
        Assets.videoLoading1,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );
      
      _controller2 = VideoPlayerController.asset(
        Assets.videoLoading2,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      // 初始化两个视频控制器
      await Future.wait([
        _controller1!.initialize(),
        _controller2!.initialize(),
      ]);
      
      _isPreloaded = true;
      debugPrint('视频预加载完成');
    } catch (e) {
      debugPrint('视频预加载失败: $e');
      _disposeControllers();
    }
  }

  void _disposeControllers() {
    _controller1?.dispose();
    _controller2?.dispose();
    _controller1 = null;
    _controller2 = null;
    _isPreloaded = false;
  }

  void dispose() {
    _disposeControllers();
  }
}