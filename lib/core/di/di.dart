import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../feature/login/data/rebo/auth_rebo.dart';
import '../../feature/login/data/rebo/sign-email-password.dart';
import '../../feature/login/data/rebo/sign_in_impl.dart';
import '../../feature/login/logic/login_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());



  // Repositories
  sl.registerLazySingleton<AuthGoogleService>(() => AuthGoogleService(sl(),sl()),);
  sl.registerLazySingleton<SignInWithEmailAndPassword>(() => SignInWithEmailAndPasswordImpl(sl()),);







  // Cubits
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<AuthGoogleService>(),sl<SignInWithEmailAndPassword>()));


}
