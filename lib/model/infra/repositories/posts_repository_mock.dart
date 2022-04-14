import 'package:flutter_getx_mvvm_poc/model/domain/entities/post_entity.dart';
import 'package:flutter_getx_mvvm_poc/model/domain/repositories/posts_repository_interface.dart';
import 'package:flutter_getx_mvvm_poc/model/infra/models/post_model.dart';

class PostsRepositoryMock implements IPostsRepository {
  @override
  Future<List<PostEntity>> getPosts() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => PostModel.fakeList(15),
    );
  }
}
