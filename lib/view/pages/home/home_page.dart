import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/view_model/posts/posts_view_model.dart';
import 'package:get/get.dart';

import '../../widgets/post_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostsViewModel postsController = Get.find();
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
