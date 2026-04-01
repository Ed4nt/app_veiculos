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
  const MyCustomForm({super.key, required this.onSalvar});

  final void Function(Veiculo) onSalvar;

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
                return 'O campo é obrigatório';
              }
              final ano = int.tryParse(value);
              if(ano == null) {
                return 'Digite apenas números';
              } else if(ano < 1886) {
                return 'Ano inválido';
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
                      final veiculo = Veiculo(
                        marca: marcaController.text,
                        modelo: modeloController.text,
                        ano: int.parse(anoController.text)
                      );
                      return Text('teste');
                    }
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
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {

  List<Veiculo> veiculos = [];

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

  @override
  void setState(() {
    veiculos
  })

}