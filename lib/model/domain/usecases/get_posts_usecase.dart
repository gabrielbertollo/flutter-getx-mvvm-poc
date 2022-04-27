import 'package:flutter_getx_mvvm_poc/model/domain/entities/post_entity.dart';
import 'package:flutter_getx_mvvm_poc/model/domain/repositories/posts_repository_interface.dart';

class GetPostsUsecase {
  final IPostsRepository postsRepository;

  const GetPostsUsecase({required this.postsRepository});

  Future<List<PostEntity>> call() async {
    return await postsRepository.getPosts();
  }
}
