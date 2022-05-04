import '../entities/post.dart';
import '../serializers/post_serializer.dart';

class PostsRepositoryMock {
  Future<List<Post>> getPosts() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        PostSerializer().fake(),
        PostSerializer().fake(),
        PostSerializer().fake(),
      ],
    );
  }
}
