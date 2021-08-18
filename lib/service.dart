import 'package:usermap/model.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class Service {
  String base = 'https://jsonplaceholder.typicode.com/';
  String post = 'posts';
  String user = 'users';

  Future<List<User>> getUsers() async {
    Response res = await Dio().get("$base$user");
    List<User> Users=[];
    var data=res.data;
    data.forEach((element){
      Users.add(User.fromJson(element));
    });
    return Users;
  }
}
