import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/aluno_inicial.dart';
import 'dart:convert';
import 'package:flutter/services.dart'; // Importar para acessar arquivos locais
import 'package:flutter_application_1/banco/test_conexao.dart';

class AlunoLoginPage extends StatefulWidget {
  AlunoLoginPage({Key? key}) : super(key: key);

  @override
  State<AlunoLoginPage> createState() => _AlunoLoginPageState();
}

class _AlunoLoginPageState extends State<AlunoLoginPage> {
  TextEditingController _codigController = TextEditingController();
  List<dynamic> alunos = [];

  @override
  void initState() {
    super.initState();
    _carregarAluno();
  }

  Future<void> _carregarAluno() async {
    // Ler o arquivo JSON
    String jsonString =
        await rootBundle.loadString('assets/Projeto_integrador.Aluno.json');
    // Converter o JSON em lista de mapas
    setState(() {
      alunos = json.decode(jsonString);
    });
  }

  void _codigoController() {
    String codigo = _codigController.text;

    // Verificar se as credenciais correspondem a algum aluno
    dynamic aluno = alunos.firstWhere(
      (aln) => aln['CodigoDeAcesso'] == codigo,
      orElse: () => null,
    );

    if (aluno != null) {
      // Navegar para a página principal do aluno
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlunoInicialPage(
            nomeAluno: aluno['Nome'], // Corrigir se 'Nome' for o campo correto
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
        iconTheme: IconThemeData(color: Colors.white), // Cor do ícone de voltar
        backgroundColor: const Color(0xFF042c2c), // Cor do fundo da AppBar
      ),
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
                  controller: _codigController,
                  decoration: InputDecoration(
                    hintText: 'Insira seu código',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2.0, color: Colors.blue),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _codigoController,
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
