import 'package:flutter/material.dart';
import 'package:flutter_idiomas_1/widgets/youtube_short.dart';

class VideosScreen extends StatefulWidget{
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late final List<String> _videos;

  @override
  void initState() {
    super.initState();

    _videos = [
      "https://youtube.com/shorts/4HLPUo8FCXc?si=1oEZ3YUqV3oPb_YM",
      "https://youtube.com/shorts/tNl2jDPs6As?si=FNbGJ64gvC4T1HJB",
      "https://youtube.com/shorts/TxO8KVMgH7o?si=lQPr02E02DntiENS"
    ];    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _videos.length,
        itemBuilder: (context, index) {
          final url = _videos[index];
          return YoutubeShort(
            url: url,
          );
        }
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFC44A45),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      title: const Text(
        'Shorts',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}