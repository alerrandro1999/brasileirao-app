import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/models/titulo.dart';

class Time {
  int? id;
  String nome;
  int ponto;
  String brasao;
  Color cor;
  List<Titulo>? titulos = [];

  Time({ this.id, required this.nome, required this.ponto, required this.brasao, required this.cor, this.titulos});

}