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
  String _selectedDia = 'Segunda-feira';
  String _selectedExercicio = 'Panturrilhas';
  final List<String> _diasSemana = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo'
  ];
  final List<String> _exercicios = [
    'Panturrilhas',
    'Rosca Inversa',
    'Abdominais',
    'Rosca Direta',
    'Agachamento',
    'Tríceps Banco',
    'Panturilhas',
    'Elevação Lateral',
    'Remada Curvada'
  ];
  final TextEditingController _repeticoesController = TextEditingController();
  final TextEditingController _kgController = TextEditingController();
  final Map<String, List<Map<String, dynamic>>> _exerciciosPorDia = {};

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

  void _adicionarExercicio() {
    String dia = _selectedDia;
    String exercicio = _selectedExercicio;
    String repeticoes = _repeticoesController.text;
    String kgs = _kgController.text;

    if (repeticoes.isEmpty || kgs.isEmpty) {
      // Validar campos vazios
      return;
    }

    setState(() {
      if (_exerciciosPorDia[dia] == null) {
        _exerciciosPorDia[dia] = [];
      }
      _exerciciosPorDia[dia]!.add({
        'name': exercicio,
        'quantidade': '$repeticoes rept / $kgs KGs',
        'completed': false
      });
      _repeticoesController.clear();
      _kgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inserir exercícios para: ${widget.nomeAluno}',
          style: TextStyle(color: Colors.white),
        ),
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
                'Selecione o Dia',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedDia,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDia = newValue!;
                  });
                },
                items:
                    _diasSemana.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Selecione o Exercício',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedExercicio,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedExercicio = newValue!;
                  });
                },
                items:
                    _exercicios.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _repeticoesController,
                      decoration: InputDecoration(
                        hintText: 'Repetições',
                        filled: true,
                        fillColor:
                            Colors.white, // Cor do fundo do campo de texto
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _kgController,
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
                    onPressed: _adicionarExercicio,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _exerciciosPorDia[_selectedDia]?.length ?? 0,
                  itemBuilder: (context, index) {
                    final exercicio = _exerciciosPorDia[_selectedDia]![index];
                    return ListTile(
                      title: Text(
                        exercicio['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        exercicio['quantidade'],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
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
