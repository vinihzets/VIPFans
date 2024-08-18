import 'package:firebase_core/firebase_core.dart';
import 'package:only_fans/core/services/firebase_service.dart';

class FirebaseServiceImpl implements FirebaseService {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyBHVFr2YrSoY8gxo9KY_YHQJ0oyu0ukYgc',
            appId: '1:357904254398:android:64f1ba2b56d3bfcc1365ef',
            messagingSenderId: '357904254398',
            projectId: 'vipfans-1abd8'));
  }
}
