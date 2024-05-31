import 'package:flutter/material.dart';

class ProdutosCompradosProfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produtos Comprados',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              const Color.fromARGB(158, 0, 0, 0),
              Color.fromARGB(221, 0, 0, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            buildProductCard(
              context,
              'Whey Protein',
              'R\$ 99,99',
              'Contém 20g de proteína por porção.',
              '10', // Quantidade de produtos vendidos
              '../assets/img/whey_protein.jpg',
            ),
            buildProductCard(
              context,
              'Creatina',
              'R\$ 49,99',
              'Aumenta a força e a resistência muscular.',
              '5', // Quantidade de produtos vendidos
              '../assets/img/creatina.jpg',
            ),
            buildProductCard(
              context,
              'BCAA',
              'R\$ 39,99',
              'Auxilia na recuperação muscular pós-treino.',
              '1',
              '../assets/img/bcaa.jpg',
            ),
            buildProductCard(
              context,
              'Glutamina',
              'R\$ 59,99',
              'Ajuda na recuperação e reparação muscular.',
              '2',
              '../assets/img/glutamina.jpg',
            ),
            buildProductCard(
              context,
              'Albumina',
              'R\$ 19,99',
              'Proteína de digestão lenta, ideal para consumo antes de dormir.',
              '7',
              '../assets/img/albumina.jpg',
            ),
            buildProductCard(
              context,
              'Termogênico',
              'R\$ 79,99',
              'Acelera o metabolismo e auxilia na queima de gordura.',
              '0',
              '../assets/img/termogenico.jpg',
            ),
            buildProductCard(
              context,
              'Omega 3',
              'R\$ 34,99',
              'Ácido graxo essencial que promove a saúde cardiovascular.',
              '12',
              '../assets/img/omega3.jpg',
            ),
            buildProductCard(
              context,
              'Barra de Proteína',
              'R\$ 9,99',
              'Lanche prático e rico em proteínas, ideal para consumo entre as refeições.',
              '15',
              '../assets/img/barra_proteina.jpg',
            ),
            buildProductCard(
              context,
              'Caseína',
              'R\$ 69,99',
              'Proteína de digestão lenta, ideal para consumo antes de dormir.',
              '6',
              '../assets/img/caseina.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(BuildContext context, String name, String price,
      String description, String quantity, String imagePath) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.transparent, // Removido o preenchimento de cor daqui
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
            Text(price, style: const TextStyle(color: Colors.white)),
            Text(description, style: const TextStyle(color: Colors.white)),
            Text('Quantidade Vendida: $quantity',
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
