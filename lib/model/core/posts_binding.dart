import 'package:flutter_getx_mvvm_poc/model/domain/repositories/posts_repository_interface.dart';
import 'package:flutter_getx_mvvm_poc/model/infra/repositories/posts_repository_mock.dart';
import 'package:flutter_getx_mvvm_poc/view/pages/posts_controller.dart';
import 'package:flutter_getx_mvvm_poc/view_model/posts/posts_view_model.dart';
import 'package:get/get.dart';

class PostsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsViewModel>(
      () => PostsViewModel(
        Get.find<IPostsRepository>(),
      ),
    );
    Get.lazyPut<IPostsRepository>(
      () => PostsRepositoryMock(),
    );
    Get.put(
      PostsController(
        postsViewModel: Get.find(),
      ),
    );
  }
}
