import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_getx_mvvm_poc/model/infra/repositories/posts_repository_mock.dart';
import 'package:flutter_getx_mvvm_poc/view/widgets/post_widget.dart';
import 'package:flutter_getx_mvvm_poc/view_model/posts/posts_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PostsController postsController =
        Get.put(PostsController(postsRepository: PostsRepositoryMock()));

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
    );
  }
}
