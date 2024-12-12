import 'package:flutter/material.dart';
import 'package:flutter_idiomas_1/pages/tela_comofunciona.dart';
import 'tela_dashboard.dart';
import '../services/auth_services.dart';
import 'tela_trilhadeaprendizado.dart';
import 'tela_perfil.dart';
import 'tela_politicadeprivacidade.dart';
import 'tela_ajuda.dart';

class Cdrawer extends StatelessWidget {
  final bool isDarkMode;
  final String userId;
  final Function(bool) onThemeToggle;

  const Cdrawer({
    Key? key,
    required this.isDarkMode,
    required this.userId,
    required this.onThemeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color.fromARGB(255, 27, 27, 27)
              : const Color(0xFFE0E0E0),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color.fromARGB(255, 27, 27, 27)
                    : const Color(0xFFC44A45),
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
                  const Text(
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
            _buildDrawerItem(
              context,
              Icons.person,
              'Perfil',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaPerfil(
                    isDarkMode: isDarkMode,
                    userId: userId,
                  ),
                ),
              ),
            ),
            _buildDrawerItem(
              context,
              Icons.help,
              'Ajuda',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaAjuda(isDarkMode: isDarkMode),
                ),
              ),
            ),
            _buildDrawerItem(
              context,
              Icons.privacy_tip,
              'Políticas de Privacidade',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaPoliticadeprivacidade(isDarkMode: isDarkMode),
                ),
              ),
            ),
            _buildDrawerItem(
              context,
              Icons.logout,
              'Sair',
              () => _showLogoutDialog(context),
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.dark_mode,
                color: isDarkMode
                    ? Colors.white
                    : const Color.fromARGB(255, 27, 27, 27),
              ),
              title: Text(
                'Modo escuro',
                style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : const Color.fromARGB(255, 27, 27, 27),
                ),
              ),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  onThemeToggle(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDarkMode ? Colors.white : const Color.fromARGB(255, 27, 27, 27),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDarkMode ? Colors.white : const Color.fromARGB(255, 27, 27, 27),
        ),
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final AuthService _authService = AuthService();
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
