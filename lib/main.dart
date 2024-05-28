import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/aluno_login.dart';
import 'pages/professor/professor_login_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF042c2c),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'IMG/logo1.png',
                height: 100,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfessorLoginPage()),
                  );
                },
                 style: ButtonStyle(
                  // Definindo a altura do botão
                  minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
                  // Definindo a largura do botão
                  fixedSize: MaterialStateProperty.all<Size>(const Size(250, 50)),
                  // Definindo a cor de fundo do botão
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  // Definindo a cor do texto do botão
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text('Sou Professor'),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlunoLoginPage()),
                  );
                },
                style: ButtonStyle(
                  // Definindo a altura do botão
                  minimumSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
                  // Definindo a largura do botão
                  fixedSize: MaterialStateProperty.all<Size>(const Size(250, 50)),
                  // Definindo a cor de fundo do botão
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  // Definindo a cor do texto do botão
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                child: const Text('Sou Aluno'),
              ),
            ],
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
