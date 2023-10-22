import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class LogoutProvider extends GetConnect {
  Future<Response> logout() async {
    var token = SpUtil.getString('token');
    var myHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await post(
        'https://apitronik-api.000webhostapp.com/api/logout', token,
        headers: myHeaders);
    return response;
  }
}
