import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'randon_number_event.dart';

class RandonNumberBloc extends Bloc<RandonNumberEvent, int> {
  RandonNumberBloc() : super(0) {
    on<GenerateNewRandonNumber>((event, emit) {
      final random=Random();
      final randomNumber=random.nextInt(100);
      emit(randomNumber);
    });
  }
}

