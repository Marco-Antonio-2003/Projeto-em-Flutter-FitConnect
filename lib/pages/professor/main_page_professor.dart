import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/ver_alunos_page.dart'; // Mantém o import da VerAlunosPage.dart
import 'package:flutter_application_1/pages/professor/adic_exerc.dart'; // Importe a página AdicionarExercicioPage.dart
import 'package:flutter_application_1/pages/professor/estoque_prof.dart'; // Importe a página EstoquePage
import 'package:flutter_application_1/pages/professor/prod_comprados_prof.dart'; // Importe a página ProdutosCompradosProfPage
import 'package:flutter_application_1/pages/professor/cadastrar_aluno.dart'; // Importe a página CadastrarAlunoPage.dart

class MainPageProfessor extends StatefulWidget {
  MainPageProfessor({super.key, this.nomeProfessor});

  String? nomeProfessor;

  @override
  State<MainPageProfessor> createState() => _MainPageProfessorState();
}

class _MainPageProfessorState extends State<MainPageProfessor>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  late AnimationController _controller;
  late Animation<double> _animation;

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pop(context);
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPageProfessor(
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
                'Olá, ${widget.nomeProfessor}',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: FadeTransition(
                opacity: _animation,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCard(
                        text: 'Cadastrar Aluno',
                        icon: Icons.person_add,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CadastrarAlunoPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildCard(
                        text: 'Ver seus alunos(as)',
                        icon: Icons.group,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerAlunosPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildCard(
                        text: 'Adicionar novos exercícios',
                        icon: Icons.fitness_center,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdicionarExercicioPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildCard(
                        text: 'Estoque',
                        icon: Icons.inventory,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EstoqueProfPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildCard(
                        text: 'Produtos Comprados',
                        icon: Icons.shopping_bag,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProdutosCompradosProfPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
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

  Widget _buildCard({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 8,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 300,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: const LinearGradient(
              colors: [Colors.teal, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
