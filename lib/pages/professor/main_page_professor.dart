import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'ver_alunos_page.dart'; // Mantém o import da VerAlunosPage.dart
import 'adic_exerc.dart'; // Importe a página AdicionarExercicioPage.dart

// ignore: must_be_immutable
class MainPageProfessor extends StatefulWidget {
  MainPageProfessor({super.key, this.nomeProfessor});

  String? nomeProfessor;

  @override
  State<MainPageProfessor> createState() => _MainPageProfessorState();
}

class _MainPageProfessorState extends State<MainPageProfessor> {
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
                nomeProfessor: '${widget.nomeProfessor}',
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
      backgroundColor: const Color(0xFF042c2c), // Mesma cor de fundo
      appBar: AppBar(
        title: Text('Olá, ${widget.nomeProfessor}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navegar para a página de ver alunos
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerAlunosPage(),
                  ),
                );
              },
              style: ButtonStyle(
                // Definindo a altura do botão
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(150, 50)),
                // Definindo a largura do botão
                fixedSize: MaterialStateProperty.all<Size>(const Size(300, 50)),
                // Definindo a cor de fundo do botão
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                // Definindo a cor do texto do botão
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                'Ver seus alunos(as)',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar para a página de adicionar exercícios
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdicionarExercicioPage(), // Conexão com a página AdicionarExercicioPage
                  ),
                );
              },
              style: ButtonStyle(
                // Definindo a altura do botão
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(150, 50)),
                // Definindo a largura do botão
                fixedSize: MaterialStateProperty.all<Size>(const Size(300, 50)),
                // Definindo a cor de fundo do botão
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                // Definindo a cor do texto do botão
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                'Adicionar novos exercícios',
                style: TextStyle(color: Colors.white), // Cor do texto
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de produtos (TelaSuplementos)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaSuplementos(),
                  ),
                );
              },
              style: ButtonStyle(
                // Definindo a altura do botão
                minimumSize:
                    MaterialStateProperty.all<Size>(const Size(150, 50)),
                // Definindo a largura do botão
                fixedSize: MaterialStateProperty.all<Size>(const Size(300, 50)),
                // Definindo a cor de fundo do botão
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                // Definindo a cor do texto do botão
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                'Ver produtos',
                style: TextStyle(color: Colors.white), // Cor do texto
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
