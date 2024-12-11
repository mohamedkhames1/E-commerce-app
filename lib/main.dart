import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'data/repositories/authentication/repositories_authenticatio.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepoditry()));
  runApp(const App());
}


       //  SHA1: 80:E7:6E:2D:D1:19:8D:DB:59:85:03:FA:A6:5B:8F:B8:1C:E7:44:AC
       //  SHA256: DC:92:08:A9:54:12:C8:5A:D5:5D:34:B4:0B:41:92:18:83:81:72:01:8A:D2:46:24:3C:7A:43:ED:92:53:C2:7E
       