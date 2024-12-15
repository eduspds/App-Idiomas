import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_idiomas_1/Cubit/timer_cubit.dart';
import 'package:flutter_idiomas_1/pages/tela_videos.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_idiomas_1/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_idiomas_1/services/progress_service.dart';

class DashboardScreen extends StatefulWidget {
  final bool isDarkMode;
  final String userId;
  final String language;

  const DashboardScreen({super.key, required this.isDarkMode, required this.userId, required this.language});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late final TimerCubit _timerCubit;
  String? _currentLevel;

  @override
  void initState() {
    super.initState();
    _loadUserLevel();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _timerCubit = BlocProvider.of(context);
  }

    // Carrega o nível atual do usuário
  Future<void> _loadUserLevel() async {
    try {
      final level = await ProgressService().getCurrentUserLevel(widget.userId, widget.language);
      _showSnackBar('Nível carregado: $level');  
      setState(() {
        _currentLevel = level ?? "A1"; 
      });
    } catch (e) {
      _showSnackBar('Erro ao carregar nível atual: $e');
    }
  }

  // Atualiza o nível atual do usuário
  void refreshProgress() {
    _loadUserLevel();
  }

  void updateProgress() {
  setState(() {
    _loadUserLevel(); // Atualiza o nível
  });
  }

  void _showSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
  }


  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final String userId = user?.uid ?? ''; // Obtém o UID do usuário logado

    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.isDarkMode
                      ? 'lib/assets/darkbg.png'
                      : 'lib/assets/iniciobg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: _buildScrollView(),
            ),
          ),
        ],
      ),
      drawer: Cdrawer(
        isDarkMode: widget.isDarkMode,
        userId: userId,
        onThemeToggle: _toggleTheme,
      ),
    );
  }

  void _toggleTheme(bool value) {
    setState(() {
      widget.isDarkMode;
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor:
          widget.isDarkMode ? const Color(0xFFC44A45) : const Color(0xFFC44A45),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      title: Text(
        'Meu Progresso',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: widget.isDarkMode ? Colors.grey[300] : Colors.white,
        ),
      ),
    );
  }

  Widget _buildLateralMenu() {
    return Container(
      color: const Color(0xFFC44A45),
      width: 40,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScrollView() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildChartArea()),
        const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        SliverToBoxAdapter(child: _buildInfoArea()),
        const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
        SliverToBoxAdapter(child: _buildDailyWord()),
      ],
    );
  }

  Widget _buildChartArea() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        constraints: const BoxConstraints(minHeight: 69.0),
        decoration: BoxDecoration(
          color: widget.isDarkMode ? Colors.grey[800] : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          'lib/assets/chart.png',
        ),
      ),
    );
  }

  Widget _buildInfoArea() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: _buildPercentInfo(),
          ),
          const SizedBox(width: 16.0),
          Expanded(child: _buildVideoInfo()),
        ],
      ),
    );
  }

  Widget _buildPercentInfo() {
    return FutureBuilder<Map<String, dynamic>?>(
      future: ProgressService().loadCustomStudyProgress(
        widget.userId,
        _currentLevel ?? "A1", // Nível padrão caso não encontrado
        widget.language,
        "testeNivelamento",
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Erro ao carregar progresso",
              style: TextStyle(
                color: widget.isDarkMode ? Colors.grey[300] : Colors.black,
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(
            child: Text(
              "Nenhum progresso encontrado",
              style: TextStyle(
                color: widget.isDarkMode ? Colors.grey[300] : Colors.black,
              ),
            ),
          );
        } else {
          // Dados do progresso carregados
          final progressData = snapshot.data!;
          int questionsAnswered = progressData['questionsAnswered'] ?? 0;
          int totalScore = progressData['totalScore'] ?? 0;

          // Percentual baseado em um total fixo ou calculado
          int totalQuestions = progressData['totalQuestions'] ?? 10; // Obtido da API
          double percentage = (questionsAnswered / totalQuestions).clamp(0.0, 1.0);
              (questionsAnswered / totalQuestions).clamp(0.0, 1.0);

          return GestureDetector(
            onTap: () {},
            child: Container(
              constraints: const BoxConstraints(minHeight: 91.0),
              decoration: BoxDecoration(
                color: widget.isDarkMode ? Colors.grey[800] : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "DESEMPENHO ATUAL:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color:
                          widget.isDarkMode ? Colors.grey[300] : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  CircularPercentIndicator(
                    radius: 32,
                    lineWidth: 2.0,
                    percent: percentage,
                    progressColor:
                        widget.isDarkMode ? Colors.white : Colors.black,
                    backgroundColor: Colors.transparent,
                    center: Container(
                      height: double.infinity,
                      width: double.infinity,
                      margin: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: widget.isDarkMode
                            ? Colors.grey[700]
                            : const Color(0xffd5a03e),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "${(percentage * 100).toInt()}%",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: widget.isDarkMode
                              ? Colors.grey[300]
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "$questionsAnswered/${totalQuestions} perguntas"
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color:
                          widget.isDarkMode ? Colors.grey[300] : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Pontuação: $totalScore".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color:
                          widget.isDarkMode ? Colors.grey[300] : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildVideoInfo() {
    return Container(
      constraints: const BoxConstraints(minHeight: 91.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: widget.isDarkMode ? Colors.grey[800] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'lib/assets/flags.png',
          ),
          Positioned(
            top: 16,
            child: Text(
              "SHORTS",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.grey[300] : Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CupertinoButton(
              onPressed: _openVideoScreen,
              color: Colors.transparent,
              padding: EdgeInsets.zero,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyWord() {
    return Container(
      decoration: BoxDecoration(
        color: widget.isDarkMode ? Colors.grey[800] : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Palavra do Dia".toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode ? Colors.white : Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '"SERENDPITY"',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: widget.isDarkMode
                  ? const Color(0xFFAF4B46)
                  : const Color(0xFFAF4B46),
            ),
          ),
          const SizedBox(height: 8),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Significado: ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                TextSpan(
                  text: "Descoberta feliz ou inesperada, feita por acaso.",
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _openVideoScreen() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(),
        ),
      );
}
