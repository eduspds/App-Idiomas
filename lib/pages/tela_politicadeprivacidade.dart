import 'package:flutter/material.dart';

class TelaPoliticadeprivacidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC44A45),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/iniciobg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Política de Privacidade',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'O Fluentify valoriza a sua privacidade e se compromete a proteger as suas informações pessoais. Esta Política de Privacidade explica como coletamos, usamos, armazenamos e protegemos os seus dados, de acordo com a Lei Geral de Proteção de Dados (LGPD) e as melhores práticas de segurança.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Coleta de Dados Pessoais',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ao usar nosso aplicativo, coletamos dados pessoais que você fornece diretamente, como seu nome, e-mail e informações de login (caso você escolha se autenticar com e-mail/senha, Google ou Facebook). Utilizamos o Firebase Authentication para gerenciar o processo de login de forma segura e eficiente.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Uso dos Dados',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'Os dados coletados são usados exclusivamente para fornecer e melhorar os serviços oferecidos pelo nosso aplicativo, visando personalização da experiência de aprendizado. Não compartilhamos seus dados com terceiros sem o seu consentimento, exceto quando exigido por lei ou para cumprir com obrigações legais.'),
                    SizedBox(height: 20),
                    Text(
                      'Segurança dos Dados',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'Empregamos medidas de segurança adequadas para proteger suas informações pessoais, como criptografia e autenticação segura, utilizando as funcionalidades do Firebase Cloud. '),
                    SizedBox(height: 20),
                    Text(
                      'Armazenamento de Dados',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Os dados pessoais coletados são armazenados no Firebase, um serviço de nuvem seguro fornecido pelo Google. Os dados podem ser armazenados por um período determinado pela necessidade de cumprimento das finalidades para as quais foram coletados.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Seus Direitos',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'De acordo com a LGPD, você tem direito de acessar, corrigir ou excluir seus dados pessoais a qualquer momento. Caso deseje exercer esses direitos, entre em contato conosco através do portal de ajuda. '),
                    SizedBox(height: 20),
                    Text(
                      'Alterações na Política de Privacidade',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                        'Nos reservamos o direito de modificar esta Política de Privacidade a qualquer momento. Quando isso ocorrer, a versão atualizada será disponibilizada no aplicativo e será efetiva imediatamente após sua publicação.'),
                    SizedBox(height: 20),
                    Text('Consentimento',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(
                        'Ao usar nosso aplicativo, voce concorda com a coleta e uso de seus dados pessoais conforme descrito nesta Política de Privacidade.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
