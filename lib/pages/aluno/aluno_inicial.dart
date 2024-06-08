import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/exercicio_info.dart';
import 'package:flutter_application_1/pages/aluno/feedback_page.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';

class AlunoInicialPage extends StatefulWidget {
  AlunoInicialPage({super.key, this.nomeAluno});

  String? nomeAluno;
  @override
  State<AlunoInicialPage> createState() => _AlunoInicialPageState();
}

class _AlunoInicialPageState extends State<AlunoInicialPage> {
  int _selectedIndex = 1;
  String _selectedDia = 'Segunda-feira';
  final List<String> _diasSemana = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo'
  ];

  final Map<String, List<Map<String, dynamic>>> _exerciciosPorDia = {
    'Segunda-feira': [
      {
        'name': 'Panturrilhas',
        'quantidade': '10 rept / 3 séries',
        'imagePath': '../assets/img/quadrimusc.jpeg',
        'Graph': '../assets/img/exercicio1.png',
        'completed': false
      },
      {
        'name': 'Rosca Inversa',
        'quantidade': '12 rept / 3 séries',
        'imagePath': '../assets/img/forearmmusc.jpg',
        'Graph': '../assets/img/exercicio2.png',
        'completed': false
      },
    ],
    'Terça-feira': [
      {
        'name': 'Abdominais',
        'quantidade': '15 rept / 3 séries',
        'imagePath': '../assets/img/abdomemmusc.jpeg',
        'Graph': '../assets/img/exercicio3.png',
        'completed': false
      },
      {
        'name': 'Rosca Direta',
        'quantidade': '10 rept / 5 séries',
        'imagePath': '../assets/img/bracomusc.jpeg',
        'Graph': '../assets/img/exercicio4.png',
        'completed': false
      },
    ],
    'Quarta-feira': [
      {
        'name': 'Agachamento',
        'quantidade': '10 rept / 3 séries',
        'imagePath': '../assets/img/legmusc.jpeg',
        'Graph': '../assets/img/exercicio5.png',
        'completed': false
      },
      {
        'name': 'Tríceps Banco',
        'quantidade': '12 rept / 3 séries',
        'imagePath': '../assets/img/tricepmusc.jpeg',
        'Graph': '../assets/img/exercicio6.png',
        'completed': false
      },
    ],
    'Quinta-feira': [
      {
        'name': 'Panturilhas',
        'quantidade': '10 rept / 3 séries',
        'imagePath': '../assets/img/calf-muscle.jpg',
        'Graph': '../assets/img/exercicio7.png',
        'completed': false
      },
      {
        'name': 'Elevação Lateral',
        'quantidade': '15 rept / 3 séries',
        'imagePath': '../assets/img/ombromusc.jpeg',
        'Graph': '../assets/img/exercicio8.png',
        'completed': false
      },
    ],
    'Sexta-feira': [
      {
        'name': 'Remada Curvada',
        'quantidade': '12 rept / 3 séries',
        'imagePath': '../assets/img/backmuscle.jpeg',
        'Graph': '../assets/img/exercicio9.png',
        'completed': false
      },
    ],
    'Sábado': [],
    'Domingo': [],
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Realize ações com base no índice selecionado
      switch (index) {
        case 0:
          Navigator.pop(context);
          break;
        case 1:
          // Já estamos na página inicial do aluno
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

  void _onDiaSelecionado(String? dia) {
    setState(() {
      _selectedDia = dia!;
    });
  }

  void _onExercicioCompleto(int index, bool? value) {
    setState(() {
      _exerciciosPorDia[_selectedDia]![index]['completed'] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Olá, ${widget.nomeAluno}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 83, 83),
              Color.fromARGB(255, 10, 100, 100),
              Color.fromARGB(255, 6, 136, 136),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: _selectedDia,
                onChanged: _onDiaSelecionado,
                items: _diasSemana.map((String dia) {
                  return DropdownMenuItem<String>(
                    value: dia,
                    child: Text(dia),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _exerciciosPorDia[_selectedDia]!.length,
                itemBuilder: (context, index) {
                  final exercicio = _exerciciosPorDia[_selectedDia]![index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    color: Colors.cyan[900],
                    child: CheckboxListTile(
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(exercicio['imagePath']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(exercicio['name'],
                                  style: const TextStyle(color: Colors.white)),
                              Text(exercicio['quantidade'],
                                  style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      value: exercicio['completed'],
                      onChanged: (value) {
                        _onExercicioCompleto(index, value);
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.green,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FeedbackPage()),
          );
        },
        child: const Icon(Icons.feedback),
        backgroundColor: Colors.amber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

Widget _buildProductCard(BuildContext context, String name, String quantidade,
    String imagePath, String Graph) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    color: Colors.cyan[900],
    child: ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' $name', style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 40),
          Text(' $quantidade', style: const TextStyle(color: Colors.white)),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExercicioInfoPage(
              nomeExercicio: name,
              imagePath: imagePath,
              graph: Graph,
              nomeAluno: '',
            ),
          ),
        );
      },
    ),
  );
}

void main() {
  runApp(MaterialApp(
    home: AlunoInicialPage(),
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black87,
      ),
    ),
  ));
}
