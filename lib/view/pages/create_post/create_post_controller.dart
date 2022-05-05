import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_poc/model/entities/post.dart';
import 'package:flutter_getx_mvvm_poc/view_model/posts/posts_view_model.dart';
import 'package:get/get.dart';

class CreatePostController extends GetxController {
  final PostsViewModel _postsViewModel;
  final TextEditingController postFormController = TextEditingController();

  CreatePostController({
    required PostsViewModel postsViewModel,
  }) : _postsViewModel = postsViewModel;

  void addPost(Post post) {
    Get.back(result: post);
  }
}
