import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/pages/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  var controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Brasileirão"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: ((BuildContext context, int i) {
          final tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[i].brasao),
            title: Text(tabela[i].nome),
            trailing: Text(tabela[i].ponto.toString()),
          );
        }),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: controller.tabela.length,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
