import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  void saveUserLoginDetails(String phoneOrEmail,String password) async{
    final userDetails = new FlutterSecureStorage();
    await userDetails.write(key: "phoneOrEmail", value: phoneOrEmail);
    await userDetails.write(key: "password", value: password);
  }
  Future<Map> readUserDetails() async{
    final userDetails = new FlutterSecureStorage();
    return await userDetails.readAll();
  }

}
