import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _texts = ['Texto'];

  void _addText(String text) {
    setState(() {
      _texts.add(text);
    });
  }

  void _clearTexts() {
    setState(() {
      _texts.clear();
    });
  }

  void _removeText(int index) {
    setState(() {
      _texts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _texts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.accessible_forward),
                    title: Text(_texts[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              _addText('HOLA');
            },
            child: const Text('HOLA'),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              _addText('ADEU');
            },
            child: const Text('ADEU'),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: _clearTexts,
            child: const Text('Borrar'),
          ),
        ],
      ),
    );
  }
}
