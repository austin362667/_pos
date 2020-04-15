
import 'package:pos/db.dart';
import 'package:pos/user.dart';

class API {
  
  static DB _db;

  static init() async =>
    _db = await DB.connect();

  static Future<List<User>> findUser(dynamic data, {String table = 'user'}) async {

    List<User> items = [];
    User item = User.fromData(data);
    String sql = 'select * from "$table" where email = (@email)';
    Map<String, dynamic> params = { "email": item.email, "password": item.password };
    dynamic result = await _db.query(sql, values: params);
    for (final row in result) {print(row['user'].toString()); items.add(User.fromData(row['user'])); }
    return items;
  }

  static Future<List<User>> insertOneUser(dynamic data, {String table = 'user'}) async {

    List<User> items = [];
    User item = User.fromData(data);
    String sql = 'insert into "$table" (email, password) values (@email, @password)';
    Map<String, dynamic> params = { "email": item.email, "password": item.password };
    dynamic result = await _db.query(sql, values: params);
    for (final row in result) {print(row['user'].toString()); items.add(User.fromData(row['user'])); }
    return items;
  }


}