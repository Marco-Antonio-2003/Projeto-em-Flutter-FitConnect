// tela3.dart

import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  final String nomeProduto;
  final String imagePath;

  Tela3({required this.nomeProduto, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nomeProduto,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(
            color: Colors.white), // Define a cor do ícone de voltar
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para pagar com PIX
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Pagamento com PIX"),
                      content: Text(
                          "Você selecionou pagamento com PIX para $nomeProduto."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Fechar"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('PIX'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para pagar com Cartão
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Pagamento com Cartão"),
                      content: Text(
                          "Você selecionou pagamento com cartão para $nomeProduto."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Fechar"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Cartão'),
            ),
          ],
        ),
      ),
    );
  }
}
