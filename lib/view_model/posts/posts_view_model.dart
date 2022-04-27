import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/domain/entities/post_entity.dart';
import '../../model/domain/usecases/get_posts_usecase.dart';
import '../../model/infra/models/post_model.dart';

class PostsViewModel extends GetxController {
  final GetPostsUsecase _getPostsUsecase;

  final TextEditingController postFormController = TextEditingController();
  List<PostEntity> _posts = <PostEntity>[].obs;

  PostsViewModel({
    required GetPostsUsecase getPostsUsecase,
  }) : _getPostsUsecase = getPostsUsecase {
    init();
  }

  List<PostEntity> get posts => _posts;

  set posts(List<PostEntity> value) {
    _posts = value;
    update();
  }

  Future<void> init() async {
    posts.addAll(await _getPostsUsecase());
  }

  void addPost(PostModel post) {
    posts.insert(0, post);
    update();
  }
}
