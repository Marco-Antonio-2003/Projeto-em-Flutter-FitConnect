import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  final String nomeProduto;
  final double precoUnitario;
  final int quantidade;
  final String imagePath;

  Tela3({
    required this.nomeProduto,
    required this.precoUnitario,
    required this.quantidade,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double valorTotal = precoUnitario * quantidade;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          nomeProduto,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
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
            Text(
              'Preço Unitário: R\$${precoUnitario.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Quantidade: $quantidade',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Valor Total: R\$${valorTotal.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
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
