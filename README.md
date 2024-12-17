# Fluentify

## Aplicativo de Aprendizado de Idiomas

Este é o projeto final desenvolvido para a disciplina de Programação de Aplicativos, no curso técnico em Desenvolvimento de Sistemas. Nosso grupo criou um aplicativo voltado para o aprendizado de idiomas, implementado com Flutter e utilizando o banco de dados Firebase para persistência de dados e autenticação.

## Equipe
- Eduardo Santos Pires de Souza
- Levi Figueredo Oliveira
- Iwin de Lima Borges
- Raynan Silva de Carvalho
- Silas Gabriel Pereira de Jesus

## Descrição do Projeto

O aplicativo tem como objetivo proporcionar uma experiência prática e personalizada no aprendizado de idiomas. Atualmente, oferece suporte para as trilhas de Português e Inglês, com uma trilha de Espanhol em desenvolvimento.  
Os usuários podem escolher entre começar do zero ou realizar um teste de nivelamento, que direciona para um plano de estudo baseado na proficiência alcançada.

## Principais Funcionalidades

### Cadastro e Autenticação:
- Login/cadastro com e-mail e senha.
- Login social via Google.

### Persistência de Dados:
- Utilizamos o Firebase para armazenar os dados do usuário e o progresso no aprendizado.

### Navegação e Design:
- Tela inicial com botões de navegação e menu lateral (drawer).
- Telas intuitivas e organizadas para facilitar o uso.

### Funcionalidades CRUD:
- Implementação de operações para adicionar, editar e excluir informações no banco de dados.

## Estrutura do Aplicativo

### Telas do Aplicativo:
- **Tela Inicial**: Navegação para as principais funcionalidades.
- **Tela de Cadastro**: Registro de novos usuários.
- **Tela de Login**: Acesso ao aplicativo via autenticação.
- **Dashboard**: Exibe o progresso do usuário e as opções de aprendizado.
- **Perfil**: Dados do usuário, com opção de edição.
- **Ajuda**: Suporte para dúvidas sobre o uso do app.
- **Recuperação de Senhas**: Recuperação de acesso em caso de senha esquecida.
- **Políticas de Privacidade**: Informações sobre o uso dos dados.
- **Tela de Estudo de Idiomas**: Permite acesso às trilhas de estudo e ao teste de nivelamento.

## Tecnologias Utilizadas
- **Linguagem**: Dart
- **Framework**: Flutter
- **Banco de Dados**: Firebase (Cloud Firestore)
- **Autenticação**: Firebase Auth

## Apresentação

O projeto será apresentado em um vídeo demonstrativo, explicando o processo de desenvolvimento, os desafios enfrentados e as funcionalidades implementadas.  
**Duração do Vídeo**: Máximo de 10 minutos.

### Conteúdo:
- Demonstração prática do aplicativo em funcionamento.
- Explicação sobre a arquitetura e as tecnologias utilizadas.

## Relatório

### Silas: Firebase

Silas foi responsável pela integração do Firebase no projeto, desempenhando um papel crucial na configuração do banco de dados em tempo real e no sistema de autenticação. Sua atuação incluiu:
- Configuração da infraestrutura de backend para suporte a usuários e armazenamento.
- Implementação das regras de segurança no Firebase para proteger dados sensíveis.
- Testes de conectividade e performance para garantir um backend robusto.

### Levi e Eduardo: Front-End e Relatório

A equipe de front-end foi dividida estrategicamente:
- **Eduardo** focou na criação das telas, organizando os componentes e layouts essenciais para a funcionalidade e navegação intuitiva:
  - Ajustes responsivos para diferentes tamanhos de tela.
  - Criou o esboço inicial da tela de cadastro, tela de início, de recuperação de senha.
  - Desenvolveu as telas de como funciona, ajuda, políticas de privacidade.
  - Desenvolveu as trilhas de aprendizado, com telas de comece do 0, teste de nivelamento e estudo personalizado, nos idiomas Português e Inglês.

- **Levi**, identificado pelos commits em IDs "Figuereds" e "GileadeTexeira", foi responsável pela estilização, garantindo que o design do app fosse agradável e consistente. Ele trabalhou na:
  - Escolha de paletas de cores, tipografia e espaçamento.
  - Refinamento da experiência visual para tornar o app esteticamente atraente.
  - Widget de navegação que permite que a tela da Dashboard seja “scrollavel”, oferecendo uma experiência mais fluida.

Além disso, Levi e Eduardo colaboraram na construção deste relatório, reunindo informações detalhadas sobre as atividades da equipe e organizando o progresso do projeto de forma clara e objetiva.

### Raynan e Iwin: Criação do Vídeo

Ambos colaboraram na produção de um vídeo promocional para apresentar o app. Suas atividades incluíram:
- **Raynan**: Planejamento do roteiro e narração, destacando as principais funcionalidades.
- **Iwin**: Edição e pós-produção, adicionando efeitos visuais e transições que refletissem a identidade do app.

### Raynan: Implementação do Login

Raynan também foi encarregado da implementação do sistema de login, conectando-o ao Firebase. Suas contribuições envolveram:
- Criação de interfaces de login e registro de usuários.
- Integração com o Firebase Authentication, oferecendo suporte a métodos como e-mail e senha.
- Testes para garantir que o login fosse funcional e seguro.
- Implementou a ferramenta de shorts, exibindo vídeos curtos pertinentes ao app de idiomas.

### Iwin: Implementação do Dark Mode

Iwin desenvolveu a funcionalidade de Dark Mode, uma característica essencial para melhorar a usabilidade do app. Ele realizou:
- A aplicação de temas dinâmicos, permitindo que os usuários alternem entre os modos claro e escuro.
- Testes para verificar a compatibilidade do Dark Mode com todos os componentes estilizados por Levi.
- Implementou o botão de Logout, permitindo que o usuário desconecte sua conta do App.

## Como Executar o Projeto



Como Executar o Projeto
Clone este repositório:

	git clone https://github.com/eduspds/App-Idiomas.git

Instale as dependências:

flutter pub get

Configure o Firebase no projeto seguindo as instruções no Firebase Console.

Execute o aplicativo:

flutter run
