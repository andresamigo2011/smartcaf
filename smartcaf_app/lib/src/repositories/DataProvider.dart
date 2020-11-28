import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_pet_app/src/models/Pet.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataProvider {
  SharedPreferences session;

  Future<String> addPet(Pet pet) async {
    String token = await this.checkToken(this.session.get("token"));
      String urlRegistraP = "http://3.16.150.74:8080/pet/api/mascotas";

      var response = await http.post(urlRegistraP,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':'Bearer '+token,
          },
          body:
          json.encode({
            "active": true,
            "altura": pet.altura,
            "animal": pet.animal,
            "color": pet.color,
            "edad": pet.edad,
            "nombre": pet.nombre,
            "peso": pet.peso,
            "raza": pet.raza
          })

      );
      var extraerData = json.decode(response.body);
      var data = extraerData;
      return "Mascota registrada!";
  }

  Future<List> recibir() async {
    String token = await this.checkToken(this.session.get("token"));
    String url="http://3.16.150.74:8080/pet/api/mascotas";
    List data;
    var response = await http.get(Uri.encodeFull(url),
        headers: {
      "Accept":"application/json",
      "Authorization":"Bearer "+token,});
      var extraerData = json.decode(response.body);
      data = extraerData;
     return data;
  }

  Future<String> checkToken(responseString) async{
    var responseWord = http.read("http://3.16.150.74:8080/mascotas-login/hello", headers: {"Authorization": responseString});
    if(responseWord == null) return "";
    return responseWord;
  }
}
