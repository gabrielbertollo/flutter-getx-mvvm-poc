import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/post_widget.dart';
import '../posts_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostsController postsController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter GetX MVVM Poc'),
      ),
      body: SafeArea(
        child: Obx(() {
          if (postsController.posts.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: postsController.posts.length,
            itemBuilder: (context, index) {
              final post = postsController.posts[index];
              return PostWidget(post: post);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/create_post');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
