import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_idiomas_1/Cubit/timer_cubit.dart';
import 'package:flutter_idiomas_1/pages/tela_videos.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter_idiomas_1/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  late final TimerCubit _timerCubit;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();

    _timerCubit = BlocProvider.of(context);
  }

  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/iniciobg.png'),
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
        isDarkMode: _isDarkMode,
        userId: userId,
        onThemeToggle: _toggleTheme,
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
        'Meu Progresso',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
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
        constraints: const BoxConstraints(
          minHeight: 69.0
        ),
        decoration: BoxDecoration(
          color: Colors.white,
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
          Expanded(
            child: _buildVideoInfo()
          ),
        ],
      ),
    );
  }

  Widget _buildPercentInfo() {
    return BlocBuilder<TimerCubit, int>(
      bloc: _timerCubit,
      builder: (context, currentMinutes) {
        const total = 10;

        int formattedMinutes = currentMinutes >= total ? total : currentMinutes;
        double percentage = formattedMinutes/total;

        return GestureDetector(
          onTap: () {},
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 91.0
            ),
            decoration: BoxDecoration(
              color: Colors.white,
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
                const Text(
                  "DESEMPENHO ATUAL:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 8.0),
                CircularPercentIndicator(
                  radius: 32,
                  lineWidth: 2.0,
                  percent: percentage,
                  progressColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  center: Container(
                    height: double.infinity,
                    width: double.infinity,
                    margin: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                      color: Color(0xffd5a03e),
                      shape: BoxShape.circle
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${(percentage * 100).toInt()}%",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  "$currentMinutes minuto${currentMinutes == 1 ? '': 's'}".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildVideoInfo() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 91.0,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
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
          const Positioned(
            top: 16,
            child: Text(
              "SHORTS",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold
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
                  shape: BoxShape.circle
                ),
                child: const Icon(
                  Icons.play_arrow,
                ),
              )
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDailyWord() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '"SERENDPITY"',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFAF4B46),
            ),
          ),
          const SizedBox(height: 8),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Significado: ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )
                ),
                TextSpan(
                  text: "Descoberta feliz ou inesperada, feita por acaso.",
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic
                  )
                )
              ]
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  void _openVideoScreen() => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const VideosScreen(),
    ),
  );
}
