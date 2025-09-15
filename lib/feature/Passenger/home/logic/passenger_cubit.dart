import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasalni1/feature/login/logic/login_cubit.dart';

import '../../../../core/di/di.dart';
import '../presentation/passenger_home.dart';
import '../presentation/widgets/passenger_home.dart';
import '../presentation/widgets/passenger_setting.dart';

part 'passenger_state.dart';

class PassengerCubit extends Cubit<PassengerState> {
  PassengerCubit() : super(PassengerInitial());
  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    emit(ChangeIndex(index: index));
  }

  List<String> titles=[
    "اختار خدمتك",
    "بياناتي"
  ];
  List<Widget> pages = [
    PassengerHomeMain(),
    BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: PassengerSetting(),
    ),
  ];
}
