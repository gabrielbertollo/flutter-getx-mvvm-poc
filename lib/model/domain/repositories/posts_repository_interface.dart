import 'package:flutter_getx_mvvm_poc/model/domain/entities/post_entity.dart';

abstract class IPostsRepository {
  Future<List<PostEntity>> getPosts();
}
