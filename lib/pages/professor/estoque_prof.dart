import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produtos/tela2.dart';

class EstoqueProfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Estoque',
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
            _buildProductCard(
              context,
              'Whey Protein',
              99.99,
              '../assets/img/whey_protein.jpg',
              30,
            ),
            _buildProductCard(
              context,
              'Creatina',
              49.99,
              '../assets/img/creatina.jpg',
              32,
            ),
            _buildProductCard(
              context,
              'BCAA',
              39.99,
              '../assets/img/bcaa.jpg',
              20,
            ),
            _buildProductCard(
              context,
              'Glutamina',
              59.99,
              '../assets/img/glutamina.jpg',
              27,
            ),
            _buildProductCard(
              context,
              'Albumina',
              19.99,
              '../assets/img/albumina.jpg',
              18,
            ),
            _buildProductCard(
              context,
              'Termogênico',
              79.99,
              '../assets/img/termogenico.jpg',
              26,
            ),
            _buildProductCard(
              context,
              'Omega 3',
              34.99,
              '../assets/img/omega3.jpg',
              40,
            ),
            _buildProductCard(
              context,
              'Barra de Proteína',
              9.99,
              '../assets/img/barra_proteina.jpg',
              29,
            ),
            _buildProductCard(
              context,
              'Caseína',
              69.99,
              '../assets/img/caseina.jpg',
              34,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String name, double price, String imagePath, int quantityInStock) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.transparent,
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
            Text('Preço: R\$ $price', style: const TextStyle(color: Colors.white)),
            Text('Quantidade em estoque: $quantityInStock', style: const TextStyle(color: Colors.white)),
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
