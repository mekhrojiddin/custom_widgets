import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'randon_number_event.dart';
part 'randon_number_state.dart';

class RandonNumberBloc extends Bloc<RandonNumberEvent, RandonNumberState> {
  RandonNumberBloc() : super(RandonNumberInitial()) {
    on<RandonNumberEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
