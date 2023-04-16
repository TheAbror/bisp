import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_level_state.dart';

class UserLevelBloc extends Cubit<UserLevelState> {
  UserLevelBloc() : super(UserLevelState.initial());

  void updateUserLevel() {
    double newValue = state.level + 0.01;
    emit(state.copyWith(level: newValue));
  }
}
