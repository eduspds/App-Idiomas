import 'package:flutter/material.dart';
import 'package:flutter_idiomas_1/pages/tela_comofunciona.dart';
import 'tela_dashboard.dart'; // Tela de Dashboard
import '../services/auth_services.dart'; // Serviço de autenticação
import 'tela_trilhadeaprendizado.dart';
import 'tela_politicadeprivacidade.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _authService = AuthService(); // Instância do AuthService

  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        children: [
          Container(
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
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: _isDarkMode 
                    ? const Color.fromARGB(255, 7, 7, 7) 
                    : const Color.fromARGB(153, 239, 239, 239),
                image: DecorationImage(
                  image: AssetImage(
                    _isDarkMode ? 'lib/assets/darkbg.png' : 'lib/assets/iniciobg.png', 
                  ),
                  fit: BoxFit.cover,
                  colorFilter: _isDarkMode
                      ? const ColorFilter.mode(Colors.black54, BlendMode.darken)
                      : null,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/Fluentifylogo.png',
                      width: 180,
                      height: 180,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Bem-vindo ao Fluentify!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _isDarkMode ? Colors.white : const Color.fromARGB(255, 27, 27, 27),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildButton(
                      context,
                      'Como funciona?',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaComoFunciona(isDarkMode: _isDarkMode),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildButton(
                      context,
                      'Meu progresso',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildButton(
                      context,
                      'Trilha de Aprendizado',
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearningPath(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: _isDarkMode ? const Color.fromARGB(255, 27, 27, 27) : const Color(0xFFE0E0E0),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: _isDarkMode ? const Color.fromARGB(255, 27, 27, 27) : const Color(0xFFC44A45),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/vetor.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Bem-vindo!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _buildDrawerItem(Icons.person, 'Perfil', context, () => Navigator.pop(context)),
              _buildDrawerItem(Icons.help, 'Ajuda', context, () => Navigator.pop(context)),
              _buildDrawerItem(
                Icons.privacy_tip,
                'Políticas de Privacidade',
                context,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaPoliticadeprivacidade(isDarkMode: _isDarkMode),
                  ),
                ),
              ),
              _buildDrawerItem(
                Icons.settings,
                'Configurações',
                context,
                () => _showSettingsDialog(context),
              ),
              _buildDrawerItem(Icons.logout, 'Sair', context, () => _showLogoutDialog(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, VoidCallback onPressed) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.8,
      height: 45,
      decoration: BoxDecoration(
        color: _isDarkMode ? Colors.grey[800]?.withOpacity(0.9) : Colors.white.withOpacity(0.9),
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: _isDarkMode ? Colors.white : const Color.fromARGB(255, 27, 27, 27),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    BuildContext context,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: _isDarkMode ? Colors.white : const Color.fromARGB(255, 27, 27, 27)),
      title: Text(
        title,
        style: TextStyle(color: _isDarkMode ? Colors.white : const Color.fromARGB(255, 27, 27, 27)),
      ),
      onTap: onTap,
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Configurações"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Modo escuro:'),
              Switch(
                value: _isDarkMode,
                onChanged: (value) {
                  _toggleTheme(value);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar Logout"),
          content: const Text("Você tem certeza que deseja sair?"),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Sair"),
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await _authService.logoutUser();
                  Navigator.of(context).pushReplacementNamed('/login');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro ao fazer logout: $e'),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
