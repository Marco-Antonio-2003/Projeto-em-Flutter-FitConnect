import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF042c2c),
        iconTheme: IconThemeData(color: Colors.white), // Cor dos ícones
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
        child: FeedbackForm(),
      ),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  TextEditingController _feedbackController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(
              labelText: 'Categoria',
              labelStyle: TextStyle(color: const Color(0xFF042c2c)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: const Color(0xFF042c2c)),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _feedbackController,
            decoration: InputDecoration(
              labelText: 'Digite seu feedback',
              labelStyle: TextStyle(color: const Color(0xFF042c2c)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: const Color(0xFF042c2c)),
              ),
            ),
            maxLines: 5,
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _additionalInfoController,
            decoration: InputDecoration(
              labelText: 'Informações Adicionais',
              labelStyle: TextStyle(color: const Color(0xFF042c2c)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: const Color(0xFF042c2c)),
              ),
            ),
            maxLines: 3,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              String feedback = _feedbackController.text;
              String category = _categoryController.text;
              String additionalInfo = _additionalInfoController.text;

              // Lógica para enviar feedback para o servidor ou armazená-lo localmente
              // Aqui você pode lidar com o envio do feedback para onde for necessário
              // Por exemplo, enviar para um servidor, armazenar localmente, etc.
              print('Feedback enviado: $feedback');
              print('Categoria: $category');
              print('Informações adicionais: $additionalInfo');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Feedback enviado com sucesso!')),
              );
            },
            style: ElevatedButton.styleFrom(),
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _categoryController.dispose();
    _additionalInfoController.dispose();
    super.dispose();
  }
}
