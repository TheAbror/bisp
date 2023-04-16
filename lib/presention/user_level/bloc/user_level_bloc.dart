import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_level_state.dart';

class UserLevelBloc extends Cubit<UserLevelState> {
  UserLevelBloc() : super(UserLevelState.initial());

  void updateUserLevel(double updateLevel) {
    emit(state.copyWith(level: state.level + updateLevel));
  }
}
