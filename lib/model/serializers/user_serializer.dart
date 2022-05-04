import 'package:faker/faker.dart';

import '../entities/user.dart';
import 'serializer.dart';

class UserSerializer implements Serializer<User, Map<String, dynamic>> {
  @override
  User from(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
  }

  @override
  Map<String, dynamic> to(User user) {
    return {
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'avatarUrl': user.avatarUrl,
    };
  }

  @override
  User fake() => User(
        id: faker.randomGenerator.integer(999),
        name: faker.person.name(),
        email: faker.internet.email(),
        avatarUrl: faker.image.image(random: true),
      );
}
