
import 'package:pontos_brasileirao/models/time.dart';
import 'package:pontos_brasileirao/repositories/time_repository.dart';

class HomeController {
 late TimesRepository timesRepository;

 List<Time> get tabela => timesRepository.times;

 HomeController() {
  timesRepository = TimesRepository();
 }
}