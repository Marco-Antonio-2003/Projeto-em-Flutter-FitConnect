import 'package:flutter/material.dart';
import 'tela2.dart';

class TelaSuplementos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nossos Produtos', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black87,
      body: ListView(
        children: [
          _buildProductCard(
              context,
              'Whey Protein',
              99.99,
              'Contém 20g de proteína por porção.',
              '../assets/img/whey_protein.jpg'),
          _buildProductCard(
              context,
              'Creatina',
              49.99,
              'Aumenta a força e a resistência muscular.',
              '../assets/img/creatina.jpg'),
          _buildProductCard(
              context,
              'BCAA',
              39.99,
              'Auxilia na recuperação muscular pós-treino.',
              '../assets/img/bcaa.jpg'),
          _buildProductCard(
              context,
              'Glutamina',
              59.99,
              'Ajuda na recuperação e reparação muscular.',
              '../assets/img/glutamina.jpg'),
          _buildProductCard(
              context,
              'Albumina',
              19.99,
              'Proteína de digestão lenta, ideal para consumo antes de dormir.',
              '../assets/img/albumina.jpg'),
          _buildProductCard(
              context,
              'Termogênico',
              79.99,
              'Acelera o metabolismo e auxilia na queima de gordura.',
              '../assets/img/termogenico.jpg'),
          _buildProductCard(
              context,
              'Omega 3',
              34.99,
              'Ácido graxo essencial que promove a saúde cardiovascular.',
              '../assets/img/omega3.jpg'),
          _buildProductCard(
              context,
              'Barra de Proteína',
              9.99,
              'Lanche prático e rico em proteínas, ideal para consumo entre as refeições.',
              '../assets/img/barra_proteina.jpg'),
          _buildProductCard(
              context,
              'Caseína',
              69.99,
              'Proteína de digestão lenta, ideal para consumo antes de dormir.',
              '../assets/img/caseina.jpg'),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String name, double price, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.grey[900],
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
        title: Text(name, style: const TextStyle(color: Colors.white)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Preço: R\$${price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
            Text(description, style: const TextStyle(color: Colors.white)),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaDetalhesProduto(
                nomeProduto: name,
                precoUnitario: price,
                imagePath: imagePath,
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TelaSuplementos(),
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black87,
      ),
    ),
  ));
}
