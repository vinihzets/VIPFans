import 'package:flutter/material.dart';
import 'package:only_fans/app.dart';
import 'package:only_fans/core/services/impl/firebase_service_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServiceImpl().initialize();

  runApp(const VipFansApp());
}
