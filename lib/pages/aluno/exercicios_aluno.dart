import 'package:flutter/material.dart';

class ExerciciosAlunoPage extends StatefulWidget {
  @override
  _ExerciciosAlunoPageState createState() => _ExerciciosAlunoPageState();
}

class _ExerciciosAlunoPageState extends State<ExerciciosAlunoPage> {
  DateTime selectedDate = DateTime.now();
  Map<String, List<String>> exerciciosPorCategoria = {
    'Superiores': ['Rosca Direta', 'Rosca Inversa', 'Supino Reto'],
    'Inferiores': ['Agachamento', 'Leg Press', 'Extensão de Pernas'],
    'Aeróbicos': ['Corrida', 'Bicicleta', 'Elíptico'],
    'Core': ['Abdominais', 'Prancha', 'Flexões']
  };

  Map<String, Map<String, List<String>>> exerciciosPorDia = {
    'Monday': {
      'Superiores': ['Rosca Direta', 'Rosca Inversa'],
      'Inferiores': [],
      'Aeróbicos': ['Corrida'],
      'Core': ['Abdominais']
    },
    'Wednesday': {
      'Superiores': [],
      'Inferiores': ['Agachamento', 'Leg Press'],
      'Aeróbicos': [],
      'Core': []
    },
    'Friday': {
      'Superiores': [],
      'Inferiores': ['Extensão de Pernas'],
      'Aeróbicos': ['Bicicleta'],
      'Core': ['Prancha', 'Flexões']
    }
  };

  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedDay = _getDayOfWeek(selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios do Dia'),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
            CalendarDatePicker(
              initialDate: selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
              onDateChanged: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: exerciciosPorCategoria.keys.map((categoria) {
                  return ExpansionTile(
                    title: Text(
                      categoria,
                      style: const TextStyle(color: Colors.white),
                    ),
                    children: exerciciosPorDia[selectedDay]?[categoria]
                            ?.map((exercicio) {
                          return ListTile(
                            title: Text(
                              exercicio,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList() ??
                        [],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
