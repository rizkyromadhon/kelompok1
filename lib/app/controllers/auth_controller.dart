import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  Rx token = ''.obs;

  Future<bool> isLoggedIn() async {
    token.value = SpUtil.getString('token');
    return token.value != null;
  }
}
