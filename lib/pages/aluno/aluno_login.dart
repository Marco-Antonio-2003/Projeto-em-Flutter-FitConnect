import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/aluno_inicial.dart';

class AlunoLoginPage extends StatefulWidget {
  AlunoLoginPage({Key? key}) : super(key: key);

  @override
  State<AlunoLoginPage> createState() => _AlunoLoginPageState();
}

class _AlunoLoginPageState extends State<AlunoLoginPage> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                './assets/img/logo1.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Aluno',
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
                  decoration: InputDecoration(
                    hintText: 'Insira seu código',
                    filled: true,
                    fillColor: Colors.white, // Cor do fundo do campo de texto
                    // Define as bordas do TextField
                    border: OutlineInputBorder(
                      // Define a largura e a cor da borda
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.blue),
                      // Define o raio dos cantos da borda
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    // Define um espaço de preenchimento interno para o texto
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
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
                      builder: (context) => AlunoInicialPage(),
                    ),
                  );
                },
                style: ButtonStyle(
                  // Definindo a altura do botão
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(150, 50)),
                  // Definindo a largura do botão
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(150, 50)),
                  // Definindo a cor de fundo do botão
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  // Definindo a cor do texto do botão
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check), // Ícone de confirmação
                    SizedBox(width: 10), // Espaçamento
                    Text('Confirmar'), // Texto do botão
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AlunoLoginPage(),
  ));
}
