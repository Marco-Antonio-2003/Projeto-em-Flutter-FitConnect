import 'package:flutter/material.dart';
import 'main_page_professor.dart'; // Importação corrigida

class ProfessorLoginPage extends StatefulWidget {
  ProfessorLoginPage({super.key});

  @override
  State<ProfessorLoginPage> createState() => _ProfessorLoginPageState();
}

class _ProfessorLoginPageState extends State<ProfessorLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 83, 83),
              Color.fromARGB(255, 10, 100, 100),
              Color.fromARGB(255, 6, 136, 136)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
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
                child: const TextField(
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
                child: const TextField(
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
                onPressed: () {
                  // Navegar para a página principal do professor
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPageProfessor(
                        nomeProfessor: 'Nome do Professor',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // Definindo a altura do botão
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
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
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfessorLoginPage(),
  ));
}
