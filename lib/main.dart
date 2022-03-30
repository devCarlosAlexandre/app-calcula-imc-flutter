import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bem vindo ao Calculeixon de IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double imc = 0.0;
  double alt = 0.0;
  double peso = 0.0;

  void caluculoImc(double a, double p) {
    setState(() {
     imc = p / (a*a);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (texto){
                alt  = double.parse(texto);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Altura em metros...'  
              ),
            ),
             TextField(
            onChanged: (texto){
                peso  = double.parse(texto);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Peso em kg'
              ),
            ),

            const Text(
              'Seu imc é: ',
            ),
            Text(
              '$imc',
              style: Theme.of(context).textTheme.headline4,
            ),
             new RaisedButton(
             child: const Text("calcular imc"),
             color: Theme.of(context).accentColor,
             elevation: 4.0,
             splashColor: Colors.blueGrey,
             onPressed: (){
            caluculoImc(alt, peso);
         },  
      )
          ],
        ),
      ),
    );
  
   
  }
}
