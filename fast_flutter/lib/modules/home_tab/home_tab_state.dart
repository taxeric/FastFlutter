import 'package:fast_flutter/models/news_entity.dart';
import 'package:get/get.dart';

class HomeTabState {

  RxList<NewsData> newsList = RxList();

  /// 列表滚动距离
  var realScrollPixels = 0.0;

  HomeTabState() {
    ///Initialize variables
  }
}
