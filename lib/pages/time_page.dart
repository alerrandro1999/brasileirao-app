import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/models/titulo.dart';
import 'package:pontos_brasileirao/pages/add_titulo_page.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({required Key key, required this.time}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {

  tituloPage() {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => AddTituloPage(
       time: widget.time, 
       onSave: addTitulo,
       ),
      ),
    );
  }

  addTitulo(Titulo titulo) {
    setState(() {
      widget.time.titulos.add(titulo);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Salvo com sucesso!'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
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
                  child: Image.network(widget.time.brasao.replaceAll('40x40', '100x100')),
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
    final quantidade = widget.time.titulos.length;

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
                    title: Text(widget.time.titulos[index].campeonato),
                    trailing: Text(widget.time.titulos[index].ano),
                  );
                }, 
              separatorBuilder: (_, __) => const Divider(), 
              itemCount: quantidade,
              );
  }
}
