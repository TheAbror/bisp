import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'interface_state.dart';

class InterfaceBloc extends Cubit<InterfaceState> {
  InterfaceBloc() : super(InterfaceState.initial());

  void username() {
    emit(state.copyWith(nickname: state.nickname));
  }
}
