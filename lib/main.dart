import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_getx_mvvm_poc/core/create_post_binding.dart';
import 'package:get/get.dart';

import 'core/home_binding.dart';
import 'view/pages/create_post/create_post_page.dart';
import 'view/pages/home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter GetX MVVM Poc';
    return GetMaterialApp(
      title: title,
      initialRoute: '/',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/create_post',
          page: () => const CreatePostPage(),
          binding: CreatePostBinding(),
        ),
      ],
    );
  }
}
