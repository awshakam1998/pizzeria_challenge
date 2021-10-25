import 'dart:convert';

import 'package:pizzeria_challenge/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  saveUser(User user) async {
    final prefs= await SharedPreferences.getInstance();
    String userStr=json.encode(user.toJson());
    prefs.setString('user', userStr);
    prefs.commit();
  }

  Future<User>getUser()async{
    final prefs= await SharedPreferences.getInstance();
    String userStr=prefs.getString('user');
    User user=User(success: true);
    if(userStr!=null){
      user=User.fromJson(json.decode(userStr));
      print(user.toJson());
      return user;
    }
    return User(success: false);
  }

  erase()async{
    final prefs= await SharedPreferences.getInstance();
    prefs.clear();
  }
}
