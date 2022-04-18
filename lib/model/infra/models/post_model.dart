import 'package:faker/faker.dart';
import 'package:flutter_getx_mvvm_poc/model/domain/entities/post_entity.dart';
import 'package:flutter_getx_mvvm_poc/model/domain/entities/user_entity.dart';
import 'package:flutter_getx_mvvm_poc/model/infra/models/user_model.dart';

class PostModel extends PostEntity {
  const PostModel({
    required int id,
    required String body,
    required UserEntity author,
    required String imageUrl,
    required int likes,
  }) : super(
          id: id,
          body: body,
          author: author,
          imageUrl: imageUrl,
          likes: likes,
        );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      body: json['body'],
      author: UserModel.fromJson(json['author']),
      imageUrl: json['imageUrl'],
      likes: json['likes'],
    );
  }

  factory PostModel.fake() {
    return PostModel(
      id: faker.randomGenerator.integer(999),
      body: faker.lorem.sentence(),
      author: UserModel.fake(),
      imageUrl: faker.image.image(random: true),
      likes: faker.randomGenerator.integer(999),
    );
  }

  static List<PostModel> fakeList(int length) {
    return List<PostModel>.generate(
      length,
      (i) => PostModel.fake(),
    );
  }
}
