import 'package:get/get.dart';
import 'package:flutter_getx_mvvm_poc/model/domain/entities/post_entity.dart';
import 'package:flutter_getx_mvvm_poc/model/domain/repositories/posts_repository_interface.dart';

class PostsController extends GetxController {
  final List<PostEntity> _posts = <PostEntity>[].obs;

  PostsController({required IPostsRepository postsRepository}) {
    _loadPosts(postsRepository);
  }

  List<PostEntity> get posts => _posts;

  Future<List<PostEntity>> _loadPosts(IPostsRepository postsRepository) async {
    final posts = await postsRepository.getPosts();
    _posts.addAll(posts);
    update();
    return posts;
  }
}
