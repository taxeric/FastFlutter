import 'package:fast_flutter/http/net_helper.dart';
import 'package:fast_flutter/http/req_helper.dart';
import 'package:fast_flutter/models/news_entity.dart';
import 'package:get/get.dart';

import '../../http/mx_net_adapter.dart';
import 'home_tab_state.dart';

class HomeTabLogic extends GetxController {
  final HomeTabState state = HomeTabState();
  
  var _page = 1;
  var total = 0;
  var isLoading = false;
  var hasMore = true;
  
  @override
  void onInit() {
    super.onInit();
    _getNewsData();
  }

  Future<void> getNewsData() async {
    _getNewsData();
  }
  
  Future<void> _getNewsData() async {
    isLoading = true;
    var request = ReqBuilder()
        .setUrl("/api/news/v1/news")
        .addParam("page", _page)
        .addParam("amount", 15)
        .build();
    var result = await NetHelper.getInstance().sendMx(request);
    if (result is MxNetResponse) {
      var newsEntity = NewsEntity.fromJson(result.data);
      if (newsEntity.code == 200) {
        if (_page == 1) {
          state.newsList.clear();
        }
        total = newsEntity.total?? 0;
        state.newsList.addAll(newsEntity.data!);
        hasMore = state.newsList.length < total;
        if (hasMore) {
          _page ++;
        }
      }
    }
    isLoading = false;
  }
}
