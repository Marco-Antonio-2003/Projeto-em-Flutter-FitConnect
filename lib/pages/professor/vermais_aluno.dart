import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';
import 'historico_aluno.dart'; // Importe a página HistoricoAluno.dart
import 'inserir_ex_aluno.dart'; // Importe a página InserirExAlunoPage.dart

class AlunoPage2 extends StatefulWidget {
  AlunoPage2({Key? key, this.nomeAluno, this.nomeProfessor});

  final String? nomeAluno; // Nome do aluno selecionado
  final String? nomeProfessor; // Nome do professor

  @override
  State<AlunoPage2> createState() => _AlunoPage2State();
}

class _AlunoPage2State extends State<AlunoPage2> {
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
              title: const Text(
                'Ver mais sobre o aluno',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Nome do Aluno: ${widget.nomeAluno}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navegar para a página de histórico do aluno
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoricoAluno(
                              nomeAluno: '${widget.nomeAluno}',
                              dataEntrada: '',
                              ultimosExercicios: [],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      icon: Icon(Icons.history),
                      label: const Text(
                        'Ver seu histórico',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Navegar para a página de inserção de exercícios do aluno
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InserirExAlunoPage(
                              nomeAluno: '${widget.nomeAluno}',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      icon: Icon(Icons.fitness_center),
                      label: const Text(
                        'Inserir exercícios',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // Implemente a lógica para enviar notificação
                    //   },
                    //   child: Text(
                    //     'Mandar uma notificação',
                    //     style: TextStyle(color: Colors.white),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.blue, // Cor de fundo do botão
                    //   ),
                    // ),
                  ],
                ),
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
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
