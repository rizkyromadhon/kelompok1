import 'package:get/get.dart';

class RegisterProvider extends GetConnect {
  Future<Response> auth(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    return post('https://apitronik-api.000webhostapp.com/api/register', data, headers: myHeader);
  }
}
