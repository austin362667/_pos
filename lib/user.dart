import 'package:pos/db.dart';
import 'package:pos/user.dart';

class User {

  final String email;
  final String password;

  
  User({ this.email, this.password });

  User.fromData(Map<String, dynamic> data)
      : email = data['email'],
        password = data['password'];

}