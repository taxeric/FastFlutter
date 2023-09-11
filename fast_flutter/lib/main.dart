import 'package:fast_flutter/router/local_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/main/main_binding.dart';
import 'modules/main/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: BaseRoute.main,
      getPages: BaseRoute.pages,
    );
  }
}
