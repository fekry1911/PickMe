import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'feature/splash_screen/presentation/splash_screen.dart';
import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



