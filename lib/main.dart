import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/pages/home_page.dart';

void main() {
  runApp(
    const MeuAplicativo()
  );
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brasileirão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomePage(),
    );
  }
}

