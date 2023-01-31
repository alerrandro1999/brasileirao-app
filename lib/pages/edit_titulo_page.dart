import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pontos_brasileirao/models/titulo.dart';
import 'package:pontos_brasileirao/repositories/time_repository.dart';
import 'package:provider/provider.dart';

class EditTituloPage extends StatefulWidget {
  Titulo titulo;
  EditTituloPage ({required this.titulo});

  @override
  _EditTituloPageState createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {
  final _ano = TextEditingController();
  final _campeonato = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    _ano.text = widget.titulo.ano;
    _campeonato.text = widget.titulo.campeonato;
  }

  editar() {
    Provider.of<TimesRepository>(context, listen: false).editTitulo(
      titulo: widget.titulo,
      campeonato: _campeonato.text,
      ano: _ano.text,
    );

    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Título'),
        backgroundColor: Colors.grey[800],
        actions: [IconButton(onPressed: editar, icon: const Icon(Icons.check))],
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ano',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o ano do titulo!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _campeonato,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Campeonato',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o campeonato!';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}