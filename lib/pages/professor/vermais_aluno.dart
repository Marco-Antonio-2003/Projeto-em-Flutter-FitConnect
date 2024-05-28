import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';
import 'historico_aluno.dart'; // Importe a página HistoricoAluno.dart
import 'inserir_ex_aluno.dart'; // Importe a página InserirExAlunoPage.dart


class AlunoPage2 extends StatefulWidget {
  AlunoPage2({super.key,   this.nomeAluno,  this.nomeProfessor});

  String? nomeAluno; // Nome do aluno selecionado
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
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPageProfessor(
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
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF042c2c), // Cor de fundo
      appBar: AppBar(
        title: const Text(
            'ver mais sobre o aluno'), // Exibe o nome do aluno selecionado na AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Nome do Aluno: ${widget.nomeAluno}', // Exibe o nome do aluno selecionado
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
              style: ButtonStyle(
                // Definindo a altura do botão
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200, 50)),
                // Definindo a largura do botão
                fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                // Definindo a cor de fundo do botão
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                // Definindo a cor do texto do botão
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                'Ver seu histórico',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
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
               style: ButtonStyle(
                // Definindo a altura do botão
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(200, 50)),
                // Definindo a largura do botão
                fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
                // Definindo a cor de fundo do botão
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                // Definindo a cor do texto do botão
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                
                'Inserir exercícios',
                style: TextStyle(color: Colors.white),
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
      ), bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons
                .shopping_cart), // Alterei o ícone para carrinho de compras
            label: 'Produtos', // Alterei o rótulo para "Produtos"
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
