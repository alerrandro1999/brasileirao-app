import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/models/titulo.dart';

class TimesRepository extends ChangeNotifier {
  final List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);
  void addTitulo({required Time time, required Titulo titulo}) {
    time.titulos.add(titulo);

    notifyListeners();
  }

  void editTitulo({required Titulo titulo, required String ano, required String campeonato}){
    titulo.campeonato = campeonato;
    titulo.ano = ano;
    notifyListeners();
  }

  TimesRepository() {
    _times.addAll([
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
    ]);
  }
}
