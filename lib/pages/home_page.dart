import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/pages/home_controller.dart';
import 'package:pontos_brasileirao/pages/time_page.dart';
import 'package:pontos_brasileirao/repositories/time_repository.dart';
import 'package:pontos_brasileirao/widget/brasao.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brasileirão"),
        centerTitle: true,
      ),
      body: Consumer<TimesRepository>(builder: (context, repositorio, clild) {
          return ListView.separated(
            itemBuilder: ((BuildContext context, int time) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Brasao(
                  image: tabela[time].brasao, 
                  width: 40,
                  ),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos: ${tabela[time].titulos.length}'),
                trailing: Text(tabela[time].ponto.toString(),
                ),
                onTap: () {
                  Get.to(() => TimePage(
                    key: Key(tabela[time].nome), 
                    time: tabela[time],
                    ));
                },
              );
            }),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: repositorio.times.length,
            padding: const EdgeInsets.all(16),
          );
        }
      ),
    );
  }
}
