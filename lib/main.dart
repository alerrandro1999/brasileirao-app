import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontos_brasileirao/pages/home_page.dart';
import 'package:pontos_brasileirao/repositories/time_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => TimesRepository(),
    child: const MeuAplicativo(),
    )
  );
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Brasileirão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const HomePage(),
    );
  }
}

