import 'package:flutter/material.dart';

class TelaPoliticadeprivacidade extends StatelessWidget {
  final bool isDarkMode;

  const TelaPoliticadeprivacidade({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC44A45),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Políticas de Privacidade',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(isDarkMode ? 'lib/assets/darkbg.png' : 'lib/assets/iniciobg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          if (isDarkMode)
            Container(
              color: const Color.fromARGB(255, 27, 27, 27).withOpacity(0.85), 
            ),
          
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/assets/Fluentifylogo.png',
                        width: 180,
                        height: 180,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.grey[850]
                        : Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Política de Privacidade',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'O Fluentify valoriza a sua privacidade e se compromete a proteger as suas informações pessoais. Esta Política de Privacidade explica como coletamos, usamos, armazenamos e protegemos os seus dados, de acordo com a Lei Geral de Proteção de Dados (LGPD) e as melhores práticas de segurança.',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Coleta de Dados Pessoais',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Ao usar nosso aplicativo, coletamos dados pessoais que você fornece diretamente, como seu nome, e-mail e informações de login (caso você escolha se autenticar com e-mail/senha, Google ou Facebook). Utilizamos o Firebase Authentication para gerenciar o processo de login de forma segura e eficiente.',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Uso dos Dados',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Os dados coletados são usados exclusivamente para fornecer e melhorar os serviços oferecidos pelo nosso aplicativo, visando personalização da experiência de aprendizado. Não compartilhamos seus dados com terceiros sem o seu consentimento, exceto quando exigido por lei ou para cumprir com obrigações legais.',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Segurança dos Dados',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Empregamos medidas de segurança adequadas para proteger suas informações pessoais, como criptografia e autenticação segura, utilizando as funcionalidades do Firebase Cloud.',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Armazenamento de Dados',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Os dados pessoais coletados são armazenados no Firebase, um serviço de nuvem seguro fornecido pelo Google. Os dados podem ser armazenados por um período determinado pela necessidade de cumprimento das finalidades para as quais foram coletados.',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Seus Direitos',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'De acordo com a LGPD, você tem direito de acessar, corrigir ou excluir seus dados pessoais a qualquer momento. Caso deseje exercer esses direitos, entre em contato conosco através do portal de ajuda.',
                        style: TextStyle(
                          color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                      ),
                      const SizedBox(height: 10),
                    Text(
                        'Nos reservamos o direito de modificar esta Política de Privacidade a qualquer momento. Quando isso ocorrer, a versão atualizada será disponibilizada no aplicativo e será efetiva imediatamente após sua publicação.',
                        style: TextStyle(
                            color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                    ),
                    const SizedBox(height: 20),
                    Text('Consentimento',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                            color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        'Ao usar nosso aplicativo, voce concorda com a coleta e uso de seus dados pessoais conforme descrito nesta Política de Privacidade.',
                         style: TextStyle(
                            color: isDarkMode
                              ? Colors.white
                              : const Color.fromARGB(255, 27, 27, 27),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ]
      ),
    );
  }
}