import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/aluno_login.dart';
import 'package:flutter_application_1/pages/professor/professor_login_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  './assets/img/logo1.png',
                  height: 100,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfessorLoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // Definindo a altura do botão
                    minimumSize: Size(100, 50),
                    // Definindo a largura do botão
                    fixedSize: Size(250, 50),
                    // Definindo a cor de fundo do botão
                    backgroundColor: Colors.white,
                    // Definindo a cor do texto do botão
                    foregroundColor: Colors.black,
                  ),
                  icon: Icon(Icons.school), // Ícone para "Sou Professor"
                  label: const Text('Sou Professor'),
                ),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlunoLoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // Definindo a altura do botão
                    minimumSize: Size(150, 50),
                    // Definindo a largura do botão
                    fixedSize: Size(250, 50),
                    // Definindo a cor de fundo do botão
                    backgroundColor: Colors.white,
                    // Definindo a cor do texto do botão
                    foregroundColor: Colors.black,
                  ),
                  icon: Icon(Icons.person), // Ícone para "Sou Aluno"
                  label: const Text('Sou Aluno'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
