import 'package:flutter/material.dart';
import 'package:ceniceros0450/transform_0450.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Diaz 0460",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffd5e5c1), // Color de fondo del AppBar
          title: const Text(
            "Vinill Music 0450",
            style: TextStyle(color: Color(0xff000000)), // Color del texto
          ),
          actions: [
            IconButton(
              icon:
                  Icon(Icons.shopping_cart), // Icono para el carrito de compras
              onPressed: () {
                // Implementa la lógica para abrir el carrito de compras
              },
            ),
          ],
        ),
        body: const TransformPageView(),
      ),
    );
  }
}
