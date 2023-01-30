import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/models/titulo.dart';

class TimesRepository {
  final List<Time> _times = [];

  get times => _times;

  void addTitulo({required Time time, required Titulo titulo}) {
    time.titulos.add(titulo);
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
