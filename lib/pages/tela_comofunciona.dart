import 'package:flutter/material.dart';

class TelaComoFunciona extends StatefulWidget {
  final bool isDarkMode;
  const TelaComoFunciona({super.key, required this.isDarkMode});

  @override
  _TelaComoFuncionaState createState() => _TelaComoFuncionaState();
}

class _TelaComoFuncionaState extends State<TelaComoFunciona> {
  int currentIndex = 0;

  final List<Map<String, String>> contentList = [
    {
      "title": "Bem-vindo ao nosso aplicativo de aprendizado de idiomas!",
      "text":
          "Aqui, você vai encontrar uma forma prática e eficiente de aprender e testar seus conhecimentos de acordo com o Quadro Europeu Comum de Referência para Línguas (CEFR). Vamos explicar como funciona o nosso método e o processo para conquistar a sua certificação!",
      "image": "lib/assets/Fluentifylogo.png",
    },
    {
      "title": "O Quadro Europeu Comum de Referência para Línguas (CEFR)",
      "text":
          "O CEFR é uma estrutura internacional que avalia a proficiência linguística em seis níveis, indo do básico ao proficiente. Com esse sistema, podemos classificar seu nível de conhecimento de acordo com sua capacidade de compreensão e expressão na língua, além de facilitar o acompanhamento do seu progresso ao longo do aprendizado.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "Aqui estão os níveis de proficiência de acordo com o CEFR:",
      "text":
          "A1 (Iniciante): Você é capaz de compreender e usar expressões cotidianas e simples para satisfazer necessidades básicas. Pode se apresentar e fazer perguntas simples sobre si mesmo e outros.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "",
      "text":
          "A2 (Básico): Você compreende frases e expressões simples sobre áreas do cotidiano, como informações pessoais e familiares. Consegue comunicar-se em situações rotineiras que exigem uma troca de informações simples.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "",
      "text":
          "B1 (Intermediário): Você compreende as questões principais quando a linguagem é clara e os temas são familiares, como trabalho, escola e lazer. Consegue lidar com a maioria das situações no país onde a língua é falada e consegue falar de forma coerente sobre tópicos pessoais.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "",
      "text":
          "B2 (Usuário Independente): Você compreende as ideias principais em textos mais complexos e consegue se comunicar espontaneamente com falantes nativos, sem dificuldades. Consegue argumentar de forma clara e detalhada sobre temas diversos.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "",
      "text":
          "C1 (Proficiência Operativa Eficaz): Você compreende textos longos e exigentes, e pode expressar-se de forma fluente e espontânea, usando a língua de maneira flexível para fins sociais, acadêmicos e profissionais.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "",
      "text":
          "C2 (Domínio Pleno): Você compreende praticamente tudo o que ouve ou lê sem esforço. Consegue expressar-se de forma espontânea e fluente, com precisão, e distinguir variações sutis de significado em situações complexas.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "",
      "text":
          "Para garantir que você comece no nível adequado, oferecemos um teste de nivelamento inicial. Ele ajuda a identificar seu nível de proficiência e a adaptar as lições de acordo com suas necessidades. O teste é composto por questões práticas, que avaliam seu conhecimento atual do idioma.",
      "image": "lib/assets/SLIDE2.png",
    },
    {
      "title": "Metodologia do App",
      "text":
          "Nosso aplicativo adota uma metodologia interativa e dinâmica para tornar o aprendizado mais eficiente. A cada nível, você terá acesso a uma série de questões e atividades que testarão seus conhecimentos, de forma semelhante a testes de proficiência. A cada acerto, você avançará no conteúdo, e ao final de cada nível, será possível visualizar seu progresso.",
      "image": "lib/assets/METOD.png",
    },
    {
      "title": "Certificação",
      "text":
          "Após completar a trilha de aprendizado Comece do 0 e acertar pelo menos 60% das questões, você receberá um certificado digital. Este certificado comprova sua proficiência no idioma, conforme o nível alcançado de acordo com o CEFR.",
      "image": "lib/assets/CERTI.png",
    },
  ];

  void nextContent() {
    setState(() {
      if (currentIndex < contentList.length - 1) {
        currentIndex++;
      }
    });
  }

  void previousContent() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = widget.isDarkMode;

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
          'Como Funciona',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [
                    const Color(0xFF2B2B2B),
                    const Color(0xFF1E1E1E)
                  ] // Tons escuros
                : [
                    const Color(0xFFF5F5F5),
                    const Color(0xFFFFFFFF)
                  ], // Tons claros
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage(
              isDarkMode ? "lib/assets/darkbg.png" : "lib/assets/iniciobg.png",
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              isDarkMode
                  ? Colors.black.withOpacity(0.5)
                  : Colors.white.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
          child: Container(
            width: 350,
            height: 500,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF3A3A3A) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  contentList[currentIndex]["image"]!,
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 15),
                if (contentList[currentIndex]["title"]!.isNotEmpty)
                  Text(
                    contentList[currentIndex]["title"]!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 15),
                Text(
                  contentList[currentIndex]["text"]!,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentIndex > 0)
                      IconButton(
                        onPressed: previousContent,
                        icon: Icon(Icons.arrow_back,
                            color: isDarkMode ? Colors.white : Colors.red),
                      ),
                    if (currentIndex < contentList.length - 1)
                      IconButton(
                        onPressed: nextContent,
                        icon: Icon(Icons.arrow_forward,
                            color: isDarkMode ? Colors.white : Colors.red),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
