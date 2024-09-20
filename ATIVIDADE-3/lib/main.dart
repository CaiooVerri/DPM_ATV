import 'package:flutter/material.dart';

void main() {
  runApp(BancoApp());
}

class BancoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      home: FormularioScreen(),
    );
  }
}

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final List<String> _transacoes = [];
  final TextEditingController _controller = TextEditingController();

  void _adicionarTransacao() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _transacoes.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Descrição da Transação',
              ),
              onSubmitted: (_) => _adicionarTransacao(),
            ),
          ),
          ElevatedButton(
            onPressed: _adicionarTransacao,
            child: Text('Adicionar Transação'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _transacoes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_transacoes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}