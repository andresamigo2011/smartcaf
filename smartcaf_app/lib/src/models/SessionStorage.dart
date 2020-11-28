import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_pet_app/src/models/Session.dart';

class SessionStorage {
  static final _storage = FlutterSecureStorage();

  Future<Map<String, String>> getAllValues() async {
    return _storage.readAll();
  }

  Future<String> getValueforKey(String key) async {
    return _storage.read(key: key);
  }

  Future deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  Future deleteAllValues() async {
    await _storage.deleteAll();
  }

  Future writeValue(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future saveSessionStorage(
      Session session, String timeSession, String username) async {
    await _storage.write(key: 'accessToken', value: session.accessToken);
    await _storage.write(key: 'refreshToken', value: session.refreshToken);
    await _storage.write(
        key: 'expiryDuration', value: session.expiryDuration.toString());
    await _storage.write(key: 'timeSession', value: timeSession);
    await _storage.write(key: 'username', value: username);
  }

  Future saveProfessional(String professional) async {
    await _storage.write(key: 'professional', value: professional);
  }

  Future saveIdUser(int id) async {
    await _storage.write(key: 'idUser', value: id.toString());
  }

  Future saveNameProf(String name) async {
    await _storage.write(key: 'nameprofessional', value: name);
  }

  Future<String> getNameProf() async {
    return _storage.read(key: 'nameprofessional');
  }

  Future<String> getProfessional() async {
    return _storage.read(key: 'professional');
  }

  Future<String> getUsername() async {
    return _storage.read(key: 'username');
  }

  Future<int> getIdUser() async {
    return int.parse(await _storage.read(key: 'idUser'));
  }

  Future<String> getAccessToken() async {
    return _storage.read(key: 'accessToken');
  }

  Future<String> getrefreshToken() async {
    return _storage.read(key: 'refreshToken');
  }

  Future<String> getinitialTimeSession() async {
    return _storage.read(key: 'timeSession');
  }

  Future<int> getexpiryDuration() async {
    String exp = await _storage.read(key: 'expiryDuration');
    return int.parse(exp);
  }
}