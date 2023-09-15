
import 'package:get_it_test_lern/core/model/character_model.dart';
import 'package:get_it_test_lern/core/repository/character_repo.dart';
import 'package:get_it_test_lern/locator.dart';
class ChracterController {
  Future<List<CharacterModel>> getNextCharacter() async {
    return await getIt.get<Characterrepo>().getChracter();
  }
}