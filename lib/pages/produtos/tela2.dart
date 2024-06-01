import 'package:flutter/material.dart';
import 'tela3.dart';
import 'package:flutter_application_1/models/informacoes_produtos.dart';

class TelaDetalhesProduto extends StatefulWidget {
  final String nomeProduto;
  final double precoUnitario;
  final String imagePath;

  TelaDetalhesProduto({
    required this.nomeProduto,
    required this.precoUnitario,
    required this.imagePath,
  });

  @override
  _TelaDetalhesProdutoState createState() => _TelaDetalhesProdutoState();
}

class _TelaDetalhesProdutoState extends State<TelaDetalhesProduto> {
  int quantidade = 1;

  String getInformacoesProduto(String nomeProduto) {
    switch (nomeProduto) {
      case 'Whey Protein':
        return InformacoesProdutos.wheyProtein;
      case 'Creatina':
        return InformacoesProdutos.creatina;
      case 'BCAA':
        return InformacoesProdutos.bcaa;
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
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 10),
              Text(
                widget.nomeProduto,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                getInformacoesProduto(widget.nomeProduto),
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Preço Unitário: R\$${widget.precoUnitario.toStringAsFixed(2)}',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (quantidade > 1) {
                          quantidade--;
                        }
                      });
                    },
                  ),
                  Text(
                    '$quantidade',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        quantidade++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tela3(
                        nomeProduto: widget.nomeProduto,
                        precoUnitario: widget.precoUnitario,
                        quantidade: quantidade,
                        imagePath: widget.imagePath,
                      ),
                    ),
                  );
                },
                child: const Text('Comprar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
