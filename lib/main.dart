import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple)
          ),
      home: MyHomePage(
        title: 'Cadastro de Veículos'
        ),
      

    );
  }
}



class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  final marcaController = TextEditingController();
  final modeloController = TextEditingController();
  final anoController = TextEditingController();

  @override
  void dispose() {
    marcaController.dispose();
    modeloController.dispose();
    anoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: marcaController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo deve ser preenchido';
              }
              return null;
            },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Marca'
                  ),
                ),

          SizedBox(height: 20,),

          TextFormField(
            controller: modeloController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'O campo deve ser preenchido';
              }
              return null;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Modelo'
            ),
          ),

          SizedBox(height: 20,),
              
          TextFormField(
            controller: anoController,
            validator:(value) {
              if (value == null || value.isEmpty) {
                return 'O campo deve ser preenchido';
              }
              return null;
            },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ano'
              ),
            ),
              
          SizedBox(height: 20,),
              
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                  context: context,
                  builder: (context) {
                    final corolla = Veiculo(marca: marcaController.text, modelo: modeloController.text, ano: int.parse(anoController.text));
                    return AlertDialog(
                      content: Text(corolla.toString())
                    );
                  }
                );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando dados'))
                  );                  
                }
              },
              child: Text('Salvar'),
          )
        ],
      )
    );
  }
}

class Veiculo {
  final String marca;
  final String modelo;
  final int ano;

  const Veiculo({
    required this.marca,
    required this.modelo,
    required this.ano,
  });

  @override
  String toString() {
    return ('''
Marca: $marca
Modelo: $modelo
Ano: $ano
''');
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20), 
          child: Column(
            children: [
              const MyCustomForm()
            ],
          )
      ),
    );
  }

}



