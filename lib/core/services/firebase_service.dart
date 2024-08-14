import 'package:firebase_core/firebase_core.dart';

abstract class FirebaseService {
  Future<FirebaseApp> initialize();
}
