import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/pages/home_controller.dart';
import 'package:pontos_brasileirao/pages/time_page.dart';

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
      body: ListView.separated(
        itemBuilder: ((BuildContext context, int time) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[time].brasao),
            title: Text(tabela[time].nome),
            trailing: Text(tabela[time].ponto.toString(),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => TimePage(key: Key(tabela[time].nome), time: tabela[time])
              ),
              );
            },
          );
        }),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: controller.tabela.length,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
