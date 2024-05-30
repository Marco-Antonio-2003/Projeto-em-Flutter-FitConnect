import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aluno/exercicio_info.dart';
import 'package:flutter_application_1/pages/produtos/tela1.dart';

class AlunoInicialPage extends StatefulWidget {
  AlunoInicialPage({Key? key}) : super(key: key);

  @override
  State<AlunoInicialPage> createState() => _AlunoInicialPageState();
}

class _AlunoInicialPageState extends State<AlunoInicialPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Realize ações com base no índice selecionado
      switch (index) {
        case 0:
          Navigator.pop(context);
          break;
        case 1:
          // Nada a fazer aqui, pois já estamos na página inicial do aluno
          break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaSuplementos(),
            ),
          );
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá, Aluno'),
      ),
      body: Container(
        decoration: BoxDecoration(
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
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildProductCard(
              context,
              'Panturrilhas',
              '10 rept / 3 séries',
              '../assets/img/quadrimusc.jpeg',
              '../assets/img/exercicio1.png',
            ),
            _buildProductCard(
              context,
              'Rosca Inversa',
              '12 rept / 3 séries',
              '../assets/img/forearmmusc.jpg',
              '../assets/img/exercicio2.png',
            ),
            _buildProductCard(
              context,
              'Abdominais',
              '15 rept / 3 séries',
              '../assets/img/abdomemmusc.jpeg',
              '../assets/img/exercicio3.png',
            ),
            _buildProductCard(
              context,
              'Rosca Direta',
              '10 rept / 5 séries',
              '../assets/img/bracomusc.jpeg',
              '../assets/img/exercicio4.png',
            ),
            _buildProductCard(
              context,
              'Agachamento',
              '10 rept / 3 séries',
              '../assets/img/legmusc.jpeg',
              '../assets/img/exercicio5.png',
            ),
            _buildProductCard(
              context,
              'Tríceps Banco',
              '12 rept / 3 séries',
              '../assets/img/tricepmusc.jpeg',
              '../assets/img/exercicio6.png',
            ),
            _buildProductCard(
              context,
              'Panturilhas',
              '10 rept / 3 séries',
              '../assets/img/calf-muscle.jpg',
              '../assets/img/exercicio7.png',
            ),
            _buildProductCard(
              context,
              'Elevação Lateral',
              '15 rept / 3 séries',
              '../assets/img/ombromusc.jpeg',
              '../assets/img/exercicio8.png',
            ),
            _buildProductCard(
              context,
              'Remada Curvada',
              '12 rept / 3 séries',
              '../assets/img/backmuscle.jpeg',
              '../assets/img/exercicio9.png',
            ),
            // const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Navegar para a tela de produtos (TelaSuplementos)
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => TelaSuplementos(),
            //       ),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue, // Cor do botão
            //   ),
            //   child: const Text(
            //     'Ver produtos',
            //     style: TextStyle(color: Colors.white), // Cor do texto
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Voltar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Produtos',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

Widget _buildProductCard(
  BuildContext context,
  String name,
  String quantidade,
  String imagePath,
  String Graph,
) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    color: Colors.cyan[900],
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
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' $name', style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 40),
          Text(' $quantidade', style: const TextStyle(color: Colors.white)),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExercicioInfoPage(
              nomeExercicio: name,
              imagePath: imagePath,
              graph: Graph,
            ),
          ),
        );
      },
    ),
  );
}

void main() {
  runApp(MaterialApp(
    home: AlunoInicialPage(),
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black87,
      ),
    ),
  ));
}
