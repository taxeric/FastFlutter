import 'package:fast_flutter/modules/spirit_tab/spirit_tab_state.dart';
import 'package:fast_flutter/router/local_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/spirit_page_entity.dart';
import 'spirit_tab_logic.dart';

class SpiritTabPage extends StatefulWidget {
  const SpiritTabPage({super.key});

  @override
  State<SpiritTabPage> createState() => _SpiritTabPageState();
}

class _SpiritTabPageState extends State<SpiritTabPage> {

  late SpiritTabLogic logic;
  late SpiritTabState state;

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => SpiritTabLogic());
    print(">>>> 初始化精灵页面------------------------------------");
    logic = Get.find<SpiritTabLogic>();
    state = Get.find<SpiritTabLogic>().state;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (!logic.isLoading) {
          if (logic.hasMore) {
            logic.getSpiritData();
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
    return Container(
      color: const Color.fromARGB(255, 245, 245, 245),
      child: Obx(() {
        var data = state.spiritPageList;
        return GridView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 180
            // childAspectRatio: 8 / 12
          ),
          padding: const EdgeInsets.all(8),
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            return _itemView(context, index);
          },
        );
      }),
    );
  }

  Widget _itemView(BuildContext context, int index) {
    if (index <= state.spiritPageList.length - 1) {
      return _SpiritSingleItem(
        state.spiritPageList[index],
        200,
        callback: (){
          Get.toNamed(
              BaseRoute.spirit_details,
              parameters: {
                "spirit_id": state.spiritPageList[index].id.toString(),
                "spirit_name": state.spiritPageList[index].name!
              }
          );
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

class _SpiritSingleItem extends StatelessWidget {

  final double height;
  final SpiritPageData data;
  final VoidCallback? callback;

  const _SpiritSingleItem(this.data, this.height, {super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: height,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(),
                  image: DecorationImage(image: AssetImage("images/spirit_bg_1.png"))
              ),
              child: Image.network(
                data.avatar??"",
                errorBuilder: (context, err, _) {
                  return Container();
                },
              ),
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: Text(data.name??"未知精灵"),
            )
          ],
        ),
      ),
    );
  }
}


