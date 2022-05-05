import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/model/entities/post.dart';
import 'package:flutter_getx_mvvm_poc/view_model/posts/posts_view_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PostsViewModel _postsViewModel;

  final TextEditingController postFormController = TextEditingController();
  List<Post> _posts = <Post>[].obs;

  HomeController({
    required PostsViewModel postsViewModel,
  }) : _postsViewModel = postsViewModel {
    init();
  }

  List<Post> get posts => _posts;

  set posts(List<Post> value) {
    _posts = value;
    update();
  }

  Future<void> init() async {
    posts.addAll(await _postsViewModel.getPosts());
  }

  void addPostLocally({
    required Post post,
    required List<Post> posts,
  }) {
    _postsViewModel.addPostLocally(
      post: post,
      posts: this.posts,
    );
  }
}
