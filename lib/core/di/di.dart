import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wasalni1/feature/login/data/rebo/get_user_data/get_user_data_impl.dart';
import 'package:wasalni1/feature/register/data/rebo/create_email/create_email.dart';
import 'package:wasalni1/feature/register/data/rebo/create_email/create_email_impl.dart';
import 'package:wasalni1/feature/register/logic/registeration_cubit.dart';
import '../../feature/driver/home/logic/driver_home_cubit.dart';
import '../../feature/driver/set_data/data/rebo/image_pick.dart';
import '../../feature/driver/set_data/data/rebo/save_driver_car_data.dart';
import '../../feature/driver/set_data/logic/set_up_driver_data_cubit.dart';
import '../../feature/login/data/rebo/auth_rebo.dart';
import '../../feature/login/data/rebo/get_user_data/get_user_data.dart';
import '../../feature/login/data/rebo/sign-email-password.dart';
import '../../feature/login/data/rebo/sign_in_impl.dart';
import '../../feature/login/logic/login_cubit.dart';
import '../../feature/register/data/rebo/save_user_data/save_user_data.dart';
import '../../feature/register/data/rebo/save_user_data/save_user_data_impl.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  sl.registerLazySingleton<DatabaseReference>(() => FirebaseDatabase.instance.ref());



  // Repositories
  sl.registerLazySingleton<AuthGoogleService>(() => AuthGoogleService(sl(),sl()),);
  sl.registerLazySingleton<SignInWithEmailAndPassword>(() => SignInWithEmailAndPasswordImpl(sl()),);
  sl.registerLazySingleton<SaveUserData>(() => SaveUserDataImpl(sl()),);
  sl.registerLazySingleton<CreateEmail>(() => CreateEmailImpl(sl()),);
  sl.registerLazySingleton<GetUserData>(() => GetUserDataImpl(sl()),);
  sl.registerLazySingleton<SaveDriverCarData>(() => SaveDriverCarData(sl(),sl()),);
  sl.registerLazySingleton<SupabaseImageService>(() => SupabaseImageService(sl<SupabaseClient>()),);








  // Cubits
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl<AuthGoogleService>(),sl<SignInWithEmailAndPassword>(),sl<GetUserData>()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl<CreateEmail>(),sl<SaveUserData>()));
  sl.registerFactory<SetUpDriverDataCubit>(() => SetUpDriverDataCubit(sl<SaveDriverCarData>(),sl<SupabaseImageService>()));
  sl.registerFactory<DriverHomeCubit>(() => DriverHomeCubit(sl<DatabaseReference>()));




}
