import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_level_state.dart';

double level = 1.0;

class UserLevelBloc extends Cubit<UserLevelState> {
  void asd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    level = (prefs.getDouble('level') ?? 1);
  }

  UserLevelBloc() : super(UserLevelState.initial());

  void updateUserLevel() {
    double newValue = state.level + 0.05;
    emit(state.copyWith(level: newValue));
  }
}
