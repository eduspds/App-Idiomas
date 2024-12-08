import 'package:flutter/material.dart';

class TelaComoFunciona extends StatelessWidget {
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
          'Como Funciona',
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
                    const Text(
                      'Como Funciona',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
                      'Bem-vindo ao nosso aplicativo de aprendizado de idiomas!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Aqui, você vai encontrar uma forma prática e eficiente de aprender e testar seus conhecimentos de acordo com o Quadro Europeu Comum de Referência para Línguas (CEFR). Vamos explicar como funciona o nosso método e o processo para conquistar a sua certificação!',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'O Quadro Europeu Comum de Referência para Línguas (CEFR)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'O CEFR é uma estrutura internacional que avalia a proficiência linguística em seis níveis, indo do básico ao proficiente. Com esse sistema, podemos classificar seu nível de conhecimento de acordo com sua capacidade de compreensão e expressão na língua, além de facilitar o acompanhamento do seu progresso ao longo do aprendizado.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Aqui estão os níveis de proficiência de acordo com o CEFR:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('A — Básico'),
                    Text(
                        'A1 (Iniciante): Você é capaz de compreender e usar expressões cotidianas e simples para satisfazer necessidades básicas. Pode se apresentar e fazer perguntas simples sobre si mesmo e outros.'),
                    Text(
                        'A2 (Básico): Você compreende frases e expressões simples sobre áreas do cotidiano, como informações pessoais e familiares. Consegue comunicar-se em situações rotineiras que exigem uma troca de informações simples.'),
                    SizedBox(height: 10),
                    Text('B — Independente'),
                    Text(
                        'B1 (Intermediário): Você compreende as questões principais quando a linguagem é clara e os temas são familiares, como trabalho, escola e lazer. Consegue lidar com a maioria das situações no país onde a língua é falada e consegue falar de forma coerente sobre tópicos pessoais.'),
                    Text(
                        'B2 (Usuário Independente): Você compreende as ideias principais em textos mais complexos e consegue se comunicar espontaneamente com falantes nativos, sem dificuldades. Consegue argumentar de forma clara e detalhada sobre temas diversos.'),
                    SizedBox(height: 10),
                    Text('C — Proficiente'),
                    Text(
                        'C1 (Proficiência Operativa Eficaz): Você compreende textos longos e exigentes, e pode expressar-se de forma fluente e espontânea, usando a língua de maneira flexível para fins sociais, acadêmicos e profissionais.'),
                    Text(
                        'C2 (Domínio Pleno): Você compreende praticamente tudo o que ouve ou lê sem esforço. Consegue expressar-se de forma espontânea e fluente, com precisão, e distinguir variações sutis de significado em situações complexas.'),
                    SizedBox(height: 20),
                    Text(
                      'O Teste de Nivelamento',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Para garantir que você comece no nível adequado, oferecemos um teste de nivelamento inicial. Ele ajuda a identificar seu nível de proficiência e a adaptar as lições de acordo com suas necessidades. O teste é composto por questões práticas, que avaliam seu conhecimento atual do idioma.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Metodologia do App',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Nosso aplicativo adota uma metodologia interativa e dinâmica para tornar o aprendizado mais eficiente. A cada nível, você terá acesso a uma série de questões e atividades que testarão seus conhecimentos, de forma semelhante a testes de proficiência. A cada acerto, você avançará no conteúdo, e ao final de cada nível, será possível visualizar seu progresso.',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Certificação',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Após completar um nível e acertar pelo menos 7 questões no teste final de cada nível, você receberá um certificado digital. Este certificado será gerado automaticamente em formato PDF e estará disponível para você fazer o download. Ele comprova sua proficiência no idioma, conforme o nível alcançado de acordo com o CEFR.',
                    ),
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
