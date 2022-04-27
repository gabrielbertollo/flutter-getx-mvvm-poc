import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/view_model/posts/posts_view_model.dart';
import 'package:get/get.dart';

import '../../../model/infra/models/post_model.dart';
import '../../../model/infra/models/user_model.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Create Post'),
            TextFormField(
              controller: Get.find<PostsViewModel>().postFormController,
              decoration: const InputDecoration(
                labelText: 'Type the post content',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.find<PostsViewModel>().addPost(
                  PostModel(
                    author: UserModel.fake(),
                    body: Get.find<PostsViewModel>().postFormController.text,
                    id: 1,
                    imageUrl: 'https://picsum.photos/id/1/200/300',
                    likes: 0,
                  ),
                );
                Get.back();
              },
              child: const Text('Publish'),
            ),
          ],
        ),
      ),
    );
  }
}
