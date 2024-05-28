import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';
import 'vermais_aluno.dart'; // Importe a página AlunoPage2

class VerAlunosPage extends StatefulWidget {
  VerAlunosPage({super.key, this.nomeProfessor});

  String? nomeProfessor;

  @override
  State<VerAlunosPage> createState() => _VerAlunosPageState();
}

class _VerAlunosPageState extends State<VerAlunosPage> {
  int _selectedIndex = 1;
  TextEditingController _searchController = TextEditingController();
  List<String> _filteredAlunos = [];

  final List<String> _alunos = [
    'Ana Silva',
    'Bruno Costa',
    'Carla Souza',
    'Daniel Oliveira',
    'Elaine Santos',
    'Felipe Lima',
    'Gabriela Martins',
    'Henrique Almeida',
    'Isabel Pereira',
    'João Rodrigues'
  ];

  @override
  void initState() {
    super.initState();
    _filteredAlunos = _alunos;
    _searchController.addListener(_filterAlunos);
  }

  void _filterAlunos() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAlunos = _alunos.where((aluno) {
        return aluno.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Realize ações com base no índice selecionado
      switch (index) {
        case 0:
          Navigator.pop(context);
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPageProfessor(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF042c2c), // Mesma cor de fundo
      appBar: AppBar(
        title: Text('Olá, ${widget.nomeProfessor}'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Pesquisar',
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              fillColor: Colors.white, // Cor do fundo do campo de texto
              filled: true,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  _filteredAlunos.length,
                  (index) => GestureDetector(
                    onTap: () {
                      // Ao clicar em um aluno, navegue para a página AlunoPage2
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlunoPage2(
                            nomeAluno: _filteredAlunos[index],
                            nomeProfessor: widget.nomeProfessor ?? '',
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        _filteredAlunos[index],
                        style: const TextStyle(
                            color: Colors.white), // Cor do texto
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
