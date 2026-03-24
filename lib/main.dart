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
            controller: myController,
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
            controller: myController,
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
            controller: myController,
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando dados'))
                  );
                }
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(myController.text),
                    );
                  }
                );
              },
              child: Text('Salvar'),
          )
        ],
      )
    );
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



