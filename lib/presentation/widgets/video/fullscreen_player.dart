import 'package:flutter/material.dart';
import 'package:tok_tik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;
  const FullscreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption,
  });

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {

  late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset( widget.videoUrl )
    // _controller = VideoPlayerController.network( widget.videoUrl )
      ..setLooping(true) // Set to true to loop the video  
      ..setVolume(0) // Set to 0 to mute the video
      ..play(); // Start playing the video


    // _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the VideoPlayerController when the widget is disposed.
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: _controller.initialize(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator( strokeWidth: 2,)
          );
        }
        return GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
              return;
            }  
              _controller.play();
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio, 
            child: Stack(
              children: [
                VideoPlayer(_controller),
                // Gradiente

                VideoBackground(),
          
                // Texto
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(
                    caption: widget.caption,
                  ),
                )
              ],
            )
            ),
        );
      } );
  }
  }

  
class _VideoCaption extends StatelessWidget {

  final String caption;
  
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: titleStyle, ),
    );
  }
}


