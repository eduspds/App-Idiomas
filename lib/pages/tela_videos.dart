import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  List<String> videoPaths = [
    'lib/assets/Ingles1.mp4',
    'lib/assets/Portugues1.mp4',
  ];
  int currentVideoIndex = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  void _loadVideo() {
    _controller = VideoPlayerController.asset(videoPaths[currentVideoIndex])
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  void _nextVideo() {
    setState(() {
      currentVideoIndex = (currentVideoIndex + 1) % videoPaths.length;
      _loadVideo(); // Carrega o próximo vídeo
    });
  }

  void _previousVideo() {
    setState(() {
      currentVideoIndex = (currentVideoIndex - 1 + videoPaths.length) % videoPaths.length; // Vai para o vídeo anterior
      _loadVideo(); // Carrega o vídeo anterior
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Pegando a largura e altura da tela
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Video Player',
          style: TextStyle(color: Colors.white),  // Cor branca para o nome na AppBar
        ),
        backgroundColor: const Color(0xFFAF4B46), // Cor vermelha para a AppBar
      ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            // Arraste para cima (deslizar para cima)
            _nextVideo();  // Carrega o próximo vídeo
          } else if (details.primaryVelocity! > 0) {
            // Arraste para baixo (deslizar para baixo)
            _previousVideo();  // Carrega o vídeo anterior
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Verifica se o vídeo foi inicializado e exibe o player com o aspecto adequado
              _controller.value.isInitialized
                  ? Container(
                      width: screenWidth,  // Ajusta a largura para a largura da tela
                      height: screenHeight * 0.91,  // Ajusta a altura para 60% da tela
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
