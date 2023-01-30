import 'package:flutter/material.dart';
import 'package:pontos_brasileirao/models/titulo.dart';

class Time {
  String nome;
  int ponto;
  String brasao;
  Color cor;
  List<Titulo> titulos = [];

  Time({required this.nome, required this.ponto, required this.brasao, required this.cor});

}