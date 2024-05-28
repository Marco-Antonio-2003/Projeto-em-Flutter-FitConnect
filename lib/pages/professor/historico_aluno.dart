import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';
import 'package:flutter_application_1/pages/professor/main_page_professor.dart';


class HistoricoAluno extends StatefulWidget {
  HistoricoAluno({super.key, this.nomeProfessor,     required this.nomeAluno,
    required this.dataEntrada,
    required this.ultimosExercicios,});

  String? nomeProfessor;  final String nomeAluno;
  final String dataEntrada;
  final List<String> ultimosExercicios;



  @override
  State<HistoricoAluno> createState() => _HistoricoAlunoState();
}

class _HistoricoAlunoState extends State<HistoricoAluno> {
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
      backgroundColor: const Color(0xFF042c2c),
      appBar: AppBar(
        title: Text('Histórico do ${widget.nomeAluno}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Entrada na Academia:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Data e Hora: ${widget.dataEntrada}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Últimos Exercícios:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
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
            ),
            const SizedBox(height: 20),
            const Text(
              'Gráfico de Desempenho do aluno:',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            // Aqui você pode adicionar o gráfico de desempenho
            // Pode usar uma biblioteca como 'charts_flutter' para isso
            // Adicione o código do gráfico aqui
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
