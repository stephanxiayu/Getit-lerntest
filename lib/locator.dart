
import 'package:get_it/get_it.dart';
import 'package:get_it_test_lern/core/controller/character_controller.dart';
import 'package:get_it_test_lern/core/repository/character_repo.dart';

final GetIt getIt = GetIt.instance;

void setup(){
  getIt.registerLazySingleton<Characterrepo>(() => Characterrepo());
  getIt.registerLazySingleton<ChracterController>(() => ChracterController());
}