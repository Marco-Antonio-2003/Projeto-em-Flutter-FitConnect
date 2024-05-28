import 'package:flutter/material.dart';

class AdicionarExercicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF042c2c), // Cor de fundo
      appBar: AppBar(
        title: const Text('Adicionar novos exercícios'), // Título da AppBar
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Nome', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Musculo', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sets', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Duração', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Repetição', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Descrição', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Máquina', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Descanso', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Frequência', // Label para o campo de texto
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              style: const TextStyle(color: Colors.white), // Cor do texto
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Colors.white.withOpacity(0.1), // Cor do fundo do campo
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implemente a lógica para adicionar o exercício
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Cor de fundo do botão
              ),
              child: const Text(
                'Adicionar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
