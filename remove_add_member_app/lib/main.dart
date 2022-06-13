import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../bindings/all_bindings.dart';
import '../utils/colors.dart';
import '../view/main_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MyColors.bgColor,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Add & Remove user Screen',
      theme: ThemeData(
          textTheme: const TextTheme(
        headline1: TextStyle(
            color: MyColors.titleTextColor,
            fontSize: 19,
            fontWeight: FontWeight.w500),
        headline2: TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        headline3: TextStyle(
          color: Colors.grey,
          fontSize: 17,
          fontWeight: FontWeight.w300,
        ),
        headline4: TextStyle(
          color: Color.fromARGB(255, 199, 198, 198),
          fontSize: 18,
        ),
      )),
      home: const MainPage(),
    );
  }
}
