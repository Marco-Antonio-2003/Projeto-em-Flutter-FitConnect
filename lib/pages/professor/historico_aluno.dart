import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';

class HistoricoAluno extends StatefulWidget {
  HistoricoAluno({
    Key? key,
    this.nomeProfessor,
    required this.nomeAluno,
    required this.dataEntrada,
    required this.ultimosExercicios,
  }) : super(key: key);

  final String? nomeProfessor;
  final String nomeAluno;
  final String dataEntrada;
  final List<String> ultimosExercicios;

  @override
  State<HistoricoAluno> createState() => _HistoricoAlunoState();
}

class _HistoricoAlunoState extends State<HistoricoAluno> {
  int _selectedIndex = 0;

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
          // Navegar para a página de produtos
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
        title: Text(
          'Histórico do ${widget.nomeAluno}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: double.infinity, // Alteração aqui
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Entrada na Academia:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Data e Hora: ${widget.dataEntrada}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Últimos Exercícios:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.ultimosExercicios.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        widget.ultimosExercicios[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Gráfico de Desempenho do aluno:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Aqui você pode adicionar o gráfico de desempenho
                // Pode usar uma biblioteca como 'charts_flutter' para isso
                // Adicione o código do gráfico aqui
              ],
            ),
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
