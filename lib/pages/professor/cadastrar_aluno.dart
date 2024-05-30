import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';

class CadastrarAlunoPage extends StatefulWidget {
  CadastrarAlunoPage({Key? key, this.nomeProfessor});

  final String? nomeProfessor;

  @override
  State<CadastrarAlunoPage> createState() => _CadastrarAlunoPageState();
}

class _CadastrarAlunoPageState extends State<CadastrarAlunoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // Índices para o BottomNavigationBar e DropdownButtonFormField
  int _bottomNavBarIndex = 1;
  int _dropdownIndex = 1;

  // Lista de dias da semana
  final List<String> _diasSemana = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo'
  ];

  // Mapa para armazenar os exercícios para cada dia
  Map<String, List<String>> _exerciciosPorDia = {
    'Segunda-feira': [],
    'Terça-feira': [],
    'Quarta-feira': [],
    'Quinta-feira': [],
    'Sexta-feira': [],
    'Sábado': [],
    'Domingo': [],
  };

  TextEditingController _exercicioController = TextEditingController();

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
    _exercicioController.dispose();
  }

  void _onBottomNavBarTapped(int index) {
    setState(() {
      _bottomNavBarIndex = index;
      switch (index) {
        case 0:
          Navigator.pop(context);
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastrarAlunoPage(
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

  void _verExerciciosSelecionados() {
    List<String> todosExercicios = [];
    _diasSemana.forEach((dia) {
      todosExercicios.addAll(_exerciciosPorDia[dia]!);
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Todos os Exercícios'),
          content: SingleChildScrollView(
            child: ListBody(
              children: todosExercicios.map((exercicio) {
                return Text(exercicio);
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _adicionarExercicio(String dia) {
    String novoExercicio = _exercicioController.text.trim();
    if (novoExercicio.isNotEmpty) {
      novoExercicio = '($dia) $novoExercicio';
      setState(() {
        _exerciciosPorDia[dia]!.add(novoExercicio);
        _exercicioController.clear();
      });
    }
  }

  void _atualizarDiaSelecionado(String? value) {
    if (value != null) {
      setState(() {
        _dropdownIndex = _diasSemana.indexOf(value);
      });
    }
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Nome completo', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Data de nascimento', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Gênero', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Endereço', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Número de telefone', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'E-mail', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Altura', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Peso', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Condições médicas pré-existentes', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lesões prévias', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),

              const SizedBox(height: 50),
              // Dropdown para selecionar o dia da semana
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
                style: TextStyle(color: Colors.white), // Cor do texto do dropdown
                iconEnabledColor: Colors.white, // Cor do ícone do dropdown
                value: _diasSemana[_dropdownIndex],
                items: _diasSemana
                    .map((dia) => DropdownMenuItem(
                          child: Text(
                            dia,
                            style: TextStyle(color: Colors.white),
                          ),
                          value: dia,
                        ))
                    .toList(),
                onChanged: _atualizarDiaSelecionado,
              ),              const SizedBox(height: 20),
              const Text(
                'Nome completo', // Label para o campo de texto
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                controller: _exercicioController,
                style: const TextStyle(color: Colors.white), // Cor do texto
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1), // Cor do fundo do campo
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _adicionarExercicio(_diasSemana[_dropdownIndex]);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor de fundo do botão
                ),
                child: const Text(
                  'Adicionar Exercício',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verExerciciosSelecionados,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor de fundo do botão
                ),
                child: const Text(
                  'Ver Exercícios',
                  style: TextStyle(color: Colors.white),
                ),
              ),
                            const SizedBox(height: 20),
              // Lista de exercícios para o dia selecionado
              if (_diasSemana.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _exerciciosPorDia[_diasSemana[_dropdownIndex]]!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _exerciciosPorDia[_diasSemana[_dropdownIndex]]![index],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
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
        currentIndex: _bottomNavBarIndex,
        selectedItemColor: Colors.teal,
        onTap: _onBottomNavBarTapped,
      ),
    );
  }
}
