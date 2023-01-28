
import 'package:pontos_brasileirao/models/time.dart';

class HomeController {
 late List<Time> tabela;

  HomeController() {
    tabela = [
      Time(
        nome: 'Flamengo', 
        ponto: 71, 
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png'
      ),
      Time(
        nome: 'Santos', 
        ponto: 61, 
        brasao: 'https://e.imguol.com/futebol/brasoes/40x40/santos.png'
      ),
    ];
  }
}