import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/aluno_inicial.dart';


class AlunoLoginPage extends StatefulWidget {
  AlunoLoginPage({Key? key}) : super(key: key);

  @override
  State<AlunoLoginPage> createState() => _AlunoLoginPageState();
}

class _AlunoLoginPageState extends State<AlunoLoginPage> {
  final TextEditingController _codigoController = TextEditingController();

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
                'assets/img/logo1.png',
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Aluno',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  controller: _codigoController,
                  decoration: InputDecoration(
                    hintText: 'Insira seu código',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2.0, color: Colors.blue),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlunoInicialPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 50),
                  fixedSize: Size(150, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check),
                    SizedBox(width: 10),
                    Text('Confirmar'),
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
