import 'package:faker/faker.dart';

import '../entities/post.dart';
import 'serializer.dart';
import 'user_serializer.dart';

class PostSerializer implements Serializer<Post, Map<String, dynamic>> {
  @override
  Post from(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      body: json['body'] as String,
      author: UserSerializer().from(json['author'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String,
      likes: json['likes'] as int,
    );
  }

  @override
  Map<String, dynamic> to(Post post) {
    return {
      'id': post.id,
      'body': post.body,
      'author': UserSerializer().to(post.author),
      'imageUrl': post.imageUrl,
      'likes': post.likes,
    };
  }

  @override
  Post fake() => Post(
        id: faker.randomGenerator.integer(999),
        body: faker.lorem.sentence(),
        author: UserSerializer().fake(),
        imageUrl: faker.image.image(random: true),
        likes: faker.randomGenerator.integer(999),
      );
}
