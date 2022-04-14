import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_mvvm_poc/view/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Selfy POS';
    return const GetMaterialApp(
      title: title,
      home: HomePage(),
    );
  }
}
