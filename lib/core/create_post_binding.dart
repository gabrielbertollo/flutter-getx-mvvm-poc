import 'package:get/get.dart';

import '../../view_model/posts/posts_view_model.dart';
import '../view/pages/create_post/create_post_controller.dart';

class CreatePostBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CreatePostController>(
      CreatePostController(
        postsViewModel: Get.find<PostsViewModel>(),
      ),
    );
  }
}
