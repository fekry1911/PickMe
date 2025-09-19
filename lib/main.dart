import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  await Supabase.initialize(
    url: "https://sfmzlaekenmgjhaokjml.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNmbXpsYWVrZW5tZ2poYW9ram1sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc3NzU0OTUsImV4cCI6MjA3MzM1MTQ5NX0.2jh_nYQdIhrRwJcZWhForzigxLrloAiB6UeKBKov6Og",
  );
  await CacheHelper.init();

  runApp(
    DevicePreview(
      enabled: true, // enable for debug only
      builder: (context) => MyApp(appRouter: AppRouter(),),
    ),
  );
}



