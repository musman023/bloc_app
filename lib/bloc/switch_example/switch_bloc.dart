import 'package:bloc_app/bloc/switch_example/switch_event.dart';
import 'package:bloc_app/bloc/switch_example/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc() : super(SwitchStates()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
  }

  void _enableOrDisableNotification(
      EnableOrDisableNotification events, Emitter<SwitchStates> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}
