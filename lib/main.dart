import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_from_json/load_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'APP LOAD WIDGET',
        theme: ThemeData(
          fontFamily: 'InterRegular',
        ),
        locale: Get.deviceLocale,
        debugShowCheckedModeBanner: false,
        home: const LoadWidget());
  }
}
