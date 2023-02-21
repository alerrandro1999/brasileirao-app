import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/pages/add_titulo_page.dart';
import 'package:pontos_brasileirao/pages/edit_titulo_page.dart';
import 'package:pontos_brasileirao/repositories/time_repository.dart';
import 'package:pontos_brasileirao/widget/brasao.dart';
import 'package:provider/provider.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({required Key key, required this.time}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {

  tituloPage() {
    Get.to(() => AddTituloPage(time: widget.time));
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome.toString()),
          actions:[
            IconButton(
              icon: const Icon(Icons.add), 
              onPressed: tituloPage,
            )
          ],
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child:  Brasao(
                  image: widget.time.brasao.toString(), 
                  width: 250,
                  ),
                ),
                Text('Pontos: ${widget.time.ponto}', style: const TextStyle(fontSize: 22),
                )
              ],
            ),
            titulos()
          ],
        ),
      ),
    );
  }

  Widget titulos() {
    final time = Provider.of<TimesRepository>(context).times.firstWhere((t) => t.nome == widget.time.nome);

    final quantidade = time.titulos!.length;

    return quantidade == 0  
            ? Container(
              child: const Center(
                child: Text("Nenhum Titulo ainda"),
              ),
            )
            : ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                  return  ListTile(
                    leading:  const Icon(Icons.emoji_events),
                    title: Text(time.titulos![index].campeonato.toString()),
                    trailing: Text(time.titulos![index].ano.toString()),
                    onTap: () {
                     Get.to(
                       EditTituloPage(titulo: time.titulos![index]),
                       fullscreenDialog: true
                     );
                    },
                  );
                }, 
              separatorBuilder: (_, __) => const Divider(), 
              itemCount: quantidade,
              );
  }
}
