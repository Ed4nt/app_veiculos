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
              TextField(
                  decoration: InputDecoration(
                    hintText: 'Marca'
                  ),
                ),

              SizedBox(height: 20,),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Modelo'
                ),
              ),

              SizedBox(height: 20,),
              
              TextField(
                  decoration: InputDecoration(
                    hintText: 'Ano'
                  ),
                ),
              
              SizedBox(height: 20,),
              
              ElevatedButton(
                  onPressed: () {},
                  child: Text('Salvar'),
                ),
            ],
          )
      ),
    );
  }

}



