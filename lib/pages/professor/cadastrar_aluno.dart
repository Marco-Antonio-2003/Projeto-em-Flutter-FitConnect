import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastrarAlunoPage extends StatefulWidget {
  final String? nomeProfessor;

  CadastrarAlunoPage({Key? key, this.nomeProfessor}) : super(key: key);

  @override
  State<CadastrarAlunoPage> createState() => _CadastrarAlunoPageState();
}

class _CadastrarAlunoPageState extends State<CadastrarAlunoPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  String? _genero;
  final MaskedTextController _horariosController =
      MaskedTextController(mask: '00:00 até 00:00');
  final MaskedTextController _cpfController =
      MaskedTextController(mask: '000.000.000-00');
  final TextEditingController _estadoController = TextEditingController();
  final MaskedTextController _telefoneController =
      MaskedTextController(mask: '(00) 00000-0000');
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  DateTime? _selectedDate;

  List<String> estados = ['SP', 'MG', 'RJ', 'PR', 'ES', 'SC'];

  int _bottomNavBarIndex = 1;

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

  void _onBottomNavBarTapped(int index) {
    setState(() {
      _bottomNavBarIndex = index;
      // Lógica de navegação do BottomNavigationBar
    });
  }

  Future<List<dynamic>> _loadJson() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonData = prefs.getString('alunos');
    if (jsonData != null) {
      return json.decode(jsonData);
    }
    return [];
  }

  Future<void> _saveJson(List<dynamic> jsonData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('alunos', json.encode(jsonData));
  }

  Future<void> _cadastrarAluno() async {
    try {
      List<dynamic> alunos = await _loadJson();

      Map<String, dynamic> novoAluno = {
        "_id": {"\$oid": DateTime.now().millisecondsSinceEpoch.toString()},
        "Nome": _nomeController.text,
        "Codigo": alunos.length + 1,
        "Data de Nasc": {"\$date": _selectedDate?.toIso8601String()},
        "Genero": _genero,
        "Horarios": _horariosController.text,
        "CPF": _cpfController.text,
        "Estado": _estadoController.text,
        "Telefone": _telefoneController.text,
        "Altura": {"\$numberDecimal": _alturaController.text},
        "Peso": int.tryParse(_pesoController.text),
        "CodigoDeAcesso": (alunos.length + 1).toString().padLeft(5, '0')
      };

      alunos.add(novoAluno);

      await _saveJson(alunos);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aluno cadastrado com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar aluno: $e')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dataNascimentoController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastrar Aluno',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 8, 83, 83),
        elevation: 0,
      ),
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
              Text('Nome e sobrenome', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Data de Nascimento', style: TextStyle(color: Colors.white)),
              InkWell(
                onTap: () => _selectDate(context),
                child: IgnorePointer(
                  child: TextField(
                    controller: _dataNascimentoController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Gênero', style: TextStyle(color: Colors.white)),
              Row(
                children: [
                  Radio<String>(
                    value: 'Masculino',
                    groupValue: _genero,
                    onChanged: (value) {
                      setState(() {
                        _genero = value;
                      });
                    },
                  ),
                  Text('Masculino', style: TextStyle(color: Colors.white)),
                  Radio<String>(
                    value: 'Feminino',
                    groupValue: _genero,
                    onChanged: (value) {
                      setState(() {
                        _genero = value;
                      });
                    },
                  ),
                  Text('Feminino', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              Text('Horários', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _horariosController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'HH:mm até HH:mm',
                ),
              ),
              SizedBox(height: 10),
              Text('CPF', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _cpfController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: '000.000.000-00',
                ),
              ),
              SizedBox(height: 10),
              Text('Estado', style: TextStyle(color: Colors.white)),
              DropdownButtonFormField<String>(
                value: _estadoController.text.isEmpty
                    ? null
                    : _estadoController.text,
                items: estados.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _estadoController.text = value!;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Telefone', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _telefoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: '(00) 00000-0000',
                ),
              ),
              SizedBox(height: 10),
              Text('Altura', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 10),
              Text('Peso', style: TextStyle(color: Colors.white)),
              TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrarAluno,
                child: Text('Cadastrar'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.teal,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavBarIndex,
        onTap: _onBottomNavBarTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Alunos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}
