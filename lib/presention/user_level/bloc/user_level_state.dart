part of 'user_level_bloc.dart';

class UserLevelState extends Equatable {
  final double level;

  const UserLevelState({
    required this.level,
  });

  factory UserLevelState.initial() {
    return const UserLevelState(
      level: 1,
    );
  }

  UserLevelState copyWith({
    double? level,
  }) {
    return UserLevelState(
      level: level ?? this.level,
    );
  }

  @override
  List<Object?> get props => [level];
}

void asd() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  level = (prefs.getDouble('level') ?? 1);
}
