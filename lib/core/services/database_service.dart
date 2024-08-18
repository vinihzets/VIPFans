import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:only_fans/core/global/entities/user_entity.dart';

abstract class DatabaseService {
  late FirebaseFirestore instance;

  void initialize();
  Future<UserEntity> fetchUser(String id);
  Future<void> createUser(UserEntity user);
}
