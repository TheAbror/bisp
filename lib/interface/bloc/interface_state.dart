part of 'interface_bloc.dart';

class InterfaceState extends Equatable {
  final String nickname;
  const InterfaceState({required this.nickname});

  factory InterfaceState.initial() {
    return const InterfaceState(nickname: 'Christie');
  }

  InterfaceState copyWith({String? nickname}) {
    return InterfaceState(
      nickname: nickname ?? this.nickname,
    );
  }

  @override
  List<Object?> get props => [nickname];
}
