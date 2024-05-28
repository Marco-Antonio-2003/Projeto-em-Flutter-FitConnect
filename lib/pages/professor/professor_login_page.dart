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
      backgroundColor: const Color(0xFF042c2c), // Mesma cor de fundo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'IMG/logo1.png',
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
            ElevatedButton(
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
             style: ButtonStyle(
                // Definindo a altura do botão
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(150, 50)),
                // Definindo a largura do botão
                fixedSize: MaterialStateProperty.all<Size>(const Size(150, 50)),
                // Definindo a cor de fundo do botão
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                // Definindo a cor do texto do botão
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
            ),
            const SizedBox(height: 10),
            // TextButton(
            //   onPressed: () {
            //     // Navegar para a página principal do professor sem fazer login
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => MainPageProfessor(
            //           nomeProfessor: 'Nome do Professor',
            //         ),
            //       ),
            //     );
            //   },
            //   child: const Text(
            //     'Entrar sem conta mesmo',
            //     style: TextStyle(color: Colors.white), // Cor do texto
            //   ),
            // ),
          ],
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
