import 'package:fast_flutter/widgets/text_field_with_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'settings_logic.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final logic = Get.find<SettingsLogic>();
  final state = Get.find<SettingsLogic>().state;

  var mHost = "";
  var mPort = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("设置"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("设定请求地址"),
            subtitle: Obx(() => Text(logic.buildRequestInfo())),
            onTap: (){ _showBtm(context, defHost: state.requestHost.value, defPort: state.requestPort.value.toString()); },
          )
        ],
      ),
    );
  }

  void _showBtm(BuildContext context, {String defHost = "", String defPort = ""}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets, // 我们可以根据这个获取需要的padding
          duration: const Duration(milliseconds: 100),
          child: Container(
            height: 240,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: (){
                          logic.setRequestInfo(mHost, int.parse(mPort));
                          Navigator.pop(context);
                        },
                        child: const Text("保存")
                    ),
                  ),
                  const Divider(),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  TextFieldWithTitle(
                    title: "主机: ",
                    defValue: defHost,
                    inputType: TextInputType.text,
                    onChanged: (str) {
                      mHost = str;
                      },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  TextFieldWithTitle(
                    title: "端口: ",
                    defValue: defPort,
                    inputType: TextInputType.number,
                    onChanged: (str) {
                      mPort = str;
                      },
                  ),
                ],
              )
          ),
        );
      },
    );
  }
}
