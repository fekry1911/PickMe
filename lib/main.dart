import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'core/helpers/cache_helper.dart';
import 'core/routing/app_router.dart';
import 'feature/splash_screen/presentation/splash_screen.dart';
import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  await CacheHelper.init();
  runApp(
    DevicePreview(
      enabled: true, // enable for debug only
      builder: (context) => MyApp(appRouter: AppRouter(),),
    ),
  );
}



