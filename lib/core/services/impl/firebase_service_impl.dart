import 'package:firebase_core/firebase_core.dart';
import 'package:only_fans/core/services/firebase_service.dart';

class FirebaseServiceImpl implements FirebaseService {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyBrOk6y2i8oaWyE7Yqn7K1FMJUxDv2nuJ8',
            appId: '1:813231632899:web:e09aa21b6c8a8e21ebd436',
            messagingSenderId: '813231632899',
            projectId: 'smart-legacy-578c7'));
  }
}
