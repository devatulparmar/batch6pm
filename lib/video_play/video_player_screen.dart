import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isVisibility = true;

  @override
  void initState() {
    super.initState();
    playVideo();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void playVideo() {
    try{
      _controller = VideoPlayerController.asset('assets/videos/sample.mp4');

      _controller.addListener(() {
        setState(() {});
      });
      _controller.setLooping(false);
      _controller.initialize().then((_) => setState(() {}));
      _controller.play();
      isVisibility = false;
    } catch (e){
      debugPrint('Error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: (){
          setState(() {
            isVisibility = !isVisibility;
          });
        },
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                color:_controller.value.isPlaying ? Colors.transparent : Colors.black,
                child: Opacity(
                  opacity: _controller.value.isPlaying ? 1 : 0.3,
                  child: VideoPlayer(_controller),
                ),
              ),
              Visibility(
                visible: isVisibility,
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Duration currentPosition = _controller.value.position;
                            Duration targetPosition = currentPosition + const Duration(seconds: -5);
                            _controller.seekTo(targetPosition);
                            _controller.value.isPlaying ? false :_controller.play();
                            isVisibility = false;
                          });
                        },
                        icon: const Icon(
                          Icons.fast_rewind,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if(_controller.value.isPlaying){
                              _controller.pause();
                            } else{
                              _controller.play();
                              isVisibility = false;
                            }
                          });
                        },
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 30),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Duration currentPosition = _controller.value.position;
                            Duration targetPosition = currentPosition + const Duration(seconds: 5);
                            _controller.seekTo(targetPosition);
                            _controller.value.isPlaying ? false :_controller.play();
                            isVisibility = false;
                          });
                        },
                        icon: const Icon(
                          Icons.fast_forward,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VideoProgressIndicator(_controller, allowScrubbing: true),
            ],
          ),
        ),
      ),
    );
  }
}
