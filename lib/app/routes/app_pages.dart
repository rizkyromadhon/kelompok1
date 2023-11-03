import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/call/bindings/call_binding.dart';
import '../modules/call/views/call_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logout/bindings/logout_binding.dart';
import '../modules/logout/views/logout_view.dart';
import '../modules/realtime/bindings/realtime_binding.dart';
import '../modules/realtime/views/realtime_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/ui/bindings/ui_binding.dart';
import '../modules/ui/views/ui_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.UI,
      page: () => UiView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
      binding: UiBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.CALL,
      page: () => const CallView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
      binding: CallBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.REALTIME,
      page: () => RealtimeView(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
      binding: RealtimeBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LogoutView(),
      binding: LogoutBinding(),
    ),
  ];
}
