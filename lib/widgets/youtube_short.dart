import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeShort extends StatefulWidget {
  final String url;

  const YoutubeShort({
    super.key,
    required this.url
  });

  @override
  State<YoutubeShort> createState() => _YoutubeShortState();
}

class _YoutubeShortState extends State<YoutubeShort> {
  late final YoutubePlayerController _controller;

  bool _popped = false;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.url);

    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        loop: true,
        mute: false,
        disableDragSeek: true,
        hideControls: true
      )
    );
    
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _popped = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        setState(() => _popped = true);
      },
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          aspectRatio: 1/1,
          controller: _controller,
          actionsPadding: const EdgeInsets.symmetric(vertical: 16.0),
          bottomActions: [
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                backgroundColor: Colors.grey.withOpacity(0.5),
                playedColor: Colors.red,
                handleColor: Colors.red,
                bufferedColor: Colors.red.withOpacity(0.25)
              ),
            ),
          ],
        ),
        builder: (context, player) {
          if (_popped) return const SizedBox();
          
          return SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: player
            )
          );
        }
      ),
    );
  }
}