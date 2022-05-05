import 'package:flutter_getx_mvvm_poc/model/entities/post.dart';
import 'package:flutter_getx_mvvm_poc/model/repositories/posts_repository_mock.dart';

class PostsViewModel {
  final PostsRepositoryMock _postsRepository;

  PostsViewModel({
    required PostsRepositoryMock postsRepository,
  }) : _postsRepository = postsRepository;

  Future<List<Post>> getPosts() async {
    return await _postsRepository.getPosts();
  }

  void addPostLocally({
    required Post post,
    required List<Post> posts,
  }) {
    posts.insert(0, post);
    return;
  }

  void createPost(Post post) {
    // TODO implement create post
    return;
  }
}
