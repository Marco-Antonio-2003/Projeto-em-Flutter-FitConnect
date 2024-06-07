import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  List<Map<String, dynamic>> _filteredAlunos = [];
  List<Map<String, dynamic>> _alunos = []; // Lista de alunos

  @override
  void initState() {
    super.initState();
    _loadAlunosFromSharedPreferences(); // Carrega os alunos do shared preferences
    _searchController.addListener(_filterAlunos);
  }

  // Função para carregar os alunos do shared preferences
  void _loadAlunosFromSharedPreferences() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonData = prefs.getString('alunos');
      if (jsonData != null) {
        List<dynamic> alunosPrefs = json.decode(jsonData);
        setState(() {
          _alunos = alunosPrefs
              .map<Map<String, dynamic>>(
                  (aluno) => aluno as Map<String, dynamic>)
              .toList();
          _filteredAlunos = _alunos;
        });
      }
    } catch (e) {
      print('Erro ao carregar alunos: $e');
    }
  }

  void _filterAlunos() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredAlunos = _alunos.where((aluno) {
        return aluno['Nome'].toLowerCase().contains(query);
      }).toList();
    });
  }

  // Função para excluir um aluno com confirmação
  void _confirmDeleteAluno(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmação de exclusão'),
          content: Text('Tem certeza que deseja excluir esse aluno?'),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () {
                _deleteAluno(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Função para excluir um aluno
  void _deleteAluno(int index) async {
    setState(() {
      _alunos.removeAt(index);
      _filteredAlunos = _alunos;
    });

    // Atualizar shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('alunos', json.encode(_alunos));
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
                            nomeAluno: _filteredAlunos[index]['Nome'],
                            nomeProfessor: widget.nomeProfessor ?? '',
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(
                        _filteredAlunos[index]['Nome'],
                        style: const TextStyle(
                            color: Colors.white), // Cor do texto
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _confirmDeleteAluno(index);
                        },
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
