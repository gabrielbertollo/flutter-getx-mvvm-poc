import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/model/entities/post.dart';
import 'package:flutter_getx_mvvm_poc/model/repositories/posts_repository_mock.dart';
import 'package:get/get.dart';

class PostsViewModel extends GetxController {
  final PostsRepositoryMock _postsRepository;

  final TextEditingController postFormController = TextEditingController();
  List<Post> _posts = <Post>[].obs;

  PostsViewModel({
    required PostsRepositoryMock postsRepository,
  }) : _postsRepository = postsRepository {
    init();
  }

  List<Post> get posts => _posts;

  set posts(List<Post> value) {
    _posts = value;
    update();
  }

  Future<void> init() async {
    posts.addAll(await _postsRepository.getPosts());
  }

  void addPost(Post post) {
    posts.insert(0, post);
    update();
  }
}
