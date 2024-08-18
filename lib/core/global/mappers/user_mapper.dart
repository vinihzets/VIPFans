import 'package:only_fans/core/core.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';

class UserMapper extends EntityMapper<UserEntity> {
  @override
  UserEntity fromMap(map) {
    return UserEntity(email: map['email'], name: map['name'], id: map['id']);
  }

  @override
  Map<String, dynamic> toMap(UserEntity entity) {
    return {
      'email': entity.email,
      'name': entity.name,
      'id': entity.id,
    };
  }
}
