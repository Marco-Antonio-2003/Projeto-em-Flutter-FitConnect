import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/aluno_inicial.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';

class ExercicioInfoPage extends StatefulWidget {
  ExercicioInfoPage(
      {required this.nomeExercicio,
      required this.imagePath,
      required this.graph});
  final String nomeExercicio;
  final String imagePath;
  final String graph;
  @override
  State<ExercicioInfoPage> createState() => _ExercicioInfoPageState();
}

class _ExercicioInfoPageState extends State<ExercicioInfoPage> {
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
              builder: (context) => AlunoInicialPage(),
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
      backgroundColor: const Color(0xFF042c2c),
      appBar: AppBar(
        title: Text('${widget.nomeExercicio}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sobre o exercício',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Imagem do exercício:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Image.asset(
                      widget.imagePath,
                      fit: BoxFit.contain,
                      height: 300,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Gráfico de Desempenho do exercício:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Image.asset(
                      widget.graph,
                      fit: BoxFit.contain,
                      height: 400,
                    ),
                  ],
                ),
              ),
              // Aqui você pode adicionar o gráfico de desempenho
              // Pode usar uma biblioteca como 'charts_flutter' para isso
              // Adicione o código do gráfico aqui
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
