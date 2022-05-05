import 'package:get/get.dart';

import '../../view_model/posts/posts_view_model.dart';
import '../model/repositories/posts_repository_mock.dart';
import '../view/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsRepositoryMock>(
      () => PostsRepositoryMock(),
    );
    Get.lazyPut<PostsViewModel>(
      () => PostsViewModel(
        postsRepository: Get.find<PostsRepositoryMock>(),
      ),
    );
    Get.put<HomeController>(
      HomeController(
        postsViewModel: Get.find<PostsViewModel>(),
      ),
    );
  }
}
