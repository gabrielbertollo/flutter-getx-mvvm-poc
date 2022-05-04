import 'package:flutter_getx_mvvm_poc/model/repositories/posts_repository_mock.dart';
import 'package:get/get.dart';

import '../../view_model/posts/posts_view_model.dart';

class PostsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsViewModel>(
      () => PostsViewModel(
        postsRepository: Get.find<PostsRepositoryMock>(),
      ),
    );
    Get.lazyPut<PostsRepositoryMock>(
      () => PostsRepositoryMock(),
    );
  }
}
