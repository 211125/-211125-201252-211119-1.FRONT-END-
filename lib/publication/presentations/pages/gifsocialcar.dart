import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final List<String> videoUrls;

  const VideoPlayerScreen({Key? key, required this.videoUrls}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrls[_currentIndex]);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playNextVideo() {
    if (_currentIndex < widget.videoUrls.length - 1) {
      setState(() {
        _currentIndex++;
        _controller = VideoPlayerController.network(widget.videoUrls[_currentIndex]);
        _initializeVideoPlayerFuture = _controller.initialize();
        _controller.setLooping(true);
        _controller.play();
      });
    }
  }

  void _playPreviousVideo() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _controller = VideoPlayerController.network(widget.videoUrls[_currentIndex]);
        _initializeVideoPlayerFuture = _controller.initialize();
        _controller.setLooping(true);
        _controller.play();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GestureDetector(
                      onTap: () {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(_controller),
                          _controller.value.isPlaying
                              ? Container()
                              : Container(
                            color: Colors.black26,
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: _playPreviousVideo,
                  child: const Icon(
                    Icons.skip_previous,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: _playNextVideo,
                  child: const Icon(
                    Icons.skip_next,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
