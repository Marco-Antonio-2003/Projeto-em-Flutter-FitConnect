import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';

class InserirExAlunoPage extends StatefulWidget {
  InserirExAlunoPage({Key? key, required this.nomeAluno});

  final String nomeAluno;

  @override
  State<InserirExAlunoPage> createState() => _InserirExAlunoPageState();
}

class _InserirExAlunoPageState extends State<InserirExAlunoPage> {
  int _selectedIndex = 1;

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
      appBar: AppBar(
        title: Text('Inserir exercícios para: ${widget.nomeAluno}'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 8, 83, 83),
              Color.fromARGB(255, 10, 100, 100),
              Color.fromARGB(255, 6, 136, 136),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Exercício 1',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Repetições/Séries',
                        filled: true,
                        fillColor:
                            Colors.white, // Cor do fundo do campo de texto
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'KGs',
                        filled: true,
                        fillColor:
                            Colors.white, // Cor do fundo do campo de texto
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Implemente a lógica para adicionar o exercício ao aluno
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
