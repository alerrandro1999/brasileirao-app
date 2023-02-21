import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/database/db.dart';
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/models/titulo.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);
  void addTitulo({Time? time, Titulo? titulo}) async {
    var db = await DB.get();
    int id = await db.insert('titulos', {
      'campeonato': titulo?.campeonato,
      'ano': titulo?.ano,
      'time_id': time?.id
    });
    titulo!.id = id;
    time!.titulos!.add(titulo);
    notifyListeners();
  }

  void editTitulo({Titulo? titulo, String? ano, String? campeonato}) async {
    var db = await DB.get();
    await db.update(
      'titulos',
      {
        'campeonato': campeonato,
        'ano': ano,
      },
      where: 'id = ?',
      whereArgs: [titulo!.id],
    );

    titulo.campeonato = campeonato.toString();
    titulo.ano = ano.toString();
    notifyListeners();
  }

  static setupTimes() {
    return [
      Time(
        nome: 'Flamengo',
        ponto: 71,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png',
        cor: (Colors.red[900])!,
      ),
      Time(
        nome: 'Santos',
        ponto: 61,
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png',
        cor: (Colors.grey[900])!,
      ),
    ];
  }

  TimesRepository() {
    initRepository();
  }

  initRepository() async {
    var db = await DB.get();

    List ts = await db.query('times');

    for (var t in ts) {
      var time = Time(
          id: t['id'],
          nome: t['nome'],
          brasao: t['brasao'],
          ponto: t['pontos'],
          cor: Color(int.parse(t['cor'])),
          titulos: await getTitulos(t['id']));
      _times.add(time);
    }

    notifyListeners();
  }

  getTitulos(timeID) async {
    var db = await DB.get();

    var results = await db.query('titulos', where: 'time_id = ?', whereArgs: [timeID]);
    List<Titulo> titulos = [];
    for (var titulo in results) {
      titulos.add(Titulo(
        id: titulo['id'],
        campeonato: titulo['campeonato'],
        ano: titulo['ano'],
      ));
    }

    return titulos;
  }
}
