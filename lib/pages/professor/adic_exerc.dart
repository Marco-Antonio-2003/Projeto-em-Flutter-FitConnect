import 'package:flutter/material.dart';

class AdicionarExercicioPage extends StatefulWidget {
  @override
  _AdicionarExercicioPageState createState() => _AdicionarExercicioPageState();
}

class _AdicionarExercicioPageState extends State<AdicionarExercicioPage> {
  final _nomeController = TextEditingController();
  final _musculoController = TextEditingController();
  final _setsController = TextEditingController();
  final _duracaoController = TextEditingController();
  final _repeticaoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _maquinaController = TextEditingController();
  final _descansoController = TextEditingController();
  final _frequenciaController = TextEditingController();
  DateTime? _selectedDay;

  List<Map<String, dynamic>> _exercicios = [];

  @override
  void dispose() {
    _nomeController.dispose();
    _musculoController.dispose();
    _setsController.dispose();
    _duracaoController.dispose();
    _repeticaoController.dispose();
    _descricaoController.dispose();
    _maquinaController.dispose();
    _descansoController.dispose();
    _frequenciaController.dispose();
    super.dispose();
  }

  void _adicionarExercicio() {
    setState(() {
      _exercicios.add({
        'nome': _nomeController.text,
        'musculo': _musculoController.text,
        'sets': _setsController.text,
        'duracao': _duracaoController.text,
        'repeticao': _repeticaoController.text,
        'descricao': _descricaoController.text,
        'maquina': _maquinaController.text,
        'descanso': _descansoController.text,
        'frequencia': _frequenciaController.text,
        'dataSelecionada': _selectedDay != null
            ? '${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}'
            : 'Não selecionada',
      });
      _limparCampos();
    });
  }

  void _limparCampos() {
    _nomeController.clear();
    _musculoController.clear();
    _setsController.clear();
    _duracaoController.clear();
    _repeticaoController.clear();
    _descricaoController.clear();
    _maquinaController.clear();
    _descansoController.clear();
    _frequenciaController.clear();
    setState(() {
      _selectedDay = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adicionar novos exercícios',
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _buildTextField('Nome', _nomeController),
              const SizedBox(height: 10),
              _buildTextField('Musculo', _musculoController),
              const SizedBox(height: 10),
              _buildTextField('Sets', _setsController),
              const SizedBox(height: 10),
              _buildTextField('Duração', _duracaoController),
              const SizedBox(height: 10),
              _buildTextField('Repetição', _repeticaoController),
              const SizedBox(height: 20),
              _buildTextField('Descrição', _descricaoController, maxLines: 5),
              const SizedBox(height: 20),
              _buildTextField('Máquina', _maquinaController),
              const SizedBox(height: 10),
              _buildTextField('Descanso', _descansoController),
              const SizedBox(height: 10),
              _buildTextField('Frequência', _frequenciaController),
              const SizedBox(height: 20),
              _buildCalendar(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _adicionarExercicio,
                child: Text('Adicionar exercício'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              _buildExerciciosList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
          maxLines: maxLines,
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _selectedDay == null
                ? 'Selecione uma data'
                : 'Data selecionada: ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (picked != null && picked != _selectedDay) {
                setState(() {
                  _selectedDay = picked;
                });
              }
            },
            child: Text('Selecionar data'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciciosList() {
    return ListView.builder(
      shrinkWrap: true, // Add this to make it work inside SingleChildScrollView
      physics: NeverScrollableScrollPhysics(), // Disable list view scrolling
      itemCount: _exercicios.length,
      itemBuilder: (context, index) {
        final exercicio = _exercicios[index];
        return Card(
          color: Colors.white.withOpacity(0.1),
          child: ListTile(
            title: Text(
              exercicio['nome'],
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Músculo: ${exercicio['musculo']}\nSets: ${exercicio['sets']}\nDuração: ${exercicio['duracao']}\nRepetição: ${exercicio['repeticao']}\nMáquina: ${exercicio['maquina']}\nDescanso: ${exercicio['descanso']}\nFrequência: ${exercicio['frequencia']}\nData: ${exercicio['dataSelecionada']}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
