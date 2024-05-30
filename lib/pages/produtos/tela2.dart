// tela2.dart

import 'package:flutter/material.dart';
import 'tela3.dart';
import 'package:flutter_application_1/models/informacoes_produtos.dart';

class TelaDetalhesProduto extends StatelessWidget {
  final String nomeProduto;
  final String imagePath;

  TelaDetalhesProduto({required this.nomeProduto, required this.imagePath});

  String getInformacoesProduto(String nomeProduto) {
    switch (nomeProduto) {
      case 'Whey Protein':
        return InformacoesProdutos.wheyProtein;
      case 'Creatina':
        return InformacoesProdutos.creatina;
      case 'BCAA':
        return InformacoesProdutos.bcaa;
      // case 'Multivitamínico':
      //   return InformacoesProdutos.multivitaminico;
      case 'Glutamina':
        return InformacoesProdutos.glutamina;
      case 'Albumina':
        return InformacoesProdutos.albumina;
      case 'Omega 3':
        return InformacoesProdutos.omega3;
      case 'Barra de Proteína':
        return InformacoesProdutos.barraProteina;
      case 'Caseína':
        return InformacoesProdutos.caseina;
      case 'Termogênico':
        return InformacoesProdutos.termogenico;
      // Adicione mais produtos conforme necessário
      default:
        return 'Informações sobre este produto não encontradas.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do Produto',
          style: TextStyle(color: Colors.white),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                nomeProduto,
                style:const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                getInformacoesProduto(
                    nomeProduto), // Exibe as informações específicas do produto
                style: const TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela 3
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Tela3(
                            nomeProduto: nomeProduto,
                            imagePath: imagePath,
                          )),
                );
              },
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
