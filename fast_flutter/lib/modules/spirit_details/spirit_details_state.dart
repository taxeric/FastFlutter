import 'package:get/get.dart';

import '../../models/spirit_details_entity.dart';

class SpiritDetailsState {

  var details = SpiritDetailsData().obs;
  var detailsIsLoading = false.obs;
  var spiritName = "".obs;
}
