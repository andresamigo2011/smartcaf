import 'package:my_pet_app/src/repositories/Repository.dart';
import 'package:my_pet_app/src/models/Pet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessLogicComponent {
  final Repository repository;
  SharedPreferences session;
  BusinessLogicComponent(this.repository);

  Future<String> mapEventToState(Pet pet) async {
    var token = repository.checkToken(session.get("token"));
    if (token != null) {
      if (pet != null) {
        try {
          var data = repository.addMascota(pet);
          return data;
        } catch (error) {
          //yield Failure(error);
        }
      }
    }
  }

  Future<List> recibir() async {
    var token = repository.checkToken(session.get("token"));
    if (token != null) {
        try {
          var dataAnimals = repository.recibir();
          return dataAnimals;
          //yield Success(data);
        } catch (error) {
          //yield Failure(error);
        }
    }
  }
}
