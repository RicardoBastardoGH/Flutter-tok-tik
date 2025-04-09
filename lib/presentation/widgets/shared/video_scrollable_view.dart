import 'package:flutter/material.dart';
import 'package:tok_tik/domain/entities/video_post.dart';
import 'package:tok_tik/presentation/widgets/shared/video_buttons.dart';
import 'package:tok_tik/presentation/widgets/video/fullscreen_player.dart';


class VideoScrollableView extends StatelessWidget {

  /// A widget that displays a scrollable view of videos.
  /// This widget is typically used to show a list of videos in a scrollable format.
  
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder (
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      // onPageChanged: (index) {
      //   // Handle page change if needed
      // },
      itemBuilder: (context, index)  {
        final VideoPost videoPost = videos[index];
        return Stack(
          children: [
            // Video player + gradiente
            SizedBox.expand(
              child: FullscreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
            ),

            // Buttons to share, like, comment, etc.
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
            ),
          ],
        );
      },
    );
  }
}