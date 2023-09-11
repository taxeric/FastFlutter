import 'package:fast_flutter/http/req_helper.dart';
import 'package:fast_flutter/models/spirit_page_entity.dart';
import 'package:fast_flutter/modules/spirit_tab/spirit_tab_state.dart';
import 'package:get/get.dart';

import '../../http/mx_net_adapter.dart';
import '../../http/net_helper.dart';

class SpiritTabLogic extends GetxController {
  final SpiritTabState state = SpiritTabState();

  var total = 0;
  var _page = 1;
  var isLoading = false;
  var hasMore = true;

  @override
  void onInit() {
    super.onInit();
    _getSpiritData();
  }

  getSpiritData() {
    _getSpiritData();
  }
  
  Future<void> _getSpiritData() async {
    isLoading = true;
    var request = ReqBuilder()
        .setUrl("/api/spirit/v1/spirits")
        .addParam("page", _page)
        .addParam("amount", 15)
        .build();
    var result = await NetHelper.getInstance().sendMx(request);
    if (result is MxNetResponse) {
      var spiritListEntity = SpiritPageEntity.fromJson(result.data);
      if (spiritListEntity.code == 200) {
        if (_page == 1) {
          state.spiritPageList.clear();
        }
        total = spiritListEntity.total!;
        state.spiritPageList.addAll(spiritListEntity.data!);
        hasMore = state.spiritPageList.length < total;
        if (hasMore) {
          _page ++;
        }
      }
    }
    isLoading = false;
  }
}
