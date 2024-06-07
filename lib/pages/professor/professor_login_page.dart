import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importar para acessar arquivos locais
import 'package:flutter_application_1/banco/test_conexao.dart';
import 'package:flutter_application_1/main.dart';
import 'main_page_professor.dart';

class ProfessorLoginPage extends StatefulWidget {
  ProfessorLoginPage({super.key});

  @override
  _ProfessorLoginPageState createState() => _ProfessorLoginPageState();
}

class _ProfessorLoginPageState extends State<ProfessorLoginPage> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  List<dynamic> professores = [];

  @override
  void initState() {
    super.initState();
    _carregarProfessores();
  }

  Future<void> _carregarProfessores() async {
    // Ler o arquivo JSON
    String jsonString =
        await rootBundle.loadString('assets/Projeto_integrador.Professor.json');
    // Converter o JSON em lista de mapas
    setState(() {
      professores = json.decode(jsonString);
    });
  }

  void _realizarLogin() {
    String login = _loginController.text;
    String senha = _senhaController.text;

    // Verificar se as credenciais correspondem a algum professor
    dynamic professor = professores.firstWhere(
      (prof) => prof['Login'] == login && prof['Senha'] == senha,
      orElse: () => null,
    );

    if (professor != null) {
      // Navegar para a página principal do professor
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPageProfessor(
            nomeProfessor: professor['Nome'],
          ),
        ),
      );
    } else {
      // Exibir mensagem de erro caso as credenciais sejam inválidas
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de Login'),
          content: Text('Credenciais inválidas. Por favor, tente novamente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login do Professor'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyApp()), // Substitua MyApp() pelo nome correto da sua página inicial
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove a sombra da AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 83, 83),
              Color.fromARGB(255, 10, 100, 100),
              Color.fromARGB(255, 6, 136, 136),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  './assets/img/logo1.png',
                  height: 100,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Login do Professor',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Cor do texto
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    controller: _loginController,
                    decoration: InputDecoration(
                      hintText: 'Seu Login',
                      filled: true,
                      fillColor: Colors.white, // Cor do fundo do campo de texto
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    controller: _senhaController,
                    decoration: InputDecoration(
                      hintText: 'Sua Senha',
                      filled: true,
                      fillColor: Colors.white, // Cor do fundo do campo de texto
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _realizarLogin,
                  style: ElevatedButton.styleFrom(
                    // Definindo a altura do botão
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(150, 50),
                  ),
                  icon: Icon(Icons.login), // Adicionando ícone ao botão
                  label: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white), // Cor do texto
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MaterialApp(
    home: ProfessorLoginPage(),
  ));
}
