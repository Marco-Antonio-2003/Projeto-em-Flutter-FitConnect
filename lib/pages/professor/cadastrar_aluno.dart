import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';

class CadastrarAlunoPage extends StatefulWidget {
  CadastrarAlunoPage({Key? key, this.nomeProfessor});

  final String? nomeProfessor;

  @override
  State<CadastrarAlunoPage> createState() => _CadastrarAlunoPageState();
}

class _CadastrarAlunoPageState extends State<CadastrarAlunoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Controladores de texto para cada campo
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _generoController = TextEditingController();
  final TextEditingController _horariosController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _codigoDeAcessoController =
      TextEditingController();

  // Índices para o BottomNavigationBar
  int _bottomNavBarIndex = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onBottomNavBarTapped(int index) {
    setState(() {
      _bottomNavBarIndex = index;
      switch (index) {
        case 0:
          Navigator.pop(context);
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastrarAlunoPage(
                nomeProfessor: widget.nomeProfessor,
              ),
            ),
          );
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaSuplementos(),
            ),
          );
          break;
        default:
          break;
      }
    });
  }

  void _cadastrarAluno() async {
    final CollectionReference alunos =
        FirebaseFirestore.instance.collection('alunos');

    // Dados do aluno a serem adicionados
    final alunoData = {
      'nome': _nomeController.text,
      'codigo': int.tryParse(_codigoController.text) ?? 0,
      'dataDeNasc': _dataNascimentoController.text,
      'genero': _generoController.text,
      'horarios': _horariosController.text,
      'cpf': _cpfController.text,
      'estado': _estadoController.text,
      'telefone': _telefoneController.text,
      'altura': double.tryParse(_alturaController.text) ?? 0.0,
      'peso': int.tryParse(_pesoController.text) ?? 0,
      'codigoDeAcesso': _codigoDeAcessoController.text,
    };

    try {
      await alunos.add(alunoData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aluno cadastrado com sucesso!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar aluno: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar Aluno',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 8, 83, 83),
        elevation: 0,
      ),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Nome completo',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _nomeController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Código',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _codigoController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Data de nascimento',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _dataNascimentoController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Gênero',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _generoController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Horários',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _horariosController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'CPF',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Estado',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _estadoController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Número de telefone',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _telefoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Altura',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Peso',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Código de Acesso',
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _codigoDeAcessoController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrarAluno,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Cadastrar Aluno',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Voltar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Produtos',
          ),
        ],
        currentIndex: _bottomNavBarIndex,
        selectedItemColor: Colors.teal,
        onTap: _onBottomNavBarTapped,
      ),
    );
  }
}
