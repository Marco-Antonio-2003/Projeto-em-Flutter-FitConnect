import 'package:flutter/material.dart';

class AdicionarExercicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar novos exercícios'), // Título da AppBar
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
        child: SingleChildScrollView(
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
              // Adicione ícone aqui
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
              // Adicione ícone aqui
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
              // Adicione ícone aqui
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
              // Adicione ícone aqui
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
              // Adicione ícone aqui
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
              // Adicione ícone aqui
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
              // Adicione ícone aqui
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
              // Adicione ícone aqui
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
      ),
    );
  }
}
