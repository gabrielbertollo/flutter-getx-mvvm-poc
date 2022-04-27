import 'package:get/get.dart';

import '../../view_model/posts/posts_view_model.dart';
import '../domain/repositories/posts_repository_interface.dart';
import '../domain/usecases/get_posts_usecase.dart';
import '../infra/repositories/posts_repository_mock.dart';

class PostsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostsViewModel>(
      () => PostsViewModel(
        getPostsUsecase: Get.find<GetPostsUsecase>(),
      ),
    );
    Get.lazyPut<IPostsRepository>(
      () => PostsRepositoryMock(),
    );
    Get.lazyPut<GetPostsUsecase>(
      () => GetPostsUsecase(
        postsRepository: Get.find<IPostsRepository>(),
      ),
    );
  }
}
