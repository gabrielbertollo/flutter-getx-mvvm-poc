import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/view/pages/create_post/create_post_controller.dart';
import 'package:get/get.dart';

import '../../../model/entities/post.dart';
import '../../../model/serializers/user_serializer.dart';

class CreatePostPage extends GetView<CreatePostController> {
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
              controller: controller.postFormController,
              decoration: const InputDecoration(
                labelText: 'Type the post content',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.addPost(
                  Post(
                    author: UserSerializer().fake(),
                    body: controller.postFormController.text,
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
