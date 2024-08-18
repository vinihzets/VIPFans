import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:only_fans/core/core.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';
import 'package:only_fans/core/global/mappers/user_mapper.dart';
import 'package:only_fans/core/services/database_service.dart';

class DatabaseServiceImpl implements DatabaseService {
  UserMapper userMapper;

  DatabaseServiceImpl({required this.userMapper});

  @override
  late FirebaseFirestore instance;

  @override
  void initialize() async {
    instance = FirebaseFirestore.instance;
  }

  @override
  Future<UserEntity> fetchUser(String id) async {
    final userDoc = await instance.collection('users').doc(id).get();

    if (userDoc.exists) {
      return userMapper.fromMap(userDoc.data());
    }

    throw RemoteFailure(
        message: 'Usuário não foi encontrado na nossa base de dados!');
  }

  @override
  Future<void> createUser(UserEntity user) async {
    final doc = instance.collection('users').doc(user.id);

    return await doc.set(userMapper.toMap(user));
  }
}
