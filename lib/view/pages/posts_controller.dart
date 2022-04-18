import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/model/infra/models/post_model.dart';
import 'package:get/get.dart';

import '../../model/domain/entities/post_entity.dart';
import '../../view_model/posts/posts_view_model.dart';

class PostsController extends GetxController {
  final PostsViewModel _postsViewModel;

  final TextEditingController postFormController = TextEditingController();

  List<PostEntity> _posts = <PostEntity>[].obs;

  PostsController({required PostsViewModel postsViewModel})
      : _postsViewModel = postsViewModel {
    init();
  }

  Future<void> init() async {
    posts.addAll(await _postsViewModel.loadPosts());
  }

  List<PostEntity> get posts => _posts;

  set posts(List<PostEntity> value) {
    _posts = value;
    update();
  }

  void addPost(PostModel post) {
    _postsViewModel.addPost(post: post, posts: _posts);
    update();
  }
}
