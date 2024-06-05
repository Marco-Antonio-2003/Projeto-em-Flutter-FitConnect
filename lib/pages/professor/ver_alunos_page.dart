import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';
import 'vermais_aluno.dart'; // Importe a página AlunoPage2

class VerAlunosPage extends StatefulWidget {
  VerAlunosPage({super.key, this.nomeProfessor});

  final String? nomeProfessor;

  @override
  State<VerAlunosPage> createState() => _VerAlunosPageState();
}

class _VerAlunosPageState extends State<VerAlunosPage> {
  int _selectedIndex = 1;
  TextEditingController _searchController = TextEditingController();
  List<String> _filteredAlunos = [];
  List<String> _alunos = []; // Lista de alunos

  @override
  void initState() {
    super.initState();
    _loadAlunosFromJson(); // Carrega os alunos do arquivo JSON
    _searchController.addListener(_filterAlunos);
  }

  // Função para carregar os alunos do arquivo JSON
  void _loadAlunosFromJson() async {
    try {
      String data = await DefaultAssetBundle.of(context)
          .loadString('assets/Projeto_integrador.Aluno.json');
      List<dynamic> alunosJson = json.decode(data);
      setState(() {
        _alunos = _alunos =
            alunosJson.map<String>((aluno) => aluno['Nome'] as String).toList();

        _filteredAlunos = _alunos;
      });
    } catch (e) {
      print('Erro ao carregar alunos: $e');
    }
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
  }

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
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Seus alunos são',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: const Color.fromARGB(0, 248, 248, 248),
              elevation: 0,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Pesquisar',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  fillColor: Colors.white, // Cor do fundo do campo de texto
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredAlunos.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
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
                  );
                },
              ),
            ),
          ],
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
