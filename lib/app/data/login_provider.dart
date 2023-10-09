import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> postUser(Map data) =>
      post('http://youapi/users', data);
}
