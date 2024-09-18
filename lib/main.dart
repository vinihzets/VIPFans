import 'package:morphling/morphling.dart';
import 'package:vip_fans_instance_core/vip_fans_instance_core.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServiceImpl().initialize();

  runApp(const VipFansApp());
}
