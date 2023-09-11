import 'package:get/get.dart';

import 'spirit_details_logic.dart';

class SpiritDetailsBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SpiritDetailsLogic());
  }
}
