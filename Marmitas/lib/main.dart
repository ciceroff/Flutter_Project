import 'package:flutter/material.dart';
import 'package:Marmitas/Pages/pedido.dart';
import 'package:Marmitas/Pages/gerencia.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
      ),
      home: HomePage(),
      routes: {
        '/pedido': (context) => Registra(),
        '/gerencia': (context) => HomePage(),
      },
    );
  }
}
