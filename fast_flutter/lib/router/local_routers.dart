import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/main/main_binding.dart';
import '../modules/main/main_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';
import '../modules/spirit_details/spirit_details_binding.dart';
import '../modules/spirit_details/spirit_details_view.dart';

class BaseRoute {

  static const String main = "/";
  static const String settings = "/settings";
  static const String spirit_details = "/spirit_details";

  static List<GetPage> pages = [
    GetPage(
      name: BaseRoute.main,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: BaseRoute.settings,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: BaseRoute.spirit_details,
      page: () => const SpiritDetailsPage(),
      binding: SpiritDetailsBinding(),
    ),
  ];
}