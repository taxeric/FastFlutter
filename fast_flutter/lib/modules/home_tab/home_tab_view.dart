import 'package:fast_flutter/modules/home_tab/home_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_tab_logic.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {

  late HomeTabLogic logic;
  late HomeTabState state;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => HomeTabLogic());
    logic = Get.find<HomeTabLogic>();
    state = Get.find<HomeTabLogic>().state;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (!logic.isLoading) {
          if (logic.hasMore) {
            logic.getNewsData();
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = state.newsList;
      return Container(
        color: const Color.fromARGB(255, 245, 245, 245),
        child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8),
            itemCount: data.length + 1,
            itemBuilder: (context, index) {
              return _itemView(context, index);
            }
        ),
      );
    });
  }

  Widget _itemView(BuildContext context, int index) {
    if (index <= state.newsList.length - 1) {
      return NewsView(
        state.newsList[index].title!,
        callback: (){
          print(">>>> click ${state.newsList[index].title}");
        },
      );
    }
    if (index == logic.total) {
      return _noMore();
    }
    return _loadMore();
  }

  Widget _loadMore() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _noMore() {
    return const Center(
      child: Text("没有更多数据"),
    );
  }
}

class NewsView extends StatelessWidget {

  final String title;
  final bool isLatest;
  final VoidCallback? callback;

  const NewsView(this.title, {this.isLatest = false, super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )
          ),
          child: ListTile(
            title: Text(title),
            onTap: (){
              if (callback != null) {
                callback!();
              }
            },
          ),
        ),
        if (!isLatest) Container(height: 8,)
      ],
    );
  }
}

