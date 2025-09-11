import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'registeration_state.dart';

class RegisterationCubit extends Cubit<RegisterationState> {
  RegisterationCubit() : super(RegisterationInitial());
}
