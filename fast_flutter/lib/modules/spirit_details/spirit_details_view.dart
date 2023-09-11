import 'dart:ffi';

import 'package:fast_flutter/models/attributes_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'spirit_details_logic.dart';

class SpiritDetailsPage extends StatefulWidget {
  const SpiritDetailsPage({super.key});

  @override
  State<SpiritDetailsPage> createState() => _SpiritDetailsPageState();
}

class _SpiritDetailsPageState extends State<SpiritDetailsPage> {

  final logic = Get
      .find<SpiritDetailsLogic>();
  final state = Get
      .find<SpiritDetailsLogic>()
      .state;

  @override
  void dispose() {
    // TODO: implement dispose
    Get.delete<SpiritDetailsLogic>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(state.spiritName.value)),
        ),
        body: Obx(() {
          var spirit = state.details.value;
          bool loading = state.detailsIsLoading.value;
          int uid = spirit.id ?? -1;
          String avatar = spirit.avatar ?? "";
          int? priAttr = spirit.primaryAttributes?.id;
          int? secAttr = spirit.secondaryAttributes?.id;
          double height = spirit.height ?? 0.0;
          double weight = spirit.weight ?? 0.0;
          String name = spirit.name ?? "未知";
          String hobby = spirit.hobby ?? "--";
          String desc = spirit.description ?? "暂无";
          int hp = spirit.racePower ?? 0;
          int attack = spirit.raceAttack ?? 0;
          int defense = spirit.raceDefense ?? 0;
          int magicAttack = spirit.raceMagicAttack ?? 0;
          int magicDefense = spirit.raceMagicDefense ?? 0;
          int speed = spirit.raceSpeed ?? 0;
          if (loading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    height: 212,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: spiritAvatar(avatar, priAttr, secAttr)
                        ),
                        const Padding(padding: EdgeInsets.only(left: 8),),
                        Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: spiritBaseInfo(uid, height, weight, hobby)
                        )
                      ],
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      child: Text(
                        desc,
                        style: const TextStyle(
                            fontSize: 18
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: spiritRaceLayout(hp, attack, defense, magicAttack, magicDefense, speed),
                )
              ],
            );
          };
        })
    );
  }

  Widget spiritBaseInfo(int id, double height, double weight, String hobby) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "编号: $id",
            style: const TextStyle(
                fontSize: 18
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Text(
            "身高: $height m",
            style: const TextStyle(
                fontSize: 18
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Text(
            "体重: $weight kg",
            style: const TextStyle(
                fontSize: 18
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Text(
            "爱好: $hobby",
            style: const TextStyle(
                fontSize: 18
            ),
          )
        ],
      ),
    );
  }

  Widget spiritAvatar(String url, int? priAttr, int? secAttr, {double avatarHeight = 140, double attrHeight = 32}) {
    List<Widget> attrIcon = [];
    attrIcon.add(
        Image.asset(
          AttributesEntity.getAttrPath(priAttr),
          height: attrHeight,
        )
    );
    if (secAttr != null) {
      attrIcon.add(
          Image.asset(
            AttributesEntity.getAttrPath(secAttr),
            height: attrHeight,
          )
      );
    }
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(),
                image: DecorationImage(image: AssetImage("images/spirit_bg_1.png"))
            ),
            child: Image.network(
              url,
              width: avatarHeight,
              height: avatarHeight,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 8),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: attrIcon,
          )
        ],
      ),
    );
  }

  Widget spiritRaceLayout(int hp, int attack, int defense, int magicAttack, int magicDefense, int speed) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
      ),
      child: Column(
        children: [
          SpiritRaceLayout(race: hp, assetsPath: "images/race_icon/1.png"),
          const Padding(padding: EdgeInsets.only(top: 8),),
          SpiritRaceLayout(race: attack, assetsPath: "images/race_icon/2.png"),
          const Padding(padding: EdgeInsets.only(top: 8),),
          SpiritRaceLayout(race: defense, assetsPath: "images/race_icon/3.png"),
          const Padding(padding: EdgeInsets.only(top: 8),),
          SpiritRaceLayout(race: magicAttack, assetsPath: "images/race_icon/4.png"),
          const Padding(padding: EdgeInsets.only(top: 8),),
          SpiritRaceLayout(race: magicDefense, assetsPath: "images/race_icon/5.png"),
          const Padding(padding: EdgeInsets.only(top: 8),),
          SpiritRaceLayout(race: speed, assetsPath: "images/race_icon/6.png"),
        ],
      ),
    );
  }
}

class SpiritRaceLayout extends StatefulWidget {

  final String assetsPath;
  final int race;
  
  const SpiritRaceLayout({super.key, required this.race, required this.assetsPath, });

  @override
  State<SpiritRaceLayout> createState() => _SpiritRaceLayoutState();
}

class _SpiritRaceLayoutState extends State<SpiritRaceLayout>
    with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> animation;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);
    animation = Tween(begin: 0.0, end: widget.race.toDouble()).animate(animation);
    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Image.asset(
              widget.assetsPath,
              // width: 24,
              height: 32,
            ),
        ),
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressAnimWidget(animation: animation,),
              Text("${widget.race}"),
            ],
          ),
        ),
      ],
    );
  }
}

class ProgressAnimWidget extends AnimatedWidget {

  ProgressAnimWidget({required Animation<double> animation}): super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable as Animation<double>;
    return LinearProgressIndicator(
      value: animation.value / 200.0,
    );
  }
}
