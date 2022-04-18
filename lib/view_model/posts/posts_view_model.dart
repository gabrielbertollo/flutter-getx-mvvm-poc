import 'package:flutter_getx_mvvm_poc/model/domain/entities/post_entity.dart';
import 'package:flutter_getx_mvvm_poc/model/domain/repositories/posts_repository_interface.dart';
import 'package:flutter_getx_mvvm_poc/model/infra/models/post_model.dart';

class PostsViewModel {
  final IPostsRepository _postsRepository;

  PostsViewModel(this._postsRepository);

  Future<List<PostEntity>> loadPosts() async {
    return await _postsRepository.getPosts();
  }

  List<PostEntity> addPost({
    required PostModel post,
    required List<PostEntity> posts,
  }) {
    posts.insert(0, post);
    return posts;
  }
}
