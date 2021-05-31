import 'package:to_doc_patient/services/networking.dart';
import 'package:to_doc_patient/models/validation.dart';
class User{
  String phone;
  String email;
  String password;
  String city;
  String phoneOrEmail;

  User.a({this.phone,this.email,this.password,this.city});
  User.b({this.phoneOrEmail,this.password});

  String validateUser(){
    Validation validation=Validation();
    if(validation.validatePhone(phone) == false){
      return "Please enter valid phone number";
    }
    else if(validation.validateEmail(email) == false){
      return "Please enter valid Email";
    }
    else if(validation.validatePassword(password) == false){
      return "Password must contain at least 1 lowercase, 1 uppercase, 1 special character and 8 characters";
    }
    else if(city.isEmpty){
      return 'Please enter city name';
    }
    else return "";
  }

  Future<dynamic> registerUser() async{
      String validation = validateUser();
      print(validation);
      if( validation.isEmpty){
        var response = await ApiBaseHelper().post('register',
            '{"mobile":"$phone","email":"$email","password":"$password","city":"$city"}');
        return response;
      }
      else{
        return {"success":"no","error":"$validation"};
      }

  }
  Future<dynamic> logInUser() async {
    print(phoneOrEmail);
    if(Validation().validateEmail(phoneOrEmail)){
      var response = await ApiBaseHelper().post('login',
          '{"email":"$phoneOrEmail","password":"$password"}');
      return response;
    }
    else if(Validation().validatePhone(phoneOrEmail)){
      var response = await ApiBaseHelper().post('login',
          '{"mobile":"$phoneOrEmail","password":"$password"}');
      return response;
    }
    else{
      return {'success':'no','error':'Please enter valid email or phone no.'};
    }
  }
  Future<dynamic> forgotPassword() async{
    if(Validation().validateEmail(phoneOrEmail)){
      var response = await ApiBaseHelper().post('login',
          '{"email":"$phoneOrEmail"}');
      return response;
    }
  }


}