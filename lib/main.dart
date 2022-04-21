import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/model/core/posts_binding.dart';
import 'package:flutter_getx_mvvm_poc/view/pages/create_post/create_post_page.dart';
import 'package:get/get.dart';

import 'view/pages/home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Selfy POS';
    return GetMaterialApp(
      title: title,
      initialRoute: '/',
      initialBinding: PostsBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/create_post',
          page: () => const CreatePostPage(),
        ),
      ],
    );
  }
}
