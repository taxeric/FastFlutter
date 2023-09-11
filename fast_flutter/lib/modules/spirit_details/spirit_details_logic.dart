import 'package:fast_flutter/http/mx_net_adapter.dart';
import 'package:fast_flutter/models/spirit_details_entity.dart';
import 'package:get/get.dart';

import '../../http/net_helper.dart';
import '../../http/req_helper.dart';
import 'spirit_details_state.dart';

class SpiritDetailsLogic extends GetxController {

  final SpiritDetailsState state = SpiritDetailsState();

  int _searchId = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var spiritId = Get.parameters["spirit_id"];
    state.spiritName.value = Get.parameters["spirit_name"]??"精灵详情";
    if (spiritId != null) {
      _searchId = int.parse(spiritId);
      _getSpiritDetails(_searchId);
    }
  }

  Future<void> _getSpiritDetails(int searchId) async {
    state.detailsIsLoading.value = true;
    var request = ReqBuilder()
        .setUrl("/api/spirit/v1/spirit")
        .addParam("id", searchId)
        .build();
    await Future.delayed(const Duration(milliseconds: 1000));
    var result = await NetHelper.getInstance().sendMx(request);
    try {
      if (result is MxNetResponse) {
        var data = SpiritDetailsEntity.fromJson(result.data);
        if (data.data != null) {
          var spirit = data.data!;
          state.details.value = spirit;
        }
      }
    } catch (e) {
      print(e);
    } finally {
      state.detailsIsLoading.value = false;
    }
  }
}
