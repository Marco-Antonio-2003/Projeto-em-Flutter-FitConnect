import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  void _cadastrarAluno() {
    // Aqui você pode adicionar a lógica para cadastrar o aluno
    // Por exemplo, você pode enviar os dados para um serviço web ou para outro sistema de armazenamento de dados
    // ou pode simplesmente exibir os dados para fins de depuração
    print('Nome: ${_nomeController.text}');
    print('Código: ${_codigoController.text}');
    print('Data de Nascimento: ${_dataNascimentoController.text}');
    print('Gênero: ${_generoController.text}');
    print('Horários: ${_horariosController.text}');
    print('CPF: ${_cpfController.text}');
    print('Estado: ${_estadoController.text}');
    print('Telefone: ${_telefoneController.text}');
    print('Altura: ${_alturaController.text}');
    print('Peso: ${_pesoController.text}');
    print('Código de Acesso: ${_codigoDeAcessoController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Aluno cadastrado com sucesso!')),
    );
    Navigator.pop(context);
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
              Text('Nome e sobrenome', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Data de Nascimento', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _dataNascimentoController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Gênero', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _generoController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Horários', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _horariosController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('CPF', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Estado', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _estadoController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Telefone', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _telefoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Altura', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Peso', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrarAluno,
                child: Text('Cadastrar Aluno'),
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
