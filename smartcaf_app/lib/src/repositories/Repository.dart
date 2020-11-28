import 'package:my_pet_app/src/models/Pet.dart';
import 'DataProvider.dart';

class Repository {
  final DataProvider dataProviderA;

  Repository(this.dataProviderA);
  //final DataProviderB dataProviderB;

  Future<String> addMascota(Pet pet) async {
    if (pet != null) {
      return dataProviderA.addPet(pet);
    }else{
      return "Fallo";
    }
  }

  Future<List> recibir() async {
      return dataProviderA.recibir();
  }

  Future<String> checkToken(responseString) async{
    return dataProviderA.checkToken(responseString);
  }
}
