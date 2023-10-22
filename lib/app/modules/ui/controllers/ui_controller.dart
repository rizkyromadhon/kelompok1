import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

class UiController extends GetxController {
  bool isDropdownOpen = false;

  void removeToken() {
    SpUtil.remove('name');
    SpUtil.remove('token');
  }
}
