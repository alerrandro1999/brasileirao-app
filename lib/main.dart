import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontos_brasileirao/controllers/theme_controller.dart';
import 'package:pontos_brasileirao/pages/home_page.dart';
import 'package:pontos_brasileirao/repositories/time_repository.dart';
import 'package:provider/provider.dart';

void main() {
  Get.lazyPut<ThemeController>(() => ThemeController());

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

    ThemeController.to.loadThemeMode();

    return GetMaterialApp(
      title: 'Brasileirão',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.grey,
        dividerColor: Colors.black45,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent[100],
          ),
        )
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

